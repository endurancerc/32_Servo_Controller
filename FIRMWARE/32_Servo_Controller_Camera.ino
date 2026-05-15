// ─────────────────────────────────────────────────────────────
//  32 Servo Controller — Combined USB HID + WiFi + Camera
//  Boots into USB HID mode if USB host detected, WiFi otherwise
//  WiFi mode: OV2640 MJPEG stream on port 81, servo control on port 80
//  Host fingerprinting detects Android vs Windows via HID timing delta
// ─────────────────────────────────────────────────────────────

// These defines burn the correct strings into the compiled USB descriptor,
// so Chrome's device picker shows the right name before setup() even runs.
#define USB_PRODUCT      "32 Servo Controller"
#define USB_MANUFACTURER "Endurance R/C"

#include "esp_camera.h"
#include <WiFi.h>
#include <WebServer.h>
#include <Preferences.h>
#include <DNSServer.h>
#include <ESPmDNS.h>
#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "USB.h"
#include "USBHID.h"
#include "USBCDC.h"
#include "esp_system.h"        // esp_reset_reason()
#include "esp_task_wdt.h"      // esp_task_wdt_delete()
#include "soc/soc.h"           // WRITE_PERI_REG
#include "soc/rtc_cntl_reg.h"  // RTC_CNTL_BROWN_OUT_REG

USBCDC FPSerial;

// ─────────────────────────────────────────────────────────────
//  Common hardware defines
// ─────────────────────────────────────────────────────────────
#define I2C_SDA 1
#define I2C_SCL 2
#define NUM_SERVOS 32
#define SERVO_FREQ 50
#define USMIN 600
#define USMAX 2400
#define US_SCALE 7.06f

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 32
#define OLED_RESET -1
#define SCREEN_ADDRESS 0x3C

// ─────────────────────────────────────────────────────────────
//  OV2640 Camera pin map
// ─────────────────────────────────────────────────────────────
#define PWDN_GPIO_NUM   -1   // not wired
#define RESET_GPIO_NUM  -1
#define XCLK_GPIO_NUM   15
#define SIOD_GPIO_NUM    4   // camera SCCB SDA (separate bus from servo I2C)
#define SIOC_GPIO_NUM    5   // camera SCCB SCL
#define Y2_GPIO_NUM     11
#define Y3_GPIO_NUM      9
#define Y4_GPIO_NUM      8
#define Y5_GPIO_NUM     10
#define Y6_GPIO_NUM     12
#define Y7_GPIO_NUM     18
#define Y8_GPIO_NUM     17
#define Y9_GPIO_NUM     16
#define VSYNC_GPIO_NUM   6
#define HREF_GPIO_NUM    7
#define PCLK_GPIO_NUM   13
// If camera init returns error 0x105, try: #define XCLK_GPIO_NUM 40

// ─────────────────────────────────────────────────────────────
//  Mode flag — set once in setup() before USB or WiFi inits
// ─────────────────────────────────────────────────────────────
bool usbMode = false;

// ─────────────────────────────────────────────────────────────
//  I2C hardware objects
// ─────────────────────────────────────────────────────────────
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);
Adafruit_PWMServoDriver pwmA = Adafruit_PWMServoDriver(0x40);
Adafruit_PWMServoDriver pwmB = Adafruit_PWMServoDriver(0x41);

// ─────────────────────────────────────────────────────────────
//  USB HID — objects / state (only activated if usbMode == true)
// ─────────────────────────────────────────────────────────────
USBHID HID;

static const uint8_t customReportDescriptor[] = {
  0x06, 0xA0, 0xFF,
  0x09, 0x01,
  0xA1, 0x01,
  0x09, 0x03,
  0x15, 0x00,
  0x26, 0x00, 0xFF,
  0x75, 0x08,
  0x95, 0x20,
  0x81, 0x02,
  0x09, 0x04,
  0x15, 0x00,
  0x26, 0x00, 0xFF,
  0x75, 0x08,
  0x95, 0x20,
  0x91, 0x02,
  0x09, 0x05,
  0x15, 0x00,
  0x26, 0x00, 0xFF,
  0x75, 0x08,
  0x95, 0x20,
  0xB1, 0x02,
  0xC0
};

struct ServoReport {
  uint8_t servoPosition[32];
};

volatile uint8_t servoBuffer[2][32] = { { 0 }, { 0 } };
volatile uint8_t writeBuffer = 0;
volatile uint8_t readBuffer = 1;
volatile bool bufferReady = false;
volatile bool usbWasConnected = false;
volatile unsigned long lastUSBActivity = 0;
static unsigned long lastPrint = 0;

// ── Cross-core synchronisation ────────────────────────────────
// portMUX_TYPE is safe to use from both a FreeRTOS task and an ISR
// on either core; noInterrupts() only masks Core 1 and is NOT
// sufficient when the USB stack runs concurrently on Core 0.
static portMUX_TYPE bufferMux = portMUX_INITIALIZER_UNLOCKED;
static SemaphoreHandle_t usbSendMutex = nullptr;  // created in setup()

// ─────────────────────────────────────────────────────────────
//  USB Host Fingerprinting
//
//  Signals collected during the enumeration handshake and scored
//  to produce a best-guess HostType.  All volatile globals below
//  are written from USB ISR context (Core 0) and read from loop()
//  (Core 1); they are simple scalars so word-torn reads are safe
//  on Xtensa without additional locking.
// ─────────────────────────────────────────────────────────────
enum HostType : uint8_t {
  HOST_UNKNOWN = 0,
  HOST_ANDROID,
  HOST_WINDOWS,
  HOST_LINUX,
  HOST_MACOS
};

static const char* hostTypeName(HostType t) {
  switch (t) {
    case HOST_ANDROID: return "ANDROID";
    case HOST_WINDOWS: return "WINDOWS";
    case HOST_LINUX: return "LINUX";
    case HOST_MACOS: return "MACOS";
    default: return "UNKNOWN";
  }
}

// ── Fingerprint signals ───────────────────────────────────────
// Primary discriminator: Windows reads the BOS descriptor, finds the
// MS OS 2.0 Platform Capability entry the library always includes, and
// sends a vendor request (bRequest=2 / VENDOR_REQUEST_MICROSOFT, wIndex=7).
// Android never requests BOS for HID devices so this never fires on Android.
// tinyusb_vendor_control_request_cb() below catches it — it is declared
// __attribute__((weak)) in esp32-hal-tinyusb.c so no library edit is needed.

static volatile bool fp_eeStringRequested = false;    // Windows-only: string 0xEE probe
static volatile bool fp_msVendorReqReceived = false;  // secondary (USB 2.1 only, unused at 2.0)
static volatile bool fp_setIdleReceived = false;
static volatile bool fp_setProtocolReceived = false;
static volatile uint8_t fp_setProtocolValue = 0xFF;
static volatile bool fp_getReportReceived = false;
static volatile bool fp_getIdleReceived = false;
static volatile bool fp_getProtocolReceived = false;
// Timestamps: fp_connectTimeMs set in setup() right after while(!USB).
static volatile unsigned long fp_connectTimeMs = 0;
static volatile unsigned long fp_firstHIDReqMs = 0;
static volatile unsigned long fp_setIdleMs = 0;
static volatile unsigned long fp_setProtocolMs = 0;
static volatile unsigned long fp_getReportMs = 0;
// Evaluated result
static volatile bool fp_evaluated = false;
HostType detectedHostType = HOST_UNKNOWN;

#define FP_TIMING_THRESHOLD_MS 8   // Android ~0-2 ms, Windows ~15-25 ms — threshold splits them cleanly

// ── Scorer (no I/O — safe to call from any context) ──────────
// Returns the host type based purely on timing.  Does NOT write to
// FPSerial so it cannot block loop() regardless of CDC state.
static HostType scoreHostType() {
  unsigned long delta = (fp_firstHIDReqMs >= fp_connectTimeMs)
                          ? (fp_firstHIDReqMs - fp_connectTimeMs)
                          : 0UL;
  return (delta >= FP_TIMING_THRESHOLD_MS) ? HOST_WINDOWS : HOST_ANDROID;
}

// ── Report printer — only call when host is confirmed Windows ─
// All FPSerial output lives here so Android never sees a write attempt.
static void printFingerprintReport(HostType result) {
  unsigned long hidDelta = (fp_firstHIDReqMs >= fp_connectTimeMs)
                             ? (fp_firstHIDReqMs - fp_connectTimeMs)
                             : 0UL;
  FPSerial.println("[FP] ════ FINGERPRINT REPORT ════");
  FPSerial.printf("[FP] fp_connectTimeMs      : %lu\n", (unsigned long)fp_connectTimeMs);
  FPSerial.printf("[FP] fp_firstHIDReqMs      : %lu  (delta +%lu ms)\n",
                  (unsigned long)fp_firstHIDReqMs, hidDelta);
  FPSerial.printf("[FP] HID req delta (key)    : %lu ms  (threshold %d ms)\n",
                  hidDelta, FP_TIMING_THRESHOLD_MS);
  FPSerial.printf("[FP] SET_IDLE received      : %s", fp_setIdleReceived ? "YES" : "NO");
  if (fp_setIdleReceived && fp_setIdleMs >= fp_connectTimeMs)
    FPSerial.printf("  (+%lu ms)\n", (unsigned long)(fp_setIdleMs - fp_connectTimeMs));
  else FPSerial.println();
  FPSerial.printf("[FP] SET_PROTOCOL recv      : %s  val=%d",
                  fp_setProtocolReceived ? "YES" : "NO", fp_setProtocolValue);
  if (fp_setProtocolReceived && fp_setProtocolMs >= fp_connectTimeMs)
    FPSerial.printf("  (+%lu ms)\n", (unsigned long)(fp_setProtocolMs - fp_connectTimeMs));
  else FPSerial.println();
  FPSerial.printf("[FP] GET_REPORT recv        : %s", fp_getReportReceived ? "YES" : "NO");
  if (fp_getReportReceived && fp_getReportMs >= fp_connectTimeMs)
    FPSerial.printf("  (+%lu ms)\n", (unsigned long)(fp_getReportMs - fp_connectTimeMs));
  else FPSerial.println();
  FPSerial.printf("[FP] GET_IDLE received      : %s\n", fp_getIdleReceived ? "YES" : "NO");
  FPSerial.printf("[FP] GET_PROTOCOL recv      : %s\n", fp_getProtocolReceived ? "YES" : "NO");
  FPSerial.println("[FP] ════════════════════════════");
  if (result == HOST_WINDOWS)
    FPSerial.printf("[FP] RESULT: WINDOWS (HID delta %lu ms >= %d ms threshold)\n",
                    hidDelta, FP_TIMING_THRESHOLD_MS);
  else
    FPSerial.printf("[FP] RESULT: ANDROID / non-Windows (HID delta %lu ms < %d ms threshold)\n",
                    hidDelta, FP_TIMING_THRESHOLD_MS);
}

// ── Fingerprint reset ────────────────────────────────────────
static void fp_reset() {
  fp_eeStringRequested = false;
  fp_msVendorReqReceived = false;
  fp_setIdleReceived = false;
  fp_setProtocolReceived = false;
  fp_setProtocolValue = 0xFF;
  fp_getReportReceived = false;
  fp_getIdleReceived = false;
  fp_getProtocolReceived = false;
  fp_firstHIDReqMs = 0;
  fp_setIdleMs = 0;
  fp_setProtocolMs = 0;
  fp_getReportMs = 0;
  fp_evaluated = false;
  detectedHostType = HOST_UNKNOWN;
  // fp_connectTimeMs is set separately in setup()
}

class CustomHID : public USBHIDDevice {
private:
  ServoReport lastReport = { 0 };
public:
  CustomHID(void) {
    static bool initialized = false;
    if (!initialized) {
      initialized = true;
      HID.addDevice(this, sizeof(customReportDescriptor));
    }
  }
  void begin(void) {
    HID.begin();
  }
  uint16_t _onGetDescriptor(uint8_t* buffer) {
    memcpy(buffer, customReportDescriptor, sizeof(customReportDescriptor));
    return sizeof(customReportDescriptor);
  }
  bool sendReport(ServoReport* report) {
    if (!usbSendMutex) return false;
    bool ok = false;
    if (xSemaphoreTake(usbSendMutex, pdMS_TO_TICKS(5)) == pdTRUE) {
      ok = HID.SendReport(1, report, sizeof(ServoReport));
      xSemaphoreGive(usbSendMutex);
    }
    return ok;
  }
  void _onOutput(uint8_t report_id, const uint8_t* buffer, uint16_t len) {
    lastUSBActivity = millis();
    if (len >= 32) {
      taskENTER_CRITICAL(&bufferMux);
      uint8_t wb = writeBuffer;
      for (int i = 0; i < 32; i++) servoBuffer[wb][i] = buffer[i];
      bufferReady = true;
      taskEXIT_CRITICAL(&bufferMux);
    }
  }
  uint16_t _onGetReport(uint8_t report_id, uint8_t* buffer, uint16_t len) {
    unsigned long now = millis();
    lastUSBActivity = now;
    if (fp_firstHIDReqMs == 0) fp_firstHIDReqMs = now;
    fp_getReportReceived = true;
    fp_getReportMs = now;
    // No FPSerial here — Core-0 USB callback; CDC writes cause WDT resets.
    if (len >= 32) {
      memcpy(buffer, &lastReport, 32);
      return 32;
    }
    return 0;
  }
  void _onSetReport(uint8_t report_id, const uint8_t* buffer, uint16_t len) {
    lastUSBActivity = millis();
    if (len >= 32) {
      taskENTER_CRITICAL(&bufferMux);
      uint8_t wb = writeBuffer;
      for (int i = 0; i < 32; i++) servoBuffer[wb][i] = buffer[i];
      bufferReady = true;
      taskEXIT_CRITICAL(&bufferMux);
    }
  }
  // ── Fingerprinting hook ──────────────────────────────────────
  // _onSetup is called by the ESP32 Arduino USBHID layer for every
  // HID class-type setup packet BEFORE TinyUSB's default handler.
  // We peek at the request, record it, then return false so TinyUSB
  // handles the ACK/response normally — we never disrupt USB traffic.
  //
  // setup[] layout (8 bytes, USB spec §9.3):
  //   [0] bmRequestType  [1] bRequest
  //   [2] wValue-lo      [3] wValue-hi
  //   [4] wIndex-lo      [5] wIndex-hi
  //   [6] wLength-lo     [7] wLength-hi
  bool _onSetup(const uint8_t setup[8], uint8_t* buf, uint16_t* len) {
    unsigned long now = millis();
    if (fp_firstHIDReqMs == 0) fp_firstHIDReqMs = now;
    long delta = (fp_connectTimeMs > 0) ? (long)(now - fp_connectTimeMs) : -1;

    uint8_t bmRT = setup[0];
    uint8_t bRequest = setup[1];
    uint8_t wValLo = setup[2];
    uint8_t wValHi = setup[3];

    // Record signals only — no FPSerial calls here.
    // _onSetup runs on the Core-0 USB task; CDC writes from this context
    // can deadlock the USB stack and trigger the Core-0 WDT.
    // scoreHostType() in loop() evaluates after the window closes; printFingerprintReport() only fires on Windows.
    switch (bRequest) {
      case 0x0A:
        fp_setIdleReceived = true;
        fp_setIdleMs = now;
        break;  // SET_IDLE
      case 0x0B:
        fp_setProtocolReceived = true;  // SET_PROTOCOL
        fp_setProtocolValue = wValLo;
        fp_setProtocolMs = now;
        break;
      case 0x02: fp_getIdleReceived = true; break;      // GET_IDLE
      case 0x03: fp_getProtocolReceived = true; break;  // GET_PROTOCOL
      default: break;
    }

    return false;  // always defer to TinyUSB default handler
  }

  void updateLastReport(uint8_t* data) {
    memcpy(lastReport.servoPosition, data, 32);
  }
  void sendKeepalive() {
    if (!USB) return;  // don't send if host isn't connected
    if (!usbSendMutex) return;
    if (xSemaphoreTake(usbSendMutex, pdMS_TO_TICKS(5)) == pdTRUE) {
      HID.SendReport(1, &lastReport, sizeof(ServoReport));
      xSemaphoreGive(usbSendMutex);
    }
  }
};

CustomHID controller;

// ─────────────────────────────────────────────────────────────
//  USB descriptor strings — set via a global constructor so they
//  are applied before Arduino's initArduino() starts the USB stack,
//  which happens before setup() is ever called.  Calling
//  USB.productName() inside setup() is too late.
// ─────────────────────────────────────────────────────────────
static const struct _USBEarlyInit {
  _USBEarlyInit() {
    USB.VID(0x0925);
    USB.PID(0x1299);
    USB.productName("32 Servo Controller");
    USB.manufacturerName("Endurance R/C");
    USB.serialNumber("32SC001");
  }
} _usbEarlyInit;


// ─────────────────────────────────────────────────────────────
//  TinyUSB weak callbacks — fingerprinting backup layer
//
//  TinyUSB declares tud_hid_set_idle_cb and tud_hid_set_protocol_cb
//  as TU_ATTR_WEAK symbols.  Defining them here overrides the empty
//  stubs so we are guaranteed to see SET_IDLE / SET_PROTOCOL even if
//  the Arduino USBHID wrapper version running on the target handles
//  those requests before forwarding them to _onSetup.
//
//  These run in the USB task / ISR context (Core 0).  Only plain
//  volatile writes and Serial prints are safe here.
// ─────────────────────────────────────────────────────────────
// ESP32 Arduino 2.0.x TinyUSB signature: bool(instance, idle_rate) — no report_id.
// Return true to ACK; TinyUSB sends the ZLP status stage for us.
extern "C" bool tud_hid_set_idle_cb(uint8_t instance, uint8_t idle_rate) {
  unsigned long now = millis();
  if (fp_firstHIDReqMs == 0) fp_firstHIDReqMs = now;
  fp_setIdleReceived = true;
  if (fp_setIdleMs == 0) fp_setIdleMs = now;
  // No FPSerial call — runs on Core-0 USB task; CDC writes here cause WDT resets.
  return true;
}

extern "C" void tud_hid_set_protocol_cb(uint8_t instance, uint8_t protocol) {
  if (fp_firstHIDReqMs == 0) fp_firstHIDReqMs = millis();
  fp_setProtocolReceived = true;
  fp_setProtocolValue = protocol;
  // No FPSerial call — same reason as above.
}

// ─────────────────────────────────────────────────────────────
//  Host discriminator — timing-based
//
//  All passive USB signal approaches (string 0xEE, BOS/MS OS 2.0) either
//  require USB 2.1 which causes Android to reset the bus repeatedly, or
//  are cached by Windows and stop firing after the first plug-in.
//
//  The reliable discriminator that requires no library hacks and causes
//  no enumeration side-effects is the timing gap between USB connect and
//  the first HID class request:
//
//    Windows:  ~15–25 ms  — Windows must load/match the HID driver first,
//                           then the driver sends SET_IDLE.
//    Android:  ~0–2 ms   — Android's built-in kernel HID stack sends
//                           SET_IDLE as part of enumeration itself.
//
//  Threshold: 8 ms.  Values consistently observed: Windows ~20 ms,
//  Android ~0 ms.  If the gap ever turns out to overlap on real hardware
//  the threshold can be tuned here.
// ─────────────────────────────────────────────────────────────

// ─────────────────────────────────────────────────────────────
//  WiFi — objects / state (only activated if usbMode == false)
// ─────────────────────────────────────────────────────────────
volatile int sliderValues[NUM_SERVOS] = { 0 };
SemaphoreHandle_t sliderMutex = nullptr;
TaskHandle_t webTaskHandle = nullptr;
TaskHandle_t hardwareTaskHandle = nullptr;

#define AP_SSID        "32_SC"
#define AP_PASSWORD    "12345678"
#define AP_IP          IPAddress(192, 168, 4, 1)


WebServer   server(80);        // control API — always responsive
WiFiServer  streamServer(81);  // raw MJPEG stream — separate from control API
WiFiClient  streamClient;

DNSServer   dns;
Preferences prefs;

enum Mode { MODE_AP, MODE_STA };
Mode currentMode = MODE_AP;
String savedSsid;
String savedPass;
String savedNetMode;   // "ap" or "sta" — persisted to prefs

// ── Camera reinit signal (web task → hardware task) ──────────
volatile bool         reinitRequested  = false;
volatile framesize_t  pendingFrameSize = FRAMESIZE_XGA;

// ── Camera presence flag (set at boot, false if not wired) ───
bool cameraAvailable = false;

// ── Web-visible syslog ring buffer ───────────────────────────
#define SYSLOG_MAX 48
static String   _syslogBuf[SYSLOG_MAX];
static uint32_t _syslogTotal = 0;

// ── Stream telemetry (updated by hardware task, read by web task) ──
volatile uint16_t streamFps  = 0;   // frames per second
volatile uint32_t streamKbps = 0;   // kilobits per second
// Internal accumulators (hardware task only — no mutex needed)
static uint32_t _fpsFrameCount = 0;
static uint32_t _bpsByteCount  = 0;
static uint32_t _statsLastMs   = 0;

// Forward declarations
bool isConnectedToUSBHost();
void showEnduranceRC_WIFI_MODE();
void showEnduranceRC_USB_MODE();
void displayWiFiSignal();

static const char SETUP_HTML[] PROGMEM = R"rawliteral(
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="data:image/x-icon;base64,AAABAAMAEBAAAAEACABoBQAANgAAACAgEAABAAQA6AIAAJ4FAAAwMAAAAQAIAKgOAACGCAAAKAAAABAAAAAgAAAAAQAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAQAAAgEAAAEBAQACAQEAAgIAAAMCAAADAgEABAMAAAUEAgAGBAIABgUAAAcFAwAIBQMACAYAAAgGAwAJBwMACggAAA8MAAASDwAAExAAABkVAAAdGAAA++EAAPziAAD94wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAQgAAAAAAAAABAAGAQELEQAAAAAABQAABA0PGRkZGRkZGRkZGRkZDw0NDxkZGRgZGRkZGRkZGQ0NDQ8ZGRkPDQ0NDQ0NDQ0NDQ0PGRkZDw0NDQ0NDQ0NDQ0NDxkZGRAPDw8PDw0NDQ0NDQ8ZGRkZGRkZGRkZDw0NDQ0PGRkZGRkZGRkZGQ8NDQ0NDxkZGRAPDw8PDw0NDQ0NDQ8ZGRkPDQ0NDQ0NDQ0NDQ0PGRkZDw0NDQ0NDQ0NDQ0NDxgZGRkZGRcXGBgZGQ0NDQ8ZGRkZGRkZGRkYGRcPDQ0HFAIRERMGABIOFhUTAwoMAAAAAAAAAAAAAAAAAAAJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgAAAAgAAAAQAAAAAEABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBQMACAYDAAkHAwAKCAMACwkDAAwJAwANCgMADgoFABIPAgAUEAUAi30AAP3jAAAAAAAAAAAAAAAAAAAAAAAAAAS7u7u7u7u7u7u7u7tAAAAEqqqqqqqqqqqqqqqqQAAABLu7u7u7u7u7u7u7u0AAAASqqqqqqqqqqqqqqqowAAAEu7u7u7u7u7u7u7u7IAAABKqqqGVEREREREREMgAAAAS7u7YQAAAAAAAAAAAAAAAEqqqlAAAAAAAAAAAAAAAABLu7tAAAAAAAAAAAAAAAAASqqqQAAAAAAAAAAAAAAAAEu7u0AAAAAAAAAAAAAAAABKqqpQAAAAAAAAAAAAAAAAS7u7YQAAAAAAAAAAAAAAAEqqqoZURERERDIAAAAAAABLu7u7u7u7u7u7IAAAAAAASqqqqqqqqqqqqjAAAAAAAEu7u7u7u7u7u7swAAAAAABKqqqqqqqqqqqqIAAAAAAAS7u7hlREREREMgAAAAAAAEqqqmEAAAAAAAAAAAAAAABLu7tQAAAAAAAAAAAAAAAASqqqQAAAAAAAAAAAAAAAAEu7u0AAAAAAAAAAAAAAAABKqqpAAAAAAAAAAAAAAAAAS7u7UAAAAAAAAAAAAAAAAEqqqmEAAAAAAAAAAAAAAABLu7uGVEREREREREMgAAAASqqqqqqqqqqqqqqqogAAAEu7u7u7u7u7u7u7u7MAAABKqqqqqqqqqqqqqqqkAAAAS7u7u7u7u7u7u7u7tAAHd5qqqqqqqqqqqqqqqql3cAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgAAAAwAAAAYAAAAAEACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBQMACAYDAAkHAwAKCAMACwkDAAwKAwANCgMADgoFAA0LAwAOCwMADwsFAA4MAwAPDQIAEAwFABANAgARDQUAEQ8CABIPAgATDgUAEw8CABMPBQAUEAUAFhIFABcTBQAYFAUAGhUFABoWAgAaFgUAHBcEAB0YBAAfGwQAIBsEACEcBAAiHAQAinwAAIt9AAD74QAA/OIAAP3jAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgUOEBETExMTExMTExMTExMTExMTExMTExMTExMTExEQDgUCAAAAAAAABwcHBwcKFCQlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSQUCgcHBwcHBwcHBwcKFyUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHAAAAAAABCCIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyIIAQAAAAAAAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyILAgAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUYCgcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHAAAAAAACCyIjIyMjIyIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIDAAAAAAAAAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwsLCwsLCwsJBgMBAAAAAAAABwcHBwcNGSUmJiYmJR8VDw0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQoKCgcHBwcHBwcHBwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRsNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIhEEAgICAgICAgICAgICAgICAQEBAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwkGAwEAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJiUlJSUlJSUlJSUlJSUlJSUlJSUlJBIHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJRcKBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIggBAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIggBAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJRcKBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJiUlJSUlJSUlJSUlJSUlJSUlJSUlJBIHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwkGAwEAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIhEEAgICAgICAgICAgICAgICAQEBAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRsNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJR8VDw0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQoKCgcHBwcHBwcHAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwsLCwsLCwsJBgMBAAAAAAAAAAAAAAACCyIjIyMjIyIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIDAAAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUYCgcHBwcHAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyILAgAAAAAAAAAAAAABCCIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyIIAQAAAAAABwcHBwcKFyUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHBwcHBwcKFCQlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSQUCgcHBwcHBwcHBwcHDRYdHiAhISEhISEhISEhISEhISEhISEhISEhISEhISAeHRYNBwcHBwcHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
  <title>32 Servo Controller - Setup</title>
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    :root{--bg:#050709;--accent:#00ffe7;--accent2:#ff3c5f;--text:#b8d8e8;--dim:#3a5060;--danger:#ff3c5f}
    html,body{
      min-height:100vh;background:var(--bg);color:var(--text);
      font-family:'Orbitron',monospace;
      display:flex;flex-direction:column;align-items:center;justify-content:center;padding:20px;gap:20px;
    }
    body::before{
      content:'';position:fixed;inset:0;
      background-image:linear-gradient(rgba(0,255,231,0.05) 1px,transparent 1px),
        linear-gradient(90deg,rgba(0,255,231,0.05) 1px,transparent 1px);
      background-size:48px 48px;pointer-events:none;z-index:0;
    }
    body::after{
      content:'';position:fixed;inset:0;
      background:repeating-linear-gradient(0deg,transparent,transparent 3px,rgba(0,0,0,0.08) 3px,rgba(0,0,0,0.08) 4px);
      pointer-events:none;z-index:0;
    }
    @keyframes statglow-cyan{
      0%,100%{text-shadow:-2px 0 rgba(0,255,231,.45),2px 0 rgba(255,60,95,.45),0 0 10px rgba(0,255,231,.8),0 0 24px rgba(0,255,231,.4)}
      50%{text-shadow:-4px 0 rgba(0,255,231,.7),4px 0 rgba(255,60,95,.7),0 0 22px rgba(0,255,231,1),0 0 44px rgba(0,255,231,.5)}
    }
    @keyframes statglow-pink{
      0%,100%{text-shadow:2px 0 rgba(255,60,95,.45),-2px 0 rgba(0,255,231,.45),0 0 10px rgba(255,60,95,.7),0 0 24px rgba(255,60,95,.3)}
      50%{text-shadow:4px 0 rgba(255,60,95,.7),-4px 0 rgba(0,255,231,.7),0 0 22px rgba(255,60,95,1),0 0 44px rgba(255,60,95,.5)}
    }
    @keyframes logo-flicker{0%,90%,92%,97%,97.5%,100%{opacity:1}91.4%{opacity:.12}97.2%{opacity:.55}}
    @keyframes pulseline{0%,100%{opacity:.9}50%{opacity:.2}}
    @keyframes fadeInUp{from{opacity:0;transform:translateY(12px)}to{opacity:1;transform:none}}
    .logo-wrap{text-align:center;position:relative;z-index:1}
    .logo{font-size:1.2rem;font-weight:800;letter-spacing:4px;text-transform:uppercase}
    .logo-real{color:var(--accent);animation:statglow-cyan 2.5s ease-in-out infinite,logo-flicker 8s ease-in-out infinite}
    .logo-driver{color:var(--accent2);animation:statglow-pink 2.5s ease-in-out infinite,logo-flicker 8s ease-in-out infinite .3s}
    .logo-subtitle{font-family:'Share Tech Mono',monospace;font-size:9px;letter-spacing:3px;color:var(--accent);margin-top:4px}
    .login-box{
      width:340px;max-width:95vw;background:rgba(5,10,16,0.85);
      padding:28px 24px;position:relative;
      animation:fadeInUp .5s .1s ease both;
      backdrop-filter:blur(8px);z-index:1;
    }
    .login-box::before{
      content:'';position:absolute;top:0;left:0;right:0;height:2px;
      background:linear-gradient(90deg,transparent,var(--accent),var(--accent2),var(--accent),transparent);
      animation:pulseline 2s ease-in-out infinite;
    }
    .corner-tl,.corner-tr,.corner-bl,.corner-br{position:absolute;width:12px;height:12px}
    .corner-tl{top:0;left:0;border-top:1.5px solid var(--accent);border-left:1.5px solid var(--accent)}
    .corner-tr{top:0;right:0;border-top:1.5px solid var(--accent);border-right:1.5px solid var(--accent)}
    .corner-bl{bottom:0;left:0;border-bottom:1.5px solid var(--accent2);border-left:1.5px solid var(--accent2)}
    .corner-br{bottom:0;right:0;border-bottom:1.5px solid var(--accent2);border-right:1.5px solid var(--accent2)}
    .field-wrap{margin-bottom:14px}
    .field-label{font-size:.6rem;letter-spacing:3px;color:var(--dim);text-transform:uppercase;margin-bottom:6px;font-family:'Share Tech Mono',monospace}
    input[type=text],input[type=password]{
      width:100%;background:rgba(0,20,30,0.75);
      border:1px solid rgba(0,255,231,0.3);color:var(--accent);
      font-family:'Share Tech Mono',monospace;font-size:.8rem;
      padding:10px 14px;outline:none;transition:border-color .2s,background .2s;
    }
    input[type=text]::placeholder,input[type=password]::placeholder{color:var(--dim);opacity:.7}
    input[type=text]:focus,input[type=password]:focus{border-color:rgba(0,255,231,.85);background:rgba(0,30,45,.82)}
    .pw-wrap{position:relative}
    .pw-wrap input{padding-right:44px}
    .eye{position:absolute;right:12px;top:50%;transform:translateY(-50%);cursor:pointer;color:var(--dim);font-size:1.1rem;user-select:none}
    .scan-row{display:flex;gap:8px;align-items:stretch}
    .ssid-dropdown{position:relative;font-family:'Share Tech Mono',monospace;flex:1;z-index:100}
    .ssid-trigger{
      display:flex;align-items:center;justify-content:space-between;gap:8px;
      background:rgba(0,20,30,0.75);border:1px solid rgba(0,255,231,0.3);color:var(--accent);
      padding:10px 14px;cursor:pointer;font-size:.7rem;font-weight:700;
      letter-spacing:.08em;text-transform:uppercase;white-space:nowrap;user-select:none;width:100%;
      transition:border-color .2s;
    }
    .ssid-trigger:hover{border-color:var(--accent)}
    .ssid-arrow{font-size:.65rem;transition:transform .25s;flex-shrink:0}
    .ssid-dropdown.open .ssid-arrow{transform:rotate(180deg)}
    .ssid-menu{
      display:none;position:absolute;top:calc(100% + 4px);left:0;
      list-style:none;padding:4px 0;margin:0;
      background:#050d14;border:1px solid rgba(0,255,231,0.2);
      min-width:100%;max-height:200px;overflow-y:auto;
      box-shadow:0 0 20px rgba(0,255,231,.12),0 8px 32px #000c;
    }
    .ssid-dropdown.open .ssid-menu{display:block}
    .ssid-menu li{
      display:flex;justify-content:space-between;align-items:center;gap:12px;
      padding:9px 14px;color:var(--text);font-size:.74rem;
      letter-spacing:.06em;text-transform:uppercase;cursor:pointer;
      border-left:2px solid transparent;transition:background .1s,color .1s,border-color .1s;
    }
    .ssid-menu li span{color:var(--dim);font-size:.7rem}
    .ssid-menu li:hover{background:rgba(0,255,231,.06);color:var(--accent);border-left-color:var(--accent)}
    .ssid-placeholder{color:var(--dim)!important;cursor:default!important;font-size:.7rem!important;text-transform:none!important;letter-spacing:.04em!important}
    .ssid-placeholder:hover{background:transparent!important;border-left-color:transparent!important;color:var(--dim)!important}
    .btn-scan{
      background:rgba(0,20,30,0.75);border:1px solid rgba(0,255,231,0.25);color:var(--dim);
      padding:10px 14px;cursor:pointer;font-size:.6rem;font-family:'Orbitron',monospace;
      letter-spacing:2px;text-transform:uppercase;white-space:nowrap;
      transition:border-color .2s,color .2s;flex-shrink:0;
    }
    .btn-scan:hover{border-color:var(--accent);color:var(--accent)}
    .btn-connect{
      margin-top:8px;width:100%;background:rgba(0,20,30,0.75);color:var(--accent);
      border:1px solid rgba(0,255,231,.4);padding:12px;
      font-size:.75rem;font-family:'Share Tech Mono',monospace;
      letter-spacing:3px;text-transform:uppercase;cursor:pointer;
      transition:background .2s,box-shadow .2s,border-color .2s;backdrop-filter:blur(4px);
    }
    .btn-connect:hover{background:rgba(0,40,55,.88);box-shadow:0 0 12px rgba(0,255,231,.25);border-color:var(--accent)}
    #msg{margin-top:12px;text-align:center;font-size:.72rem;font-family:'Share Tech Mono',monospace;min-height:18px;letter-spacing:1px}
    .ok{color:var(--accent)}.err{color:var(--danger)}
    .spinner{display:inline-block;width:12px;height:12px;border:2px solid rgba(0,255,231,.15);
             border-top-color:var(--accent);border-radius:50%;animation:spin .7s linear infinite;vertical-align:middle;margin-right:6px}
    @keyframes spin{to{transform:rotate(360deg)}}
  </style>
</head>
<body>
<div class="logo-wrap">
  <div class="logo"><span class="logo-real">32 SERVO</span><span class="logo-driver"> CONTROLLER</span></div>
  <div class="logo-subtitle">&#9658;&nbsp;&nbsp;WIFI SETUP&nbsp;&nbsp;&#9668;</div>
</div>

<div class="login-box">
  <div class="corner-tl"></div><div class="corner-tr"></div>
  <div class="corner-bl"></div><div class="corner-br"></div>

  <div class="field-wrap">
    <div class="field-label"><span style="color:var(--accent2)">//</span><span style="color:var(--accent)"> NETWORK (SSID)</span></div>
    <div class="scan-row">
      <div class="ssid-dropdown" id="ssid-dropdown">
        <div class="ssid-trigger" id="ssid-trigger" onclick="toggleSsidDropdown()">
          <span id="ssid-label">tap Scan to find networks</span>
          <span class="ssid-arrow">&#9660;</span>
        </div>
        <ul class="ssid-menu" id="ssid-menu">
          <li class="ssid-placeholder">tap Scan to find networks</li>
        </ul>
      </div>
      <button type="button" class="btn-scan" onclick="scanNetworks()">SCAN</button>
    </div>
  </div>

  <div class="field-wrap">
    <div class="field-label"><span style="color:var(--accent2)">//</span><span style="color:var(--accent)"> OR TYPE SSID</span></div>
    <input type="text" id="ssid" placeholder="MyWiFiNetwork" autocomplete="off" spellcheck="false">
  </div>

  <div class="field-wrap">
    <div class="field-label"><span style="color:var(--accent2)">//</span><span style="color:var(--accent)"> PASSWORD</span></div>
    <div class="pw-wrap">
      <input type="password" id="pass" placeholder="WiFi password" autocomplete="new-password">
      <span class="eye" onclick="togglePw()">&#128065;</span>
    </div>
  </div>

  <button type="button" class="btn-connect" onclick="doConnect()">[ CONNECT &amp; SAVE ]</button>
  <div id="msg"></div>

  <div style="text-align:center;margin-top:16px">
    <a href="/" style="font-family:'Share Tech Mono',monospace;font-size:9px;letter-spacing:3px;color:rgba(0,255,231,0.35);text-decoration:none;text-transform:uppercase">&#9664; BACK TO CONTROL</a>
  </div>
</div>
<script>
  function msg(text,cls){const e=document.getElementById('msg');e.innerHTML=text;e.className=cls||'';}
  function togglePw(){const p=document.getElementById('pass');p.type=p.type==='password'?'text':'password';}
  function pickSsid(v,label){
    if(v){
      document.getElementById('ssid').value=v;
      document.getElementById('ssid-label').textContent=label||v;
    }
    closeSsidDropdown();
  }
  function toggleSsidDropdown(){
    document.getElementById('ssid-dropdown').classList.toggle('open');
  }
  function closeSsidDropdown(){
    document.getElementById('ssid-dropdown').classList.remove('open');
  }
  document.addEventListener('click',function(e){
    const dd=document.getElementById('ssid-dropdown');
    if(!dd.contains(e.target))closeSsidDropdown();
  });
  function scanNetworks(){
    msg('<span class="spinner"></span>Scanning&hellip;');
    fetch('/scan').then(r=>r.json()).then(nets=>{
      const menu=document.getElementById('ssid-menu');
      menu.innerHTML='';
      if(nets.length===0){
        const li=document.createElement('li');
        li.className='ssid-placeholder';
        li.textContent='No networks found';
        menu.appendChild(li);
      } else {
        nets.forEach(n=>{
          const li=document.createElement('li');
          const label=n.ssid;
          const rssi=n.rssi+' dBm';
          li.innerHTML=label+'<span>'+rssi+'</span>';
          li.onclick=()=>pickSsid(n.ssid,n.ssid);
          menu.appendChild(li);
        });
      }
      document.getElementById('ssid-label').textContent='select a network';
      msg(nets.length+' networks found','ok');
    }).catch(()=>msg('Scan failed - try again','err'));
  }
  function doConnect(){
    const ssid=document.getElementById('ssid').value.trim();
    const pass=document.getElementById('pass').value;
    if(!ssid){msg('Please enter a network name (SSID)','err');return;}
    msg('<span class="spinner"></span>Saving &amp; connecting&hellip;');
    fetch('/save',{method:'POST',
      headers:{'Content-Type':'application/x-www-form-urlencoded'},
      body:'ssid='+encodeURIComponent(ssid)+'&pass='+encodeURIComponent(pass)
    }).then(r=>r.text()).then(t=>msg(t,'ok')).catch(()=>msg('Close this page and reconnect to WiFi','err'));
  }
  function setAPMode(){
    if(!confirm('Switch to Access Point mode? The device will reboot and broadcast its own WiFi network.'))return;
    msg('<span class="spinner"></span>Switching to AP mode&hellip;');
    fetch('/setap').then(r=>r.text()).then(t=>{
      msg(t,'ok');
    }).catch(()=>msg('Done — reconnect to 32_SC_Setup network','ok'));
  }
  window.addEventListener('DOMContentLoaded',scanNetworks);
  (function(){var l=document.createElement('link');l.rel='stylesheet';
  l.href='https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;800&family=Share+Tech+Mono&display=swap';
  document.head.appendChild(l);})();
</script>
</body>
</html>

)rawliteral";

// -------------------------------------------------------------
//  HTML - main page: camera + servo sliders (STA mode)
// -------------------------------------------------------------
static const char MAIN_HTML[] PROGMEM = R"rawliteral(
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="data:image/x-icon;base64,AAABAAMAEBAAAAEACABoBQAANgAAACAgEAABAAQA6AIAAJ4FAAAwMAAAAQAIAKgOAACGCAAAKAAAABAAAAAgAAAAAQAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAQAAAgEAAAEBAQACAQEAAgIAAAMCAAADAgEABAMAAAUEAgAGBAIABgUAAAcFAwAIBQMACAYAAAgGAwAJBwMACggAAA8MAAASDwAAExAAABkVAAAdGAAA++EAAPziAAD94wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAQgAAAAAAAAABAAGAQELEQAAAAAABQAABA0PGRkZGRkZGRkZGRkZDw0NDxkZGRgZGRkZGRkZGQ0NDQ8ZGRkPDQ0NDQ0NDQ0NDQ0PGRkZDw0NDQ0NDQ0NDQ0NDxkZGRAPDw8PDw0NDQ0NDQ8ZGRkZGRkZGRkZDw0NDQ0PGRkZGRkZGRkZGQ8NDQ0NDxkZGRAPDw8PDw0NDQ0NDQ8ZGRkPDQ0NDQ0NDQ0NDQ0PGRkZDw0NDQ0NDQ0NDQ0NDxgZGRkZGRcXGBgZGQ0NDQ8ZGRkZGRkZGRkYGRcPDQ0HFAIRERMGABIOFhUTAwoMAAAAAAAAAAAAAAAAAAAJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgAAAAgAAAAQAAAAAEABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBQMACAYDAAkHAwAKCAMACwkDAAwJAwANCgMADgoFABIPAgAUEAUAi30AAP3jAAAAAAAAAAAAAAAAAAAAAAAAAAS7u7u7u7u7u7u7u7tAAAAEqqqqqqqqqqqqqqqqQAAABLu7u7u7u7u7u7u7u0AAAASqqqqqqqqqqqqqqqowAAAEu7u7u7u7u7u7u7u7IAAABKqqqGVEREREREREMgAAAAS7u7YQAAAAAAAAAAAAAAAEqqqlAAAAAAAAAAAAAAAABLu7tAAAAAAAAAAAAAAAAASqqqQAAAAAAAAAAAAAAAAEu7u0AAAAAAAAAAAAAAAABKqqpQAAAAAAAAAAAAAAAAS7u7YQAAAAAAAAAAAAAAAEqqqoZURERERDIAAAAAAABLu7u7u7u7u7u7IAAAAAAASqqqqqqqqqqqqjAAAAAAAEu7u7u7u7u7u7swAAAAAABKqqqqqqqqqqqqIAAAAAAAS7u7hlREREREMgAAAAAAAEqqqmEAAAAAAAAAAAAAAABLu7tQAAAAAAAAAAAAAAAASqqqQAAAAAAAAAAAAAAAAEu7u0AAAAAAAAAAAAAAAABKqqpAAAAAAAAAAAAAAAAAS7u7UAAAAAAAAAAAAAAAAEqqqmEAAAAAAAAAAAAAAABLu7uGVEREREREREMgAAAASqqqqqqqqqqqqqqqogAAAEu7u7u7u7u7u7u7u7MAAABKqqqqqqqqqqqqqqqkAAAAS7u7u7u7u7u7u7u7tAAHd5qqqqqqqqqqqqqqqql3cAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgAAAAwAAAAYAAAAAEACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBQMACAYDAAkHAwAKCAMACwkDAAwKAwANCgMADgoFAA0LAwAOCwMADwsFAA4MAwAPDQIAEAwFABANAgARDQUAEQ8CABIPAgATDgUAEw8CABMPBQAUEAUAFhIFABcTBQAYFAUAGhUFABoWAgAaFgUAHBcEAB0YBAAfGwQAIBsEACEcBAAiHAQAinwAAIt9AAD74QAA/OIAAP3jAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgUOEBETExMTExMTExMTExMTExMTExMTExMTExMTExEQDgUCAAAAAAAABwcHBwcKFCQlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSQUCgcHBwcHBwcHBwcKFyUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHAAAAAAABCCIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyIIAQAAAAAAAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyILAgAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUYCgcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHAAAAAAACCyIjIyMjIyIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIDAAAAAAAAAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwsLCwsLCwsJBgMBAAAAAAAABwcHBwcNGSUmJiYmJR8VDw0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQoKCgcHBwcHBwcHBwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRsNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIhEEAgICAgICAgICAgICAgICAQEBAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwkGAwEAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJiUlJSUlJSUlJSUlJSUlJSUlJSUlJBIHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJRcKBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIggBAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIggBAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJRcKBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJiUlJSUlJSUlJSUlJSUlJSUlJSUlJBIHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwkGAwEAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIhEEAgICAgICAgICAgICAgICAQEBAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRsNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJR8VDw0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQoKCgcHBwcHBwcHAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwsLCwsLCwsJBgMBAAAAAAAAAAAAAAACCyIjIyMjIyIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIDAAAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUYCgcHBwcHAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyILAgAAAAAAAAAAAAABCCIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyIIAQAAAAAABwcHBwcKFyUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHBwcHBwcKFCQlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSQUCgcHBwcHBwcHBwcHDRYdHiAhISEhISEhISEhISEhISEhISEhISEhISEhISAeHRYNBwcHBwcHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
  <title>32 Servo Controller</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;800&family=Share+Tech+Mono&display=swap" rel="stylesheet">
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    :root{
      --bg:#050709;--panel:rgba(8,16,28,0.92);--border:rgba(0,255,231,0.18);
      --accent:#00ffe7;--accent2:#ff3c5f;--green:#00ff88;
      --text:#b8d8e8;--dim:#3a5060;--muted:#4a6878;--danger:#ff3c5f;
    }
    html,body{min-height:100vh;background:var(--bg);color:var(--text);font-family:'Orbitron',monospace}
    body::before{
      content:'';position:fixed;inset:0;
      background-image:linear-gradient(rgba(0,255,231,0.05) 1px,transparent 1px),
        linear-gradient(90deg,rgba(0,255,231,0.05) 1px,transparent 1px);
      background-size:48px 48px;pointer-events:none;z-index:0;
    }
    body::after{
      content:'';position:fixed;inset:0;
      background:repeating-linear-gradient(0deg,transparent,transparent 3px,rgba(0,0,0,0.06) 3px,rgba(0,0,0,0.06) 4px);
      pointer-events:none;z-index:0;
    }
    #header{
      position:relative;z-index:2;
      display:flex;align-items:center;justify-content:space-between;
      padding:14px 24px;min-height:64px;
      border-bottom:1px solid var(--border);
      background:var(--panel);backdrop-filter:blur(10px);
    }
    .logo-wrap{display:flex;flex-direction:column;align-items:center}
    @keyframes statglow-cyan{
      0%,100%{text-shadow:-2px 0 rgba(0,255,231,0.45),2px 0 rgba(255,60,95,0.45),0 0 10px rgba(0,255,231,0.8),0 0 24px rgba(0,255,231,0.4)}
      50%{text-shadow:-4px 0 rgba(0,255,231,0.7),4px 0 rgba(255,60,95,0.7),0 0 22px rgba(0,255,231,1),0 0 44px rgba(0,255,231,0.5)}
    }
    @keyframes statglow-pink{
      0%,100%{text-shadow:-2px 0 rgba(0,255,231,0.45),2px 0 rgba(255,60,95,0.45),0 0 10px rgba(255,60,95,0.8),0 0 24px rgba(255,60,95,0.4)}
      50%{text-shadow:-4px 0 rgba(0,255,231,0.7),4px 0 rgba(255,60,95,0.7),0 0 22px rgba(255,60,95,1),0 0 44px rgba(255,60,95,0.5)}
    }
    @keyframes logo-flicker{0%,90%,92%,97%,97.5%,100%{opacity:1}91.4%{opacity:.12}97.2%{opacity:.55}}
    .logo{font-size:1rem;font-weight:800;letter-spacing:4px;color:var(--accent);text-transform:uppercase;position:relative;animation:statglow-cyan 2.5s ease-in-out infinite,logo-flicker 8s ease-in-out infinite}
    .logo .logo-real{color:var(--accent);animation:statglow-cyan 2.5s ease-in-out infinite,logo-flicker 8s ease-in-out infinite}
    .logo .logo-driver{color:var(--accent2);animation:statglow-pink 2.5s ease-in-out infinite,logo-flicker 8s ease-in-out infinite .3s}
    .logo-subtitle{font-family:'Share Tech Mono',monospace;font-size:9px;letter-spacing:3px;color:var(--accent);margin-top:4px}
    .page{position:relative;z-index:1;padding:16px 16px 40px;max-width:900px;margin:0 auto}
    button{
      background:transparent;border:1px solid var(--border);color:var(--muted);
      padding:8px 18px;cursor:pointer;font-size:.68rem;font-family:'Orbitron',monospace;
      letter-spacing:2px;text-transform:uppercase;border-radius:0;
      transition:border-color .2s,color .2s,box-shadow .2s;
    }
    button:hover{border-color:var(--accent);color:var(--accent);box-shadow:0 0 10px rgba(0,255,231,.2)}
    button.active{background:rgba(0,255,231,.12);color:var(--accent);border-color:var(--accent);box-shadow:0 0 12px rgba(0,255,231,.3)}
    .danger-btn{border-color:rgba(255,60,95,.7);color:var(--danger);border-radius:4px;font-size:10px;font-weight:600;padding:7px 14px;}
    .danger-btn:hover{border-color:var(--danger)!important;color:var(--danger)!important;box-shadow:0 0 14px rgba(255,60,95,.35)!important}
    .input-mode-bar{
      display:flex;align-items:center;justify-content:center;gap:14px;
      margin-bottom:16px;padding-bottom:16px;border-bottom:1px solid var(--border);
    }
    .mode-label{font-size:.65rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--dim);transition:color .2s;user-select:none}
    .mode-label.active{color:var(--accent)}
    .toggle-track{
      position:relative;width:52px;height:26px;border-radius:13px;
      background:rgba(0,0,0,.4);border:1px solid var(--border);cursor:pointer;
      transition:background .25s,border-color .25s;flex-shrink:0;
    }
    .toggle-track.joystick{background:rgba(0,255,231,.1);border-color:var(--accent);box-shadow:0 0 8px rgba(0,255,231,.3)}
    .toggle-thumb{position:absolute;top:3px;left:3px;width:18px;height:18px;border-radius:50%;background:var(--dim);transition:transform .25s,background .25s}
    .toggle-track.joystick .toggle-thumb{transform:translateX(26px);background:var(--accent)}
    .toggle-track.disabled{opacity:.35;cursor:not-allowed}
    .toggle-track.disabled:hover{border-color:var(--border)}
    .mode-label.dimmed{color:#1a2530!important}
    .servo-section{margin-top:12px}
    .sl-slash{color:var(--accent2)}
    details.slider-panel{overflow:hidden}
    details.slider-panel summary{
      display:flex;justify-content:space-between;align-items:center;
      padding:6px 12px;cursor:pointer;list-style:none;
      border:1px solid var(--border);
      background:rgba(5,10,16,0.80);
      font-family:'Share Tech Mono',monospace;font-size:10px;
      color:var(--accent);letter-spacing:2px;
      backdrop-filter:blur(6px);
      user-select:none;transition:background .15s;
    }
    details.slider-panel summary::-webkit-details-marker{display:none}
    details.slider-panel summary:hover{background:rgba(5,10,16,0.95)}
    details.slider-panel[open] summary{border-bottom:none}
    .summary-chevron{font-size:11px;color:var(--accent)}
    .summary-chevron::before{content:'\25B8'}
    details.slider-panel[open] .summary-chevron::before{content:'\25BE'}
    .slider-panel-inner{
      border:1px solid var(--border);border-top:none;
      background:rgba(5,10,16,0.72);padding:12px;
      backdrop-filter:blur(6px);
    }
    .servo-grid{display:grid;grid-template-columns:1fr 1fr;gap:24px}
    @media(max-width:560px){.servo-grid{grid-template-columns:1fr}}
    .servo-col h3{
      font-size:.68rem;font-weight:700;color:var(--accent);
      text-align:center;padding:6px;
      background:rgba(0,255,231,.05);border:1px solid var(--border);
      margin-bottom:12px;letter-spacing:.08em;text-transform:uppercase;
      text-shadow:0 0 8px rgba(0,255,231,.5);
    }
    .servo-item{display:flex;align-items:center;gap:8px;margin-bottom:8px}
    .servo-label{min-width:72px;font-size:.68rem;color:var(--accent);font-family:'Share Tech Mono',monospace;font-weight:600;white-space:nowrap;text-transform:uppercase}
    input[type=range]{flex:1;accent-color:var(--accent);cursor:pointer;height:4px}
    .servo-val{min-width:30px;text-align:right;font-size:.72rem;font-weight:700;color:var(--accent);font-family:'Share Tech Mono',monospace}
    .servo-actions{display:flex;gap:8px;margin-top:16px;flex-wrap:wrap}
    .servo-actions button{flex:1;min-width:110px}
    .cyber-select{position:relative;width:100%}
    .map-cs{min-width:0}
    .cyber-select-btn{
      width:100%;height:36px;box-sizing:border-box;background:rgba(0,20,30,0.75);border:1px solid rgba(0,255,231,0.3);
      color:var(--accent);font-family:'Share Tech Mono',monospace;font-size:.72rem;
      padding:0 8px;cursor:pointer;transition:border-color .2s,background .2s;
      text-align:left;letter-spacing:1px;backdrop-filter:blur(4px);
      display:flex;align-items:center;justify-content:space-between;gap:4px;
    }
    .cyber-select-btn:hover,.cyber-select-btn.open{border-color:rgba(0,255,231,.85);background:rgba(0,30,45,.82)}
    .cs-label{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;flex:1;min-width:0}
    .cs-arrow{opacity:.5;font-size:.65rem;flex-shrink:0}
    .cyber-select-list{
      background:#050a10;border:1px solid rgba(0,255,231,0.3);
      max-height:180px;overflow-y:auto;
      font-family:'Share Tech Mono',monospace;font-size:.72rem;display:none;
    }
    .cyber-select-list::-webkit-scrollbar{width:14px;height:14px}
    .cyber-select-list::-webkit-scrollbar-track{background:#0a0e14;border-left:1px solid #0099bb22}
    .cyber-select-list::-webkit-scrollbar-thumb{background:#0099bb;border-radius:0;box-shadow:0 0 6px #0099bb,0 0 12px #0099bb66}
    .cyber-select-list::-webkit-scrollbar-thumb:hover{background:#00e5ff;box-shadow:0 0 8px #00e5ff,0 0 18px #00e5ffaa}
    .cyber-select-list::-webkit-scrollbar-corner{background:#0a0e14}
    .cs-opt{padding:7px 10px;color:var(--accent);cursor:pointer;letter-spacing:1px;transition:background .1s;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
    .cs-opt:hover{background:rgba(0,255,231,.1);color:#fff}
    .cs-opt.selected{background:rgba(0,255,231,.15);border-left:2px solid var(--accent)}
    .map-check-label{display:flex;align-items:center;gap:4px;font-family:'Share Tech Mono',monospace;font-size:.72rem;color:var(--accent);white-space:nowrap;cursor:pointer}
    .map-check-label input[type=checkbox]{appearance:none;-webkit-appearance:none;width:11px;height:11px;flex-shrink:0;background:rgba(0,10,18,0.85);border:1px solid rgba(0,255,231,0.35);cursor:pointer;position:relative;transition:border-color .15s,box-shadow .15s}
    .map-check-label input[type=checkbox]:checked{background:rgba(0,255,231,0.15);border-color:var(--accent);box-shadow:0 0 6px rgba(0,255,231,0.5)}
    .map-check-label input[type=checkbox]:checked::after{content:'';position:absolute;left:2px;top:0px;width:4px;height:7px;border:1.5px solid var(--accent);border-top:none;border-left:none;transform:rotate(45deg)}
    .map-dz-label{display:flex;align-items:center;gap:4px;font-family:'Share Tech Mono',monospace;font-size:.72rem;color:var(--accent);white-space:nowrap}
    .map-dz-label input{width:62px;height:36px;box-sizing:border-box;background:rgba(0,10,18,0.85);border:1px solid rgba(0,255,231,0.2);color:var(--accent);font-family:'Share Tech Mono',monospace;font-size:.72rem;padding:0 4px;outline:none;text-align:center}
    .map-dz-label input::-webkit-inner-spin-button,.map-dz-label input::-webkit-outer-spin-button{opacity:1;height:100%;filter:invert(1) sepia(1) saturate(3) hue-rotate(155deg)}
    .map-val-input{width:58px;height:36px;box-sizing:border-box;background:rgba(0,10,18,0.85);border:1px solid rgba(0,255,231,0.2);color:var(--accent);font-family:'Share Tech Mono',monospace;font-size:9px;padding:0 4px;outline:none;text-align:center}
    .map-val-input::-webkit-inner-spin-button,.map-val-input::-webkit-outer-spin-button{opacity:1;height:100%;filter:invert(1) sepia(1) saturate(3) hue-rotate(155deg)}
    .map-remove-btn{font-family:'Share Tech Mono',monospace;font-size:10px;padding:0;width:36px;height:36px;background:transparent;border:1px solid rgba(255,60,95,0.3);color:rgba(255,60,95,0.5);cursor:pointer;transition:all .2s;box-sizing:border-box;letter-spacing:0}
    .map-remove-btn:hover{border-color:var(--accent2)!important;color:var(--accent2)!important;box-shadow:none!important}
    /* global scrollbar — cyberpunk neon blue */
    ::-webkit-scrollbar{width:14px;height:14px}
    ::-webkit-scrollbar-track{background:#0a0e14;border-left:1px solid #0099bb22}
    ::-webkit-scrollbar-thumb{background:#0099bb;border-radius:0;box-shadow:0 0 6px #0099bb,0 0 12px #0099bb66}
    ::-webkit-scrollbar-thumb:hover{background:#00e5ff;box-shadow:0 0 8px #00e5ff,0 0 18px #00e5ffaa}
    ::-webkit-scrollbar-corner{background:#0a0e14}
    /* ssid dropdown scrollbar */
    .ssid-menu::-webkit-scrollbar{width:14px;height:14px}
    .ssid-menu::-webkit-scrollbar-track{background:#0a0e14;border-left:1px solid #0099bb22}
    .ssid-menu::-webkit-scrollbar-thumb{background:#0099bb;border-radius:0;box-shadow:0 0 6px #0099bb,0 0 12px #0099bb66}
    .ssid-menu::-webkit-scrollbar-thumb:hover{background:#00e5ff;box-shadow:0 0 8px #00e5ff,0 0 18px #00e5ffaa}
    .ssid-menu::-webkit-scrollbar-corner{background:#0a0e14}
  </style>
</head>
<body>
<div id="header">
  <div class="logo-wrap">
    <div class="logo"><span class="logo-real">32 SERVO</span><span class="logo-driver"> CONTROLLER</span></div>
    <div class="logo-subtitle">&#9658;&nbsp;&nbsp;v1.9&nbsp;&nbsp;&#9668;</div>
  </div>
  <button class="danger-btn" onclick="forgetWifi()">Reset WiFi</button>
</div>

<div class="page">

  <!-- controller status: collapsible panel -->
  <div class="servo-section">
    <details class="slider-panel" id="controller-panel" open>
      <summary>
        <span><span class="sl-slash">//</span> CONTROLLER</span>
        <span class="summary-chevron"></span>
      </summary>
      <div class="slider-panel-inner" style="padding:12px">

        <!-- Status bar -->
        <div style="margin-bottom:14px;padding-bottom:12px;border-bottom:1px solid var(--border)">
          <span id="gp-status" style="color:var(--dim);font-size:.72rem;font-family:'Share Tech Mono',monospace;display:block;text-align:center;width:100%">PRESS A BUTTON TO ACTIVATE CONTROLLER</span>
        </div>

        <!-- -- Axis / Button Mappings -- -->
        <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:8px">
          <span style="font-size:.66rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--accent)">Axis/Button -> Servo Mapping</span>
          <div style="display:flex;gap:6px">
            <button id="btn-add-axis" onclick="addAxisMapping()" style="padding:4px 10px;font-size:.65rem;border-color:rgba(0,255,231,.4);color:var(--accent)" disabled>+ Add Axis</button>
            <button id="btn-add-button" onclick="addButtonMapping()" style="padding:4px 10px;font-size:.65rem;border-color:rgba(0,255,231,.4);color:var(--accent)" disabled>+ Add Button</button>
          </div>
        </div>
        <div id="no-mappings-msg" style="color:var(--dim);font-size:.72rem;padding:8px 4px;text-align:center;font-family:'Share Tech Mono',monospace">NO MAPPINGS</div>
        <div style="margin-bottom:16px">
          <div id="axis-mappings"></div>
        </div>
        <div>
          <div id="button-mappings"></div>
        </div>

      </div>
    </details>
  </div>

  <!-- servo section: collapsible sliders -->
  <div class="servo-section">
    <details class="slider-panel" id="slider-panel" open>
      <summary>
        <span><span class="sl-slash">//</span> SERVO_CONTROLS</span>
        <span class="summary-chevron"></span>
      </summary>
      <div class="slider-panel-inner">
        <!-- input mode toggle inside panel -->
        <div class="input-mode-bar">
          <span class="mode-label active" id="lbl-slider">Sliders</span>
          <div class="toggle-track" id="mode-toggle" onclick="toggleInputMode()">
            <div class="toggle-thumb"></div>
          </div>
          <span class="mode-label" id="lbl-joystick">Joystick</span>
        </div>
        <div class="servo-grid">
          <div class="servo-col">

            <div id="col-a"></div>
          </div>
          <div class="servo-col">

            <div id="col-b"></div>
          </div>
        </div>
        <div class="servo-actions">

        </div>
      </div>
    </details>
  </div>

</div><!-- /page -->
<script>
  function forgetWifi() {
    if (!confirm('Clear saved WiFi credentials and restart in setup mode?')) return;
    fetch('/forget').then(() => alert('Done! The device will restart into setup mode.'));
  }

  // -- Input mode -------------------------------------------
  let inputMode = 'slider'; // 'slider' or 'joystick'
  let gamepadConnected = false;

  function setToggleEnabled(enabled) {
    const track   = document.getElementById('mode-toggle');
    const lblJoy  = document.getElementById('lbl-joystick');
    const btnAxis = document.getElementById('btn-add-axis');
    const btnBtn  = document.getElementById('btn-add-button');
    // Add buttons unlock as soon as a controller is detected
    const addEnabled = gamepadConnected;
    if (btnAxis) btnAxis.disabled = !addEnabled;
    if (btnBtn)  btnBtn.disabled  = !addEnabled;
    // Toggle only unlocks when controller detected AND at least one mapping exists
    if (enabled) {
      track.classList.remove('disabled');
      lblJoy.classList.remove('dimmed');
    } else {
      track.classList.add('disabled');
      lblJoy.classList.add('dimmed');
    }
  }

  function updateToggleState() {
    const hasMappings = axisMappings.length > 0 || buttonMappings.length > 0;
    setToggleEnabled(gamepadConnected && hasMappings);
  }

  function toggleInputMode() {
    if (!gamepadConnected) return; // block toggle when no controller
    inputMode = (inputMode === 'slider') ? 'joystick' : 'slider';
    const track     = document.getElementById('mode-toggle');
    const lblSlider = document.getElementById('lbl-slider');
    const lblJoy    = document.getElementById('lbl-joystick');
    if (inputMode === 'joystick') {
      track.classList.add('joystick');
      lblSlider.classList.remove('active');
      lblJoy.classList.add('active');
    } else {
      track.classList.remove('joystick');
      lblJoy.classList.remove('active');
      lblSlider.classList.add('active');
    }
  }

  function forceSliderMode() {
    if (inputMode === 'joystick') {
      inputMode = 'slider';
      const track     = document.getElementById('mode-toggle');
      const lblSlider = document.getElementById('lbl-slider');
      const lblJoy    = document.getElementById('lbl-joystick');
      track.classList.remove('joystick');
      lblJoy.classList.remove('active');
      lblSlider.classList.add('active');
    }
  }

  // -- Servos -----------------------------------------------
  const sliders = [];
  const lastSent = new Array(32).fill(0); // match slider default so nothing is sent on page load

  function buildSliders() {
    const colA = document.getElementById('col-a');
    const colB = document.getElementById('col-b');
    for (let i = 0; i < 32; i++) {
      const row = document.createElement('div');
      row.className = 'servo-item';

      const lbl = document.createElement('span');
      lbl.className = 'servo-label';
      lbl.textContent = 'Servo ' + (i + 1) + ':';

      const sl = document.createElement('input');
      sl.type='range'; sl.min=0; sl.max=255; sl.value=0; sl.id='sl'+i;

      const vd = document.createElement('span');
      vd.className='servo-val'; vd.id='v'+i; vd.textContent='0';

      sl.addEventListener('input', function() { vd.textContent = this.value; });

      row.appendChild(lbl); row.appendChild(sl); row.appendChild(vd);
      (i < 16 ? colA : colB).appendChild(row);
      sliders.push(sl);
    }
  }

  function sendServo(num, val) {
    fetch('/servo?num=' + num + '&val=' + val);
  }

  // Poll all sliders every 50ms - only send changed values
  setInterval(function() {
    sliders.forEach(function(sl, i) {
      const val = parseInt(sl.value);
      if (val !== lastSent[i]) {
        lastSent[i] = val;
        sendServo(i, val);
      }
    });
  }, 50);

  function setAll(val) {
    sliders.forEach((sl, i) => {
      sl.value = val;
      document.getElementById('v' + i).textContent = val;
    });
  }
  function centerAll() { setAll(127); }
  function minAll()    { setAll(0);   }
  function maxAll()    { setAll(255); }

  buildSliders();

  // Arrow keys control Servo 1 in slider mode
  document.addEventListener('keydown', function(e) {
    if (inputMode !== 'slider') return;
    if (e.key !== 'ArrowLeft' && e.key !== 'ArrowRight') return;
    e.preventDefault();
    const sl = sliders[0];
    const step = e.shiftKey ? 10 : 1;
    let val = parseInt(sl.value);
    if (e.key === 'ArrowRight') val = Math.min(255, val + step);
    if (e.key === 'ArrowLeft')  val = Math.max(0,   val - step);
    sl.value = val;
    document.getElementById('v0').textContent = val;
  });

  // -- Xbox Controller (Gamepad API) ------------------------
  const gpStatus    = document.getElementById('gp-status');

  // -- Mapping data structures ------------------------------
  // Axis source names: LX LY RX RY LT RT
  // Button indices (standard gamepad layout):
  //   0=A 1=B 2=X 3=Y 4=LB 5=RB 6=LT(btn) 7=RT(btn)
  //   8=Back/Select 9=Start 10=L3 11=R3
  //   12=DUp 13=DDown 14=DLeft 15=DRight

  const AXIS_SOURCES = [
    {id:'LX', label:'Left Stick X',  axisIdx:0, isTrigger:false},
    {id:'LY', label:'Left Stick Y',  axisIdx:1, isTrigger:false},
    {id:'RX', label:'Right Stick X', axisIdx:2, isTrigger:false},
    {id:'RY', label:'Right Stick Y', axisIdx:3, isTrigger:false},
    {id:'LT', label:'Left Trigger',  axisIdx:4, isTrigger:true},
    {id:'RT', label:'Right Trigger', axisIdx:5, isTrigger:true},
  ];

  const BUTTON_SOURCES = [
    {id:'A',     label:'A',          btnIdx:0},
    {id:'B',     label:'B',          btnIdx:1},
    {id:'X',     label:'X',          btnIdx:2},
    {id:'Y',     label:'Y',          btnIdx:3},
    {id:'LB',    label:'LB',         btnIdx:4},
    {id:'RB',    label:'RB',         btnIdx:5},
    {id:'Back',  label:'Back/Select',btnIdx:8},
    {id:'Start', label:'Start',      btnIdx:9},
    {id:'L3',    label:'L3 (L-Click)',btnIdx:10},
    {id:'R3',    label:'R3 (R-Click)',btnIdx:11},
    {id:'DUp',   label:'D-Pad Up',   btnIdx:12},
    {id:'DDown', label:'D-Pad Down', btnIdx:13},
    {id:'DLeft', label:'D-Pad Left', btnIdx:14},
    {id:'DRight','label':'D-Pad Right',btnIdx:15},
  ];

  const BTN_ACTIONS = [
    {id:'set',   label:'Set Value',       hasVal:true,  hold:false, desc:'Instantly set servo to value'},
    {id:'inc',   label:'Increment (hold)',hasVal:true,  hold:true,  desc:'Increase servo while held'},
    {id:'dec',   label:'Decrement (hold)',hasVal:true,  hold:true,  desc:'Decrease servo while held'},
    {id:'toggle',label:'Toggle Min/Max',  hasVal:false, hold:false, desc:'Toggle between 0 and 255'},
  ];

  // Live mapping arrays - each entry is an object
  let axisMappings   = []; // {axisId, servo(0-based), invert, deadzone}
  let buttonMappings = []; // {btnId, servo(0-based), action, value, stepSize}

  // Button toggle state for toggle action
  const btnToggleState = {};
  // Previous button pressed state for edge detection
  const btnPrevState = {};

  let nextAxisId   = 0;
  let nextBtnId    = 0;

  // -- Cyber-select portal system ---------------------------
  const _mapCsCb   = {};
  const _mapCsOpts = {};
  var _mapCsPortal    = null;
  var _mapCsActiveUid = null;

  function _getMapCsPortal() {
    if (!_mapCsPortal) {
      _mapCsPortal = document.createElement('div');
      _mapCsPortal.className = 'cyber-select-list';
      _mapCsPortal.style.cssText = 'position:fixed;z-index:99999;min-width:120px;';
      document.body.appendChild(_mapCsPortal);
    }
    return _mapCsPortal;
  }

  function renderMapCS(uid, opts, selVal, cb) {
    _mapCsCb[uid]   = cb;
    _mapCsOpts[uid] = opts;
    const sel   = opts.find(o => String(o.value) === String(selVal)) || opts[0];
    const label = sel ? sel.label : '-';
    return '<div class="cyber-select map-cs" id="'+uid+'"><div class="cyber-select-btn" onclick="mapCsToggle(\''+uid+'\',event)"><span class="cs-label">'+label+'</span><span class="cs-arrow">&#x25BE;</span></div></div>';
  }

  function _closeAllMapCs() {
    if (_mapCsPortal) _mapCsPortal.style.display = 'none';
    if (_mapCsActiveUid) {
      const w = document.getElementById(_mapCsActiveUid);
      if (w) { const b = w.querySelector('.cyber-select-btn'); if (b) b.classList.remove('open'); }
    }
    _mapCsActiveUid = null;
  }

  function mapCsToggle(uid, e) {
    if (e) e.stopPropagation();
    const wrap = document.getElementById(uid);
    if (!wrap) return;
    const btn    = wrap.querySelector('.cyber-select-btn');
    const isOpen = _mapCsActiveUid === uid;
    _closeAllMapCs();
    if (!isOpen) {
      const opts   = _mapCsOpts[uid] || [];
      const curLbl = btn.querySelector('.cs-label').textContent;
      const portal = _getMapCsPortal();
      portal.innerHTML = opts.map((o,i) =>
        '<div class="cs-opt'+(o.label===curLbl?' selected':'')+'" onclick="mapCsPortalSelect('+i+',event)">'+o.label+'</div>'
      ).join('');
      const rect = btn.getBoundingClientRect();
      portal.style.top     = rect.bottom + 'px';
      portal.style.left    = rect.left   + 'px';
      portal.style.width   = rect.width  + 'px';
      portal.style.display = 'block';
      btn.classList.add('open');
      _mapCsActiveUid = uid;
    }
  }

  function mapCsPortalSelect(idx, e) {
    if (e) e.stopPropagation();
    const uid = _mapCsActiveUid;
    if (!uid) return;
    const opt = (_mapCsOpts[uid] || [])[idx];
    if (!opt) return;
    const wrap = document.getElementById(uid);
    if (wrap) { const lbl = wrap.querySelector('.cs-label'); if (lbl) lbl.textContent = opt.label; }
    _closeAllMapCs();
    if (_mapCsCb[uid]) _mapCsCb[uid](opt.value);
  }

  document.addEventListener('click', _closeAllMapCs);

  // -- Render helpers ---------------------------------------
  function syncNoMappingsMsg() {
    const msg = document.getElementById('no-mappings-msg');
    if (msg) msg.style.display = (axisMappings.length === 0 && buttonMappings.length === 0) ? '' : 'none';
  }

  function renderAxisMappings() {
    const container = document.getElementById('axis-mappings');
    if (axisMappings.length === 0) { container.innerHTML = ''; syncNoMappingsMsg(); return; }
    const servoOpts = Array.from({length:32}, (_,i) => ({value:i, label:'SERVO '+(i+1)}));
    const axisOpts  = AXIS_SOURCES.map(a => ({value:a.id, label:a.label}));
    container.innerHTML = axisMappings.map(m => `
      <div class="mapping-row" id="arow-${m._id}" style="
        display:grid;grid-template-columns:1fr 1fr auto auto auto;
        gap:6px;align-items:center;
        background:rgba(8,16,28,0.8);border:1px solid rgba(0,255,231,0.12);
        padding:8px 10px;margin-bottom:6px">
        ${renderMapCS('acs-ax-'+m._id, axisOpts, m.axisId, v=>updateAxisMapping(m._id,'axisId',v))}
        ${renderMapCS('acs-sv-'+m._id, servoOpts, m.servo, v=>updateAxisMapping(m._id,'servo',parseInt(v)))}
        <label class="map-check-label">
          <input type="checkbox" ${m.invert?'checked':''} onchange="updateAxisMapping(${m._id},'invert',this.checked)"> INV
        </label>
        <label class="map-dz-label">
          DZ<input type="number" value="${m.deadzone}" min="0" max="0.5" step="0.01"
            onchange="updateAxisMapping(${m._id},'deadzone',parseFloat(this.value))">
        </label>
        <button class="map-remove-btn" onclick="removeAxisMapping(${m._id})">&#x2715;</button>
      </div>`).join('');
    syncNoMappingsMsg();
  }

  function renderButtonMappings() {
    const container = document.getElementById('button-mappings');
    if (buttonMappings.length === 0) {
      container.innerHTML = '';
      syncNoMappingsMsg();
      return;
    }
    const servoOpts = Array.from({length:32}, (_,i) => ({value:i, label:'SERVO '+(i+1)}));
    const btnOpts   = BUTTON_SOURCES.map(b => ({value:b.id, label:b.label}));
    const actOpts   = BTN_ACTIONS.map(a => ({value:a.id, label:a.label}));
    container.innerHTML = buttonMappings.map(m => {
      const actionDef = BTN_ACTIONS.find(a => a.id === m.action) || BTN_ACTIONS[0];
      const showVal   = actionDef.hasVal;
      return `
      <div class="mapping-row" id="brow-${m._id}" style="
        display:grid;grid-template-columns:1fr 1fr 1fr ${showVal?'80px':''} auto;
        gap:6px;align-items:center;
        background:rgba(8,16,28,0.8);border:1px solid rgba(0,255,231,0.12);
        padding:8px 10px;margin-bottom:6px">
        ${renderMapCS('bcs-bt-'+m._id, btnOpts, m.btnId, v=>updateButtonMapping(m._id,'btnId',v))}
        ${renderMapCS('bcs-sv-'+m._id, servoOpts, m.servo, v=>updateButtonMapping(m._id,'servo',parseInt(v)))}
        ${renderMapCS('bcs-ac-'+m._id, actOpts, m.action, v=>{updateButtonMapping(m._id,'action',v);renderButtonMappings();})}
        ${showVal ? `<input class="map-val-input" type="number" value="${m.value}" min="0" max="255" step="1"
          onchange="updateButtonMapping(${m._id},'value',parseInt(this.value))"
          title="${actionDef.id==='inc'||actionDef.id==='dec'?'Step size per tick':'Target value (0-255)'}">` : ''}
        <button class="map-remove-btn" onclick="removeButtonMapping(${m._id})">&#x2715;</button>
      </div>`;
    }).join('');
    syncNoMappingsMsg();
  }

  // -- CRUD operations --------------------------------------
  function addAxisMapping() {
    axisMappings.push({_id:nextAxisId++, axisId:'LX', servo:0, invert:false, deadzone:0.08});
    renderAxisMappings();
    updateToggleState();
  }
  function removeAxisMapping(id) {
    axisMappings = axisMappings.filter(m => m._id !== id);
    renderAxisMappings();
    updateToggleState();
  }
  function updateAxisMapping(id, key, val) {
    const m = axisMappings.find(m => m._id === id);
    if (m) m[key] = val;
  }

  function addButtonMapping() {
    buttonMappings.push({_id:nextBtnId++, btnId:'A', servo:0, action:'set', value:255});
    renderButtonMappings();
    updateToggleState();
  }
  function removeButtonMapping(id) {
    buttonMappings = buttonMappings.filter(m => m._id !== id);
    renderButtonMappings();
    updateToggleState();
  }
  function updateButtonMapping(id, key, val) {
    const m = buttonMappings.find(m => m._id === id);
    if (m) m[key] = val;
  }

  // -- Gamepad utility --------------------------------------
  function getXboxGamepad() {
    const pads = navigator.getGamepads ? navigator.getGamepads() : [];
    for (let i = 0; i < pads.length; i++) {
      if (pads[i] && pads[i].id.toLowerCase().includes('xbox')) return pads[i];
    }
    for (let i = 0; i < pads.length; i++) { if (pads[i]) return pads[i]; }
    return null;
  }

  function getAxisValue(gp, axisId) {
    const src = AXIS_SOURCES.find(a => a.id === axisId);
    if (!src) return 0;
    if (src.isTrigger) {
      // Triggers come as buttons (value 0-1) on standard mapping
      const btnIdx = (axisId === 'LT') ? 6 : 7;
      return gp.buttons[btnIdx] ? gp.buttons[btnIdx].value : 0;
      // Normalise 0-1 -> 0-255 (not -1..1)
    }
    return gp.axes[src.axisIdx] || 0;
  }

  function axisToServo255(rawVal, isTrigger, invert, deadzone) {
    let v = rawVal;
    if (!isTrigger) {
      if (Math.abs(v) < deadzone) v = 0;
      v = (v + 1) / 2; // âˆ’1..1 -> 0..1
    } else {
      if (v < deadzone) v = 0;
    }
    if (invert) v = 1 - v;
    return Math.round(v * 255);
  }

  function setSlider(idx, val) {
    val = Math.max(0, Math.min(255, val));
    sliders[idx].value = val;
    document.getElementById('v' + idx).textContent = val;
  }

  window.addEventListener('gamepadconnected', function(e) {
    gamepadConnected = true;
    gpStatus.textContent = e.gamepad.id;
    gpStatus.style.color = 'var(--accent)';
    updateToggleState();
  });
  window.addEventListener('gamepaddisconnected', function(e) {
    gamepadConnected = false;
    gpStatus.textContent = 'No controller detected \u2014 press a button on your Xbox controller to activate';
    gpStatus.style.color = 'var(--dim)';
    updateToggleState();
    forceSliderMode();
  });

  // Initialise toggle as disabled on page load
  setToggleEnabled(false);

  // Render empty mapping lists on load
  renderAxisMappings();
  renderButtonMappings();

  // -- Gamepad polling loop - runs in joystick mode ---------
  setInterval(function() {
    if (inputMode !== 'joystick') return;
    const gp = getXboxGamepad();
    if (!gp) return;

    // -- Process axis mappings --
    axisMappings.forEach(function(m) {
      const src      = AXIS_SOURCES.find(a => a.id === m.axisId);
      const rawVal   = getAxisValue(gp, m.axisId);
      const servoVal = axisToServo255(rawVal, src && src.isTrigger, m.invert, m.deadzone);
      setSlider(m.servo, servoVal);
    });

    // -- Process button mappings --
    buttonMappings.forEach(function(m) {
      const src    = BUTTON_SOURCES.find(b => b.id === m.btnId);
      if (!src) return;
      const btn    = gp.buttons[src.btnIdx];
      const pressed = btn && (btn.pressed || btn.value > 0.5);
      const wasPressed = !!btnPrevState[m._id];
      const risingEdge = pressed && !wasPressed;
      btnPrevState[m._id] = pressed;

      if (!pressed && !risingEdge) return;

      const action = m.action;
      const srv    = m.servo;
      let   cur    = parseInt(sliders[srv].value);

      if (action === 'set'    && risingEdge) { setSlider(srv, m.value); }
      if (action === 'center' && risingEdge) { setSlider(srv, 127); }
      if (action === 'min'    && risingEdge) { setSlider(srv, 0); }
      if (action === 'max'    && risingEdge) { setSlider(srv, 255); }
      if (action === 'toggle' && risingEdge) {
        const key = 'toggle_' + m._id;
        btnToggleState[key] = !btnToggleState[key];
        setSlider(srv, btnToggleState[key] ? 255 : 0);
      }
      if (action === 'inc' && pressed) { setSlider(srv, cur + (m.value || 3)); }
      if (action === 'dec' && pressed) { setSlider(srv, cur - (m.value || 3)); }
    });

  }, 50);
</script>
</body>
</html>
)rawliteral";

// ─────────────────────────────────────────────────────────────
//  HTML — camera stream + servo sliders (STA mode, camera build)
// ─────────────────────────────────────────────────────────────
static const char CAMERA_HTML[] PROGMEM = R"rawliteral(
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>32 Servo Controller</title>
  <link rel="icon" type="image/x-icon" href="data:image/x-icon;base64,AAABAAMAEBAAAAEACABoBQAANgAAACAgEAABAAQA6AIAAJ4FAAAwMAAAAQAIAKgOAACGCAAAKAAAABAAAAAgAAAAAQAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAQAAAgEAAAEBAQACAQEAAgIAAAMCAAADAgEABAMAAAUEAgAGBAIABgUAAAcFAwAIBQMACAYAAAgGAwAJBwMACggAAA8MAAASDwAAExAAABkVAAAdGAAA++EAAPziAAD94wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAQgAAAAAAAAABAAGAQELEQAAAAAABQAABA0PGRkZGRkZGRkZGRkZDw0NDxkZGRgZGRkZGRkZGQ0NDQ8ZGRkPDQ0NDQ0NDQ0NDQ0PGRkZDw0NDQ0NDQ0NDQ0NDxkZGRAPDw8PDw0NDQ0NDQ8ZGRkZGRkZGRkZDw0NDQ0PGRkZGRkZGRkZGQ8NDQ0NDxkZGRAPDw8PDw0NDQ0NDQ8ZGRkPDQ0NDQ0NDQ0NDQ0PGRkZDw0NDQ0NDQ0NDQ0NDxgZGRkZGRcXGBgZGQ0NDQ8ZGRkZGRkZGRkYGRcPDQ0HFAIRERMGABIOFhUTAwoMAAAAAAAAAAAAAAAAAAAJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgAAAAgAAAAQAAAAAEABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBQMACAYDAAkHAwAKCAMACwkDAAwJAwANCgMADgoFABIPAgAUEAUAi30AAP3jAAAAAAAAAAAAAAAAAAAAAAAAAAS7u7u7u7u7u7u7u7tAAAAEqqqqqqqqqqqqqqqqQAAABLu7u7u7u7u7u7u7u0AAAASqqqqqqqqqqqqqqqowAAAEu7u7u7u7u7u7u7u7IAAABKqqqGVEREREREREMgAAAAS7u7YQAAAAAAAAAAAAAAAEqqqlAAAAAAAAAAAAAAAABLu7tAAAAAAAAAAAAAAAAASqqqQAAAAAAAAAAAAAAAAEu7u0AAAAAAAAAAAAAAAABKqqpQAAAAAAAAAAAAAAAAS7u7YQAAAAAAAAAAAAAAAEqqqoZURERERDIAAAAAAABLu7u7u7u7u7u7IAAAAAAASqqqqqqqqqqqqjAAAAAAAEu7u7u7u7u7u7swAAAAAABKqqqqqqqqqqqqIAAAAAAAS7u7hlREREREMgAAAAAAAEqqqmEAAAAAAAAAAAAAAABLu7tQAAAAAAAAAAAAAAAASqqqQAAAAAAAAAAAAAAAAEu7u0AAAAAAAAAAAAAAAABKqqpAAAAAAAAAAAAAAAAAS7u7UAAAAAAAAAAAAAAAAEqqqmEAAAAAAAAAAAAAAABLu7uGVEREREREREMgAAAASqqqqqqqqqqqqqqqogAAAEu7u7u7u7u7u7u7u7MAAABKqqqqqqqqqqqqqqqkAAAAS7u7u7u7u7u7u7u7tAAHd5qqqqqqqqqqqqqqqql3cAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgAAAAwAAAAYAAAAAEACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBQMACAYDAAkHAwAKCAMACwkDAAwKAwANCgMADgoFAA0LAwAOCwMADwsFAA4MAwAPDQIAEAwFABANAgARDQUAEQ8CABIPAgATDgUAEw8CABMPBQAUEAUAFhIFABcTBQAYFAUAGhUFABoWAgAaFgUAHBcEAB0YBAAfGwQAIBsEACEcBAAiHAQAinwAAIt9AAD74QAA/OIAAP3jAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgUOEBETExMTExMTExMTExMTExMTExMTExMTExMTExEQDgUCAAAAAAAABwcHBwcKFCQlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSQUCgcHBwcHBwcHBwcKFyUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHAAAAAAABCCIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyIIAQAAAAAAAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyILAgAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUYCgcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHAAAAAAACCyIjIyMjIyIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIDAAAAAAAAAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwsLCwsLCwsJBgMBAAAAAAAABwcHBwcNGSUmJiYmJR8VDw0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQoKCgcHBwcHBwcHBwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRsNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIhEEAgICAgICAgICAgICAgICAQEBAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwkGAwEAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJiUlJSUlJSUlJSUlJSUlJSUlJSUlJBIHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJRcKBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIggBAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIggBAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJRcKBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJiUlJSUlJSUlJSUlJSUlJSUlJSUlJBIHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwkGAwEAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIhEEAgICAgICAgICAgICAgICAQEBAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRsNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJRkNBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACCyIjIyMjIgsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwcHBwcNGSUmJiYmJRwPCgcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcNGSUmJiYmJR8VDw0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQoKCgcHBwcHBwcHAAAAAAACCyIjIyMjIhoQDAsLCwsLCwsLCwsLCwsLCwsLCwsLCwsJBgMBAAAAAAAAAAAAAAACCyIjIyMjIyIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIDAAAAAAAABwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHBwcHBwcNGSUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUYCgcHBwcHAAAAAAACCyIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyILAgAAAAAAAAAAAAABCCIjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyIIAQAAAAAABwcHBwcKFyUmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiUXCgcHBwcHBwcHBwcKFCQlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSQUCgcHBwcHBwcHBwcHDRYdHiAhISEhISEhISEhISEhISEhISEhISEhISEhISAeHRYNBwcHBwcHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;800&family=Share+Tech+Mono&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    ::-webkit-scrollbar { width: 14px; height: 14px; }
    ::-webkit-scrollbar-button { display: none; height: 0; width: 0; }
    ::-webkit-scrollbar-track { background: #0a0e14; border-left: 1px solid #0099bb22; }
    ::-webkit-scrollbar-thumb { background: #0099bb; border-radius: 0; box-shadow: 0 0 6px #0099bb, 0 0 12px #0099bb66; }
    ::-webkit-scrollbar-thumb:hover { background: #00e5ff; box-shadow: 0 0 8px #00e5ff, 0 0 18px #00e5ffaa; }
    ::-webkit-scrollbar-corner { background: #0a0e14; }
    :root {
      --bg: #050709; --accent: #00ffe7; --accent2: #ff3c5f; --accent3: #ffd600;
      --panel: rgba(8,16,28,0.92); --border: rgba(0,255,231,0.18);
      --text: #b8d8e8; --dim: #3a5060; --green: #00ff88; --blue: #4488ff;
    }
    html, body { width: 100%; height: 100%; background: var(--bg); color: var(--text);
      font-family: 'Orbitron', monospace; overflow: hidden; }
    #flat-ui { position: fixed; inset: 0; display: flex; flex-direction: column; z-index: 10; overflow: hidden; }
    #flat-ui::after { content: ''; position: absolute; inset: 0;
      background: repeating-linear-gradient(0deg, transparent, transparent 3px, rgba(0,0,0,0.06) 3px, rgba(0,0,0,0.06) 4px);
      pointer-events: none; z-index: 100; }
    #flat-ui::before { content: ''; position: fixed; inset: 0;
      background-image: linear-gradient(rgba(0,255,231,0.07) 1px, transparent 1px),
        linear-gradient(90deg, rgba(0,255,231,0.07) 1px, transparent 1px);
      background-size: 48px 48px; pointer-events: none; }
    /* HEADER */
    #header { display: flex; align-items: center; justify-content: space-between;
      padding: 12px 24px; min-height: 64px; border-bottom: 1px solid var(--border);
      background: var(--panel); position: relative; z-index: 5; flex-shrink: 0; }
    @keyframes statglow-cyan {
      0%,100% { text-shadow: -2px 0 rgba(0,255,231,0.45), 2px 0 rgba(255,60,95,0.45), 0 0 10px rgba(0,255,231,0.8), 0 0 24px rgba(0,255,231,0.4); }
      50%      { text-shadow: -4px 0 rgba(0,255,231,0.7), 4px 0 rgba(255,60,95,0.7), 0 0 22px rgba(0,255,231,1), 0 0 44px rgba(0,255,231,0.5); } }
    @keyframes statglow-pink {
      0%,100% { text-shadow: -2px 0 rgba(0,255,231,0.45), 2px 0 rgba(255,60,95,0.45), 0 0 10px rgba(255,60,95,0.8), 0 0 24px rgba(255,60,95,0.4); }
      50%      { text-shadow: -4px 0 rgba(0,255,231,0.7), 4px 0 rgba(255,60,95,0.7), 0 0 22px rgba(255,60,95,1), 0 0 44px rgba(255,60,95,0.5); } }
    @keyframes logo-flicker { 0%,90%,92%,97%,97.5%,100% { opacity: 1; } 91.4% { opacity: 0.12; } 97.2% { opacity: 0.55; } }
    .logo { font-size: 22px; font-weight: 800; letter-spacing: 4px; color: var(--accent); position: relative; }
    .logo-32sc { color: var(--accent); animation: statglow-cyan 2.5s ease-in-out infinite, logo-flicker 8s ease-in-out infinite; }
    .logo-cam  { color: var(--accent2); animation: statglow-pink 2.5s ease-in-out infinite, logo-flicker 8s ease-in-out infinite 0.3s; }
    .logo-subtitle { font-family: 'Share Tech Mono', monospace; font-size: 9px; letter-spacing: 3px;
      color: var(--accent); margin-top: 4px; text-align: center; }
    .dot { width: 7px; height: 7px; border-radius: 50%; background: var(--dim); }
    .dot.live { background: var(--accent); box-shadow: 0 0 8px var(--accent); animation: pulse 1.4s step-end infinite; }
    .dot.error { background: var(--accent2); box-shadow: 0 0 8px var(--accent2); }
    @keyframes pulse { 0%,49%{opacity:1} 50%,100%{opacity:0} }
    /* CALL SCREEN */
    #call-screen { padding: 16px 20px; gap: 14px; flex: 1; min-height: 0; overflow-y: auto;
      display: flex; flex-direction: column; }
    /* VIDEO */
    .video-wrap { flex: 0 0 auto; width: 100%; display: flex; flex-direction: column; }
    #video-panel { border: 1px solid var(--border); background: #000; position: relative;
      overflow: hidden; width: 100%; min-width: 160px; min-height: 240px; align-self: center; }
    #video-panel::before { content: ''; position: absolute; inset: 0;
      border: 1px solid rgba(0,255,231,0.08); pointer-events: none; z-index: 2; }
    #video-panel { position: relative; z-index: 101; }
    #stream { display: none; width: 100%; height: auto; }
    #vid-resize { position: absolute; bottom: 0; right: 0; width: 18px; height: 18px; z-index: 5; cursor: nwse-resize; touch-action: none; user-select: none; }
    #vid-resize::before { content: ''; position: absolute; bottom: 0; right: 0; width: 12px; height: 12px;
      border-right: 2px solid var(--accent2); border-bottom: 2px solid var(--accent2);
      opacity: 0.55; transition: opacity 0.2s; pointer-events: none; }
    #vid-resize:hover::before { opacity: 1; }
    .vid-label { position: absolute; top: 6px; left: 10px; font-family: 'Share Tech Mono', monospace;
      font-size: 9px; color: var(--accent); letter-spacing: 2px; z-index: 4; text-shadow: 0 0 8px var(--accent); }
    /* Calling spinner */
    #calling-spinner { display: flex; position: absolute; inset: 0; z-index: 10;
      flex-direction: column; align-items: center; justify-content: center; gap: 18px;
      background: rgba(4,8,15,0.72); }
    #calling-spinner.hidden { display: none; }
    .cs-ring { width: 80px; height: 80px; position: relative; }
    .cs-ring::before, .cs-ring::after { content: ''; position: absolute; border-radius: 50%; border: 3px solid transparent; }
    .cs-ring::before { inset: 0; border-top-color: #00ffcc; border-right-color: #00ffcc44;
      animation: cs-cw 1s linear infinite; filter: drop-shadow(0 0 6px #00ffcc); }
    .cs-ring::after  { inset: 12px; border-bottom-color: #ff003c; border-left-color: #ff003c44;
      animation: cs-cw 0.7s linear infinite reverse; filter: drop-shadow(0 0 6px #ff003c); }
    @keyframes cs-cw { to { transform: rotate(360deg); } }
    #calling-spinner .spinner-label { font-family: 'Share Tech Mono', monospace; font-size: 10px; letter-spacing: 0.3em;
      color: #00ffcc99; animation: cs-blink 1s step-end infinite; }
    @keyframes cs-blink { 50% { opacity: 0; } }
    /* No-camera state */
    #calling-spinner.no-cam .cs-ring { display: none; }
    #calling-spinner.no-cam .spinner-label { color: #ff3c5f; font-size: 12px; animation: none; opacity: 1; letter-spacing: 0.25em; }
    .vid-ctrl-disabled { opacity: 0.3; pointer-events: none; }
    /* HUD BAR */
    #hud { display: flex; align-items: center; gap: 8px; flex-wrap: wrap;
      border: 1px solid var(--border);
      background: rgba(5,10,16,0.95); padding: 7px 12px;
      position: relative; z-index: 200; }
    .hud-chip { display: flex; align-items: center; gap: 5px; padding: 4px 10px;
      border: 1px solid rgba(0,255,231,0.12); background: rgba(0,20,30,0.6);
      font-family: 'Share Tech Mono', monospace; font-size: 11px; color: var(--dim); white-space: nowrap; }
    .hud-val { color: var(--accent); font-weight: 700; min-width: 30px; text-align: right; font-family: 'Share Tech Mono', monospace; }
    .hud-val.ok   { color: var(--green); text-shadow: 0 0 6px var(--green); }
    .hud-val.warn { color: var(--accent3); }
    .hud-unit { font-size: 9px; color: var(--dim); letter-spacing: 1px; }
    .tp-wrap { flex: 1; min-width: 60px; max-width: 120px; height: 4px;
      background: rgba(0,255,231,0.08); border: 1px solid rgba(0,255,231,0.12); }
    .tp-fill { height: 100%; width: 0%; background: var(--green);
      box-shadow: 0 0 4px var(--green); transition: width 0.6s ease, background 0.4s; }
    .hud-spacer { flex: 1; min-width: 8px; }
    /* CYBER SELECT (resolution dropdown) */
    .cyber-select { position: relative; z-index: 300; min-width: 158px; }
    .cyber-select-btn { width: 100%; background: rgba(0,20,30,0.75); border: 1px solid rgba(0,255,231,0.3);
      color: var(--accent); font-family: 'Share Tech Mono', monospace; font-size: 9px;
      padding: 9px 8px; cursor: pointer; transition: border-color 0.2s; text-align: left; letter-spacing: 1px;
      white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
      display: flex; align-items: center; justify-content: space-between; gap: 4px; }
    .cyber-select-btn:hover, .cyber-select-btn.open { border-color: var(--accent); }
    .cyber-select-btn.open { background: rgba(0,30,45,0.82); }
    .cyber-select-btn .cs-arrow { opacity: 0.5; font-size: 8px; flex-shrink: 0; transition: transform 0.25s; }
    .cyber-select-btn.open .cs-arrow { transform: rotate(180deg); }
    .cyber-select-list { position: absolute; top: 100%; left: 0; right: 0; z-index: 999;
      background: #050a10; border: 1px solid rgba(0,255,231,0.3); border-top: none;
      max-height: 200px; overflow-y: auto; display: none; font-family: 'Share Tech Mono', monospace; font-size: 9px; }
    .cyber-select-list.open { display: block; }
    .cyber-select-list .cs-opt { padding: 8px 10px; color: var(--accent); cursor: pointer;
      letter-spacing: 1px; transition: background 0.1s; white-space: nowrap;
      display: flex; justify-content: space-between; align-items: center;
      border-left: 2px solid transparent; }
    .cyber-select-list .cs-opt span { color: var(--dim); font-size: 9px; }
    .cyber-select-list .cs-opt:hover { background: rgba(0,255,231,0.1); color: #fff; border-left-color: var(--accent); }
    .cyber-select-list .cs-opt.res-active { background: rgba(0,255,231,0.15); border-left-color: var(--accent); }
    /* CTRL BUTTONS */
    .ctrl-btn { font-family: 'Orbitron', monospace; font-size: 9px; font-weight: 600;
      letter-spacing: 2px; padding: 9px 8px; background: rgba(0,20,30,0.75);
      border: 1px solid var(--border); color: var(--accent); cursor: pointer; border-radius: 0;
      transition: all 0.2s; text-transform: uppercase; white-space: nowrap; backdrop-filter: blur(4px); }
    .ctrl-btn:hover:not(:disabled) { border-color: var(--accent); color: var(--accent); }
    .ctrl-btn.btn-danger { color: var(--accent2); border-color: var(--accent2); background: rgba(30,8,14,0.75);
      border-radius: 4px; font-size: 10px; font-weight: 600; padding: 7px 14px; }
    .ctrl-btn.btn-danger:hover:not(:disabled) { background: rgba(50,10,20,0.88); box-shadow: 0 0 12px rgba(255,60,95,0.25); }
    /* COLLAPSIBLE PANELS — exact realdriver style */
    #ctrl-wrap, #servo-wrap { flex-shrink: 0; position: relative; }
    #ctrl-header, #servo-header { display: flex; justify-content: space-between; align-items: center;
      padding: 6px 12px; border: 1px solid var(--border); background: rgba(5,10,16,0.80);
      cursor: pointer; font-family: 'Share Tech Mono', monospace; font-size: 10px;
      color: var(--accent); letter-spacing: 2px; backdrop-filter: blur(6px); }
    #ctrl-body, #servo-body { border: 1px solid var(--border); border-top: none;
      background: rgba(5,10,16,0.72); padding: 12px; backdrop-filter: blur(6px); display: none; }
    /* GAMEPAD STATUS */
    #gp-status-bar { display: flex; align-items: center; justify-content: space-between;
      padding: 4px 0; margin-bottom: 10px; font-family: 'Share Tech Mono', monospace; font-size: 10px; }
    #gp-status { color: var(--dim); }
    #gp-live-badge { display: none; font-size: 9px; letter-spacing: 2px;
      padding: 2px 8px; border: 1px solid var(--accent); color: var(--accent); }
    /* MAP SECTIONS */
    .map-section { margin-bottom: 10px; }
    .map-section-header { display: flex; justify-content: space-between; align-items: center;
      padding: 4px 0; margin-bottom: 6px; border-bottom: 1px solid rgba(0,255,231,0.1); }
    .map-section-label { font-family: 'Share Tech Mono', monospace; font-size: 9px; letter-spacing: 3px; text-transform: uppercase; }
    .map-add-btn { font-family: 'Share Tech Mono', monospace; font-size: 9px; letter-spacing: 1px;
      padding: 3px 10px; width: 120px; text-align: center;
      background: rgba(0,20,30,0.75); border: 1px solid rgba(0,255,231,0.3); color: var(--accent);
      cursor: pointer; transition: all 0.2s; text-transform: uppercase; backdrop-filter: blur(4px); }
    .map-add-btn:hover { border-color: var(--accent); color: var(--accent); }
    /* MAPPING ROWS */
    .mapping-row { display: grid; gap: 5px; align-items: center;
      background: rgba(0,0,0,0.35); border: 1px solid rgba(0,255,231,0.1);
      padding: 5px 8px; margin-bottom: 5px; overflow: visible; }
    .mapping-row.axis-row   { grid-template-columns: 1fr 1fr auto auto auto; }
    .mapping-row.button-row { grid-template-columns: 1fr 1fr 1fr auto; }
    .mapping-row.button-row.has-val { grid-template-columns: 1fr 1fr 1fr 60px auto; }
    .mapping-row.key-row { grid-template-columns: 80px 1fr 1fr auto; }
    .mapping-row.key-row.has-val { grid-template-columns: 80px 1fr 1fr 60px auto; }
    .key-cap-btn { background: rgba(0,20,30,0.75); border: 1px solid rgba(0,255,231,0.3);
      color: var(--accent); font-family: 'Share Tech Mono', monospace; font-size: 9px;
      letter-spacing: 1px; padding: 6px 6px; cursor: pointer; width: 100%;
      text-align: center; transition: border-color 0.2s; white-space: nowrap;
      overflow: hidden; text-overflow: ellipsis; }
    .key-cap-btn:hover { border-color: var(--accent); }
    .key-cap-btn.capturing { border-color: var(--accent2); color: var(--accent2);
      animation: rec-blink 0.7s ease-in-out infinite; }
    .map-select { appearance: none; -webkit-appearance: none;
      background: rgba(0,20,30,0.75) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3E%3Cpath fill='%2300ffe7' d='M0 2l4 4 4-4z'/%3E%3C/svg%3E") no-repeat right 8px center;
      border: 1px solid rgba(0,255,231,0.3); color: var(--accent);
      font-family: 'Share Tech Mono', monospace; font-size: 9px;
      padding: 6px 24px 6px 8px; outline: none; transition: border-color 0.2s, background-color 0.2s;
      width: 100%; backdrop-filter: blur(4px); letter-spacing: 1px; cursor: pointer; }
    .map-select:hover { border-color: var(--accent); }
    .map-select:focus { border-color: rgba(0,255,231,0.85); background-color: rgba(0,30,45,0.82); outline: none; }
    .map-select option { background: #050a12; color: var(--accent); }
    /* Custom stepper */
    .custom-stepper { display: flex; align-items: stretch; box-sizing: border-box;
      border: 1px solid rgba(0,255,231,0.2); background: rgba(0,10,18,0.85); height: 26px; }
    .custom-stepper .stepper-input { flex: 1; min-width: 0; background: transparent; border: none;
      color: var(--accent); font-family: 'Share Tech Mono', monospace; font-size: 9px;
      text-align: center; outline: none; padding: 0 3px; }
    .custom-stepper .stepper-btns { display: flex; flex-direction: column; flex-shrink: 0;
      border-left: 1px solid rgba(0,255,231,0.15); width: 18px; }
    .custom-stepper .stepper-btn { flex: 1; background: transparent; border: none;
      color: rgba(0,255,231,0.6); cursor: pointer; padding: 0; font-size: 7px; line-height: 1;
      display: flex; align-items: center; justify-content: center; transition: background 0.1s, color 0.1s; }
    .custom-stepper .stepper-btn:first-child { border-bottom: 1px solid rgba(0,255,231,0.12); }
    .custom-stepper .stepper-btn:hover { background: rgba(0,255,231,0.12); color: var(--accent); }
    .dz-stepper { width: 68px; }
    .map-val-stepper { width: 100%; }
    /* Custom checkbox */
    .map-check-label { display: flex; align-items: center; gap: 4px;
      font-family: 'Share Tech Mono', monospace; font-size: 9px;
      color: var(--accent); white-space: nowrap; cursor: pointer; }
    .map-check-label input[type="checkbox"] { appearance: none; -webkit-appearance: none;
      width: 11px; height: 11px; flex-shrink: 0; background: rgba(0,10,18,0.85);
      border: 1px solid rgba(0,255,231,0.35); cursor: pointer; position: relative; transition: border-color 0.15s, box-shadow 0.15s; }
    .map-check-label input[type="checkbox"]:checked { background: rgba(0,255,231,0.15);
      border-color: var(--accent); box-shadow: 0 0 6px rgba(0,255,231,0.5); }
    .map-check-label input[type="checkbox"]:checked::after { content: ''; position: absolute;
      left: 2px; top: 0px; width: 4px; height: 7px;
      border: 1.5px solid var(--accent); border-top: none; border-left: none; transform: rotate(45deg); }
    .map-dz-label { display: flex; align-items: center; gap: 5px;
      font-family: 'Share Tech Mono', monospace; font-size: 9px;
      color: var(--accent); white-space: nowrap; margin-left: 10px; }
    .map-remove-btn { font-family: 'Share Tech Mono', monospace; font-size: 10px;
      padding: 0; width: 26px; height: 24px; background: transparent;
      border: 1px solid rgba(255,60,95,0.3); color: rgba(255,60,95,0.5);
      cursor: pointer; transition: all 0.2s; box-sizing: border-box; }
    .map-remove-btn:hover { border-color: var(--accent2); color: var(--accent2); }
    .map-empty { font-family: 'Share Tech Mono', monospace; font-size: 9px;
      color: var(--dim); text-align: center; padding: 8px 4px; letter-spacing: 1px; }
    /* INPUT MODE TOGGLE */
    .mode-bar { display: flex; align-items: center; justify-content: center; gap: 14px;
      margin-bottom: 14px; padding-bottom: 14px; border-bottom: 1px solid rgba(0,255,231,0.1); }
    .mode-lbl { font-family: 'Share Tech Mono', monospace; font-size: 10px; letter-spacing: 2px;
      color: var(--dim); transition: color 0.2s; user-select: none; text-transform: uppercase; }
    .mode-lbl.active { color: var(--accent); text-shadow: 0 0 8px rgba(0,255,231,0.4); }
    .mode-lbl.dimmed { color: #1a2a30 !important; }
    .toggle-track { position: relative; width: 52px; height: 26px; border-radius: 13px;
      background: rgba(0,20,30,0.8); border: 1px solid rgba(0,255,231,0.2);
      cursor: pointer; transition: all 0.25s; flex-shrink: 0; }
    .toggle-track.joystick { background: rgba(0,40,30,0.8); border-color: var(--accent); box-shadow: 0 0 8px rgba(0,255,231,0.3); }
    .toggle-thumb { position: absolute; top: 3px; left: 3px; width: 18px; height: 18px;
      border-radius: 50%; background: var(--dim); transition: transform 0.25s, background 0.25s; }
    .toggle-track.joystick .toggle-thumb { transform: translateX(26px); background: var(--accent); }
    .toggle-track.disabled { opacity: 0.35; cursor: not-allowed; }
    /* SERVO GRID */
    .servo-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; }
    @media(max-width:560px) { .servo-grid { grid-template-columns: 1fr; } }
    .servo-item { display: flex; align-items: center; gap: 8px; margin-bottom: 8px; }
    .servo-label { min-width: 72px; font-family: 'Share Tech Mono', monospace; font-size: 9px;
      color: var(--dim); letter-spacing: 1px; white-space: nowrap; }
    input[type=range] { flex: 1; accent-color: var(--accent); cursor: pointer; height: 5px; }
    .servo-val { min-width: 30px; text-align: right; font-family: 'Share Tech Mono', monospace;
      font-size: 10px; font-weight: 700; color: var(--accent); }
    /* RECORDING */
    @keyframes rec-blink { 0%,100%{opacity:1} 50%{opacity:0.15} }
    #rec-indicator { position:absolute; top:8px; right:8px; display:none; align-items:center; gap:6px;
      padding:3px 9px; background:rgba(5,10,14,0.80); border:1px solid rgba(255,60,95,0.45);
      backdrop-filter:blur(4px); z-index:20; font-family:'Share Tech Mono',monospace;
      font-size:10px; color:var(--accent2); letter-spacing:2px; }
    #rec-indicator.active { display:flex; }
    #rec-dot { width:7px; height:7px; border-radius:50%; background:var(--accent2);
      flex-shrink:0; box-shadow:0 0 6px var(--accent2); animation:rec-blink 1s ease-in-out infinite; }
    .ctrl-btn.recording { border-color:var(--accent2)!important; color:var(--accent2)!important;
      animation:rec-blink 1.2s ease-in-out infinite; }
    #rec-btn { min-width: 72px; text-align: center; }
    /* SYSTEM LOG */
    #log-wrap { flex-shrink: 0; position: relative; }
    #log-header { display: flex; justify-content: space-between; align-items: center;
      padding: 6px 12px; border: 1px solid var(--border); background: rgba(5,10,16,0.80);
      cursor: pointer; font-family: 'Share Tech Mono', monospace; font-size: 10px;
      color: var(--accent); letter-spacing: 2px; backdrop-filter: blur(6px); }
    #log-output { max-height: 120px; overflow-y: auto; background: rgba(5,10,16,0.78);
      border: 1px solid var(--border); border-top: none; padding: 6px 10px;
      font-family: 'Share Tech Mono', monospace; font-size: 10px; line-height: 1.6;
      backdrop-filter: blur(6px); }
    .log-entry { color: var(--accent); }
    .log-entry.err { color: var(--accent2); }
    .log-entry.warn { color: var(--dim); }
  </style>
</head>
<body>
<div id="flat-ui">

  <!-- HEADER -->
  <div id="header">
    <div>
      <div class="logo"><span class="logo-32sc">32</span><span class="logo-cam">&nbsp;SERVO CONTROLLER</span></div>
      <div class="logo-subtitle">&#9658;&nbsp;&nbsp;v1.9&nbsp;&nbsp;&#9668;</div>
    </div>
    <!-- dot/status-text kept hidden for JS use -->
    <div style="display:none"><div class="dot" id="dot"></div><span id="status-text"></span></div>
    <button class="ctrl-btn" onclick="location.href='/wifi-setup'" style="border-color:rgba(0,255,231,0.3);position:absolute;left:50%;transform:translateX(-50%)">WIFI SETUP</button>
    <button class="ctrl-btn btn-danger" onclick="forgetWifi()">&#x21BA; RESET WiFi</button>
  </div>

  <!-- MAIN SCREEN -->
  <div id="call-screen">

    <!-- VIDEO FEED -->
    <div class="video-wrap">
      <div id="video-panel">
        <span class="vid-label">LIVE FEED</span>
        <img id="stream" alt="">
        <div id="calling-spinner">
          <div class="cs-ring"></div>
          <div class="spinner-label">CONNECTING...</div>
        </div>
        <!-- Recording indicator overlay -->
        <div id="rec-indicator"><div id="rec-dot"></div><span id="rec-timer-display">00:00</span></div>
        <div id="vid-resize"></div>
      </div>
    </div>

    <!-- HUD BAR -->
    <div id="hud">
      <div class="hud-chip">
        <span class="hud-val ok" id="fps">--</span>
        <span class="hud-unit">FPS</span>
      </div>
      <div class="hud-chip">
        <span class="hud-val" id="kbps">--</span>
        <span class="hud-unit">KB/s</span>
        <div class="tp-wrap"><div class="tp-fill" id="tp-bar"></div></div>
      </div>
      <div class="hud-spacer"></div>
      <div class="cyber-select" id="res-dropdown">
        <div class="cyber-select-btn" id="res-btn" onclick="toggleResDropdown()">
          <span id="res-label">XGA 1024&times;768</span>
          <span class="cs-arrow">&#9660;</span>
        </div>
        <div class="cyber-select-list" id="res-menu">
          <div class="cs-opt" onclick="pickRes('UXGA','UXGA 1600&times;1200')">UXGA <span>1600&times;1200</span></div>
          <div class="cs-opt" onclick="pickRes('SXGA','SXGA 1280&times;1024')">SXGA <span>1280&times;1024</span></div>
          <div class="cs-opt res-active" onclick="pickRes('XGA','XGA 1024&times;768')">XGA  <span>1024&times;768</span></div>
          <div class="cs-opt" onclick="pickRes('SVGA','SVGA 800&times;600')">SVGA <span>800&times;600</span></div>
          <div class="cs-opt" onclick="pickRes('VGA','VGA 640&times;480')">VGA  <span>640&times;480</span></div>
          <div class="cs-opt" onclick="pickRes('CIF','CIF 400&times;296')">CIF  <span>400&times;296</span></div>
          <div class="cs-opt" onclick="pickRes('QVGA','QVGA 320&times;240')">QVGA <span>320&times;240</span></div>
        </div>
      </div>
      <button class="ctrl-btn" onclick="snapshot()">&#x1F4F7; SNAP</button>
      <button class="ctrl-btn" id="rec-btn" onclick="toggleRecording()">&#9210; REC</button>
    </div>

    <!-- CONTROL FUNCTIONS -->
    <div id="ctrl-wrap">
      <div id="ctrl-header" onclick="toggleCtrl()">
        <span><span style="color:var(--accent2)">//</span> CONTROL_FUNCTIONS</span>
        <span id="ctrl-toggle">&#9658;</span>
      </div>
      <div id="ctrl-body" style="display:none">
        <div id="gp-status-bar">
          <span id="gp-status">PRESS A BUTTON TO ACTIVATE CONTROLLER</span>
          <span id="gp-live-badge">&#9679; LIVE</span>
        </div>
        <div class="map-section">
          <div class="map-section-header">
            <span class="map-section-label" style="color:var(--accent)"><span style="color:var(--accent2)">//</span> AXIS &rarr; SERVO</span>
            <button class="map-add-btn" onclick="addAxisMapping()">&#xFF0B; ADD_AXIS</button>
          </div>
          <div id="axis-mappings"></div>
        </div>
        <div class="map-section">
          <div class="map-section-header">
            <span class="map-section-label" style="color:var(--accent)"><span style="color:var(--accent2)">//</span> BUTTON &rarr; SERVO</span>
            <button class="map-add-btn" onclick="addButtonMapping()">&#xFF0B; ADD_BUTTON</button>
          </div>
          <div id="button-mappings"></div>
        </div>
        <div class="map-section">
          <div class="map-section-header">
            <span class="map-section-label" style="color:var(--accent)"><span style="color:var(--accent2)">//</span> KEY &rarr; SERVO</span>
            <button class="map-add-btn" onclick="addKeyMapping()">&#xFF0B; ADD_KEY</button>
          </div>
          <div id="key-mappings"></div>
        </div>
      </div>
    </div>

    <!-- SERVO CONTROLS -->
    <div id="servo-wrap">
      <div id="servo-header" onclick="toggleServo()">
        <span><span style="color:var(--accent2)">//</span> SERVO_CONTROLS</span>
        <span id="servo-toggle">&#9658;</span>
      </div>
      <div id="servo-body" style="display:none">
        <div class="mode-bar">
          <span class="mode-lbl active" id="lbl-slider">Sliders</span>
          <div class="toggle-track" id="mode-toggle" onclick="toggleInputMode()">
            <div class="toggle-thumb"></div>
          </div>
          <span class="mode-lbl" id="lbl-joystick">Joystick</span>
        </div>
        <div class="servo-grid">
          <div id="col-a"></div>
          <div id="col-b"></div>
        </div>
      </div>
    </div>

    <!-- SYSTEM LOG -->
    <div id="log-wrap">
      <div id="log-header" onclick="toggleLog()">
        <span><span style="color:var(--accent2)">//</span> SYSTEM_LOG</span>
        <span id="log-toggle">&#9658;</span>
      </div>
      <div id="log-output" style="display:none"></div>
    </div>

  </div><!-- /#call-screen -->
</div><!-- /#flat-ui -->
<script>
  const STREAM_URL='http://'+location.hostname+':81/stream';
  const img=document.getElementById('stream'),
        spinner=document.getElementById('calling-spinner'),
        spinLabel=spinner.querySelector('.spinner-label'),
        dot=document.getElementById('dot'),
        fpsEl=document.getElementById('fps'),
        kbpsEl=document.getElementById('kbps'),
        tpBar=document.getElementById('tp-bar'),
        statusEl=document.getElementById('status-text');
  let currentRes='XGA';          // tracks the active camera resolution
  let _autoResApplied=false;     // fires changeRes once after first stream connect
  let _suppressStreamError=false;// set during intentional res change to silence onerror
  let paused=false,retryTimer=null,watchdog=null;

  function zeroHud(){fpsEl.textContent='0';fpsEl.className='hud-val';kbpsEl.textContent='0';tpBar.style.width='0%';}
  const MAX_KBPS=4000;
  function pollStats(){
    if(paused)return;
    fetch('/stats').then(r=>r.json()).then(d=>{
      if(d.fps!==undefined){
        fpsEl.textContent=d.fps;
        fpsEl.className='hud-val '+(d.fps>=15?'ok':d.fps>=8?'warn':'');
        if(d.fps>0)resetWatchdog();
      }
      if(d.kbps!==undefined){
        const kBs=Math.round(d.kbps/8);
        kbpsEl.textContent=kBs>=1000?(kBs/1000).toFixed(1)+'M':kBs;
        const pct=Math.min(100,(d.kbps/MAX_KBPS)*100);
        tpBar.style.width=pct+'%';
        tpBar.style.background=pct>75?'var(--accent)':pct>40?'var(--green)':'var(--dim)';
      }
    }).catch(()=>{});
  }
  setInterval(pollStats,1000);

  // ── Camera syslog polling ──
  let _syslogCursor=0;
  function pollSyslog(){
    fetch('/syslog?since='+_syslogCursor)
      .then(r=>r.json())
      .then(d=>{
        if(d.msgs&&d.msgs.length){
          d.msgs.forEach(m=>log('[CAM] '+m,''));
          _syslogCursor=d.total;
        }
      }).catch(()=>{});
  }
  setInterval(pollSyslog,2000);

  function showSpinner(txt){spinner.classList.remove('hidden');spinLabel.textContent=txt;}
  function hideSpinner(){spinner.classList.add('hidden');}

  // ── Camera presence check ─────────────────────────────────
  let _cameraPresent = true;
  function _disableVideoControls(){
    _cameraPresent = false;
    // Show persistent no-camera message — hide rings, show red text
    spinner.classList.remove('hidden');
    spinner.classList.add('no-cam');
    spinLabel.textContent = 'CAMERA NOT CONNECTED';
    // Grey out and block video-related controls
    ['res-dropdown','res-btn'].forEach(function(id){
      var el=document.getElementById(id); if(el) el.classList.add('vid-ctrl-disabled');
    });
    document.querySelectorAll('.ctrl-btn').forEach(function(btn){
      if(btn.textContent.indexOf('SNAP')!==-1 || btn.textContent.indexOf('REC')!==-1)
        btn.classList.add('vid-ctrl-disabled');
    });
    log('CAMERA NOT CONNECTED — video disabled','err');
  }

  function resetWatchdog(){
    clearTimeout(watchdog);
    watchdog=setTimeout(()=>{
      if(!paused){zeroHud();setStatus('error','Reconnecting…');
        img.style.display='none';showSpinner('RECONNECTING...');
        log('WATCHDOG TIMEOUT — reconnecting...','warn');
        img.src='';retryTimer=setTimeout(startStream,2000);}
    },5000);
  }
  let _lastNW=0;
  setInterval(()=>{
    if(paused||!img.src)return;
    const nw=img.naturalWidth;
    if(nw===0){_lastNW=0;}
    else if(nw!==_lastNW){_lastNW=nw;resetWatchdog();}
  },200);

  function startStream(){if(!_cameraPresent)return;img.src=STREAM_URL+'?'+Date.now();}
  function setStatus(cls,txt){dot.className='dot '+cls;statusEl.textContent=txt;}

  img.onload=()=>{
    hideSpinner();
    img.style.display='block';
    setStatus('live','Live');resetWatchdog();
    log('STREAM CONNECTED','ok');
    if(!_autoResApplied){
      _autoResApplied=true;
      if(currentRes!=='QVGA'){
        log('AUTO-SWITCH → '+currentRes,'');
        setTimeout(()=>changeRes(currentRes),400);
      }
    }
  };
  img.onerror=()=>{
    if(paused||_suppressStreamError)return;
    clearTimeout(watchdog);zeroHud();setStatus('error','Reconnecting…');
    img.style.display='none';showSpinner('RECONNECTING...');
    log('STREAM ERROR — retrying...','err');
    clearTimeout(retryTimer);retryTimer=setTimeout(startStream,2000);
  };

  function snapshot(){
    if(!_cameraPresent){log('No camera — snapshot unavailable','err');return;}
    fetch('/capture').then(r=>{if(!r.ok)throw 0;return r.blob();})
      .then(b=>{const a=document.createElement('a');a.href=URL.createObjectURL(b);
                a.download='snap_'+Date.now()+'.jpg';a.click();log('SNAPSHOT SAVED','ok');})
      .catch(()=>{log('SNAPSHOT FAILED','err');alert('Snapshot failed');});
  }

  function toggleResDropdown(){
    const btn=document.getElementById('res-btn'),menu=document.getElementById('res-menu');
    const open=menu.classList.contains('open');
    btn.classList.toggle('open',!open);menu.classList.toggle('open',!open);
  }
  document.addEventListener('click',function(e){
    if(!document.getElementById('res-dropdown').contains(e.target)){
      document.getElementById('res-btn').classList.remove('open');
      document.getElementById('res-menu').classList.remove('open');
    }
  });
  function pickRes(val,label){
    currentRes=val;
    document.querySelectorAll('.cs-opt').forEach(el=>el.classList.remove('res-active'));
    event.currentTarget.classList.add('res-active');
    document.getElementById('res-label').textContent=label;
    document.getElementById('res-btn').classList.remove('open');
    document.getElementById('res-menu').classList.remove('open');
    changeRes(val);
  }
  function changeRes(val){
    if(!val||!_cameraPresent)return;
    clearTimeout(watchdog);
    _suppressStreamError=true;
    img.src='';img.style.display='none';
    showSpinner('CHANGING TO '+val+'...');
    log('RESOLUTION → '+val,'');
    const delays={UXGA:5000,SXGA:4500,XGA:3500,SVGA:2500,VGA:2000};
    fetch('/set?res='+val)
      .then(()=>setTimeout(()=>{_suppressStreamError=false;startStream();},delays[val]||1500))
      .catch(()=>{_suppressStreamError=false;alert('Could not change resolution');});
  }
  function forgetWifi(){
    if(!confirm('Clear saved WiFi credentials and restart in setup mode?'))return;
    log('WIFI CREDENTIALS CLEARED — restarting...','warn');
    fetch('/forget').then(()=>alert('Done! Restarting into setup mode.'));
  }

  function toggleCtrl(){
    const body=document.getElementById('ctrl-body'),tog=document.getElementById('ctrl-toggle');
    const open=body.style.display!=='none';
    body.style.display=open?'none':'block';tog.textContent=open?'▸':'▾';
  }
  function toggleServo(){
    const body=document.getElementById('servo-body'),tog=document.getElementById('servo-toggle');
    const open=body.style.display!=='none';
    body.style.display=open?'none':'block';tog.textContent=open?'▸':'▾';
  }

  // ── Video panel drag-resize handle
  document.addEventListener('DOMContentLoaded', function() {
    var panel  = document.getElementById('video-panel');
    var handle = document.getElementById('vid-resize');
    if (!panel || !handle) return;
    var wrap = panel.closest('.video-wrap') || panel.parentElement;
    var dragging = false, startX, startY, startW, startH;
    handle.addEventListener('pointerdown', function(e) {
      e.preventDefault();
      dragging = true;
      startX = e.clientX; startY = e.clientY;
      startW = panel.offsetWidth;
      startH = panel.offsetHeight;
      panel.style.width  = startW + 'px';
      panel.style.height = startH + 'px';
      document.body.style.userSelect = 'none';
      handle.setPointerCapture(e.pointerId);
    });
    handle.addEventListener('pointermove', function(e) {
      if (!dragging) return;
      e.preventDefault();
      var dx = e.clientX - startX;
      var dy = e.clientY - startY;
      var maxW = wrap.offsetWidth;
      panel.style.width  = Math.min(maxW, Math.max(160, startW + dx * 2)) + 'px';
      panel.style.height = Math.max(90, startH + dy) + 'px';
    });
    handle.addEventListener('pointerup',     function() { dragging = false; document.body.style.userSelect = ''; });
    handle.addEventListener('pointercancel', function() { dragging = false; document.body.style.userSelect = ''; });
  });

  // Check camera presence first, then start stream or show no-camera message
  fetch('/camstatus').then(function(r){return r.json();}).then(function(d){
    if(!d.available){
      _disableVideoControls();
    } else {
      // Skip QVGA cold-boot flash — go straight to the default resolution.
      // _autoResApplied is set true so img.onload doesn't trigger a second switch.
      if(currentRes!=='QVGA'){
        _autoResApplied=true;
        changeRes(currentRes);
      } else {
        spinLabel.textContent='CONNECTING...';
        startStream();
      }
    }
  }).catch(function(){
    // If endpoint unreachable just try to connect normally
    spinLabel.textContent='CONNECTING...';
    startStream();
  });

  let inputMode='slider',gamepadConnected=false;
  function setToggleEnabled(enabled){
    const track=document.getElementById('mode-toggle'),lblJoy=document.getElementById('lbl-joystick');
    if(enabled){track.classList.remove('disabled');lblJoy.classList.remove('dimmed');}
    else{track.classList.add('disabled');lblJoy.classList.add('dimmed');}
  }
  function toggleInputMode(){
    if(!gamepadConnected)return;
    inputMode=(inputMode==='slider')?'joystick':'slider';
    const track=document.getElementById('mode-toggle'),
          lblSlider=document.getElementById('lbl-slider'),
          lblJoy=document.getElementById('lbl-joystick');
    if(inputMode==='joystick'){track.classList.add('joystick');lblSlider.classList.remove('active');lblJoy.classList.add('active');}
    else{track.classList.remove('joystick');lblJoy.classList.remove('active');lblSlider.classList.add('active');}
  }
  function forceSliderMode(){
    if(inputMode==='joystick'){
      inputMode='slider';
      const track=document.getElementById('mode-toggle'),
            lblSlider=document.getElementById('lbl-slider'),
            lblJoy=document.getElementById('lbl-joystick');
      track.classList.remove('joystick');lblJoy.classList.remove('active');lblSlider.classList.add('active');
    }
  }

  const sliders=[],lastSent=new Array(32).fill(0);
  function buildSliders(){
    const colA=document.getElementById('col-a'),colB=document.getElementById('col-b');
    for(let i=0;i<32;i++){
      const row=document.createElement('div');row.className='servo-item';
      const lbl=document.createElement('span');lbl.className='servo-label';lbl.textContent='Servo '+(i+1)+':';
      const sl=document.createElement('input');sl.type='range';sl.min=0;sl.max=255;sl.value=0;sl.id='sl'+i;
      const vd=document.createElement('span');vd.className='servo-val';vd.id='v'+i;vd.textContent='0';
      sl.addEventListener('input',function(){vd.textContent=this.value;});
      row.appendChild(lbl);row.appendChild(sl);row.appendChild(vd);
      (i<16?colA:colB).appendChild(row);sliders.push(sl);
    }
  }
  function sendServo(num,val){fetch('/servo?num='+num+'&val='+val);}
  setInterval(function(){
    sliders.forEach(function(sl,i){
      const val=parseInt(sl.value);
      if(val!==lastSent[i]){lastSent[i]=val;sendServo(i,val);}
    });
  },50);
  buildSliders();

  document.addEventListener('keydown',function(e){
    // ── Key capture mode: assign key to a mapping ──
    if(_capturingKeyFor!==null){
      e.preventDefault();
      if(e.code==='Escape'){_capturingKeyFor=null;renderKeyMappings();return;}
      updKey(_capturingKeyFor,'key',e.code);
      _capturingKeyFor=null;
      renderKeyMappings();
      return;
    }
    // ── Legacy: arrow keys nudge slider 0 in slider mode ──
    if(inputMode==='slider'&&(e.key==='ArrowLeft'||e.key==='ArrowRight')){
      const sl=sliders[0],step=e.shiftKey?10:1;
      let val=parseInt(sl.value);
      if(e.key==='ArrowRight')val=Math.min(255,val+step);
      if(e.key==='ArrowLeft')val=Math.max(0,val-step);
      sl.value=val;document.getElementById('v0').textContent=val;
    }
    // ── Key mappings: rising-edge actions (fires once on first keydown) ──
    if(!keysHeld.has(e.code)){
      keysHeld.add(e.code);
      keyMappings.forEach(function(m){
        if(!m.key||m.key!==e.code)return;
        const srv=m.servo,cur=parseInt(sliders[srv].value);
        if(m.action==='set')    setSlider(srv,m.value);
        if(m.action==='center') setSlider(srv,127);
        if(m.action==='min')    setSlider(srv,0);
        if(m.action==='max')    setSlider(srv,255);
        if(m.action==='toggle'){const k='kt'+m._id;keyToggleState[k]=!keyToggleState[k];setSlider(srv,keyToggleState[k]?255:0);}
      });
    }
  });
  document.addEventListener('keyup',function(e){
    keysHeld.delete(e.code);
  });

  const gpStatus=document.getElementById('gp-status'),gpBadge=document.getElementById('gp-live-badge');
  const AXIS_SOURCES=[
    {id:'LX',label:'Left Stick X',axisIdx:0,isTrigger:false},
    {id:'LY',label:'Left Stick Y',axisIdx:1,isTrigger:false},
    {id:'RX',label:'Right Stick X',axisIdx:2,isTrigger:false},
    {id:'RY',label:'Right Stick Y',axisIdx:3,isTrigger:false},
    {id:'LT',label:'Left Trigger',axisIdx:4,isTrigger:true},
    {id:'RT',label:'Right Trigger',axisIdx:5,isTrigger:true},
  ];
  const BUTTON_SOURCES=[
    {id:'A',label:'A',btnIdx:0},{id:'B',label:'B',btnIdx:1},
    {id:'X',label:'X',btnIdx:2},{id:'Y',label:'Y',btnIdx:3},
    {id:'LB',label:'LB',btnIdx:4},{id:'RB',label:'RB',btnIdx:5},
    {id:'Back',label:'Back/Select',btnIdx:8},{id:'Start',label:'Start',btnIdx:9},
    {id:'L3',label:'L3 (L-Click)',btnIdx:10},{id:'R3',label:'R3 (R-Click)',btnIdx:11},
    {id:'DUp',label:'D-Pad Up',btnIdx:12},{id:'DDown',label:'D-Pad Down',btnIdx:13},
    {id:'DLeft',label:'D-Pad Left',btnIdx:14},{id:'DRight',label:'D-Pad Right',btnIdx:15},
  ];
  const BTN_ACTIONS=[
    {id:'set',label:'Set Value',hasVal:true},{id:'inc',label:'Increment (hold)',hasVal:true},
    {id:'dec',label:'Decrement (hold)',hasVal:true},{id:'center',label:'Center (127)',hasVal:false},
    {id:'min',label:'Minimum (0)',hasVal:false},{id:'max',label:'Maximum (255)',hasVal:false},
    {id:'toggle',label:'Toggle Min/Max',hasVal:false},
  ];
  let axisMappings=[],buttonMappings=[],keyMappings=[],nextAxisId=0,nextBtnId=0,nextKeyId=0;
  const btnToggleState={},btnPrevState={},keyToggleState={};
  const keysHeld=new Set();  // currently held key codes
  let _capturingKeyFor=null; // mapping _id awaiting a key press, or null

  function servoOpts(sel){let o='';for(let i=0;i<32;i++)o+='<option value="'+i+'"'+(i===sel?' selected':'')+'>Servo '+(i+1)+'</option>';return o;}
  function axisOpts(sel){return AXIS_SOURCES.map(a=>'<option value="'+a.id+'"'+(a.id===sel?' selected':'')+'>'+a.label+'</option>').join('');}
  function btnOpts(sel){return BUTTON_SOURCES.map(b=>'<option value="'+b.id+'"'+(b.id===sel?' selected':'')+'>'+b.label+'</option>').join('');}
  function actOpts(sel){return BTN_ACTIONS.map(a=>'<option value="'+a.id+'"'+(a.id===sel?' selected':'')+'>'+a.label+'</option>').join('');}

  function makeStepper(cls,val,min,max,step,onch){
    const id='sp'+Math.random().toString(36).slice(2);
    return`<div class="custom-stepper ${cls}">
      <input class="stepper-input" id="${id}" type="text" value="${val}" onchange="${onch.replace('__VAL__','parseFloat(this.value)||0')}">
      <div class="stepper-btns">
        <button class="stepper-btn" onclick="stepperAdj('${id}',${step},${max});${onch.replace('__VAL__','parseFloat(document.getElementById(\''+id+'\').value)||0')}">&#9650;</button>
        <button class="stepper-btn" onclick="stepperAdj('${id}',-${step},${max});${onch.replace('__VAL__','parseFloat(document.getElementById(\''+id+'\').value)||0')}">&#9660;</button>
      </div></div>`;
  }
  function stepperAdj(id,delta,max){
    const el=document.getElementById(id);
    let v=parseFloat(el.value)||0;
    v=Math.max(0,Math.min(max,+(v+delta).toFixed(2)));
    el.value=v;
  }

  function renderAxisMappings(){
    const c=document.getElementById('axis-mappings');
    if(!axisMappings.length){c.innerHTML='<div class="map-empty">&mdash; NO AXIS MAPPINGS &mdash;</div>';return;}
    c.innerHTML=axisMappings.map(m=>`
      <div class="mapping-row axis-row">
        <select class="map-select" onchange="updAx(${m._id},'axisId',this.value)">${axisOpts(m.axisId)}</select>
        <select class="map-select" onchange="updAx(${m._id},'servo',parseInt(this.value))">${servoOpts(m.servo)}</select>
        <label class="map-check-label"><input type="checkbox" ${m.invert?'checked':''} onchange="updAx(${m._id},'invert',this.checked)"> INV</label>
        <div class="map-dz-label">DZ ${makeStepper('dz-stepper',m.deadzone,0,0.5,0.01,"updAx("+m._id+",'deadzone',__VAL__)")}</div>
        <button class="map-remove-btn" onclick="rmAx(${m._id})">&times;</button>
      </div>`).join('');
  }
  function renderButtonMappings(){
    const c=document.getElementById('button-mappings');
    if(!buttonMappings.length){c.innerHTML='<div class="map-empty">&mdash; NO BUTTON MAPPINGS &mdash;</div>';return;}
    c.innerHTML=buttonMappings.map(m=>{
      const ad=BTN_ACTIONS.find(a=>a.id===m.action)||BTN_ACTIONS[0];
      return`<div class="mapping-row button-row ${ad.hasVal?'has-val':''}">
        <select class="map-select" onchange="updBt(${m._id},'btnId',this.value)">${btnOpts(m.btnId)}</select>
        <select class="map-select" onchange="updBt(${m._id},'servo',parseInt(this.value))">${servoOpts(m.servo)}</select>
        <select class="map-select" onchange="updBt(${m._id},'action',this.value);renderButtonMappings()">${actOpts(m.action)}</select>
        ${ad.hasVal?makeStepper('map-val-stepper',m.value,0,255,1,"updBt("+m._id+",'value',parseInt(__VAL__))"):''}
        <button class="map-remove-btn" onclick="rmBt(${m._id})">&times;</button>
      </div>`;
    }).join('');
  }
  function addAxisMapping(){axisMappings.push({_id:nextAxisId++,axisId:'LX',servo:0,invert:false,deadzone:0.08});renderAxisMappings();}
  function rmAx(id){axisMappings=axisMappings.filter(m=>m._id!==id);renderAxisMappings();}
  function updAx(id,k,v){const m=axisMappings.find(m=>m._id===id);if(m)m[k]=v;}
  function addButtonMapping(){buttonMappings.push({_id:nextBtnId++,btnId:'A',servo:0,action:'set',value:255});renderButtonMappings();}
  function rmBt(id){buttonMappings=buttonMappings.filter(m=>m._id!==id);renderButtonMappings();}
  function updBt(id,k,v){const m=buttonMappings.find(m=>m._id===id);if(m)m[k]=v;}

  // ── KEY → SERVO mappings ──────────────────────────────────────
  function prettyKey(code){
    if(!code)return '— PRESS KEY —';
    return code
      .replace('Arrow','').replace('Key','').replace('Digit','')
      .replace('Numpad','NUM').replace('ShiftLeft','LSHIFT').replace('ShiftRight','RSHIFT')
      .replace('ControlLeft','LCTRL').replace('ControlRight','RCTRL')
      .replace('AltLeft','LALT').replace('AltRight','RALT')
      .replace('Space','SPC').replace('Enter','↵').replace('Backspace','⌫')
      .replace('Tab','TAB').replace('Escape','ESC')
      .replace('Left','←').replace('Right','→').replace('Up','↑').replace('Down','↓')
      .toUpperCase();
  }
  function renderKeyMappings(){
    const c=document.getElementById('key-mappings');
    if(!keyMappings.length){c.innerHTML='<div class="map-empty">&mdash; NO KEY MAPPINGS &mdash;</div>';return;}
    c.innerHTML=keyMappings.map(m=>{
      const ad=BTN_ACTIONS.find(a=>a.id===m.action)||BTN_ACTIONS[0];
      const isCap=_capturingKeyFor===m._id;
      return`<div class="mapping-row key-row ${ad.hasVal?'has-val':''}">
        <button class="key-cap-btn${isCap?' capturing':''}" onclick="startKeyCapture(${m._id})">${isCap?'PRESS KEY…':prettyKey(m.key)}</button>
        <select class="map-select" onchange="updKey(${m._id},'servo',parseInt(this.value))">${servoOpts(m.servo)}</select>
        <select class="map-select" onchange="updKey(${m._id},'action',this.value);renderKeyMappings()">${actOpts(m.action)}</select>
        ${ad.hasVal?makeStepper('map-val-stepper',m.value,0,255,1,"updKey("+m._id+",'value',parseInt(__VAL__))"):''}
        <button class="map-remove-btn" onclick="rmKey(${m._id})">&times;</button>
      </div>`;
    }).join('');
  }
  function addKeyMapping(){keyMappings.push({_id:nextKeyId++,key:'',servo:0,action:'set',value:255});renderKeyMappings();}
  function rmKey(id){keyMappings=keyMappings.filter(m=>m._id!==id);if(_capturingKeyFor===id)_capturingKeyFor=null;renderKeyMappings();}
  function updKey(id,k,v){const m=keyMappings.find(m=>m._id===id);if(m)m[k]=v;}
  function startKeyCapture(id){_capturingKeyFor=id;renderKeyMappings();}

  function getXboxGamepad(){
    const pads=navigator.getGamepads?navigator.getGamepads():[];
    for(let i=0;i<pads.length;i++){if(pads[i]&&pads[i].id.toLowerCase().includes('xbox'))return pads[i];}
    for(let i=0;i<pads.length;i++){if(pads[i])return pads[i];}
    return null;
  }
  function getAxisValue(gp,axisId){
    const src=AXIS_SOURCES.find(a=>a.id===axisId);if(!src)return 0;
    if(src.isTrigger){const bi=(axisId==='LT')?6:7;return gp.buttons[bi]?gp.buttons[bi].value:0;}
    return gp.axes[src.axisIdx]||0;
  }
  function axisToServo255(rawVal,isTrigger,invert,deadzone){
    let v=rawVal;
    if(!isTrigger){if(Math.abs(v)<deadzone)v=0;v=(v+1)/2;}
    else{if(v<deadzone)v=0;}
    if(invert)v=1-v;
    return Math.round(v*255);
  }
  function setSlider(idx,val){
    val=Math.max(0,Math.min(255,val));sliders[idx].value=val;document.getElementById('v'+idx).textContent=val;
  }
  window.addEventListener('gamepadconnected',function(e){
    gamepadConnected=true;gpStatus.textContent=e.gamepad.id;gpStatus.style.color='var(--accent)';
    if(gpBadge)gpBadge.style.display='inline-block';setToggleEnabled(true);
    log('GAMEPAD CONNECTED: '+e.gamepad.id,'ok');
  });
  window.addEventListener('gamepaddisconnected',function(){
    gamepadConnected=false;gpStatus.textContent='PRESS A BUTTON TO ACTIVATE CONTROLLER';
    gpStatus.style.color='var(--dim)';if(gpBadge)gpBadge.style.display='none';
    setToggleEnabled(false);forceSliderMode();
    log('GAMEPAD DISCONNECTED','warn');
  });
  setToggleEnabled(false);renderAxisMappings();renderButtonMappings();renderKeyMappings();

  // ── VIDEO RECORDING
  // Uses /capture (port 80, same-origin) polled at ~8 fps rather than drawing
  // the MJPEG stream img directly.  The MJPEG stream is on port 81 — a different
  // origin — so drawing it to a canvas taints the canvas and captureStream()
  // throws a SecurityError.  /capture is always same-origin, zero CORS issues.
  let _recCanvas=null,_recCtx=null,_recMR=null,_recChunks=[];
  let _recStartTime=0,_recTimerInt=null,_recMime='';
  let _recFetchTimer=null,_recBusy=false,_recActive=false;
  const REC_INTERVAL_MS=125;  // ~8 fps — light enough for ESP32 at XGA

  function _recChooseMime(){
    const c=['video/mp4;codecs=avc1','video/mp4','video/webm;codecs=vp9','video/webm;codecs=vp8','video/webm'];
    for(const t of c){if(MediaRecorder.isTypeSupported(t))return t;}return'';
  }
  function _recFmt(ms){const s=Math.floor(ms/1000),m=Math.floor(s/60);return String(m).padStart(2,'0')+':'+String(s%60).padStart(2,'0');}

  function _recLogErr(msg){
    // Open the log panel so the error is immediately visible
    const out=document.getElementById('log-output'),tog=document.getElementById('log-toggle');
    if(out&&out.style.display==='none'){out.style.display='block';if(tog)tog.textContent='▾';}
    log(msg,'err');
  }

  function toggleRecording(){
    if(_recActive)_stopRec();else _startRec();
  }

  function _startRec(){
    _recMime=_recChooseMime();
    if(!_recMime){_recLogErr('MediaRecorder not supported in this browser');return;}

    if(!_recCanvas){
      _recCanvas=document.createElement('canvas');
      _recCanvas.width=1024;_recCanvas.height=768;
      Object.assign(_recCanvas.style,{position:'fixed',left:'-9999px',top:'-9999px',
        width:'1px',height:'1px',opacity:'0',pointerEvents:'none'});
      document.body.appendChild(_recCanvas);
      _recCtx=_recCanvas.getContext('2d');
    }

    let stream;
    try{stream=_recCanvas.captureStream(8);}
    catch(e){_recLogErr('captureStream error: '+e.message);return;}
    try{_recMR=new MediaRecorder(stream,{mimeType:_recMime});}
    catch(e){_recLogErr('Recorder init error: '+e.message);return;}

    _recChunks=[];_recActive=true;
    _recMR.ondataavailable=function(e){if(e.data&&e.data.size>0)_recChunks.push(e.data);};
    _recMR.onstop=_recSave;
    _recMR.onerror=function(e){_recLogErr('Recorder error: '+(e.error?e.error.message:e));_recCleanupUI();};
    _recMR.start(1000);

    // Fetch frames from /capture (same-origin, no CORS issue)
    _recBusy=false;
    (function fetchFrame(){
      if(!_recActive)return;
      if(_recBusy){_recFetchTimer=setTimeout(fetchFrame,REC_INTERVAL_MS);return;}
      _recBusy=true;
      fetch('/capture?r='+Date.now())
        .then(function(r){return r.blob();})
        .then(function(blob){
          const url=URL.createObjectURL(blob);
          const im=new Image();
          im.onload=function(){
            if(_recCanvas.width!==im.naturalWidth||_recCanvas.height!==im.naturalHeight){
              _recCanvas.width=im.naturalWidth;_recCanvas.height=im.naturalHeight;
            }
            _recCtx.drawImage(im,0,0);
            URL.revokeObjectURL(url);
            _recBusy=false;
            if(_recActive)_recFetchTimer=setTimeout(fetchFrame,REC_INTERVAL_MS);
          };
          im.onerror=function(){URL.revokeObjectURL(url);_recBusy=false;if(_recActive)_recFetchTimer=setTimeout(fetchFrame,REC_INTERVAL_MS*2);};
          im.src=url;
        })
        .catch(function(){_recBusy=false;if(_recActive)_recFetchTimer=setTimeout(fetchFrame,REC_INTERVAL_MS*4);});
    })();

    _recStartTime=Date.now();
    const btn=document.getElementById('rec-btn'),ind=document.getElementById('rec-indicator');
    if(btn){btn.classList.add('recording');btn.innerHTML='&#9209; STOP';}
    if(ind)ind.classList.add('active');
    _recTimerInt=setInterval(function(){
      const d=document.getElementById('rec-timer-display');
      if(d)d.textContent=_recFmt(Date.now()-_recStartTime);
    },500);
    log('Recording started (~8 fps via /capture)','ok');
  }

  function _stopRec(){
    _recActive=false;
    clearTimeout(_recFetchTimer);_recFetchTimer=null;
    if(_recMR&&_recMR.state!=='inactive')_recMR.stop();
    _recCleanupUI();
  }
  function _recCleanupUI(){
    clearInterval(_recTimerInt);_recTimerInt=null;
    const btn=document.getElementById('rec-btn'),ind=document.getElementById('rec-indicator'),d=document.getElementById('rec-timer-display');
    if(btn){btn.classList.remove('recording');btn.innerHTML='&#9210; REC';}
    if(ind)ind.classList.remove('active');
    if(d)d.textContent='00:00';
  }
  function _recSave(){
    const dur=_recFmt(Date.now()-_recStartTime);
    if(!_recChunks.length){log('Recording stopped — no data captured','warn');return;}
    const ext=_recMime.startsWith('video/mp4')?'mp4':'webm';
    const blob=new Blob(_recChunks,{type:_recMime});
    const url=URL.createObjectURL(blob);
    const a=document.createElement('a');a.href=url;
    a.download='32sc_'+new Date().toISOString().slice(0,19).replace(/:/g,'-')+'.'+ext;
    document.body.appendChild(a);a.click();document.body.removeChild(a);
    URL.revokeObjectURL(url);_recChunks=[];
    log('Recording saved — '+dur,'ok');
  }

  // ── SYSTEM_LOG
  function log(msg,type){
    const out=document.getElementById('log-output');if(!out)return;
    const now=new Date();
    const ts=now.getHours().toString().padStart(2,'0')+':'+
              now.getMinutes().toString().padStart(2,'0')+':'+
              now.getSeconds().toString().padStart(2,'0');
    const entry=document.createElement('div');
    entry.className='log-entry'+(type?' '+type:'');
    entry.textContent='['+ts+'] '+msg;
    out.appendChild(entry);out.scrollTop=out.scrollHeight;
  }
  function toggleLog(){
    const out=document.getElementById('log-output'),tog=document.getElementById('log-toggle');
    const open=out.style.display!=='none';
    out.style.display=open?'none':'block';
    tog.textContent=open?'▸':'▾';
  }

  setInterval(function(){
    if(inputMode==='joystick'){
      const gp=getXboxGamepad();if(gp){
        axisMappings.forEach(function(m){
          const src=AXIS_SOURCES.find(a=>a.id===m.axisId);
          setSlider(m.servo,axisToServo255(getAxisValue(gp,m.axisId),src&&src.isTrigger,m.invert,m.deadzone));
        });
        buttonMappings.forEach(function(m){
          const src=BUTTON_SOURCES.find(b=>b.id===m.btnId);if(!src)return;
          const btn=gp.buttons[src.btnIdx],pressed=btn&&(btn.pressed||btn.value>0.5);
          const wasPressed=!!btnPrevState[m._id],risingEdge=pressed&&!wasPressed;
          btnPrevState[m._id]=pressed;if(!pressed&&!risingEdge)return;
          const srv=m.servo;let cur=parseInt(sliders[srv].value);
          if(m.action==='set'&&risingEdge)setSlider(srv,m.value);
          if(m.action==='center'&&risingEdge)setSlider(srv,127);
          if(m.action==='min'&&risingEdge)setSlider(srv,0);
          if(m.action==='max'&&risingEdge)setSlider(srv,255);
          if(m.action==='toggle'&&risingEdge){const k='t'+m._id;btnToggleState[k]=!btnToggleState[k];setSlider(srv,btnToggleState[k]?255:0);}
          if(m.action==='inc'&&pressed)setSlider(srv,cur+(m.value||3));
          if(m.action==='dec'&&pressed)setSlider(srv,cur-(m.value||3));
        });
      }
    }
    // ── Key held: inc/dec (always active, regardless of inputMode) ──
    if(keysHeld.size){
      keyMappings.forEach(function(m){
        if(!m.key||!keysHeld.has(m.key))return;
        const srv=m.servo,cur=parseInt(sliders[srv].value);
        if(m.action==='inc')setSlider(srv,cur+(m.value||3));
        if(m.action==='dec')setSlider(srv,cur-(m.value||3));
      });
    }
  },50);
</script>
</body>
</html>
)rawliteral";

// ─────────────────────────────────────────────────────────────
//  Syslog — write to FPSerial AND the web-visible ring buffer
// ─────────────────────────────────────────────────────────────
void syslog(const char* msg) {
  _syslogBuf[_syslogTotal % SYSLOG_MAX] = String(msg);
  _syslogTotal++;
  FPSerial.println(msg);
}
void syslog(const String& msg) { syslog(msg.c_str()); }

// GET /syslog?since=N  →  {"total":N,"msgs":["…","…"]}
void handleSyslog() {
  uint32_t since  = server.hasArg("since") ? (uint32_t)server.arg("since").toInt() : 0;
  uint32_t oldest = (_syslogTotal > SYSLOG_MAX) ? _syslogTotal - SYSLOG_MAX : 0;
  if (since < oldest) since = oldest;
  String json = "{\"total\":";
  json += _syslogTotal;
  json += ",\"msgs\":[";
  bool first = true;
  for (uint32_t i = since; i < _syslogTotal; i++) {
    if (!first) json += ',';
    String s = _syslogBuf[i % SYSLOG_MAX];
    s.replace("\\", "\\\\");
    s.replace("\"", "\\\"");
    s.replace("\n", "");
    s.replace("\r", "");
    json += '"'; json += s; json += '"';
    first = false;
  }
  json += "]}";
  server.send(200, "application/json", json);
}

// ─────────────────────────────────────────────────────────────
//  Camera — initialisation
// ─────────────────────────────────────────────────────────────
bool initCamera() {
  camera_config_t cfg;
  cfg.ledc_channel = LEDC_CHANNEL_0;  cfg.ledc_timer   = LEDC_TIMER_0;
  cfg.pin_d0       = Y2_GPIO_NUM;     cfg.pin_d1       = Y3_GPIO_NUM;
  cfg.pin_d2       = Y4_GPIO_NUM;     cfg.pin_d3       = Y5_GPIO_NUM;
  cfg.pin_d4       = Y6_GPIO_NUM;     cfg.pin_d5       = Y7_GPIO_NUM;
  cfg.pin_d6       = Y8_GPIO_NUM;     cfg.pin_d7       = Y9_GPIO_NUM;
  cfg.pin_xclk     = XCLK_GPIO_NUM;   cfg.pin_pclk     = PCLK_GPIO_NUM;
  cfg.pin_vsync    = VSYNC_GPIO_NUM;  cfg.pin_href     = HREF_GPIO_NUM;
  cfg.pin_sscb_sda = SIOD_GPIO_NUM;   cfg.pin_sscb_scl = SIOC_GPIO_NUM;
  cfg.pin_pwdn     = PWDN_GPIO_NUM;   cfg.pin_reset    = RESET_GPIO_NUM;
  cfg.xclk_freq_hz = 20000000;
  cfg.pixel_format = PIXFORMAT_JPEG;
  if (psramFound()) {
    // Always cold-init at QVGA — OV2640 reliably initialises at low res.
    // JS triggers changeRes() after the stream connects to switch to XGA.
    cfg.frame_size   = FRAMESIZE_QVGA;
    cfg.jpeg_quality = 10;
    cfg.fb_count     = 2;
    cfg.grab_mode    = CAMERA_GRAB_LATEST;
    cfg.fb_location  = CAMERA_FB_IN_PSRAM;
  } else {
    syslog("WARNING: No PSRAM — check IDE PSRAM setting!");
    cfg.frame_size   = FRAMESIZE_QVGA;
    cfg.jpeg_quality = 20;
    cfg.fb_count     = 1;
    cfg.grab_mode    = CAMERA_GRAB_WHEN_EMPTY;
    cfg.fb_location  = CAMERA_FB_IN_DRAM;
  }
  esp_err_t err = esp_camera_init(&cfg);
  if (err != ESP_OK) {
    char _b[72]; snprintf(_b, sizeof(_b), "Camera init FAILED 0x%x (try XCLK=40 if 0x105)", err);
    syslog(_b);
    return false;
  }
  sensor_t* s = esp_camera_sensor_get();
  if (s) {
    s->set_brightness(s,0);    s->set_contrast(s,0);     s->set_saturation(s,0);
    s->set_whitebal(s,1);      s->set_awb_gain(s,1);     s->set_wb_mode(s,0);
    s->set_exposure_ctrl(s,1); s->set_aec2(s,1);         s->set_ae_level(s,0);
    s->set_gain_ctrl(s,1);     s->set_agc_gain(s,0);
    s->set_gainceiling(s,(gainceiling_t)2);
    s->set_bpc(s,1); s->set_wpc(s,1); s->set_raw_gma(s,1); s->set_lenc(s,1);
    s->set_hmirror(s,0);  // set to 1 if image is mirrored
    s->set_vflip(s,0);    // set to 1 if image is upside-down
    s->set_colorbar(s,0);
  }
  syslog("Camera initialised (QVGA cold-boot).");
  return true;
}

// ─────────────────────────────────────────────────────────────
//  Camera — reinitialise at a new frame size (deinit + init)
// ─────────────────────────────────────────────────────────────
bool reinitCamera(framesize_t newSize) {
  { char _b[56]; snprintf(_b, sizeof(_b), "Camera reinit → framesize %d...", (int)newSize); syslog(_b); }
  if (streamClient && streamClient.connected()) streamClient.stop();
  esp_camera_deinit();
  delay(300); // give sensor time to fully power down before reinit
  camera_config_t cfg;
  cfg.ledc_channel = LEDC_CHANNEL_0;  cfg.ledc_timer   = LEDC_TIMER_0;
  cfg.pin_d0       = Y2_GPIO_NUM;     cfg.pin_d1       = Y3_GPIO_NUM;
  cfg.pin_d2       = Y4_GPIO_NUM;     cfg.pin_d3       = Y5_GPIO_NUM;
  cfg.pin_d4       = Y6_GPIO_NUM;     cfg.pin_d5       = Y7_GPIO_NUM;
  cfg.pin_d6       = Y8_GPIO_NUM;     cfg.pin_d7       = Y9_GPIO_NUM;
  cfg.pin_xclk     = XCLK_GPIO_NUM;   cfg.pin_pclk     = PCLK_GPIO_NUM;
  cfg.pin_vsync    = VSYNC_GPIO_NUM;  cfg.pin_href     = HREF_GPIO_NUM;
  cfg.pin_sscb_sda = SIOD_GPIO_NUM;   cfg.pin_sscb_scl = SIOC_GPIO_NUM;
  cfg.pin_pwdn     = PWDN_GPIO_NUM;   cfg.pin_reset    = RESET_GPIO_NUM;
  cfg.xclk_freq_hz = 20000000;
  cfg.pixel_format = PIXFORMAT_JPEG;
  cfg.frame_size   = newSize;
  if (psramFound()) {
    cfg.jpeg_quality = 10; cfg.fb_count = 2;
    cfg.grab_mode = CAMERA_GRAB_LATEST; cfg.fb_location = CAMERA_FB_IN_PSRAM;
  } else {
    cfg.jpeg_quality = 20; cfg.fb_count = 1;
    cfg.grab_mode = CAMERA_GRAB_WHEN_EMPTY; cfg.fb_location = CAMERA_FB_IN_DRAM;
  }
  esp_err_t err = esp_camera_init(&cfg);
  if (err != ESP_OK) { char _b[48]; snprintf(_b,sizeof(_b),"Camera reinit FAILED 0x%x",err); syslog(_b); return false; }
  sensor_t* s = esp_camera_sensor_get();
  if (s) {
    s->set_brightness(s,0);    s->set_contrast(s,0);     s->set_saturation(s,0);
    s->set_whitebal(s,1);      s->set_awb_gain(s,1);     s->set_wb_mode(s,0);
    s->set_exposure_ctrl(s,1); s->set_aec2(s,1);         s->set_ae_level(s,0);
    s->set_gain_ctrl(s,1);     s->set_agc_gain(s,0);
    s->set_gainceiling(s,(gainceiling_t)2);
    s->set_bpc(s,1); s->set_wpc(s,1); s->set_raw_gma(s,1); s->set_lenc(s,1);
    s->set_hmirror(s,0); s->set_vflip(s,0); s->set_colorbar(s,0);
  }
  syslog("Camera reinitialised OK.");
  return true;
}

// ─────────────────────────────────────────────────────────────
//  MJPEG stream loop — called each hardwareTask iteration (port 81)
// ─────────────────────────────────────────────────────────────
void handleStreamLoop() {
  if (!streamClient || !streamClient.connected()) {
    streamClient = streamServer.accept();
    if (!streamClient) return;
    syslog("Stream client connected.");
    while (streamClient.connected() && streamClient.available()) {
      if (streamClient.readStringUntil('\n') == "\r") break;
    }
    streamClient.print(
      "HTTP/1.1 200 OK\r\n"
      "Content-Type: multipart/x-mixed-replace; boundary=frame\r\n"
      "Access-Control-Allow-Origin: *\r\n"
      "Cache-Control: no-store, no-cache, must-revalidate\r\n"
      "Connection: close\r\n\r\n");
  }
  if (!streamClient.connected()) return;
  if (!cameraAvailable) return;  // no camera — don't attempt frame grab
  camera_fb_t* fb = esp_camera_fb_get();
  if (!fb) return;
  size_t frameLen = fb->len;
  streamClient.printf("--frame\r\nContent-Type: image/jpeg\r\nContent-Length: %u\r\n\r\n",
                      (unsigned)frameLen);
  streamClient.write(fb->buf, frameLen);
  streamClient.print("\r\n");
  esp_camera_fb_return(fb);

  _fpsFrameCount++;
  _bpsByteCount += frameLen;
  uint32_t now = millis();
  if (now - _statsLastMs >= 1000) {
    uint32_t elapsed = now - _statsLastMs;
    streamFps  = (uint16_t)((_fpsFrameCount * 1000UL) / elapsed);
    streamKbps = (uint32_t)((_bpsByteCount  * 8UL * 1000UL) / (elapsed * 1000UL));
    _fpsFrameCount = 0; _bpsByteCount = 0; _statsLastMs = now;
  }
  if (!streamClient.connected()) {
    streamClient.stop();
    streamFps = 0; streamKbps = 0; _fpsFrameCount = 0; _bpsByteCount = 0;
    syslog("Stream client disconnected.");
  }
}

// ─────────────────────────────────────────────────────────────
//  /stats — JSON: {"fps":N,"kbps":N,"rssi":N}
// ─────────────────────────────────────────────────────────────
void handleStats() {
  char buf[80];
  snprintf(buf, sizeof(buf),
    "{\"fps\":%u,\"kbps\":%lu,\"rssi\":%d}",
    (unsigned)streamFps, (unsigned long)streamKbps, (int)WiFi.RSSI());
  server.sendHeader("Access-Control-Allow-Origin", "*");
  server.send(200, "application/json", buf);
}

// ─────────────────────────────────────────────────────────────
//  /capture — single JPEG snapshot download
// ─────────────────────────────────────────────────────────────
void handleCamStatus() {
  server.sendHeader("Access-Control-Allow-Origin", "*");
  server.send(200, "application/json", cameraAvailable ? "{\"available\":true}" : "{\"available\":false}");
}

void handleCapture() {
  if (!cameraAvailable) { server.send(503, "text/plain", "No camera"); return; }
  camera_fb_t* fb = esp_camera_fb_get();
  if (!fb) { server.send(500, "text/plain", "Capture failed"); return; }
  server.sendHeader("Content-Disposition", "attachment; filename=snapshot.jpg");
  server.send_P(200, "image/jpeg", (const char*)fb->buf, fb->len);
  esp_camera_fb_return(fb);
}

// ─────────────────────────────────────────────────────────────
//  /set — resolution / quality change
// ─────────────────────────────────────────────────────────────
void handleSet() {
  if (server.hasArg("res")) {
    String r = server.arg("res");
    framesize_t fs = FRAMESIZE_QVGA;
    if      (r=="UXGA") fs=FRAMESIZE_UXGA;
    else if (r=="SXGA") fs=FRAMESIZE_SXGA;
    else if (r=="XGA")  fs=FRAMESIZE_XGA;
    else if (r=="SVGA") fs=FRAMESIZE_SVGA;
    else if (r=="VGA")  fs=FRAMESIZE_VGA;
    else if (r=="CIF")  fs=FRAMESIZE_CIF;
    else if (r=="QVGA") fs=FRAMESIZE_QVGA;
    pendingFrameSize = fs;
    reinitRequested  = true;
    { char _b[48]; snprintf(_b,sizeof(_b),"Resolution change → %s",r.c_str()); syslog(_b); }
  }
  if (server.hasArg("quality")) {
    sensor_t* s = esp_camera_sensor_get();
    if (s) s->set_quality(s, constrain(server.arg("quality").toInt(), 0, 63));
  }
  server.send(200, "text/plain", "OK");
}

// -------------------------------------------------------------
//  AP-mode handlers
// -------------------------------------------------------------
void handleSetupRoot() {
  server.send_P(200, "text/html", SETUP_HTML);
}
void handleWifiSetup() {
  server.send_P(200, "text/html", SETUP_HTML);
}

void handleScan() {
  int n = WiFi.scanNetworks(false, false, false, 200);
  String json = "[";
  for (int i = 0; i < n; i++) {
    if (i) json += ",";
    json += "{\"ssid\":\"" + WiFi.SSID(i) + "\","
                                            "\"rssi\":"
            + WiFi.RSSI(i) + ","
                             "\"secure\":"
            + (WiFi.encryptionType(i) != WIFI_AUTH_OPEN ? "true" : "false") + "}";
  }
  json += "]";
  WiFi.scanDelete();
  server.send(200, "application/json", json);
}

void handleSave() {
  if (!server.hasArg("ssid") || server.arg("ssid").isEmpty()) {
    server.send(400, "text/plain", "Missing SSID");
    return;
  }
  prefs.begin("wifi", false);
  prefs.putString("ssid",    server.arg("ssid"));
  prefs.putString("pass",    server.hasArg("pass") ? server.arg("pass") : "");
  prefs.putString("netmode", "sta");
  prefs.end();
  FPSerial.printf("Credentials saved for: %s — rebooting into STA mode.\n", server.arg("ssid").c_str());
  server.send(200, "text/plain", "Saved! Switching to infrastructure mode...");
  delay(1200);
  ESP.restart();
}

void handleSetAP() {
  prefs.begin("wifi", false);
  prefs.putString("netmode", "ap");
  prefs.end();
  FPSerial.println("Mode set to AP — rebooting.");
  server.send(200, "text/plain", "Switching to Access Point mode...");
  delay(1200);
  ESP.restart();
}

// Tell Windows NCSI the network has internet — prevents captive portal popup / MSN
void handleNCSI_Windows()  { server.send(200, "text/plain", "Microsoft Connect Test"); }
void handleNCSI_Windows2() { server.send(200, "text/plain", "Microsoft NCSI"); }

// Tell Android the network has internet (204 = no captive portal)
void handleGenerate204()   { server.send(204, "text/plain", ""); }

// Tell iOS/macOS the network has internet
void handleHotspotDetect() {
  server.send(200, "text/html",
    "<HTML><HEAD><TITLE>Success</TITLE></HEAD><BODY>Success</BODY></HTML>");
}

// Generic fallback redirect for any unknown URL — takes browser to controller
void handleCaptivePortal() {
  server.sendHeader("Location", "http://192.168.4.1/", true);
  server.send(302, "text/html",
    "<!DOCTYPE html><html><head>"
    "<meta http-equiv='refresh' content='0;url=http://192.168.4.1/'>"
    "</head><body><a href='http://192.168.4.1/'>Open Controller</a></body></html>"
  );
}

// -------------------------------------------------------------
//  STA-mode handlers (port 80 - always responsive)
// -------------------------------------------------------------
void handleMainPage() {
  server.send_P(200, "text/html", CAMERA_HTML);
}

void handleForget() {
  prefs.begin("wifi", false);
  prefs.clear();
  prefs.end();
  server.send(200, "text/plain", "Credentials cleared - rebooting into setup modeâ€¦");
  delay(1500);
  ESP.restart();
}

void handleServo() {
  if (!server.hasArg("num") || !server.hasArg("val")) {
    server.send(400, "text/plain", "Bad Request");
    return;
  }
  int num = server.arg("num").toInt();
  int val = constrain(server.arg("val").toInt(), 0, 255);
  if (num >= 0 && num < NUM_SERVOS) {
    if (xSemaphoreTake(sliderMutex, pdMS_TO_TICKS(10)) == pdTRUE) {
      sliderValues[num] = val;
      xSemaphoreGive(sliderMutex);
    }
    FPSerial.printf("Servo %2d = %3d\n", num + 1, val);
  }
  server.send(200, "text/plain", "OK");
}

// -------------------------------------------------------------
//  Mode starters
// -------------------------------------------------------------
void startAPMode() {
  currentMode = MODE_AP;
  WiFi.mode(WIFI_AP);
  WiFi.softAPConfig(AP_IP, AP_IP, IPAddress(255, 255, 255, 0));
  strlen(AP_PASSWORD) > 0 ? WiFi.softAP(AP_SSID, AP_PASSWORD) : WiFi.softAP(AP_SSID);
  FPSerial.printf("AP started - SSID: \"%s\"\n", AP_SSID);
  FPSerial.println("Connect to that network then open http://192.168.4.1/");

  dns.start(53, "*", AP_IP);

  // Serve main control page at root — WiFi setup accessible via button
  server.on("/",           HTTP_GET, handleMainPage);
  server.on("/wifi-setup", HTTP_GET, handleWifiSetup);
  server.on("/scan",       HTTP_GET, handleScan);
  server.on("/save",       HTTP_POST, handleSave);
  server.on("/setap",      HTTP_GET, handleSetAP);
  server.on("/servo",      HTTP_GET, handleServo);
  server.on("/capture",    HTTP_GET, handleCapture);
  server.on("/set",        HTTP_GET, handleSet);
  server.on("/stats",      HTTP_GET, handleStats);
  server.on("/syslog",     HTTP_GET, handleSyslog);
  server.on("/camstatus",  HTTP_GET, handleCamStatus);
  server.on("/forget",     HTTP_GET, handleForget);
  server.on("/generate_204",              handleGenerate204);    // Android — no captive portal
  server.on("/connecttest.txt",           handleNCSI_Windows);   // Windows NCSI — reports internet OK
  server.on("/ncsi.txt",                  handleNCSI_Windows2);  // Windows NCSI alt
  server.on("/hotspot-detect.html",       handleHotspotDetect);  // iOS/macOS
  server.on("/library/test/success.html", handleHotspotDetect);  // iOS alt
  server.on("/fwlink",                    handleCaptivePortal);  // Windows legacy browser
  server.on("/redirect",                  handleCaptivePortal);  // Windows 10/11 Edge
  server.onNotFound(handleCaptivePortal);
  server.begin();
  FPSerial.println("Control server on port 80 (AP mode).");

  if (MDNS.begin("32servo")) {
    MDNS.addService("http", "tcp", 80);
    FPSerial.println("mDNS started — http://32servo.local/");
  }

  streamServer.begin();
  streamServer.setNoDelay(true);
  FPSerial.println("Stream server on port 81 (AP mode).");
}

bool startSTAMode(const String& ssid, const String& pass) {
  currentMode = MODE_STA;
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid.c_str(), pass.c_str());
  FPSerial.printf("Connecting to \"%s\"", ssid.c_str());
  uint8_t t = 0;
  while (WiFi.status() != WL_CONNECTED && t < 40) {
    delay(500);
    FPSerial.print('.');
    t++;
  }
  FPSerial.println();
  if (WiFi.status() != WL_CONNECTED) {
    FPSerial.println("Connection failed!");
    return false;
  }
  FPSerial.printf("Connected!  http://%s/  RSSI: %d dBm\n",
                  WiFi.localIP().toString().c_str(), WiFi.RSSI());

  server.on("/",           HTTP_GET, handleMainPage);
  server.on("/wifi-setup", HTTP_GET, handleWifiSetup);
  server.on("/scan",       HTTP_GET, handleScan);
  server.on("/save",       HTTP_POST, handleSave);
  server.on("/setap",      HTTP_GET, handleSetAP);
  server.on("/forget",     HTTP_GET, handleForget);
  server.on("/servo",      HTTP_GET, handleServo);
  server.on("/capture",    HTTP_GET, handleCapture);
  server.on("/set",        HTTP_GET, handleSet);
  server.on("/stats",      HTTP_GET, handleStats);
  server.on("/syslog",     HTTP_GET, handleSyslog);
  server.on("/camstatus",  HTTP_GET, handleCamStatus);
  server.onNotFound([]() { server.send(404, "text/plain", "Not found"); });
  server.begin();
  FPSerial.println("Control server on port 80 (STA mode).");

  if (MDNS.begin("32servo")) {
    MDNS.addService("http", "tcp", 80);
    FPSerial.printf("mDNS started — http://32servo.local/  (IP: %s)\n",
                    WiFi.localIP().toString().c_str());
  }

  streamServer.begin();
  streamServer.setNoDelay(true);
  FPSerial.println("Stream server on port 81.");
  return true;
}




// -------------------------------------------------------------
//  Core 0 Task - WiFi, WebServer, DNS
// -------------------------------------------------------------
void webTask(void* pvParameters) {
  FPSerial.println("[Core 0] Web task started.");

  // Load saved prefs
  prefs.begin("wifi", true);
  savedSsid    = prefs.getString("ssid",    "");
  savedPass    = prefs.getString("pass",    "");
  savedNetMode = prefs.getString("netmode", "ap");
  prefs.end();

  FPSerial.printf("Saved mode: \"%s\"\n", savedNetMode.c_str());

  if (savedNetMode == "sta" && savedSsid.length() > 0) {
    FPSerial.printf("Starting STA mode for: \"%s\"\n", savedSsid.c_str());
    if (!startSTAMode(savedSsid, savedPass)) {
      FPSerial.println("STA failed — falling back to AP mode.");
      startAPMode();
    }
  } else {
    FPSerial.println("Starting AP mode.");
    startAPMode();
  }

  FPSerial.println("[Core 0] Web server running.");

  for (;;) {
    if (currentMode == MODE_AP) dns.processNextRequest();
    server.handleClient();
    vTaskDelay(1);
  }
}

// -------------------------------------------------------------
//  Core 1 Task - Camera stream, Servo PWM, LCD
// -------------------------------------------------------------
void hardwareTask(void* pvParameters) {
  FPSerial.println("[Core 1] Hardware task started.");

  // Local snapshot of slider values to minimise mutex hold time
  int localValues[NUM_SERVOS];

  for (;;) {
    // Check if a resolution reinit was requested by the web task
    if (reinitRequested) {
      reinitRequested = false;
      if (cameraAvailable) {
        if (!reinitCamera(pendingFrameSize)) {
          syslog("reinitCamera failed — falling back to QVGA");
          if (!reinitCamera(FRAMESIZE_QVGA)) {
            syslog("FATAL: QVGA fallback also failed");
          }
        }
      } else {
        syslog("reinit ignored — no camera present");
      }
    }

    if (currentMode == MODE_STA || currentMode == MODE_AP) {
      // Push one MJPEG frame to any connected stream client
      handleStreamLoop();

      // Snapshot slider values under mutex
      if (xSemaphoreTake(sliderMutex, pdMS_TO_TICKS(5)) == pdTRUE) {
        memcpy(localValues, (const void*)sliderValues, sizeof(localValues));
        xSemaphoreGive(sliderMutex);
      }

      // Write to both PCA9685 boards using local snapshot
      for (int i = 0; i < 16; i++) {
        uint32_t us = USMIN + (uint32_t)(localValues[i] * US_SCALE);
        pwmA.writeMicroseconds(i, us);
      }
      for (int i = 0; i < 16; i++) {
        uint32_t us = USMIN + (uint32_t)(localValues[i + 16] * US_SCALE);
        pwmB.writeMicroseconds(i, us);
      }
    }

    displayWiFiSignal();
    vTaskDelay(1);  // yield to avoid WDT
  }
}


void displayWiFiSignal() {
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);

  if (currentMode == MODE_AP) {
    // AP mode — show SSID and password for direct connection
    display.setCursor(0, 0);
    display.print(F("IP:"));
    display.print(WiFi.softAPIP());

    display.setCursor(0, 12);
    display.print(F("AP:"));
    display.print(AP_SSID);

    display.setCursor(0, 24);
    display.print(F("PW:"));
    display.print(AP_PASSWORD);

  } else {
    // STA mode — show IP, FPS, and network name
    display.setCursor(0, 0);
    display.print(F("IP:"));
    display.print(WiFi.localIP());

    display.setCursor(0, 12);
    display.print(F("AP: "));
    display.print(savedSsid);

    display.setCursor(0, 24);
    display.print(F("FPS:"));
    display.print(streamFps);
    display.print(F("  "));
    uint32_t kBps = streamKbps / 8;
    if (kBps >= 1000) {
      display.print(kBps / 1000); display.print(F(".")); display.print((kBps % 1000) / 100); display.print(F("MB/s"));
    } else {
      display.print(kBps); display.print(F("KB/s"));
    }

    int bars = 0;
    int rssi = WiFi.RSSI();
    if      (rssi >= -55) bars = 5;
    else if (rssi >= -65) bars = 4;
    else if (rssi >= -70) bars = 3;
    else if (rssi >= -78) bars = 2;
    else if (rssi >= -90) bars = 1;
    int startX = 103, baseY = 31, barWidth = 3, barSpace = 2;
    for (int i = 0; i < 5; i++) {
      int barHeight = (i + 1) * 3;
      int x = startX + i * (barWidth + barSpace);
      int y = baseY - barHeight;
      if (i < bars) display.fillRect(x, y, barWidth, barHeight, SSD1306_WHITE);
    }
  }

  display.display();
}


void showEnduranceRC_USB_MODE() {
  unsigned long startTime = millis();
  uint8_t frame = 0;
  int scrollPos = SCREEN_WIDTH;

  while (millis() - startTime < 10000) {
    display.clearDisplay();
    frame++;

    // 1. Bottom scrolling tagline (Draw this FIRST)
    display.setTextSize(1);
    display.setTextColor(SSD1306_WHITE);
    display.setCursor(scrollPos, SCREEN_HEIGHT - 8);
    display.print(F("32 Servo Controller - USB MODE"));

    scrollPos -= 2;
    if (scrollPos < -100) scrollPos = SCREEN_WIDTH;

    // 2. MASK: Draw a black box over the signal bar area
    // This "erases" any scrolling text that tries to pass under the bars
    display.fillRect(108, SCREEN_HEIGHT - 12, 20, 12, SSD1306_BLACK);

    // 3. Neon "ENDURANCE" with glitch
    display.setTextSize(2);
    int glitchOffset = (frame % 12 < 2) ? random(-2, 3) : 0;
    display.setCursor(4 + glitchOffset, 2);
    display.println(F("ENDURANCE"));

    // 4. "R/C" and Angular Underline
    display.setTextSize(1);
    display.setCursor(82, 18);
    display.println(F("R/C"));
    display.drawLine(4, 19, 75, 19, SSD1306_WHITE);
    display.drawLine(75, 19, 82, 14, SSD1306_WHITE);

    // 5. Animated Signal Bars (Drawn LAST so they stay on top)
    int barX = 110;
    for (int i = 0; i < 5; i++) {
      int height = 6 + ((frame + i * 3) % 12);
      // Center the bars vertically in the bottom right corner
      display.fillRect(barX + i * 3, (SCREEN_HEIGHT - 4) - height / 2, 2, height, SSD1306_WHITE);
    }

    display.display();
    delay(35);
  }
}


void showEnduranceRC_WIFI_MODE() {
  unsigned long startTime = millis();
  uint8_t frame = 0;
  int scrollPos = SCREEN_WIDTH;

  while (millis() - startTime < 10000) {
    display.clearDisplay();
    frame++;

    // 1. Bottom scrolling tagline (Draw this FIRST)
    display.setTextSize(1);
    display.setTextColor(SSD1306_WHITE);
    display.setCursor(scrollPos, SCREEN_HEIGHT - 8);
    display.print(F("32 Servo Controller - WIFI MODE"));

    scrollPos -= 2;
    if (scrollPos < -100) scrollPos = SCREEN_WIDTH;

    // 2. MASK: Draw a black box over the signal bar area
    // This "erases" any scrolling text that tries to pass under the bars
    display.fillRect(108, SCREEN_HEIGHT - 12, 20, 12, SSD1306_BLACK);

    // 3. Neon "ENDURANCE" with glitch
    display.setTextSize(2);
    int glitchOffset = (frame % 12 < 2) ? random(-2, 3) : 0;
    display.setCursor(4 + glitchOffset, 2);
    display.println(F("ENDURANCE"));

    // 4. "R/C" and Angular Underline
    display.setTextSize(1);
    display.setCursor(82, 18);
    display.println(F("R/C"));
    display.drawLine(4, 19, 75, 19, SSD1306_WHITE);
    display.drawLine(75, 19, 82, 14, SSD1306_WHITE);

    // 5. Animated Signal Bars (Drawn LAST so they stay on top)
    int barX = 110;
    for (int i = 0; i < 5; i++) {
      int height = 6 + ((frame + i * 3) % 12);
      // Center the bars vertically in the bottom right corner
      display.fillRect(barX + i * 3, (SCREEN_HEIGHT - 4) - height / 2, 2, height, SSD1306_WHITE);
    }

    display.display();
    delay(35);
  }
}

bool isConnectedToUSBHost() {
  // Address for the USB_SERIAL_JTAG_FRAM_NUM_REG on the ESP32-S3
  // This register increments when a USB host is active.
  uint32_t USB_SERIAL_JTAG_FRAM_NUM_REG = 0x60038024;
  volatile uint32_t* frame_reg = (uint32_t*)USB_SERIAL_JTAG_FRAM_NUM_REG;

  // Poll for up to 3 seconds — Android delays enumeration until the user
  // responds to the "What do you want to do?" popup, so a single read at
  // boot always sees zero and incorrectly falls through to WiFi mode.
  uint32_t start = millis();
  while (millis() - start < 3000) {
    if (*frame_reg != 0) return true;
    delay(50);
  }
  return false;
}
// ─────────────────────────────────────────────────────────────
//  setup() — detect mode, init shared hardware, branch
// ─────────────────────────────────────────────────────────────
void setup() {
  // ── Disable hardware brownout detector ───────────────────────
  // Android phone USB ports can sag below the default 2.43 V
  // threshold under load, triggering repeated brownout resets.
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);

  // ── Fix Core-0 Task WDT starvation caused by USB device task ─
  // Arduino ESP32 2.0.x creates usb_device_task at configMAX_PRIORITIES-1
  // in a tight loop with NO vTaskDelay/yield.  When Android sends
  // continuous HID output reports tud_task() always has work and never
  // returns slowly enough for Core 0's idle task to run.  After 5 s the
  // Task WDT fires for the idle task (RST:6).  Unsubscribing Core 0's
  // idle task from the WDT is the correct workaround; our loopTask on
  // Core 1 is still monitored so any real hang in user code is caught.
  esp_task_wdt_delete(xTaskGetIdleTaskHandleForCPU(0));

  // Set USB descriptor strings BEFORE FPSerial.begin() — calling begin()
  // on a USBCDC object triggers the ESP32 USB stack to enumerate, and
  // Chrome reads the product name at that moment. If these are set after
  // begin(), Chrome sees TinyUSB's default "TinyUSB HID" instead.
  FPSerial.begin(115200);
  FPSerial.println("\n=== 32 Servo Controller Starting ===");

  // ── Common hardware init ──
  Wire.begin(I2C_SDA, I2C_SCL);
  Wire.setClock(400000);

  pwmA.begin();
  pwmA.setOscillatorFrequency(27000000);
  pwmA.setPWMFreq(SERVO_FREQ);
  FPSerial.println("PCA9685 0x40 ready");

  pwmB.begin();
  pwmB.setOscillatorFrequency(27000000);
  pwmB.setPWMFreq(SERVO_FREQ);
  FPSerial.println("PCA9685 0x41 ready");

  // Detect USB host BEFORE any USB or WiFi stack initialisation
  usbMode = isConnectedToUSBHost();

  display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS);

  // ── Show reset reason on OLED (any non-power-on reset) ───────
  // Codes: 4=PANIC  5=INT_WDT  6=TASK_WDT  7=WDT  9=BROWNOUT
  // This lets you identify the reboot cause without a serial adapter.
  esp_reset_reason_t rr = esp_reset_reason();
  if (rr != ESP_RST_POWERON) {
    display.clearDisplay();
    display.setTextColor(SSD1306_WHITE);
    display.setTextSize(2);
    display.setCursor(0, 0);
    display.print(F("RST:"));
    display.print((int)rr);
    display.setTextSize(1);
    display.setCursor(0, 20);
    // Print a short label so it's self-explanatory
    switch (rr) {
      case ESP_RST_PANIC: display.print(F("PANIC")); break;
      case ESP_RST_INT_WDT: display.print(F("INT WATCHDOG")); break;
      case ESP_RST_TASK_WDT: display.print(F("TASK WATCHDOG")); break;
      case ESP_RST_WDT: display.print(F("WATCHDOG")); break;
      case ESP_RST_BROWNOUT: display.print(F("BROWNOUT")); break;
      case ESP_RST_SW: display.print(F("SW RESET")); break;
      default: display.print(F("OTHER")); break;
    }
    display.display();
    delay(3000);  // hold for 3 s so you can read it
  }

  if (usbMode) {
    // ── USB HID Mode ──
    // FPSerial.println("USB host detected — starting USB HID mode.");
    display.clearDisplay();
    display.setTextSize(3);
    display.setTextColor(SSD1306_WHITE);
    display.setCursor(0, 10);
    display.print(F("USBMODE"));
    display.display();

    // Create the mutex that guards every HID.SendReport() call.
    // Must be created before USB.begin() so sendKeepalive() is safe immediately.
    usbSendMutex = xSemaphoreCreateMutex();



    controller.begin();
    USB.begin();

    while (!USB) { delay(1); }

    // Zero-point for enumeration timing: USB stack is up, HID class
    // requests (SET_IDLE, GET_REPORT, etc.) arrive after this point.
    fp_connectTimeMs = millis();
    lastUSBActivity = millis();
    usbWasConnected = true;

    //showEnduranceRC_USB_MODE();
  } else {
    // ── WiFi Mode ──
    FPSerial.println("No USB host — starting WiFi mode.");
    showEnduranceRC_WIFI_MODE();

    // Initialise camera — optional, continue without it if not connected
    cameraAvailable = initCamera();
    if (!cameraAvailable) {
      // Show warning on OLED but keep going — servo control still works
      display.clearDisplay();
      display.setTextSize(1);
      display.setTextColor(SSD1306_WHITE);
      display.setCursor(0, 0);  display.print(F("CAM NOT"));
      display.setCursor(0, 12); display.print(F("FOUND"));
      display.setCursor(0, 24); display.print(F("No video stream"));
      display.display();
      FPSerial.println("WARNING: Camera init failed — continuing without camera.");
      delay(2000); // brief pause so the message is visible, then carry on
    }

    // Camera boots at QVGA (reliable OV2640 cold-boot).
    // The page JS auto-triggers changeRes() after the stream connects,
    // which switches to XGA via the normal hardware-task reinit path.

    sliderMutex = xSemaphoreCreateMutex();

    xTaskCreatePinnedToCore(
      webTask, "WebTask", 8192, nullptr, 1, &webTaskHandle, 0);

    xTaskCreatePinnedToCore(
      hardwareTask, "HardwareTask", 12288, nullptr, 1, &hardwareTaskHandle, 1);
  }
}

// ─────────────────────────────────────────────────────────────
//  USB mode — 32-channel bar graph on the OLED
//  128×64 display: 10px header + 54px bars (3px wide, 1px gap each)
// ─────────────────────────────────────────────────────────────
void displayUSBChannels() {
  const int BAR_AREA_TOP = 10;                        // header height in px
  const int BAR_AREA_H   = SCREEN_HEIGHT - BAR_AREA_TOP; // 54px
  const int BAR_W        = 3;
  const int GAP_W        = 1;
  const int SLOT_W       = BAR_W + GAP_W;             // 4px × 32 = 128px

  display.clearDisplay();

  // ── Header row ────────────────────────────────────────────
  // "ENDURANCE R/C" centred at size 1 (each char = 6px wide, 8px tall)
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  const char* title = "LIVE SERVO DATA";
  int titleX = (SCREEN_WIDTH - (strlen(title) * 6)) / 2;
  display.setCursor(titleX, 0);
  display.print(F("LIVE SERVO DATA"));

  // ── Bars ──────────────────────────────────────────────────
  uint8_t* data = (uint8_t*)servoBuffer[readBuffer];
  for (int i = 0; i < 32; i++) {
    int val  = data[i];                               // 0–255
    int barH = (val * BAR_AREA_H) / 255;              // scale to bar area
    int x    = i * SLOT_W;
    int y    = SCREEN_HEIGHT - barH;
    if (barH > 0)
      display.fillRect(x, y, BAR_W, barH, SSD1306_WHITE);
    // Always draw a 1px tick at the bottom so silent channels are visible
    display.drawPixel(x + 1, SCREEN_HEIGHT - 1, SSD1306_WHITE);
  }

  // ── Centre-line (marks the servo midpoint — value 127) ────
  int midY = SCREEN_HEIGHT - (127 * BAR_AREA_H / 255);
  for (int x = 0; x < SCREEN_WIDTH; x += 4)
    display.drawPixel(x, midY, SSD1306_WHITE);        // dotted line

  display.display();
}

// ─────────────────────────────────────────────────────────────
//  loop()
// ─────────────────────────────────────────────────────────────
void loop() {
  if (!usbMode) {
    // WiFi tasks are self-contained; nothing for loop() to do
    vTaskDelay(portMAX_DELAY);
    return;
  }

  // ── USB HID servo update ──
  if (bufferReady) {
    // taskENTER_CRITICAL works on both cores; noInterrupts() only masks Core 1
    taskENTER_CRITICAL(&bufferMux);
    uint8_t rb = writeBuffer;
    writeBuffer = readBuffer;
    readBuffer = rb;
    bufferReady = false;
    taskEXIT_CRITICAL(&bufferMux);

    uint8_t* data = (uint8_t*)servoBuffer[readBuffer];

    for (int x = 0; x < 16; x++) {
      uint32_t us = USMIN + (uint32_t)(data[x] * 7.25);
      pwmA.writeMicroseconds(x, us);
    }
    for (int y = 0; y < 16; y++) {
      uint32_t us = USMIN + (uint32_t)(data[y + 16] * 7.25);
      pwmB.writeMicroseconds(y, us);
    }

    controller.updateLastReport(data);
    lastPrint = millis();

  } else {
    if (millis() - lastPrint > 2000) {
      lastPrint = millis();
      if ((bool)FPSerial) {
        FPSerial.print("Sending keepalive... ");
        FPSerial.print(millis() / 1000);
        FPSerial.println(" seconds since boot");
      }
      controller.sendKeepalive();
    }
  }

  // ── Fingerprint evaluation ───────────────────────────────────
  // Wait 2 seconds after the first HID class request arrives before
  // scoring.  All enumeration traffic (SET_IDLE, SET_PROTOCOL, etc.)
  // finishes well within that window on every OS we care about.
  if (!fp_evaluated && fp_firstHIDReqMs > 0
      && millis() - fp_firstHIDReqMs > 2000) {
    fp_evaluated = true;
    detectedHostType = scoreHostType();  // pure computation — no FPSerial writes

    // Show result on OLED (always, regardless of host type)
    display.clearDisplay();
    display.setTextColor(SSD1306_WHITE);
    display.setTextSize(1);
    display.setCursor(0, 0);
    display.print(F("HOST DETECTED:"));
    display.setTextSize(2);
    display.setCursor(0, 12);
    display.print(hostTypeName(detectedHostType));
    display.display();
  }

  // ── Reprint report when Serial Monitor is opened ─────────────
  // Only relevant for Windows — on Android there is no terminal app
  // and writing to CDC when nobody is reading can block loop() and
  // trigger the Core-1 WDT.  Guard strictly with host-type check.
  static bool fpSerialWasOpen = false;
  bool fpSerialNowOpen = (bool)FPSerial;
  if (fpSerialNowOpen && !fpSerialWasOpen && fp_evaluated) {
    delay(50);  // brief settle so CDC ACKs the open before we flood it
    // Always print the full report when a serial monitor connects — lets you
    // see the actual delta even if the host was mis-classified, so the
    // threshold can be tuned if needed.
    printFingerprintReport(detectedHostType);
    FPSerial.printf("[FP] *** HOST IDENTIFIED: %s ***\n",
                    hostTypeName(detectedHostType));
  }
  fpSerialWasOpen = fpSerialNowOpen;

  // ── Periodic bar-graph update (every 100 ms, after host is identified) ──
  static unsigned long lastBarDraw = 0;
  if (fp_evaluated && millis() - lastBarDraw >= 100) {
    lastBarDraw = millis();
    displayUSBChannels();
  }
}
