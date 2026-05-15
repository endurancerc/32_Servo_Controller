<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="1" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="255" name="Undefined" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Resistor" urn="urn:adsk.eagle:library:16378527">
<description>&lt;B&gt;Resistors, Potentiometers, TrimPot</description>
<packages>
<package name="RESC1005X40" urn="urn:adsk.eagle:footprint:16378540/5" library_version="20">
<description>Chip, 1.05 X 0.54 X 0.40 mm body
&lt;p&gt;Chip package with body size 1.05 X 0.54 X 0.40 mm&lt;/p&gt;</description>
<wire x1="0.55" y1="0.636" x2="-0.55" y2="0.636" width="0.127" layer="21"/>
<wire x1="0.55" y1="-0.636" x2="-0.55" y2="-0.636" width="0.127" layer="21"/>
<wire x1="0.55" y1="-0.3" x2="-0.55" y2="-0.3" width="0.12" layer="51"/>
<wire x1="-0.55" y1="-0.3" x2="-0.55" y2="0.3" width="0.12" layer="51"/>
<wire x1="-0.55" y1="0.3" x2="0.55" y2="0.3" width="0.12" layer="51"/>
<wire x1="0.55" y1="0.3" x2="0.55" y2="-0.3" width="0.12" layer="51"/>
<smd name="1" x="-0.5075" y="0" dx="0.5351" dy="0.644" layer="1"/>
<smd name="2" x="0.5075" y="0" dx="0.5351" dy="0.644" layer="1"/>
<text x="0" y="1.271" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.271" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESC1608X60" urn="urn:adsk.eagle:footprint:16378537/5" library_version="20">
<description>Chip, 1.60 X 0.82 X 0.60 mm body
&lt;p&gt;Chip package with body size 1.60 X 0.82 X 0.60 mm&lt;/p&gt;</description>
<wire x1="0.85" y1="0.8009" x2="-0.85" y2="0.8009" width="0.127" layer="21"/>
<wire x1="0.85" y1="-0.8009" x2="-0.85" y2="-0.8009" width="0.127" layer="21"/>
<wire x1="0.85" y1="-0.475" x2="-0.85" y2="-0.475" width="0.12" layer="51"/>
<wire x1="-0.85" y1="-0.475" x2="-0.85" y2="0.475" width="0.12" layer="51"/>
<wire x1="-0.85" y1="0.475" x2="0.85" y2="0.475" width="0.12" layer="51"/>
<wire x1="0.85" y1="0.475" x2="0.85" y2="-0.475" width="0.12" layer="51"/>
<smd name="1" x="-0.8152" y="0" dx="0.7987" dy="0.9739" layer="1"/>
<smd name="2" x="0.8152" y="0" dx="0.7987" dy="0.9739" layer="1"/>
<text x="0" y="1.4359" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.4359" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESC2012X65" urn="urn:adsk.eagle:footprint:16378532/5" library_version="20">
<description>Chip, 2.00 X 1.25 X 0.65 mm body
&lt;p&gt;Chip package with body size 2.00 X 1.25 X 0.65 mm&lt;/p&gt;</description>
<wire x1="1.075" y1="1.0241" x2="-1.075" y2="1.0241" width="0.127" layer="21"/>
<wire x1="1.075" y1="-1.0241" x2="-1.075" y2="-1.0241" width="0.127" layer="21"/>
<wire x1="1.075" y1="-0.7" x2="-1.075" y2="-0.7" width="0.12" layer="51"/>
<wire x1="-1.075" y1="-0.7" x2="-1.075" y2="0.7" width="0.12" layer="51"/>
<wire x1="-1.075" y1="0.7" x2="1.075" y2="0.7" width="0.12" layer="51"/>
<wire x1="1.075" y1="0.7" x2="1.075" y2="-0.7" width="0.12" layer="51"/>
<smd name="1" x="-0.9195" y="0" dx="1.0312" dy="1.4202" layer="1"/>
<smd name="2" x="0.9195" y="0" dx="1.0312" dy="1.4202" layer="1"/>
<text x="0" y="1.6591" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.6591" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESC3216X70" urn="urn:adsk.eagle:footprint:16378539/5" library_version="20">
<description>Chip, 3.20 X 1.60 X 0.70 mm body
&lt;p&gt;Chip package with body size 3.20 X 1.60 X 0.70 mm&lt;/p&gt;</description>
<wire x1="1.7" y1="1.2217" x2="-1.7" y2="1.2217" width="0.127" layer="21"/>
<wire x1="1.7" y1="-1.2217" x2="-1.7" y2="-1.2217" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.9" x2="-1.7" y2="-0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-0.9" x2="-1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="0.9" x2="1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="1.7" y1="0.9" x2="1.7" y2="-0.9" width="0.12" layer="51"/>
<smd name="1" x="-1.4754" y="0" dx="1.1646" dy="1.8153" layer="1"/>
<smd name="2" x="1.4754" y="0" dx="1.1646" dy="1.8153" layer="1"/>
<text x="0" y="1.8567" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.8567" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESC3224X71" urn="urn:adsk.eagle:footprint:16378536/5" library_version="20">
<description>Chip, 3.20 X 2.49 X 0.71 mm body
&lt;p&gt;Chip package with body size 3.20 X 2.49 X 0.71 mm&lt;/p&gt;</description>
<wire x1="1.675" y1="1.6441" x2="-1.675" y2="1.6441" width="0.127" layer="21"/>
<wire x1="1.675" y1="-1.6441" x2="-1.675" y2="-1.6441" width="0.127" layer="21"/>
<wire x1="1.675" y1="-1.32" x2="-1.675" y2="-1.32" width="0.12" layer="51"/>
<wire x1="-1.675" y1="-1.32" x2="-1.675" y2="1.32" width="0.12" layer="51"/>
<wire x1="-1.675" y1="1.32" x2="1.675" y2="1.32" width="0.12" layer="51"/>
<wire x1="1.675" y1="1.32" x2="1.675" y2="-1.32" width="0.12" layer="51"/>
<smd name="1" x="-1.4695" y="0" dx="1.1312" dy="2.6602" layer="1"/>
<smd name="2" x="1.4695" y="0" dx="1.1312" dy="2.6602" layer="1"/>
<text x="0" y="2.2791" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.2791" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESC5025X71" urn="urn:adsk.eagle:footprint:16378538/5" library_version="20">
<description>Chip, 5.00 X 2.50 X 0.71 mm body
&lt;p&gt;Chip package with body size 5.00 X 2.50 X 0.71 mm&lt;/p&gt;</description>
<wire x1="2.575" y1="1.6491" x2="-2.575" y2="1.6491" width="0.127" layer="21"/>
<wire x1="2.575" y1="-1.6491" x2="-2.575" y2="-1.6491" width="0.127" layer="21"/>
<wire x1="2.575" y1="-1.325" x2="-2.575" y2="-1.325" width="0.12" layer="51"/>
<wire x1="-2.575" y1="-1.325" x2="-2.575" y2="1.325" width="0.12" layer="51"/>
<wire x1="-2.575" y1="1.325" x2="2.575" y2="1.325" width="0.12" layer="51"/>
<wire x1="2.575" y1="1.325" x2="2.575" y2="-1.325" width="0.12" layer="51"/>
<smd name="1" x="-2.3195" y="0" dx="1.2312" dy="2.6702" layer="1"/>
<smd name="2" x="2.3195" y="0" dx="1.2312" dy="2.6702" layer="1"/>
<text x="0" y="2.2841" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.2841" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESC6332X71" urn="urn:adsk.eagle:footprint:16378533/5" library_version="20">
<description>Chip, 6.30 X 3.20 X 0.71 mm body
&lt;p&gt;Chip package with body size 6.30 X 3.20 X 0.71 mm&lt;/p&gt;</description>
<wire x1="3.225" y1="1.9991" x2="-3.225" y2="1.9991" width="0.127" layer="21"/>
<wire x1="3.225" y1="-1.9991" x2="-3.225" y2="-1.9991" width="0.127" layer="21"/>
<wire x1="3.225" y1="-1.675" x2="-3.225" y2="-1.675" width="0.12" layer="51"/>
<wire x1="-3.225" y1="-1.675" x2="-3.225" y2="1.675" width="0.12" layer="51"/>
<wire x1="-3.225" y1="1.675" x2="3.225" y2="1.675" width="0.12" layer="51"/>
<wire x1="3.225" y1="1.675" x2="3.225" y2="-1.675" width="0.12" layer="51"/>
<smd name="1" x="-2.9695" y="0" dx="1.2312" dy="3.3702" layer="1"/>
<smd name="2" x="2.9695" y="0" dx="1.2312" dy="3.3702" layer="1"/>
<text x="0" y="2.6341" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.6341" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESAD1176W63L850D250B" urn="urn:adsk.eagle:footprint:16378542/5" library_version="20">
<description>AXIAL Resistor, 11.76 mm pitch, 8.5 mm body length, 2.5 mm body diameter
&lt;p&gt;AXIAL Resistor package with 11.76 mm pitch, 0.63 mm lead diameter, 8.5 mm body length and 2.5 mm body diameter&lt;/p&gt;</description>
<wire x1="-4.25" y1="1.25" x2="-4.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-4.25" y1="-1.25" x2="4.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="4.25" y1="-1.25" x2="4.25" y2="1.25" width="0.127" layer="21"/>
<wire x1="4.25" y1="1.25" x2="-4.25" y2="1.25" width="0.127" layer="21"/>
<wire x1="-4.25" y1="0" x2="-4.911" y2="0" width="0.127" layer="21"/>
<wire x1="4.25" y1="0" x2="4.911" y2="0" width="0.127" layer="21"/>
<wire x1="4.25" y1="-1.25" x2="-4.25" y2="-1.25" width="0.12" layer="51"/>
<wire x1="-4.25" y1="-1.25" x2="-4.25" y2="1.25" width="0.12" layer="51"/>
<wire x1="-4.25" y1="1.25" x2="4.25" y2="1.25" width="0.12" layer="51"/>
<wire x1="4.25" y1="1.25" x2="4.25" y2="-1.25" width="0.12" layer="51"/>
<pad name="1" x="-5.88" y="0" drill="0.83" diameter="1.43"/>
<pad name="2" x="5.88" y="0" drill="0.83" diameter="1.43"/>
<text x="0" y="1.885" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.885" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESMELF3515" urn="urn:adsk.eagle:footprint:16378534/5" library_version="20">
<description>MELF, 3.50 mm length, 1.52 mm diameter
&lt;p&gt;MELF Resistor package with 3.50 mm length and 1.52 mm diameter&lt;/p&gt;</description>
<wire x1="1.105" y1="1.1825" x2="-1.105" y2="1.1825" width="0.127" layer="21"/>
<wire x1="-1.105" y1="-1.1825" x2="1.105" y2="-1.1825" width="0.127" layer="21"/>
<wire x1="1.85" y1="-0.8" x2="-1.85" y2="-0.8" width="0.12" layer="51"/>
<wire x1="-1.85" y1="-0.8" x2="-1.85" y2="0.8" width="0.12" layer="51"/>
<wire x1="-1.85" y1="0.8" x2="1.85" y2="0.8" width="0.12" layer="51"/>
<wire x1="1.85" y1="0.8" x2="1.85" y2="-0.8" width="0.12" layer="51"/>
<smd name="1" x="-1.6813" y="0" dx="1.1527" dy="1.7371" layer="1"/>
<smd name="2" x="1.6813" y="0" dx="1.1527" dy="1.7371" layer="1"/>
<text x="0" y="1.8175" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.8175" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESMELF2014" urn="urn:adsk.eagle:footprint:16378535/5" library_version="20">
<description>MELF, 2.00 mm length, 1.40 mm diameter
&lt;p&gt;MELF Resistor package with 2.00 mm length and 1.40 mm diameter&lt;/p&gt;</description>
<wire x1="0.5189" y1="1.114" x2="-0.5189" y2="1.114" width="0.127" layer="21"/>
<wire x1="-0.5189" y1="-1.114" x2="0.5189" y2="-1.114" width="0.127" layer="21"/>
<wire x1="1.05" y1="-0.725" x2="-1.05" y2="-0.725" width="0.12" layer="51"/>
<wire x1="-1.05" y1="-0.725" x2="-1.05" y2="0.725" width="0.12" layer="51"/>
<wire x1="-1.05" y1="0.725" x2="1.05" y2="0.725" width="0.12" layer="51"/>
<wire x1="1.05" y1="0.725" x2="1.05" y2="-0.725" width="0.12" layer="51"/>
<smd name="1" x="-0.9918" y="0" dx="0.9456" dy="1.6" layer="1"/>
<smd name="2" x="0.9918" y="0" dx="0.9456" dy="1.6" layer="1"/>
<text x="0" y="1.749" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.749" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESMELF5924" urn="urn:adsk.eagle:footprint:16378541/5" library_version="20">
<description>MELF, 5.90 mm length, 2.45 mm diameter
&lt;p&gt;MELF Resistor package with 5.90 mm length and 2.45 mm diameter&lt;/p&gt;</description>
<wire x1="2.1315" y1="1.639" x2="-2.1315" y2="1.639" width="0.127" layer="21"/>
<wire x1="-2.1315" y1="-1.639" x2="2.1315" y2="-1.639" width="0.127" layer="21"/>
<wire x1="3.05" y1="-1.25" x2="-3.05" y2="-1.25" width="0.12" layer="51"/>
<wire x1="-3.05" y1="-1.25" x2="-3.05" y2="1.25" width="0.12" layer="51"/>
<wire x1="-3.05" y1="1.25" x2="3.05" y2="1.25" width="0.12" layer="51"/>
<wire x1="3.05" y1="1.25" x2="3.05" y2="-1.25" width="0.12" layer="51"/>
<smd name="1" x="-2.7946" y="0" dx="1.3261" dy="2.65" layer="1"/>
<smd name="2" x="2.7946" y="0" dx="1.3261" dy="2.65" layer="1"/>
<text x="0" y="2.274" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.274" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESMELF3218" urn="urn:adsk.eagle:footprint:16378531/5" library_version="20">
<description>MELF, 3.20 mm length, 1.80 mm diameter
&lt;p&gt;MELF Resistor package with 3.20 mm length and 1.80 mm diameter&lt;/p&gt;</description>
<wire x1="0.8815" y1="1.314" x2="-0.8815" y2="1.314" width="0.127" layer="21"/>
<wire x1="-0.8815" y1="-1.314" x2="0.8815" y2="-1.314" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.925" x2="-1.7" y2="-0.925" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-0.925" x2="-1.7" y2="0.925" width="0.12" layer="51"/>
<wire x1="-1.7" y1="0.925" x2="1.7" y2="0.925" width="0.12" layer="51"/>
<wire x1="1.7" y1="0.925" x2="1.7" y2="-0.925" width="0.12" layer="51"/>
<smd name="1" x="-1.4946" y="0" dx="1.2261" dy="2" layer="1"/>
<smd name="2" x="1.4946" y="0" dx="1.2261" dy="2" layer="1"/>
<text x="0" y="1.949" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.949" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="RESAD724W46L381D178B" urn="urn:adsk.eagle:footprint:16378530/5" library_version="20">
<description>Axial Resistor, 7.24 mm pitch, 3.81 mm body length, 1.78 mm body diameter
&lt;p&gt;Axial Resistor package with 7.24 mm pitch (lead spacing), 0.46 mm lead diameter, 3.81 mm body length and 1.78 mm body diameter&lt;/p&gt;</description>
<wire x1="-2.16" y1="1.015" x2="-2.16" y2="-1.015" width="0.127" layer="21"/>
<wire x1="-2.16" y1="-1.015" x2="2.16" y2="-1.015" width="0.127" layer="21"/>
<wire x1="2.16" y1="-1.015" x2="2.16" y2="1.015" width="0.127" layer="21"/>
<wire x1="2.16" y1="1.015" x2="-2.16" y2="1.015" width="0.127" layer="21"/>
<wire x1="-2.16" y1="0" x2="-2.736" y2="0" width="0.127" layer="21"/>
<wire x1="2.16" y1="0" x2="2.736" y2="0" width="0.127" layer="21"/>
<wire x1="2.16" y1="-1.015" x2="-2.16" y2="-1.015" width="0.12" layer="51"/>
<wire x1="-2.16" y1="-1.015" x2="-2.16" y2="1.015" width="0.12" layer="51"/>
<wire x1="-2.16" y1="1.015" x2="2.16" y2="1.015" width="0.12" layer="51"/>
<wire x1="2.16" y1="1.015" x2="2.16" y2="-1.015" width="0.12" layer="51"/>
<pad name="1" x="-3.62" y="0" drill="0.66" diameter="1.26"/>
<pad name="2" x="3.62" y="0" drill="0.66" diameter="1.26"/>
<text x="0" y="1.65" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.65" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="RESC1005X40" urn="urn:adsk.eagle:package:16378568/5" type="model">
<description>Chip, 1.05 X 0.54 X 0.40 mm body
&lt;p&gt;Chip package with body size 1.05 X 0.54 X 0.40 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESC1005X40"/>
</packageinstances>
</package3d>
<package3d name="RESC1608X60" urn="urn:adsk.eagle:package:16378565/5" type="model">
<description>Chip, 1.60 X 0.82 X 0.60 mm body
&lt;p&gt;Chip package with body size 1.60 X 0.82 X 0.60 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESC1608X60"/>
</packageinstances>
</package3d>
<package3d name="RESC2012X65" urn="urn:adsk.eagle:package:16378559/5" type="model">
<description>Chip, 2.00 X 1.25 X 0.65 mm body
&lt;p&gt;Chip package with body size 2.00 X 1.25 X 0.65 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESC2012X65"/>
</packageinstances>
</package3d>
<package3d name="RESC3216X70" urn="urn:adsk.eagle:package:16378566/5" type="model">
<description>Chip, 3.20 X 1.60 X 0.70 mm body
&lt;p&gt;Chip package with body size 3.20 X 1.60 X 0.70 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESC3216X70"/>
</packageinstances>
</package3d>
<package3d name="RESC3224X71" urn="urn:adsk.eagle:package:16378563/7" type="model">
<description>Chip, 3.20 X 2.49 X 0.71 mm body
&lt;p&gt;Chip package with body size 3.20 X 2.49 X 0.71 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESC3224X71"/>
</packageinstances>
</package3d>
<package3d name="RESC5025X71" urn="urn:adsk.eagle:package:16378564/5" type="model">
<description>Chip, 5.00 X 2.50 X 0.71 mm body
&lt;p&gt;Chip package with body size 5.00 X 2.50 X 0.71 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESC5025X71"/>
</packageinstances>
</package3d>
<package3d name="RESC6332X71L" urn="urn:adsk.eagle:package:16378557/6" type="model">
<description>Chip, 6.30 X 3.20 X 0.71 mm body
&lt;p&gt;Chip package with body size 6.30 X 3.20 X 0.71 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESC6332X71"/>
</packageinstances>
</package3d>
<package3d name="RESAD1176W63L850D250B" urn="urn:adsk.eagle:package:16378560/5" type="model">
<description>AXIAL Resistor, 11.76 mm pitch, 8.5 mm body length, 2.5 mm body diameter
&lt;p&gt;AXIAL Resistor package with 11.76 mm pitch, 0.63 mm lead diameter, 8.5 mm body length and 2.5 mm body diameter&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESAD1176W63L850D250B"/>
</packageinstances>
</package3d>
<package3d name="RESMELF3515" urn="urn:adsk.eagle:package:16378562/5" type="model">
<description>MELF, 3.50 mm length, 1.52 mm diameter
&lt;p&gt;MELF Resistor package with 3.50 mm length and 1.52 mm diameter&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESMELF3515"/>
</packageinstances>
</package3d>
<package3d name="RESMELF2014" urn="urn:adsk.eagle:package:16378558/5" type="model">
<description>MELF, 2.00 mm length, 1.40 mm diameter
&lt;p&gt;MELF Resistor package with 2.00 mm length and 1.40 mm diameter&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESMELF2014"/>
</packageinstances>
</package3d>
<package3d name="RESMELF5924" urn="urn:adsk.eagle:package:16378567/6" type="model">
<description>MELF, 5.90 mm length, 2.45 mm diameter
&lt;p&gt;MELF Resistor package with 5.90 mm length and 2.45 mm diameter&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESMELF5924"/>
</packageinstances>
</package3d>
<package3d name="RESMELF3218" urn="urn:adsk.eagle:package:16378556/5" type="model">
<description>MELF, 3.20 mm length, 1.80 mm diameter
&lt;p&gt;MELF Resistor package with 3.20 mm length and 1.80 mm diameter&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESMELF3218"/>
</packageinstances>
</package3d>
<package3d name="RESAD724W46L381D178B" urn="urn:adsk.eagle:package:16378561/5" type="model">
<description>Axial Resistor, 7.24 mm pitch, 3.81 mm body length, 1.78 mm body diameter
&lt;p&gt;Axial Resistor package with 7.24 mm pitch (lead spacing), 0.46 mm lead diameter, 3.81 mm body length and 1.78 mm body diameter&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="RESAD724W46L381D178B"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="R" urn="urn:adsk.eagle:symbol:16378529/3" library_version="20">
<description>RESISTOR</description>
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<text x="0" y="2.54" size="1.778" layer="95" align="center">&gt;NAME</text>
<text x="0" y="-5.08" size="1.778" layer="95" align="center">&gt;SPICEMODEL</text>
<text x="0" y="-2.54" size="1.778" layer="96" align="center">&gt;VALUE</text>
<text x="0" y="-7.62" size="1.778" layer="95" align="center">&gt;SPICEEXTRA</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="R" urn="urn:adsk.eagle:component:16378570/11" prefix="R" uservalue="yes" library_version="20">
<description>&lt;b&gt;Resistor Fixed - Generic</description>
<gates>
<gate name="G$1" symbol="R" x="0" y="0"/>
</gates>
<devices>
<device name="CHIP-0402(1005-METRIC)" package="RESC1005X40">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378568/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0603(1608-METRIC)" package="RESC1608X60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378565/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0805(2012-METRIC)" package="RESC2012X65">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378559/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1206(3216-METRIC)" package="RESC3216X70">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378566/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1210(3225-METRIC)" package="RESC3224X71">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378563/7"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-2010(5025-METRIC)" package="RESC5025X71">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378564/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-2512(6332-METRIC)" package="RESC6332X71">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378557/6"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="AXIAL-11.7MM-PITCH" package="RESAD1176W63L850D250B">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378560/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="MELF(3515-METRIC)" package="RESMELF3515">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378562/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="MELF(2014-METRIC)" package="RESMELF2014">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378558/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="MELF(5924-METRIC)" package="RESMELF5924">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378567/6"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="MELF(3218-METRIC)" package="RESMELF3218">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378556/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="AXIAL-7.2MM-PITCH" package="RESAD724W46L381D178B">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16378561/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Resistor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="RATING" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="Fixed" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TOLERANCE" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Power_Symbols" urn="urn:adsk.eagle:library:16502351">
<description>&lt;B&gt;Supply &amp; Ground symbols</description>
<packages>
</packages>
<symbols>
<symbol name="GND-BAR" urn="urn:adsk.eagle:symbol:16502372/2" library_version="21">
<description>Ground (GND) Bar</description>
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="0" y="-1.905" size="1.778" layer="96" align="center">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND-BAR" urn="urn:adsk.eagle:component:16502419/5" prefix="SUPPLY" uservalue="yes" library_version="21">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt; - Ground (GND) Bar</description>
<gates>
<gate name="G$1" symbol="GND-BAR" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="CATEGORY" value="Supply" constant="no"/>
<attribute name="VALUE" value="GND" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="holes" urn="urn:adsk.eagle:library:237">
<description>&lt;b&gt;Mounting Holes and Pads&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2,8-PAD" urn="urn:adsk.eagle:footprint:14250/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 2.8 mm, round</description>
<wire x1="0" y1="2.921" x2="0" y2="2.667" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.667" x2="0" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="-1.778" y1="0" x2="0" y2="-1.778" width="2.286" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="1.778" x2="1.778" y2="0" width="2.286" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.635" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.175" width="0.8128" layer="39"/>
<circle x="0" y="0" radius="3.175" width="0.8128" layer="40"/>
<circle x="0" y="0" radius="3.175" width="0.8128" layer="43"/>
<circle x="0" y="0" radius="1.5" width="0.2032" layer="21"/>
<pad name="B2,8" x="0" y="0" drill="2.8" diameter="5.334"/>
</package>
<package name="3,0-PAD" urn="urn:adsk.eagle:footprint:14251/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.0 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="39"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.6" width="0.2032" layer="21"/>
<pad name="B3,0" x="0" y="0" drill="3" diameter="5.842"/>
<text x="-1.27" y="-3.81" size="1.27" layer="48">3,0</text>
</package>
<package name="3,2-PAD" urn="urn:adsk.eagle:footprint:14252/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.2 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="39"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.7" width="0.1524" layer="21"/>
<pad name="B3,2" x="0" y="0" drill="3.2" diameter="5.842"/>
<text x="-1.27" y="-3.81" size="1.27" layer="48">3,2</text>
</package>
<package name="3,3-PAD" urn="urn:adsk.eagle:footprint:14253/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.3 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="39"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.7" width="0.2032" layer="21"/>
<pad name="B3,3" x="0" y="0" drill="3.3" diameter="5.842"/>
</package>
<package name="3,6-PAD" urn="urn:adsk.eagle:footprint:14254/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.6 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.683" width="1.397" layer="39"/>
<circle x="0" y="0" radius="3.683" width="1.397" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.9" width="0.2032" layer="21"/>
<pad name="B3,6" x="0" y="0" drill="3.6" diameter="5.842"/>
</package>
<package name="4,1-PAD" urn="urn:adsk.eagle:footprint:14255/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 4.1 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.572" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="5.08" width="2" layer="43"/>
<circle x="0" y="0" radius="2.15" width="0.2032" layer="21"/>
<pad name="B4,1" x="0" y="0" drill="4.1" diameter="8"/>
</package>
<package name="4,3-PAD" urn="urn:adsk.eagle:footprint:14256/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 4.3 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.25" width="0.1524" layer="21"/>
<pad name="B4,3" x="0" y="0" drill="4.3" diameter="9"/>
</package>
<package name="4,5-PAD" urn="urn:adsk.eagle:footprint:14257/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 4.5 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.35" width="0.1524" layer="21"/>
<pad name="B4,5" x="0" y="0" drill="4.5" diameter="9"/>
</package>
<package name="5,0-PAD" urn="urn:adsk.eagle:footprint:14258/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 5.0 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.6" width="0.1524" layer="21"/>
<pad name="B5" x="0" y="0" drill="5" diameter="9"/>
</package>
<package name="5,5-PAD" urn="urn:adsk.eagle:footprint:14259/1" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 5.5 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.85" width="0.1524" layer="21"/>
<pad name="B5,5" x="0" y="0" drill="5.5" diameter="9"/>
</package>
</packages>
<packages3d>
<package3d name="2,8-PAD" urn="urn:adsk.eagle:package:14281/1" type="box">
<description>MOUNTING PAD 2.8 mm, round</description>
<packageinstances>
<packageinstance name="2,8-PAD"/>
</packageinstances>
</package3d>
<package3d name="3,0-PAD" urn="urn:adsk.eagle:package:14280/1" type="box">
<description>MOUNTING PAD 3.0 mm, round</description>
<packageinstances>
<packageinstance name="3,0-PAD"/>
</packageinstances>
</package3d>
<package3d name="3,2-PAD" urn="urn:adsk.eagle:package:14282/1" type="box">
<description>MOUNTING PAD 3.2 mm, round</description>
<packageinstances>
<packageinstance name="3,2-PAD"/>
</packageinstances>
</package3d>
<package3d name="3,3-PAD" urn="urn:adsk.eagle:package:14283/1" type="box">
<description>MOUNTING PAD 3.3 mm, round</description>
<packageinstances>
<packageinstance name="3,3-PAD"/>
</packageinstances>
</package3d>
<package3d name="3,6-PAD" urn="urn:adsk.eagle:package:14284/1" type="box">
<description>MOUNTING PAD 3.6 mm, round</description>
<packageinstances>
<packageinstance name="3,6-PAD"/>
</packageinstances>
</package3d>
<package3d name="4,1-PAD" urn="urn:adsk.eagle:package:14285/1" type="box">
<description>MOUNTING PAD 4.1 mm, round</description>
<packageinstances>
<packageinstance name="4,1-PAD"/>
</packageinstances>
</package3d>
<package3d name="4,3-PAD" urn="urn:adsk.eagle:package:14286/1" type="box">
<description>MOUNTING PAD 4.3 mm, round</description>
<packageinstances>
<packageinstance name="4,3-PAD"/>
</packageinstances>
</package3d>
<package3d name="4,5-PAD" urn="urn:adsk.eagle:package:14287/1" type="box">
<description>MOUNTING PAD 4.5 mm, round</description>
<packageinstances>
<packageinstance name="4,5-PAD"/>
</packageinstances>
</package3d>
<package3d name="5,0-PAD" urn="urn:adsk.eagle:package:14288/1" type="box">
<description>MOUNTING PAD 5.0 mm, round</description>
<packageinstances>
<packageinstance name="5,0-PAD"/>
</packageinstances>
</package3d>
<package3d name="5,5-PAD" urn="urn:adsk.eagle:package:14291/1" type="box">
<description>MOUNTING PAD 5.5 mm, round</description>
<packageinstances>
<packageinstance name="5,5-PAD"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="MOUNT-PAD" urn="urn:adsk.eagle:symbol:14249/1" library_version="2">
<wire x1="0.254" y1="2.032" x2="2.032" y2="0.254" width="1.016" layer="94" curve="-75.749967" cap="flat"/>
<wire x1="-2.032" y1="0.254" x2="-0.254" y2="2.032" width="1.016" layer="94" curve="-75.749967" cap="flat"/>
<wire x1="-2.032" y1="-0.254" x2="-0.254" y2="-2.032" width="1.016" layer="94" curve="75.749967" cap="flat"/>
<wire x1="0.254" y1="-2.032" x2="2.032" y2="-0.254" width="1.016" layer="94" curve="75.749967" cap="flat"/>
<circle x="0" y="0" radius="1.524" width="0.0508" layer="94"/>
<text x="2.794" y="0.5842" size="1.778" layer="95">&gt;NAME</text>
<text x="2.794" y="-2.4638" size="1.778" layer="96">&gt;VALUE</text>
<pin name="MOUNT" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOUNT-PAD-ROUND" urn="urn:adsk.eagle:component:14303/2" prefix="H" library_version="2">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt;, round</description>
<gates>
<gate name="G$1" symbol="MOUNT-PAD" x="0" y="0"/>
</gates>
<devices>
<device name="2.8" package="2,8-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B2,8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14281/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="6" constant="no"/>
</technology>
</technologies>
</device>
<device name="3.0" package="3,0-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,0"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14280/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="17" constant="no"/>
</technology>
</technologies>
</device>
<device name="3.2" package="3,2-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14282/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="4" constant="no"/>
</technology>
</technologies>
</device>
<device name="3.3" package="3,3-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14283/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="3.6" package="3,6-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14284/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="4.1" package="4,1-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B4,1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14285/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="4.3" package="4,3-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B4,3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14286/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="4.5" package="4,5-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B4,5"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14287/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="5.0" package="5,0-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B5"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14288/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="5.5" package="5,5-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B5,5"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14291/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Tinkercad" urn="urn:adsk.eagle:library:30890021">
<packages>
<package name="1X03" urn="urn:adsk.eagle:footprint:22340/1" library_version="100">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.8862" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="CAPC1005X60" urn="urn:adsk.eagle:footprint:16290849/5" library_version="100">
<description>Chip, 1.00 X 0.50 X 0.60 mm body
&lt;p&gt;Chip package with body size 1.00 X 0.50 X 0.60 mm&lt;/p&gt;</description>
<wire x1="0.55" y1="0.6286" x2="-0.55" y2="0.6286" width="0.127" layer="21"/>
<wire x1="0.55" y1="-0.6286" x2="-0.55" y2="-0.6286" width="0.127" layer="21"/>
<wire x1="0.55" y1="-0.3" x2="-0.55" y2="-0.3" width="0.12" layer="51"/>
<wire x1="-0.55" y1="-0.3" x2="-0.55" y2="0.3" width="0.12" layer="51"/>
<wire x1="-0.55" y1="0.3" x2="0.55" y2="0.3" width="0.12" layer="51"/>
<wire x1="0.55" y1="0.3" x2="0.55" y2="-0.3" width="0.12" layer="51"/>
<smd name="1" x="-0.4846" y="0" dx="0.56" dy="0.6291" layer="1"/>
<smd name="2" x="0.4846" y="0" dx="0.56" dy="0.6291" layer="1"/>
<text x="0" y="1.2636" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.2636" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC1110X102" urn="urn:adsk.eagle:footprint:16290845/5" library_version="100">
<description>Chip, 1.17 X 1.02 X 1.02 mm body
&lt;p&gt;Chip package with body size 1.17 X 1.02 X 1.02 mm&lt;/p&gt;</description>
<wire x1="0.66" y1="0.9552" x2="-0.66" y2="0.9552" width="0.127" layer="21"/>
<wire x1="0.66" y1="-0.9552" x2="-0.66" y2="-0.9552" width="0.127" layer="21"/>
<wire x1="0.66" y1="-0.635" x2="-0.66" y2="-0.635" width="0.12" layer="51"/>
<wire x1="-0.66" y1="-0.635" x2="-0.66" y2="0.635" width="0.12" layer="51"/>
<wire x1="-0.66" y1="0.635" x2="0.66" y2="0.635" width="0.12" layer="51"/>
<wire x1="0.66" y1="0.635" x2="0.66" y2="-0.635" width="0.12" layer="51"/>
<smd name="1" x="-0.5388" y="0" dx="0.6626" dy="1.2823" layer="1"/>
<smd name="2" x="0.5388" y="0" dx="0.6626" dy="1.2823" layer="1"/>
<text x="0" y="1.5902" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.5902" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC1608X85" urn="urn:adsk.eagle:footprint:16290847/5" library_version="100">
<description>Chip, 1.60 X 0.80 X 0.85 mm body
&lt;p&gt;Chip package with body size 1.60 X 0.80 X 0.85 mm&lt;/p&gt;</description>
<wire x1="0.875" y1="0.7991" x2="-0.875" y2="0.7991" width="0.127" layer="21"/>
<wire x1="0.875" y1="-0.7991" x2="-0.875" y2="-0.7991" width="0.127" layer="21"/>
<wire x1="0.875" y1="-0.475" x2="-0.875" y2="-0.475" width="0.12" layer="51"/>
<wire x1="-0.875" y1="-0.475" x2="-0.875" y2="0.475" width="0.12" layer="51"/>
<wire x1="-0.875" y1="0.475" x2="0.875" y2="0.475" width="0.12" layer="51"/>
<wire x1="0.875" y1="0.475" x2="0.875" y2="-0.475" width="0.12" layer="51"/>
<smd name="1" x="-0.7746" y="0" dx="0.9209" dy="0.9702" layer="1"/>
<smd name="2" x="0.7746" y="0" dx="0.9209" dy="0.9702" layer="1"/>
<text x="0" y="1.4341" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.4341" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC2012X110" urn="urn:adsk.eagle:footprint:16290848/5" library_version="100">
<description>Chip, 2.00 X 1.25 X 1.10 mm body
&lt;p&gt;Chip package with body size 2.00 X 1.25 X 1.10 mm&lt;/p&gt;</description>
<wire x1="1.1" y1="1.0467" x2="-1.1" y2="1.0467" width="0.127" layer="21"/>
<wire x1="1.1" y1="-1.0467" x2="-1.1" y2="-1.0467" width="0.127" layer="21"/>
<wire x1="1.1" y1="-0.725" x2="-1.1" y2="-0.725" width="0.12" layer="51"/>
<wire x1="-1.1" y1="-0.725" x2="-1.1" y2="0.725" width="0.12" layer="51"/>
<wire x1="-1.1" y1="0.725" x2="1.1" y2="0.725" width="0.12" layer="51"/>
<wire x1="1.1" y1="0.725" x2="1.1" y2="-0.725" width="0.12" layer="51"/>
<smd name="1" x="-0.8754" y="0" dx="1.1646" dy="1.4653" layer="1"/>
<smd name="2" x="0.8754" y="0" dx="1.1646" dy="1.4653" layer="1"/>
<text x="0" y="1.6817" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.6817" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC3216X135" urn="urn:adsk.eagle:footprint:16290836/5" library_version="100">
<description>Chip, 3.20 X 1.60 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 1.60 X 1.35 mm&lt;/p&gt;</description>
<wire x1="1.7" y1="1.2217" x2="-1.7" y2="1.2217" width="0.127" layer="21"/>
<wire x1="1.7" y1="-1.2217" x2="-1.7" y2="-1.2217" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.9" x2="-1.7" y2="-0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-0.9" x2="-1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="0.9" x2="1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="1.7" y1="0.9" x2="1.7" y2="-0.9" width="0.12" layer="51"/>
<smd name="1" x="-1.4754" y="0" dx="1.1646" dy="1.8153" layer="1"/>
<smd name="2" x="1.4754" y="0" dx="1.1646" dy="1.8153" layer="1"/>
<text x="0" y="1.8567" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.8567" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC3225X135" urn="urn:adsk.eagle:footprint:16290843/5" library_version="100">
<description>Chip, 3.20 X 2.50 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 2.50 X 1.35 mm&lt;/p&gt;</description>
<wire x1="1.7" y1="1.6717" x2="-1.7" y2="1.6717" width="0.127" layer="21"/>
<wire x1="1.7" y1="-1.6717" x2="-1.7" y2="-1.6717" width="0.12" layer="21"/>
<wire x1="1.7" y1="-1.35" x2="-1.7" y2="-1.35" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-1.35" x2="-1.7" y2="1.35" width="0.12" layer="51"/>
<wire x1="-1.7" y1="1.35" x2="1.7" y2="1.35" width="0.12" layer="51"/>
<wire x1="1.7" y1="1.35" x2="1.7" y2="-1.35" width="0.12" layer="51"/>
<smd name="1" x="-1.4754" y="0" dx="1.1646" dy="2.7153" layer="1"/>
<smd name="2" x="1.4754" y="0" dx="1.1646" dy="2.7153" layer="1"/>
<text x="0" y="2.3067" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.3067" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC4532X135" urn="urn:adsk.eagle:footprint:16290841/5" library_version="100">
<description>Chip, 4.50 X 3.20 X 1.35 mm body
&lt;p&gt;Chip package with body size 4.50 X 3.20 X 1.35 mm&lt;/p&gt;</description>
<wire x1="2.4" y1="2.0217" x2="-2.4" y2="2.0217" width="0.127" layer="21"/>
<wire x1="2.4" y1="-2.0217" x2="-2.4" y2="-2.0217" width="0.127" layer="21"/>
<wire x1="2.4" y1="-1.7" x2="-2.4" y2="-1.7" width="0.12" layer="51"/>
<wire x1="-2.4" y1="-1.7" x2="-2.4" y2="1.7" width="0.12" layer="51"/>
<wire x1="-2.4" y1="1.7" x2="2.4" y2="1.7" width="0.12" layer="51"/>
<wire x1="2.4" y1="1.7" x2="2.4" y2="-1.7" width="0.12" layer="51"/>
<smd name="1" x="-2.0565" y="0" dx="1.3973" dy="3.4153" layer="1"/>
<smd name="2" x="2.0565" y="0" dx="1.3973" dy="3.4153" layer="1"/>
<text x="0" y="2.6567" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.6567" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM3216X180" urn="urn:adsk.eagle:footprint:16290835/5" library_version="100">
<description>Molded Body, 3.20 X 1.60 X 1.80 mm body
&lt;p&gt;Molded Body package with body size 3.20 X 1.60 X 1.80 mm&lt;/p&gt;</description>
<wire x1="-1.7" y1="0.9084" x2="1.7" y2="0.9084" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-0.9084" x2="1.7" y2="-0.9084" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.9" x2="-1.7" y2="-0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-0.9" x2="-1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="0.9" x2="1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="1.7" y1="0.9" x2="1.7" y2="-0.9" width="0.12" layer="51"/>
<smd name="1" x="-1.3099" y="0" dx="1.7955" dy="1.1887" layer="1"/>
<smd name="2" x="1.3099" y="0" dx="1.7955" dy="1.1887" layer="1"/>
<text x="0" y="1.5434" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.5434" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM3528X210" urn="urn:adsk.eagle:footprint:16290844/5" library_version="100">
<description>Molded Body, 3.50 X 2.80 X 2.10 mm body
&lt;p&gt;Molded Body package with body size 3.50 X 2.80 X 2.10 mm&lt;/p&gt;</description>
<wire x1="-1.85" y1="1.5" x2="1.85" y2="1.5" width="0.127" layer="21"/>
<wire x1="-1.85" y1="-1.5" x2="1.85" y2="-1.5" width="0.127" layer="21"/>
<wire x1="1.85" y1="-1.5" x2="-1.85" y2="-1.5" width="0.12" layer="51"/>
<wire x1="-1.85" y1="-1.5" x2="-1.85" y2="1.5" width="0.12" layer="51"/>
<wire x1="-1.85" y1="1.5" x2="1.85" y2="1.5" width="0.12" layer="51"/>
<wire x1="1.85" y1="1.5" x2="1.85" y2="-1.5" width="0.12" layer="51"/>
<smd name="1" x="-1.4599" y="0" dx="1.7955" dy="2.2036" layer="1"/>
<smd name="2" x="1.4599" y="0" dx="1.7955" dy="2.2036" layer="1"/>
<text x="0" y="2.135" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.135" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM6032X280" urn="urn:adsk.eagle:footprint:16290839/5" library_version="100">
<description>Molded Body, 6.00 X 3.20 X 2.80 mm body
&lt;p&gt;Molded Body package with body size 6.00 X 3.20 X 2.80 mm&lt;/p&gt;</description>
<wire x1="-3.15" y1="1.75" x2="3.15" y2="1.75" width="0.127" layer="21"/>
<wire x1="-3.15" y1="-1.75" x2="3.15" y2="-1.75" width="0.127" layer="21"/>
<wire x1="3.15" y1="-1.75" x2="-3.15" y2="-1.75" width="0.12" layer="51"/>
<wire x1="-3.15" y1="-1.75" x2="-3.15" y2="1.75" width="0.12" layer="51"/>
<wire x1="-3.15" y1="1.75" x2="3.15" y2="1.75" width="0.12" layer="51"/>
<wire x1="3.15" y1="1.75" x2="3.15" y2="-1.75" width="0.12" layer="51"/>
<smd name="1" x="-2.4712" y="0" dx="2.368" dy="2.2036" layer="1"/>
<smd name="2" x="2.4712" y="0" dx="2.368" dy="2.2036" layer="1"/>
<text x="0" y="2.385" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.385" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM7343X310" urn="urn:adsk.eagle:footprint:16290840/5" library_version="100">
<description>Molded Body, 7.30 X 4.30 X 3.10 mm body
&lt;p&gt;Molded Body package with body size 7.30 X 4.30 X 3.10 mm&lt;/p&gt;</description>
<wire x1="-3.8" y1="2.3" x2="3.8" y2="2.3" width="0.127" layer="21"/>
<wire x1="-3.8" y1="-2.3" x2="3.8" y2="-2.3" width="0.127" layer="21"/>
<wire x1="3.8" y1="-2.3" x2="-3.8" y2="-2.3" width="0.12" layer="51"/>
<wire x1="-3.8" y1="-2.3" x2="-3.8" y2="2.3" width="0.12" layer="51"/>
<wire x1="-3.8" y1="2.3" x2="3.8" y2="2.3" width="0.12" layer="51"/>
<wire x1="3.8" y1="2.3" x2="3.8" y2="-2.3" width="0.12" layer="51"/>
<smd name="1" x="-3.1212" y="0" dx="2.368" dy="2.4036" layer="1"/>
<smd name="2" x="3.1212" y="0" dx="2.368" dy="2.4036" layer="1"/>
<text x="0" y="2.935" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.935" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC4564X110" urn="urn:adsk.eagle:footprint:16290837/5" library_version="100">
<description>Chip, 4.50 X 6.40 X 1.10 mm body
&lt;p&gt;Chip package with body size 4.50 X 6.40 X 1.10 mm&lt;/p&gt;</description>
<wire x1="2.4" y1="3.7179" x2="-2.4" y2="3.7179" width="0.127" layer="21"/>
<wire x1="2.4" y1="-3.7179" x2="-2.4" y2="-3.7179" width="0.127" layer="21"/>
<wire x1="2.4" y1="-3.4" x2="-2.4" y2="-3.4" width="0.12" layer="51"/>
<wire x1="-2.4" y1="-3.4" x2="-2.4" y2="3.4" width="0.12" layer="51"/>
<wire x1="-2.4" y1="3.4" x2="2.4" y2="3.4" width="0.12" layer="51"/>
<wire x1="2.4" y1="3.4" x2="2.4" y2="-3.4" width="0.12" layer="51"/>
<smd name="1" x="-2.0565" y="0" dx="1.3973" dy="6.8078" layer="1"/>
<smd name="2" x="2.0565" y="0" dx="1.3973" dy="6.8078" layer="1"/>
<text x="0" y="4.3529" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-4.3529" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPRD550W60D1025H1250B" urn="urn:adsk.eagle:footprint:16290829/5" library_version="100">
<description>Radial Non-Polarized Capacitor, 5.50 mm pitch, 10.25 mm body diameter, 12.50 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 5.50 mm pitch (lead spacing), 0.60 mm lead diameter, 10.25 mm body diameter and 12.50 mm body height&lt;/p&gt;</description>
<circle x="0" y="0" radius="5.25" width="0.127" layer="21"/>
<circle x="0" y="0" radius="5.25" width="0.12" layer="51"/>
<pad name="1" x="-2.75" y="0" drill="0.8" diameter="1.4"/>
<pad name="2" x="2.75" y="0" drill="0.8" diameter="1.4"/>
<text x="0" y="5.885" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-5.885" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPRD2261W240D5080H5555B" urn="urn:adsk.eagle:footprint:16290850/5" library_version="100">
<description>Radial Non-Polarized Capacitor, 22.61 mm pitch, 50.80 mm body diameter, 55.55 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 22.61 mm pitch (lead spacing), 2.40 mm lead diameter, 50.80 mm body diameter and 55.55 mm body height&lt;/p&gt;</description>
<circle x="0" y="0" radius="25.79" width="0.127" layer="21"/>
<circle x="0" y="0" radius="25.79" width="0.12" layer="51"/>
<pad name="1" x="-11.305" y="0" drill="2.6" diameter="3.9"/>
<pad name="2" x="11.305" y="0" drill="2.6" diameter="3.9"/>
<text x="0" y="26.425" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-26.425" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAP-THRU-2.54MM" urn="urn:adsk.eagle:footprint:32248318/2" library_version="100">
<pad name="1" x="-1.27" y="0" drill="1.016" diameter="1.8796"/>
<pad name="2" x="1.27" y="0" drill="1.016" diameter="1.8796"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.1524" layer="21" curve="-180"/>
<wire x1="2.54" y1="-1.27" x2="-2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21" curve="-180"/>
<text x="0" y="1.524" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.524" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="1X03" urn="urn:adsk.eagle:package:22458/2" type="model">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03"/>
</packageinstances>
</package3d>
<package3d name="CAPC1005X60" urn="urn:adsk.eagle:package:16290895/5" type="model">
<description>Chip, 1.00 X 0.50 X 0.60 mm body
&lt;p&gt;Chip package with body size 1.00 X 0.50 X 0.60 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC1005X60"/>
</packageinstances>
</package3d>
<package3d name="CAPC1110X102" urn="urn:adsk.eagle:package:16290904/5" type="model">
<description>Chip, 1.17 X 1.02 X 1.02 mm body
&lt;p&gt;Chip package with body size 1.17 X 1.02 X 1.02 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC1110X102"/>
</packageinstances>
</package3d>
<package3d name="CAPC1608X85" urn="urn:adsk.eagle:package:16290898/5" type="model">
<description>Chip, 1.60 X 0.80 X 0.85 mm body
&lt;p&gt;Chip package with body size 1.60 X 0.80 X 0.85 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC1608X85"/>
</packageinstances>
</package3d>
<package3d name="CAPC2012X110" urn="urn:adsk.eagle:package:16290897/5" type="model">
<description>Chip, 2.00 X 1.25 X 1.10 mm body
&lt;p&gt;Chip package with body size 2.00 X 1.25 X 1.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC2012X110"/>
</packageinstances>
</package3d>
<package3d name="CAPC3216X135" urn="urn:adsk.eagle:package:16290893/5" type="model">
<description>Chip, 3.20 X 1.60 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 1.60 X 1.35 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC3216X135"/>
</packageinstances>
</package3d>
<package3d name="CAPC3225X135" urn="urn:adsk.eagle:package:16290903/5" type="model">
<description>Chip, 3.20 X 2.50 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 2.50 X 1.35 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC3225X135"/>
</packageinstances>
</package3d>
<package3d name="CAPC4532X135" urn="urn:adsk.eagle:package:16290900/5" type="model">
<description>Chip, 4.50 X 3.20 X 1.35 mm body
&lt;p&gt;Chip package with body size 4.50 X 3.20 X 1.35 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC4532X135"/>
</packageinstances>
</package3d>
<package3d name="CAPM3216X180" urn="urn:adsk.eagle:package:16290894/5" type="model">
<description>Molded Body, 3.20 X 1.60 X 1.80 mm body
&lt;p&gt;Molded Body package with body size 3.20 X 1.60 X 1.80 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM3216X180"/>
</packageinstances>
</package3d>
<package3d name="CAPM3528X210" urn="urn:adsk.eagle:package:16290902/5" type="model">
<description>Molded Body, 3.50 X 2.80 X 2.10 mm body
&lt;p&gt;Molded Body package with body size 3.50 X 2.80 X 2.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM3528X210"/>
</packageinstances>
</package3d>
<package3d name="CAPM6032X280" urn="urn:adsk.eagle:package:16290896/5" type="model">
<description>Molded Body, 6.00 X 3.20 X 2.80 mm body
&lt;p&gt;Molded Body package with body size 6.00 X 3.20 X 2.80 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM6032X280"/>
</packageinstances>
</package3d>
<package3d name="CAPM7343X310" urn="urn:adsk.eagle:package:16290891/5" type="model">
<description>Molded Body, 7.30 X 4.30 X 3.10 mm body
&lt;p&gt;Molded Body package with body size 7.30 X 4.30 X 3.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM7343X310"/>
</packageinstances>
</package3d>
<package3d name="CAPC4564X110L" urn="urn:adsk.eagle:package:16290887/6" type="model">
<description>Chip, 4.50 X 6.40 X 1.10 mm body
&lt;p&gt;Chip package with body size 4.50 X 6.40 X 1.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC4564X110"/>
</packageinstances>
</package3d>
<package3d name="CAPRD550W60D1025H1250B" urn="urn:adsk.eagle:package:16290858/5" type="model">
<description>Radial Non-Polarized Capacitor, 5.50 mm pitch, 10.25 mm body diameter, 12.50 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 5.50 mm pitch (lead spacing), 0.60 mm lead diameter, 10.25 mm body diameter and 12.50 mm body height&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPRD550W60D1025H1250B"/>
</packageinstances>
</package3d>
<package3d name="CAPRD2261W240D5080H5555B" urn="urn:adsk.eagle:package:16290864/5" type="model">
<description>Radial Non-Polarized Capacitor, 22.61 mm pitch, 50.80 mm body diameter, 55.55 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 22.61 mm pitch (lead spacing), 2.40 mm lead diameter, 50.80 mm body diameter and 55.55 mm body height&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPRD2261W240D5080H5555B"/>
</packageinstances>
</package3d>
<package3d name="CAP-THRU-2.54MM" urn="urn:adsk.eagle:package:32248319/2" type="model">
<packageinstances>
<packageinstance name="CAP-THRU-2.54MM"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD-1X03" urn="urn:adsk.eagle:symbol:31968519/1" library_version="100">
<pin name="1" x="-2.54" y="2.54" visible="pin" length="short"/>
<pin name="2" x="-2.54" y="0" visible="pin" length="short"/>
<pin name="3" x="-2.54" y="-2.54" visible="pin" length="short"/>
<circle x="1.016" y="2.54" radius="1.016" width="0.1524" layer="94"/>
<circle x="1.016" y="0" radius="1.016" width="0.1524" layer="94"/>
<circle x="1.016" y="-2.54" radius="1.016" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="5.08" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<text x="-5.08" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="C" urn="urn:adsk.eagle:symbol:30890049/2" library_version="100">
<description>Capacitor</description>
<rectangle x1="-2.032" y1="-2.032" x2="-1.524" y2="2.032" layer="94"/>
<rectangle x1="-1.016" y1="-2.032" x2="-0.508" y2="2.032" layer="94"/>
<wire x1="0" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.032" y2="0" width="0.1524" layer="94"/>
<pin name="1" x="2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-6.35" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="-2.54" y="-4.064" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="-8.89" size="1.778" layer="97">&gt;SPICEEXTRA</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X03" urn="urn:adsk.eagle:component:31968534/2" library_version="100">
<gates>
<gate name="G$1" symbol="PINHD-1X03" x="0" y="0"/>
</gates>
<devices>
<device name="_1X03M" package="1X03">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22458/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAPACITOR" urn="urn:adsk.eagle:component:30890073/6" prefix="C" uservalue="yes" library_version="100">
<description>&lt;B&gt;Capacitor - Generic</description>
<gates>
<gate name="G$1" symbol="C" x="0" y="0"/>
</gates>
<devices>
<device name="CHIP-0402(1005-METRIC)" package="CAPC1005X60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290895/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0504(1310-METRIC)" package="CAPC1110X102">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290904/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0603(1608-METRIC)" package="CAPC1608X85">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290898/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0805(2012-METRIC)" package="CAPC2012X110">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290897/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1206(3216-METRIC)" package="CAPC3216X135">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290893/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1210(3225-METRIC)" package="CAPC3225X135">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290903/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1812(4532-METRIC)" package="CAPC4532X135">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290900/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-1206(3216-METRIC)" package="CAPM3216X180">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290894/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-1411(3528-METRIC)" package="CAPM3528X210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290902/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-2412(6032-METRIC)" package="CAPM6032X280">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290896/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-2917(7343-METRIC)" package="CAPM7343X310">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290891/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1825(4564-METRIC)" package="CAPC4564X110">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290887/6"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="RADIAL-12.5MM-DIA" package="CAPRD550W60D1025H1250B">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290858/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="RADIAL-55.5MM-DIA" package="CAPRD2261W240D5080H5555B">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290864/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CERAMIC-2.54MM" package="CAP-THRU-2.54MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:32248319/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Tutorial - Fusion 360" urn="urn:adsk.eagle:library:16997205">
<description>Library of several components used in the Getting Started With Fusion Electronics tutorial.</description>
<packages>
</packages>
<symbols>
<symbol name="VCC-CIRCLE" urn="urn:adsk.eagle:symbol:16997212/1" library_version="24">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-0.127" y="3.175" size="1.778" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC-CIRCLE" urn="urn:adsk.eagle:component:16997234/4" prefix="SUPPLY" uservalue="yes" library_version="24">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt; VCC Circle</description>
<gates>
<gate name="G$1" symbol="VCC-CIRCLE" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="CATEGORY" value="Supply" constant="no"/>
<attribute name="VALUE" value="VCC" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Connector" urn="urn:adsk.eagle:library:16378166">
<description>&lt;b&gt;Pin Headers,Terminal blocks, D-Sub, Backplane, FFC/FPC, Socket</description>
<packages>
<package name="TERMBLK_508-2N" urn="urn:adsk.eagle:footprint:24957600/1" library_version="50">
<pad name="1" x="0" y="0" drill="1.2"/>
<pad name="2" x="5.08" y="0" drill="1.2"/>
<wire x1="7.745" y1="4.25" x2="7.745" y2="-4.25" width="0.1524" layer="21"/>
<wire x1="7.745" y1="-4.25" x2="-2.665" y2="-4.25" width="0.1524" layer="21"/>
<wire x1="-2.665" y1="-4.25" x2="-2.665" y2="4.25" width="0.1524" layer="21"/>
<wire x1="-2.665" y1="4.25" x2="7.745" y2="4.25" width="0.1524" layer="21"/>
<text x="2.54" y="-6.1" size="1.778" layer="25" align="bottom-center">&gt;NAME</text>
<text x="2.54" y="4.6" size="1.778" layer="27" align="bottom-center">&gt;VALUE</text>
</package>
<package name="TERMBLK_254-2N" urn="urn:adsk.eagle:footprint:24957601/1" library_version="50">
<pad name="1" x="0" y="0" drill="1.2"/>
<pad name="2" x="2.54" y="0" drill="1.2"/>
<wire x1="4.165" y1="3.4" x2="4.165" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="4.165" y1="-3.4" x2="-1.625" y2="-3.4" width="0.1524" layer="21"/>
<wire x1="-1.625" y1="-3.4" x2="-1.625" y2="3.4" width="0.1524" layer="21"/>
<wire x1="-1.625" y1="3.4" x2="4.165" y2="3.4" width="0.1524" layer="21"/>
<text x="1.27" y="-5.4" size="1.778" layer="25" align="bottom-center">&gt;NAME</text>
<text x="1.27" y="3.9" size="1.778" layer="27" align="bottom-center">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="TERMBLK_508-2N" urn="urn:adsk.eagle:package:24957621/2" type="model">
<packageinstances>
<packageinstance name="TERMBLK_508-2N"/>
</packageinstances>
</package3d>
<package3d name="TERMBLK_254-2N" urn="urn:adsk.eagle:package:24957623/2" type="model">
<packageinstances>
<packageinstance name="TERMBLK_254-2N"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="TERMBLK_2" urn="urn:adsk.eagle:symbol:24957587/3" library_version="50">
<pin name="1" x="-5.08" y="2.54" length="short"/>
<pin name="2" x="-5.08" y="0" length="short"/>
<text x="0" y="-2.794" size="1.778" layer="96" align="top-center">&gt;VALUE</text>
<text x="0" y="5.334" size="1.778" layer="95" align="bottom-center">&gt;NAME</text>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="5.08" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="2.54" y2="5.08" width="0.1524" layer="94"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="2828XX-2" urn="urn:adsk.eagle:component:24957692/7" prefix="J" library_version="50">
<description>2 Position Wire to Board Terminal Block Horizontal with Board
&lt;br&gt;&lt;a href="https://www.te.com.cn/commerce/DocumentDelivery/DDEController?Action=showdoc&amp;DocId=Catalog+Section%7F1308389_EUROSTYLE_TERMINAL_BLOCKS%7F0607%7Fpdf%7FEnglish%7FENG_CS_1308389_EUROSTYLE_TERMINAL_BLOCKS_0607.pdf%7F2-282837-5"&gt;Datasheet&lt;/a&gt;&lt;br&gt;</description>
<gates>
<gate name="G$1" symbol="TERMBLK_2" x="0" y="0"/>
</gates>
<devices>
<device name="282837-2" package="TERMBLK_508-2N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:24957621/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="Fixed Terminal Blocks" constant="no"/>
<attribute name="DESCRIPTION" value="Fixed Terminal Blocks 5.08MM PCB MOUNT 2P" constant="no"/>
<attribute name="MANUFACTURER" value="TE Connectivity AMP Connectors" constant="no"/>
<attribute name="MPN" value="282837-2" constant="no"/>
<attribute name="OPERATING_TEMPERATURE" value="-40°C to +105°C" constant="no"/>
<attribute name="PART_STATUS" value="ACTIVE" constant="no"/>
<attribute name="PITCH" value="0.200&quot; (5.08mm)" constant="no"/>
<attribute name="ROHS_COMPLIANCE" value="RoHS Compliant" constant="no"/>
<attribute name="SERIES" value="Buchanan" constant="no"/>
<attribute name="SUBCATEGORY" value="Terminal Blocks" constant="no"/>
<attribute name="TYPE" value="Through Hole; Screw - Rising Cage Clamp; Side wire entry, Horizontal with Board" constant="no"/>
<attribute name="VALUE" value="TERM-BLK-2P" constant="no"/>
</technology>
</technologies>
</device>
<device name="282834-2" package="TERMBLK_254-2N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:24957623/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="Fixed Terminal Blocks" constant="no"/>
<attribute name="DESCRIPTION" value="Fixed Terminal Blocks 2P SIDE ENTRY 2.54mm" constant="no"/>
<attribute name="MANUFACTURER" value="TE Connectivity AMP Connectors" constant="no"/>
<attribute name="MPN" value="282834-2 " constant="no"/>
<attribute name="OPERATING_TEMPERATURE" value="-40°C ~ 105°C " constant="no"/>
<attribute name="PART_STATUS" value="Active " constant="no"/>
<attribute name="PITCH" value="0.100&quot; (2.54mm) " constant="no"/>
<attribute name="ROHS_COMPLIANCE" value="RoHS Compliant " constant="no"/>
<attribute name="SERIES" value="Buchanan" constant="no"/>
<attribute name="SUBCATEGORY" value="Terminal Blocks " constant="no"/>
<attribute name="TYPE" value="Through Hole; Screw - Rising Cage Clamp; Side wire entry, Horizontal with Board " constant="no"/>
<attribute name="VALUE" value="TERM-BLK-2P" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="LED" urn="urn:adsk.eagle:library:22900745">
<description>&lt;B&gt;LED parts CHIP-Flat Top, Round Top</description>
<packages>
<package name="LEDC1608X35N_FLAT-B" urn="urn:adsk.eagle:footprint:24294728/1" library_version="22">
<description>Chip LED, 1.60 X 0.80 X 0.35 mm body
 &lt;p&gt;Chip LED package with body size 1.60 X 0.80 X 0.35 mm&lt;/p&gt;</description>
<smd name="C" x="-0.75" y="0" dx="0.6118" dy="0.9118" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.6118" dy="0.9118" layer="1"/>
<wire x1="-1.3099" y1="0.7699" x2="0.8" y2="0.7699" width="0.12" layer="21"/>
<wire x1="-1.3099" y1="0.7699" x2="-1.3099" y2="-0.7699" width="0.12" layer="21"/>
<wire x1="-1.3099" y1="-0.7699" x2="0.8" y2="-0.7699" width="0.12" layer="21"/>
<wire x1="-0.8" y1="-0.4" x2="-0.8" y2="0.4" width="0.12" layer="51"/>
<wire x1="-0.8" y1="0.4" x2="0.8" y2="0.4" width="0.12" layer="51"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.12" layer="51"/>
<wire x1="0.8" y1="-0.4" x2="-0.8" y2="-0.4" width="0.12" layer="51"/>
<text x="-0.127" y="1.4049" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="-0.127" y="-1.4049" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="LEDC1608X55N_FLAT-B" urn="urn:adsk.eagle:footprint:24294725/1" library_version="22">
<description>Chip LED, 1.60 X 0.80 X 0.55 mm body
 &lt;p&gt;Chip LED package with body size 1.60 X 0.80 X 0.55 mm&lt;/p&gt;</description>
<smd name="C" x="-0.75" y="0" dx="0.6118" dy="0.9118" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.6118" dy="0.9118" layer="1"/>
<wire x1="-1.3099" y1="0.7699" x2="0.8" y2="0.7699" width="0.12" layer="21"/>
<wire x1="-1.3099" y1="0.7699" x2="-1.3099" y2="-0.7699" width="0.12" layer="21"/>
<wire x1="-1.3099" y1="-0.7699" x2="0.8" y2="-0.7699" width="0.12" layer="21"/>
<wire x1="-0.8" y1="-0.4" x2="-0.8" y2="0.4" width="0.12" layer="51"/>
<wire x1="-0.8" y1="0.4" x2="0.8" y2="0.4" width="0.12" layer="51"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.12" layer="51"/>
<wire x1="0.8" y1="-0.4" x2="-0.8" y2="-0.4" width="0.12" layer="51"/>
<text x="-0.127" y="1.4049" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="-0.127" y="-1.4049" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="LEDC1608X80N_FLAT-B" urn="urn:adsk.eagle:footprint:24294719/1" library_version="22">
<description>Chip LED, 1.60 X 0.80 X 0.80 mm body
 &lt;p&gt;Chip LED package with body size 1.60 X 0.80 X 0.80 mm&lt;/p&gt;</description>
<smd name="C" x="-0.75" y="0" dx="0.6118" dy="0.9118" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.6118" dy="0.9118" layer="1"/>
<wire x1="-1.3099" y1="0.7699" x2="0.8" y2="0.7699" width="0.12" layer="21"/>
<wire x1="-1.3099" y1="0.7699" x2="-1.3099" y2="-0.7699" width="0.12" layer="21"/>
<wire x1="-1.3099" y1="-0.7699" x2="0.8" y2="-0.7699" width="0.12" layer="21"/>
<wire x1="-0.8" y1="-0.4" x2="-0.8" y2="0.4" width="0.12" layer="51"/>
<wire x1="-0.8" y1="0.4" x2="0.8" y2="0.4" width="0.12" layer="51"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.12" layer="51"/>
<wire x1="0.8" y1="-0.4" x2="-0.8" y2="-0.4" width="0.12" layer="51"/>
<text x="-0.127" y="1.4049" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="-0.127" y="-1.4049" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="LEDC2012X110N_FLAT-B" urn="urn:adsk.eagle:footprint:24294710/1" library_version="22">
<description>Chip LED, 2.00 X 1.25 X 1.10 mm body
 &lt;p&gt;Chip LED package with body size 2.00 X 1.25 X 1.10 mm&lt;/p&gt;</description>
<smd name="C" x="-1.025" y="0" dx="0.7618" dy="1.3618" layer="1"/>
<smd name="A" x="1.025" y="0" dx="0.7618" dy="1.3618" layer="1"/>
<wire x1="-1.6599" y1="0.9949" x2="1" y2="0.9949" width="0.12" layer="21"/>
<wire x1="-1.6599" y1="0.9949" x2="-1.6599" y2="-0.9949" width="0.12" layer="21"/>
<wire x1="-1.6599" y1="-0.9949" x2="1" y2="-0.9949" width="0.12" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.12" layer="51"/>
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.12" layer="51"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.12" layer="51"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.12" layer="51"/>
<text x="-0.127" y="1.6299" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="-0.127" y="-1.6299" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="LEDC3216X75N_FLAT-B" urn="urn:adsk.eagle:footprint:24294704/1" library_version="22">
<description>Chip LED, 3.20 X 1.60 X 0.75 mm body
 &lt;p&gt;Chip LED package with body size 3.20 X 1.60 X 0.75 mm&lt;/p&gt;</description>
<smd name="C" x="-1.525" y="0" dx="0.9618" dy="1.7118" layer="1"/>
<smd name="A" x="1.525" y="0" dx="0.9618" dy="1.7118" layer="1"/>
<wire x1="-2.2599" y1="1.1699" x2="1.6" y2="1.1699" width="0.12" layer="21"/>
<wire x1="-2.2599" y1="1.1699" x2="-2.2599" y2="-1.1699" width="0.12" layer="21"/>
<wire x1="-2.2599" y1="-1.1699" x2="1.6" y2="-1.1699" width="0.12" layer="21"/>
<wire x1="-1.6" y1="-0.8" x2="-1.6" y2="0.8" width="0.12" layer="51"/>
<wire x1="-1.6" y1="0.8" x2="1.6" y2="0.8" width="0.12" layer="51"/>
<wire x1="1.6" y1="0.8" x2="1.6" y2="-0.8" width="0.12" layer="51"/>
<wire x1="1.6" y1="-0.8" x2="-1.6" y2="-0.8" width="0.12" layer="51"/>
<text x="-0.127" y="1.8049" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="-0.127" y="-1.8049" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="LEDC1005X25N_FLAT-B" urn="urn:adsk.eagle:footprint:22900746/2" library_version="22">
<description>Chip LED, 1.00 X 0.50 X 0.25 mm body
 &lt;p&gt;Chip LED package with body size 1.00 X 0.50 X 0.25 mm&lt;/p&gt;</description>
<smd name="C" x="-0.45" y="0" dx="0.7" dy="0.5" layer="1"/>
<smd name="A" x="0.45" y="0" dx="0.7" dy="0.5" layer="1"/>
<wire x1="-1.0099" y1="0.6199" x2="0.5" y2="0.6199" width="0.12" layer="21"/>
<wire x1="-1.0099" y1="0.6199" x2="-1.0099" y2="-0.6199" width="0.12" layer="21"/>
<wire x1="-1.0099" y1="-0.6199" x2="0.5" y2="-0.6199" width="0.12" layer="21"/>
<wire x1="-0.5" y1="-0.25" x2="-0.5" y2="0.25" width="0.12" layer="51"/>
<wire x1="-0.5" y1="0.25" x2="0.5" y2="0.25" width="0.12" layer="51"/>
<wire x1="0.5" y1="0.25" x2="0.5" y2="-0.25" width="0.12" layer="51"/>
<wire x1="0.5" y1="-0.25" x2="-0.5" y2="-0.25" width="0.12" layer="51"/>
<text x="-0.127" y="1.2549" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="-0.127" y="-1.2549" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="LEDC1608X35N_FLAT-B" urn="urn:adsk.eagle:package:24294787/1" type="model">
<description>Chip LED, 1.60 X 0.80 X 0.35 mm body
 &lt;p&gt;Chip LED package with body size 1.60 X 0.80 X 0.35 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="LEDC1608X35N_FLAT-B"/>
</packageinstances>
</package3d>
<package3d name="LEDC1608X55N_FLAT-B" urn="urn:adsk.eagle:package:24294782/1" type="model">
<description>Chip LED, 1.60 X 0.80 X 0.55 mm body
 &lt;p&gt;Chip LED package with body size 1.60 X 0.80 X 0.55 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="LEDC1608X55N_FLAT-B"/>
</packageinstances>
</package3d>
<package3d name="LEDC1608X80N_FLAT-B" urn="urn:adsk.eagle:package:24294774/1" type="model">
<description>Chip LED, 1.60 X 0.80 X 0.80 mm body
 &lt;p&gt;Chip LED package with body size 1.60 X 0.80 X 0.80 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="LEDC1608X80N_FLAT-B"/>
</packageinstances>
</package3d>
<package3d name="LEDC2012X110N_FLAT-B" urn="urn:adsk.eagle:package:24294759/1" type="model">
<description>Chip LED, 2.00 X 1.25 X 1.10 mm body
 &lt;p&gt;Chip LED package with body size 2.00 X 1.25 X 1.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="LEDC2012X110N_FLAT-B"/>
</packageinstances>
</package3d>
<package3d name="LEDC3216X75N_FLAT-B" urn="urn:adsk.eagle:package:24294749/1" type="model">
<description>Chip LED, 3.20 X 1.60 X 0.75 mm body
 &lt;p&gt;Chip LED package with body size 3.20 X 1.60 X 0.75 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="LEDC3216X75N_FLAT-B"/>
</packageinstances>
</package3d>
<package3d name="LEDC1005X25N_FLAT-B" urn="urn:adsk.eagle:package:22900837/2" type="model">
<description>Chip LED, 1.00 X 0.50 X 0.25 mm body
 &lt;p&gt;Chip LED package with body size 1.00 X 0.50 X 0.25 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="LEDC1005X25N_FLAT-B"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="LED" urn="urn:adsk.eagle:symbol:22900757/4" library_version="22">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94"/>
<text x="2.54" y="-0.762" size="1.778" layer="95" rot="R180" align="top-right">&gt;NAME</text>
<text x="2.54" y="-3.302" size="1.778" layer="96" rot="R180" align="top-right">&gt;VALUE</text>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94" pour="solid">
<vertex x="-3.048" y="-1.27"/>
<vertex x="-3.429" y="-2.159"/>
<vertex x="-2.54" y="-1.778"/>
</polygon>
<polygon width="0.1524" layer="94" pour="solid">
<vertex x="-2.921" y="-2.413"/>
<vertex x="-3.302" y="-3.302"/>
<vertex x="-2.413" y="-2.921"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="CHIP-FLAT-B" urn="urn:adsk.eagle:component:22900848/7" prefix="D" library_version="22">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="_0603-0.35MM" package="LEDC1608X35N_FLAT-B">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:24294787/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="LED" constant="no"/>
<attribute name="COLOR" value="BLUE" constant="no"/>
<attribute name="DESCRIPTION" value="CHIP LED FLAT" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="CHIP" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="FLAT_TOP" constant="no"/>
<attribute name="VALUE" value="LED_BLUE" constant="no"/>
</technology>
</technologies>
</device>
<device name="_0603-0.55MM" package="LEDC1608X55N_FLAT-B">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:24294782/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="LED" constant="no"/>
<attribute name="COLOR" value="BLUE" constant="no"/>
<attribute name="DESCRIPTION" value="CHIP LED FLAT" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="CHIP" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="FLAT_TOP" constant="no"/>
<attribute name="VALUE" value="LED_BLUE" constant="no"/>
</technology>
</technologies>
</device>
<device name="_0603-0.80MM" package="LEDC1608X80N_FLAT-B">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:24294774/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="LED" constant="no"/>
<attribute name="COLOR" value="BLUE" constant="no"/>
<attribute name="DESCRIPTION" value="CHIP LED FLAT" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="CHIP" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="FLAT_TOP" constant="no"/>
<attribute name="VALUE" value="LED_BLUE" constant="no"/>
</technology>
</technologies>
</device>
<device name="_0805" package="LEDC2012X110N_FLAT-B">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:24294759/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="LED" constant="no"/>
<attribute name="COLOR" value="BLUE" constant="no"/>
<attribute name="DESCRIPTION" value="CHIP LED FLAT" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="CHIP" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="FLAT_TOP" constant="no"/>
<attribute name="VALUE" value="LED_BLUE" constant="no"/>
</technology>
</technologies>
</device>
<device name="_1206" package="LEDC3216X75N_FLAT-B">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:24294749/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="LED" constant="no"/>
<attribute name="COLOR" value="BLUE" constant="no"/>
<attribute name="DESCRIPTION" value="CHIP LED FLAT" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="CHIP" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="FLAT_TOP" constant="no"/>
<attribute name="VALUE" value="LED_BLUE" constant="no"/>
</technology>
</technologies>
</device>
<device name="_0402" package="LEDC1005X25N_FLAT-B">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22900837/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="LED" constant="no"/>
<attribute name="COLOR" value="BLUE" constant="no"/>
<attribute name="DESCRIPTION" value="CHIP LED FLAT" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="CHIP" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="FLAT_TOP" constant="no"/>
<attribute name="VALUE" value="LED_BLUE" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="B3U-1000P" urn="urn:adsk.wipprod:fs.file:vf.XJbiwRhKSp-iOlNm4yOdNw">
<description>&lt;OMRON ELECTRONIC COMPONENTS - B3U-1000P - SWITCH, SPST-NO, 0.05A, 12V, SMD&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="B3U-1000P" library_version="2">
<description>&lt;b&gt;B3U-1000P(M)&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="1.7" y="0" dx="1.7" dy="0.8" layer="1" rot="R90"/>
<smd name="2" x="-1.7" y="0" dx="1.7" dy="0.8" layer="1" rot="R90"/>
<text x="-0.461" y="-0.206" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="-0.461" y="-0.206" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-1.5" y1="1.25" x2="1.5" y2="1.25" width="0.2" layer="51"/>
<wire x1="1.5" y1="1.25" x2="1.5" y2="-1.25" width="0.2" layer="51"/>
<wire x1="1.5" y1="-1.25" x2="-1.5" y2="-1.25" width="0.2" layer="51"/>
<wire x1="-1.5" y1="-1.25" x2="-1.5" y2="1.25" width="0.2" layer="51"/>
<circle x="2.395" y="0.971" radius="0.1" width="0.2" layer="25"/>
<wire x1="-1.5" y1="1.25" x2="1.5" y2="1.25" width="0.2" layer="21"/>
<wire x1="-1.5" y1="-1.25" x2="1.5" y2="-1.25" width="0.2" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="B3U-1000P" library_version="2">
<wire x1="5.08" y1="2.54" x2="15.24" y2="2.54" width="0.254" layer="94"/>
<wire x1="15.24" y1="-5.08" x2="15.24" y2="2.54" width="0.254" layer="94"/>
<wire x1="15.24" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<text x="16.51" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="16.51" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="K" x="0" y="-2.54" length="middle"/>
<pin name="A" x="0" y="0" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="B3U-1000P" prefix="S" library_version="2">
<description>&lt;b&gt;OMRON ELECTRONIC COMPONENTS - B3U-1000P - SWITCH, SPST-NO, 0.05A, 12V, SMD&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="https://www.omron.com/ecb/products/pdf/en-b3u.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="B3U-1000P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="B3U-1000P">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="K" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value="OMRON ELECTRONIC COMPONENTS - B3U-1000P - SWITCH, SPST-NO, 0.05A, 12V, SMD" constant="no"/>
<attribute name="HEIGHT" value="mm" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="OMRON Electronics" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="B3U-1000P" constant="no"/>
<attribute name="MOUSER_PART_NUMBER" value="653-B3U-1000P" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Omron-Electronics/B3U-1000P?qs=AO7BQMcsEu4ip80xyf2FwA%3D%3D" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="UJ20-C-H-G-SMT-1-P16-TR" urn="urn:adsk.wipprod:fs.file:vf.VgEXy_XXReqS1Zb8YyEAgA">
<packages>
<package name="SAMESKY_UJ20-C-H-G-SMT-1-P16-TR" library_version="1">
<wire x1="-4.62" y1="7.33" x2="-4.32" y2="7.63" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="7.63" x2="-4.02" y2="7.33" width="0" layer="46" curve="-90"/>
<wire x1="-4.02" y1="7.33" x2="-4.02" y2="6.23" width="0" layer="46"/>
<wire x1="-4.02" y1="6.23" x2="-4.32" y2="5.93" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="5.93" x2="-4.62" y2="6.23" width="0" layer="46" curve="-90"/>
<wire x1="-4.62" y1="6.23" x2="-4.62" y2="7.33" width="0" layer="46"/>
<polygon width="0.01" layer="1" pour="solid">
<vertex x="-4.4312625" y="5.7425375"/>
<vertex x="-4.32" y="5.73"/>
<vertex x="-4.2087375" y="5.7425375"/>
<vertex x="-4.103053125" y="5.779515625"/>
<vertex x="-4.0082625" y="5.839078125"/>
<vertex x="-3.929078125" y="5.9182625"/>
<vertex x="-3.869515625" y="6.013053125"/>
<vertex x="-3.8325375" y="6.1187375"/>
<vertex x="-3.82" y="6.23000625"/>
<vertex x="-3.82" y="7.32999375"/>
<vertex x="-3.8325375" y="7.4412625"/>
<vertex x="-3.869515625" y="7.546946875"/>
<vertex x="-3.929078125" y="7.6417375"/>
<vertex x="-4.0082625" y="7.720921875"/>
<vertex x="-4.103053125" y="7.780484375"/>
<vertex x="-4.2087375" y="7.8174625"/>
<vertex x="-4.32" y="7.83"/>
<vertex x="-4.4312625" y="7.8174625"/>
<vertex x="-4.536946875" y="7.780484375"/>
<vertex x="-4.6317375" y="7.720921875"/>
<vertex x="-4.710921875" y="7.6417375"/>
<vertex x="-4.770484375" y="7.546946875"/>
<vertex x="-4.8074625" y="7.4412625"/>
<vertex x="-4.82" y="7.32999375"/>
<vertex x="-4.82" y="6.23000625"/>
<vertex x="-4.8074625" y="6.1187375"/>
<vertex x="-4.770484375" y="6.013053125"/>
<vertex x="-4.710921875" y="5.9182625"/>
<vertex x="-4.6317375" y="5.839078125"/>
<vertex x="-4.536946875" y="5.779515625"/>
</polygon>
<polygon width="0.01" layer="16" pour="solid">
<vertex x="-4.4312625" y="5.7425375"/>
<vertex x="-4.32" y="5.73"/>
<vertex x="-4.2087375" y="5.7425375"/>
<vertex x="-4.103053125" y="5.779515625"/>
<vertex x="-4.0082625" y="5.839078125"/>
<vertex x="-3.929078125" y="5.9182625"/>
<vertex x="-3.869515625" y="6.013053125"/>
<vertex x="-3.8325375" y="6.1187375"/>
<vertex x="-3.82" y="6.23000625"/>
<vertex x="-3.82" y="7.32999375"/>
<vertex x="-3.8325375" y="7.4412625"/>
<vertex x="-3.869515625" y="7.546946875"/>
<vertex x="-3.929078125" y="7.6417375"/>
<vertex x="-4.0082625" y="7.720921875"/>
<vertex x="-4.103053125" y="7.780484375"/>
<vertex x="-4.2087375" y="7.8174625"/>
<vertex x="-4.32" y="7.83"/>
<vertex x="-4.4312625" y="7.8174625"/>
<vertex x="-4.536946875" y="7.780484375"/>
<vertex x="-4.6317375" y="7.720921875"/>
<vertex x="-4.710921875" y="7.6417375"/>
<vertex x="-4.770484375" y="7.546946875"/>
<vertex x="-4.8074625" y="7.4412625"/>
<vertex x="-4.82" y="7.32999375"/>
<vertex x="-4.82" y="6.23000625"/>
<vertex x="-4.8074625" y="6.1187375"/>
<vertex x="-4.770484375" y="6.013053125"/>
<vertex x="-4.710921875" y="5.9182625"/>
<vertex x="-4.6317375" y="5.839078125"/>
<vertex x="-4.536946875" y="5.779515625"/>
</polygon>
<polygon width="0.01" layer="30" pour="solid">
<vertex x="-4.43704375" y="5.641525"/>
<vertex x="-4.32" y="5.629996875"/>
<vertex x="-4.20295625" y="5.641525"/>
<vertex x="-4.09040625" y="5.675665625"/>
<vertex x="-3.98665625" y="5.73111875"/>
<vertex x="-3.895734375" y="5.805734375"/>
<vertex x="-3.82111875" y="5.89665625"/>
<vertex x="-3.765665625" y="6.00040625"/>
<vertex x="-3.731525" y="6.11295625"/>
<vertex x="-3.72" y="6.2299875"/>
<vertex x="-3.72" y="7.3300125"/>
<vertex x="-3.731525" y="7.44704375"/>
<vertex x="-3.765665625" y="7.55959375"/>
<vertex x="-3.82111875" y="7.66334375"/>
<vertex x="-3.895734375" y="7.754265625"/>
<vertex x="-3.98665625" y="7.82888125"/>
<vertex x="-4.09040625" y="7.884334375"/>
<vertex x="-4.20295625" y="7.918475"/>
<vertex x="-4.32" y="7.930003125"/>
<vertex x="-4.43704375" y="7.918475"/>
<vertex x="-4.54959375" y="7.884334375"/>
<vertex x="-4.65334375" y="7.82888125"/>
<vertex x="-4.744265625" y="7.754265625"/>
<vertex x="-4.81888125" y="7.66334375"/>
<vertex x="-4.874334375" y="7.55959375"/>
<vertex x="-4.908475" y="7.44704375"/>
<vertex x="-4.92" y="7.3300125"/>
<vertex x="-4.92" y="6.2299875"/>
<vertex x="-4.908475" y="6.11295625"/>
<vertex x="-4.874334375" y="6.00040625"/>
<vertex x="-4.81888125" y="5.89665625"/>
<vertex x="-4.744265625" y="5.805734375"/>
<vertex x="-4.65334375" y="5.73111875"/>
<vertex x="-4.54959375" y="5.675665625"/>
</polygon>
<polygon width="0.01" layer="29" pour="solid">
<vertex x="-4.43704375" y="5.641525"/>
<vertex x="-4.32" y="5.629996875"/>
<vertex x="-4.20295625" y="5.641525"/>
<vertex x="-4.09040625" y="5.675665625"/>
<vertex x="-3.98665625" y="5.73111875"/>
<vertex x="-3.895734375" y="5.805734375"/>
<vertex x="-3.82111875" y="5.89665625"/>
<vertex x="-3.765665625" y="6.00040625"/>
<vertex x="-3.731525" y="6.11295625"/>
<vertex x="-3.72" y="6.2299875"/>
<vertex x="-3.72" y="7.3300125"/>
<vertex x="-3.731525" y="7.44704375"/>
<vertex x="-3.765665625" y="7.55959375"/>
<vertex x="-3.82111875" y="7.66334375"/>
<vertex x="-3.895734375" y="7.754265625"/>
<vertex x="-3.98665625" y="7.82888125"/>
<vertex x="-4.09040625" y="7.884334375"/>
<vertex x="-4.20295625" y="7.918475"/>
<vertex x="-4.32" y="7.930003125"/>
<vertex x="-4.43704375" y="7.918475"/>
<vertex x="-4.54959375" y="7.884334375"/>
<vertex x="-4.65334375" y="7.82888125"/>
<vertex x="-4.744265625" y="7.754265625"/>
<vertex x="-4.81888125" y="7.66334375"/>
<vertex x="-4.874334375" y="7.55959375"/>
<vertex x="-4.908475" y="7.44704375"/>
<vertex x="-4.92" y="7.3300125"/>
<vertex x="-4.92" y="6.2299875"/>
<vertex x="-4.908475" y="6.11295625"/>
<vertex x="-4.874334375" y="6.00040625"/>
<vertex x="-4.81888125" y="5.89665625"/>
<vertex x="-4.744265625" y="5.805734375"/>
<vertex x="-4.65334375" y="5.73111875"/>
<vertex x="-4.54959375" y="5.675665625"/>
</polygon>
<wire x1="4.02" y1="7.33" x2="4.32" y2="7.63" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="7.63" x2="4.62" y2="7.33" width="0" layer="46" curve="-90"/>
<wire x1="4.62" y1="7.33" x2="4.62" y2="6.23" width="0" layer="46"/>
<wire x1="4.62" y1="6.23" x2="4.32" y2="5.93" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="5.93" x2="4.02" y2="6.23" width="0" layer="46" curve="-90"/>
<wire x1="4.02" y1="6.23" x2="4.02" y2="7.33" width="0" layer="46"/>
<polygon width="0.01" layer="1" pour="solid">
<vertex x="4.2087375" y="5.7425375"/>
<vertex x="4.32" y="5.73"/>
<vertex x="4.4312625" y="5.7425375"/>
<vertex x="4.536946875" y="5.779515625"/>
<vertex x="4.6317375" y="5.839078125"/>
<vertex x="4.710921875" y="5.9182625"/>
<vertex x="4.770484375" y="6.013053125"/>
<vertex x="4.8074625" y="6.1187375"/>
<vertex x="4.82" y="6.23000625"/>
<vertex x="4.82" y="7.32999375"/>
<vertex x="4.8074625" y="7.4412625"/>
<vertex x="4.770484375" y="7.546946875"/>
<vertex x="4.710921875" y="7.6417375"/>
<vertex x="4.6317375" y="7.720921875"/>
<vertex x="4.536946875" y="7.780484375"/>
<vertex x="4.4312625" y="7.8174625"/>
<vertex x="4.32" y="7.83"/>
<vertex x="4.2087375" y="7.8174625"/>
<vertex x="4.103053125" y="7.780484375"/>
<vertex x="4.0082625" y="7.720921875"/>
<vertex x="3.929078125" y="7.6417375"/>
<vertex x="3.869515625" y="7.546946875"/>
<vertex x="3.8325375" y="7.4412625"/>
<vertex x="3.82" y="7.32999375"/>
<vertex x="3.82" y="6.23000625"/>
<vertex x="3.8325375" y="6.1187375"/>
<vertex x="3.869515625" y="6.013053125"/>
<vertex x="3.929078125" y="5.9182625"/>
<vertex x="4.0082625" y="5.839078125"/>
<vertex x="4.103053125" y="5.779515625"/>
</polygon>
<polygon width="0.01" layer="16" pour="solid">
<vertex x="4.2087375" y="5.7425375"/>
<vertex x="4.32" y="5.73"/>
<vertex x="4.4312625" y="5.7425375"/>
<vertex x="4.536946875" y="5.779515625"/>
<vertex x="4.6317375" y="5.839078125"/>
<vertex x="4.710921875" y="5.9182625"/>
<vertex x="4.770484375" y="6.013053125"/>
<vertex x="4.8074625" y="6.1187375"/>
<vertex x="4.82" y="6.23000625"/>
<vertex x="4.82" y="7.32999375"/>
<vertex x="4.8074625" y="7.4412625"/>
<vertex x="4.770484375" y="7.546946875"/>
<vertex x="4.710921875" y="7.6417375"/>
<vertex x="4.6317375" y="7.720921875"/>
<vertex x="4.536946875" y="7.780484375"/>
<vertex x="4.4312625" y="7.8174625"/>
<vertex x="4.32" y="7.83"/>
<vertex x="4.2087375" y="7.8174625"/>
<vertex x="4.103053125" y="7.780484375"/>
<vertex x="4.0082625" y="7.720921875"/>
<vertex x="3.929078125" y="7.6417375"/>
<vertex x="3.869515625" y="7.546946875"/>
<vertex x="3.8325375" y="7.4412625"/>
<vertex x="3.82" y="7.32999375"/>
<vertex x="3.82" y="6.23000625"/>
<vertex x="3.8325375" y="6.1187375"/>
<vertex x="3.869515625" y="6.013053125"/>
<vertex x="3.929078125" y="5.9182625"/>
<vertex x="4.0082625" y="5.839078125"/>
<vertex x="4.103053125" y="5.779515625"/>
</polygon>
<polygon width="0.01" layer="30" pour="solid">
<vertex x="4.20295625" y="5.641525"/>
<vertex x="4.32" y="5.629996875"/>
<vertex x="4.43704375" y="5.641525"/>
<vertex x="4.54959375" y="5.675665625"/>
<vertex x="4.65334375" y="5.73111875"/>
<vertex x="4.744265625" y="5.805734375"/>
<vertex x="4.81888125" y="5.89665625"/>
<vertex x="4.874334375" y="6.00040625"/>
<vertex x="4.908475" y="6.11295625"/>
<vertex x="4.92" y="6.2299875"/>
<vertex x="4.92" y="7.3300125"/>
<vertex x="4.908475" y="7.44704375"/>
<vertex x="4.874334375" y="7.55959375"/>
<vertex x="4.81888125" y="7.66334375"/>
<vertex x="4.744265625" y="7.754265625"/>
<vertex x="4.65334375" y="7.82888125"/>
<vertex x="4.54959375" y="7.884334375"/>
<vertex x="4.43704375" y="7.918475"/>
<vertex x="4.32" y="7.930003125"/>
<vertex x="4.20295625" y="7.918475"/>
<vertex x="4.09040625" y="7.884334375"/>
<vertex x="3.98665625" y="7.82888125"/>
<vertex x="3.895734375" y="7.754265625"/>
<vertex x="3.82111875" y="7.66334375"/>
<vertex x="3.765665625" y="7.55959375"/>
<vertex x="3.731525" y="7.44704375"/>
<vertex x="3.72" y="7.3300125"/>
<vertex x="3.72" y="6.2299875"/>
<vertex x="3.731525" y="6.11295625"/>
<vertex x="3.765665625" y="6.00040625"/>
<vertex x="3.82111875" y="5.89665625"/>
<vertex x="3.895734375" y="5.805734375"/>
<vertex x="3.98665625" y="5.73111875"/>
<vertex x="4.09040625" y="5.675665625"/>
</polygon>
<polygon width="0.01" layer="29" pour="solid">
<vertex x="4.20295625" y="5.641525"/>
<vertex x="4.32" y="5.629996875"/>
<vertex x="4.43704375" y="5.641525"/>
<vertex x="4.54959375" y="5.675665625"/>
<vertex x="4.65334375" y="5.73111875"/>
<vertex x="4.744265625" y="5.805734375"/>
<vertex x="4.81888125" y="5.89665625"/>
<vertex x="4.874334375" y="6.00040625"/>
<vertex x="4.908475" y="6.11295625"/>
<vertex x="4.92" y="6.2299875"/>
<vertex x="4.92" y="7.3300125"/>
<vertex x="4.908475" y="7.44704375"/>
<vertex x="4.874334375" y="7.55959375"/>
<vertex x="4.81888125" y="7.66334375"/>
<vertex x="4.744265625" y="7.754265625"/>
<vertex x="4.65334375" y="7.82888125"/>
<vertex x="4.54959375" y="7.884334375"/>
<vertex x="4.43704375" y="7.918475"/>
<vertex x="4.32" y="7.930003125"/>
<vertex x="4.20295625" y="7.918475"/>
<vertex x="4.09040625" y="7.884334375"/>
<vertex x="3.98665625" y="7.82888125"/>
<vertex x="3.895734375" y="7.754265625"/>
<vertex x="3.82111875" y="7.66334375"/>
<vertex x="3.765665625" y="7.55959375"/>
<vertex x="3.731525" y="7.44704375"/>
<vertex x="3.72" y="7.3300125"/>
<vertex x="3.72" y="6.2299875"/>
<vertex x="3.731525" y="6.11295625"/>
<vertex x="3.765665625" y="6.00040625"/>
<vertex x="3.82111875" y="5.89665625"/>
<vertex x="3.895734375" y="5.805734375"/>
<vertex x="3.98665625" y="5.73111875"/>
<vertex x="4.09040625" y="5.675665625"/>
</polygon>
<wire x1="-4.62" y1="3" x2="-4.32" y2="3.3" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="3.3" x2="-4.02" y2="3" width="0" layer="46" curve="-90"/>
<wire x1="-4.02" y1="3" x2="-4.02" y2="2.2" width="0" layer="46"/>
<wire x1="-4.02" y1="2.2" x2="-4.32" y2="1.9" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="1.9" x2="-4.62" y2="2.2" width="0" layer="46" curve="-90"/>
<wire x1="-4.62" y1="2.2" x2="-4.62" y2="3" width="0" layer="46"/>
<polygon width="0.01" layer="1" pour="solid">
<vertex x="-4.4312625" y="1.7125375"/>
<vertex x="-4.32" y="1.7"/>
<vertex x="-4.2087375" y="1.7125375"/>
<vertex x="-4.103053125" y="1.749515625"/>
<vertex x="-4.0082625" y="1.809078125"/>
<vertex x="-3.929078125" y="1.8882625"/>
<vertex x="-3.869515625" y="1.983053125"/>
<vertex x="-3.8325375" y="2.0887375"/>
<vertex x="-3.82" y="2.20000625"/>
<vertex x="-3.82" y="2.99999375"/>
<vertex x="-3.8325375" y="3.1112625"/>
<vertex x="-3.869515625" y="3.216946875"/>
<vertex x="-3.929078125" y="3.3117375"/>
<vertex x="-4.0082625" y="3.390921875"/>
<vertex x="-4.103053125" y="3.450484375"/>
<vertex x="-4.2087375" y="3.4874625"/>
<vertex x="-4.32" y="3.5"/>
<vertex x="-4.4312625" y="3.4874625"/>
<vertex x="-4.536946875" y="3.450484375"/>
<vertex x="-4.6317375" y="3.390921875"/>
<vertex x="-4.710921875" y="3.3117375"/>
<vertex x="-4.770484375" y="3.216946875"/>
<vertex x="-4.8074625" y="3.1112625"/>
<vertex x="-4.82" y="2.99999375"/>
<vertex x="-4.82" y="2.20000625"/>
<vertex x="-4.8074625" y="2.0887375"/>
<vertex x="-4.770484375" y="1.983053125"/>
<vertex x="-4.710921875" y="1.8882625"/>
<vertex x="-4.6317375" y="1.809078125"/>
<vertex x="-4.536946875" y="1.749515625"/>
</polygon>
<polygon width="0.01" layer="16" pour="solid">
<vertex x="-4.4312625" y="1.7125375"/>
<vertex x="-4.32" y="1.7"/>
<vertex x="-4.2087375" y="1.7125375"/>
<vertex x="-4.103053125" y="1.749515625"/>
<vertex x="-4.0082625" y="1.809078125"/>
<vertex x="-3.929078125" y="1.8882625"/>
<vertex x="-3.869515625" y="1.983053125"/>
<vertex x="-3.8325375" y="2.0887375"/>
<vertex x="-3.82" y="2.20000625"/>
<vertex x="-3.82" y="2.99999375"/>
<vertex x="-3.8325375" y="3.1112625"/>
<vertex x="-3.869515625" y="3.216946875"/>
<vertex x="-3.929078125" y="3.3117375"/>
<vertex x="-4.0082625" y="3.390921875"/>
<vertex x="-4.103053125" y="3.450484375"/>
<vertex x="-4.2087375" y="3.4874625"/>
<vertex x="-4.32" y="3.5"/>
<vertex x="-4.4312625" y="3.4874625"/>
<vertex x="-4.536946875" y="3.450484375"/>
<vertex x="-4.6317375" y="3.390921875"/>
<vertex x="-4.710921875" y="3.3117375"/>
<vertex x="-4.770484375" y="3.216946875"/>
<vertex x="-4.8074625" y="3.1112625"/>
<vertex x="-4.82" y="2.99999375"/>
<vertex x="-4.82" y="2.20000625"/>
<vertex x="-4.8074625" y="2.0887375"/>
<vertex x="-4.770484375" y="1.983053125"/>
<vertex x="-4.710921875" y="1.8882625"/>
<vertex x="-4.6317375" y="1.809078125"/>
<vertex x="-4.536946875" y="1.749515625"/>
</polygon>
<polygon width="0.01" layer="29" pour="solid">
<vertex x="-4.43704375" y="1.611525"/>
<vertex x="-4.32" y="1.599996875"/>
<vertex x="-4.20295625" y="1.611525"/>
<vertex x="-4.09040625" y="1.645665625"/>
<vertex x="-3.98665625" y="1.70111875"/>
<vertex x="-3.895734375" y="1.775734375"/>
<vertex x="-3.82111875" y="1.86665625"/>
<vertex x="-3.765665625" y="1.97040625"/>
<vertex x="-3.731525" y="2.08295625"/>
<vertex x="-3.72" y="2.1999875"/>
<vertex x="-3.72" y="3.0000125"/>
<vertex x="-3.731525" y="3.11704375"/>
<vertex x="-3.765665625" y="3.22959375"/>
<vertex x="-3.82111875" y="3.33334375"/>
<vertex x="-3.895734375" y="3.424265625"/>
<vertex x="-3.98665625" y="3.49888125"/>
<vertex x="-4.09040625" y="3.554334375"/>
<vertex x="-4.20295625" y="3.588475"/>
<vertex x="-4.32" y="3.600003125"/>
<vertex x="-4.43704375" y="3.588475"/>
<vertex x="-4.54959375" y="3.554334375"/>
<vertex x="-4.65334375" y="3.49888125"/>
<vertex x="-4.744265625" y="3.424265625"/>
<vertex x="-4.81888125" y="3.33334375"/>
<vertex x="-4.874334375" y="3.22959375"/>
<vertex x="-4.908475" y="3.11704375"/>
<vertex x="-4.92" y="3.0000125"/>
<vertex x="-4.92" y="2.1999875"/>
<vertex x="-4.908475" y="2.08295625"/>
<vertex x="-4.874334375" y="1.97040625"/>
<vertex x="-4.81888125" y="1.86665625"/>
<vertex x="-4.744265625" y="1.775734375"/>
<vertex x="-4.65334375" y="1.70111875"/>
<vertex x="-4.54959375" y="1.645665625"/>
</polygon>
<polygon width="0.01" layer="30" pour="solid">
<vertex x="-4.43704375" y="1.611525"/>
<vertex x="-4.32" y="1.599996875"/>
<vertex x="-4.20295625" y="1.611525"/>
<vertex x="-4.09040625" y="1.645665625"/>
<vertex x="-3.98665625" y="1.70111875"/>
<vertex x="-3.895734375" y="1.775734375"/>
<vertex x="-3.82111875" y="1.86665625"/>
<vertex x="-3.765665625" y="1.97040625"/>
<vertex x="-3.731525" y="2.08295625"/>
<vertex x="-3.72" y="2.1999875"/>
<vertex x="-3.72" y="3.0000125"/>
<vertex x="-3.731525" y="3.11704375"/>
<vertex x="-3.765665625" y="3.22959375"/>
<vertex x="-3.82111875" y="3.33334375"/>
<vertex x="-3.895734375" y="3.424265625"/>
<vertex x="-3.98665625" y="3.49888125"/>
<vertex x="-4.09040625" y="3.554334375"/>
<vertex x="-4.20295625" y="3.588475"/>
<vertex x="-4.32" y="3.600003125"/>
<vertex x="-4.43704375" y="3.588475"/>
<vertex x="-4.54959375" y="3.554334375"/>
<vertex x="-4.65334375" y="3.49888125"/>
<vertex x="-4.744265625" y="3.424265625"/>
<vertex x="-4.81888125" y="3.33334375"/>
<vertex x="-4.874334375" y="3.22959375"/>
<vertex x="-4.908475" y="3.11704375"/>
<vertex x="-4.92" y="3.0000125"/>
<vertex x="-4.92" y="2.1999875"/>
<vertex x="-4.908475" y="2.08295625"/>
<vertex x="-4.874334375" y="1.97040625"/>
<vertex x="-4.81888125" y="1.86665625"/>
<vertex x="-4.744265625" y="1.775734375"/>
<vertex x="-4.65334375" y="1.70111875"/>
<vertex x="-4.54959375" y="1.645665625"/>
</polygon>
<wire x1="4.02" y1="3" x2="4.32" y2="3.3" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="3.3" x2="4.62" y2="3" width="0" layer="46" curve="-90"/>
<wire x1="4.62" y1="3" x2="4.62" y2="2.2" width="0" layer="46"/>
<wire x1="4.62" y1="2.2" x2="4.32" y2="1.9" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="1.9" x2="4.02" y2="2.2" width="0" layer="46" curve="-90"/>
<wire x1="4.02" y1="2.2" x2="4.02" y2="3" width="0" layer="46"/>
<polygon width="0.01" layer="1" pour="solid">
<vertex x="4.2087375" y="1.7125375"/>
<vertex x="4.32" y="1.7"/>
<vertex x="4.4312625" y="1.7125375"/>
<vertex x="4.536946875" y="1.749515625"/>
<vertex x="4.6317375" y="1.809078125"/>
<vertex x="4.710921875" y="1.8882625"/>
<vertex x="4.770484375" y="1.983053125"/>
<vertex x="4.8074625" y="2.0887375"/>
<vertex x="4.82" y="2.20000625"/>
<vertex x="4.82" y="2.99999375"/>
<vertex x="4.8074625" y="3.1112625"/>
<vertex x="4.770484375" y="3.216946875"/>
<vertex x="4.710921875" y="3.3117375"/>
<vertex x="4.6317375" y="3.390921875"/>
<vertex x="4.536946875" y="3.450484375"/>
<vertex x="4.4312625" y="3.4874625"/>
<vertex x="4.32" y="3.5"/>
<vertex x="4.2087375" y="3.4874625"/>
<vertex x="4.103053125" y="3.450484375"/>
<vertex x="4.0082625" y="3.390921875"/>
<vertex x="3.929078125" y="3.3117375"/>
<vertex x="3.869515625" y="3.216946875"/>
<vertex x="3.8325375" y="3.1112625"/>
<vertex x="3.82" y="2.99999375"/>
<vertex x="3.82" y="2.20000625"/>
<vertex x="3.8325375" y="2.0887375"/>
<vertex x="3.869515625" y="1.983053125"/>
<vertex x="3.929078125" y="1.8882625"/>
<vertex x="4.0082625" y="1.809078125"/>
<vertex x="4.103053125" y="1.749515625"/>
</polygon>
<polygon width="0.01" layer="16" pour="solid">
<vertex x="4.2087375" y="1.7125375"/>
<vertex x="4.32" y="1.7"/>
<vertex x="4.4312625" y="1.7125375"/>
<vertex x="4.536946875" y="1.749515625"/>
<vertex x="4.6317375" y="1.809078125"/>
<vertex x="4.710921875" y="1.8882625"/>
<vertex x="4.770484375" y="1.983053125"/>
<vertex x="4.8074625" y="2.0887375"/>
<vertex x="4.82" y="2.20000625"/>
<vertex x="4.82" y="2.99999375"/>
<vertex x="4.8074625" y="3.1112625"/>
<vertex x="4.770484375" y="3.216946875"/>
<vertex x="4.710921875" y="3.3117375"/>
<vertex x="4.6317375" y="3.390921875"/>
<vertex x="4.536946875" y="3.450484375"/>
<vertex x="4.4312625" y="3.4874625"/>
<vertex x="4.32" y="3.5"/>
<vertex x="4.2087375" y="3.4874625"/>
<vertex x="4.103053125" y="3.450484375"/>
<vertex x="4.0082625" y="3.390921875"/>
<vertex x="3.929078125" y="3.3117375"/>
<vertex x="3.869515625" y="3.216946875"/>
<vertex x="3.8325375" y="3.1112625"/>
<vertex x="3.82" y="2.99999375"/>
<vertex x="3.82" y="2.20000625"/>
<vertex x="3.8325375" y="2.0887375"/>
<vertex x="3.869515625" y="1.983053125"/>
<vertex x="3.929078125" y="1.8882625"/>
<vertex x="4.0082625" y="1.809078125"/>
<vertex x="4.103053125" y="1.749515625"/>
</polygon>
<polygon width="0.01" layer="29" pour="solid">
<vertex x="4.20295625" y="1.611525"/>
<vertex x="4.32" y="1.599996875"/>
<vertex x="4.43704375" y="1.611525"/>
<vertex x="4.54959375" y="1.645665625"/>
<vertex x="4.65334375" y="1.70111875"/>
<vertex x="4.744265625" y="1.775734375"/>
<vertex x="4.81888125" y="1.86665625"/>
<vertex x="4.874334375" y="1.97040625"/>
<vertex x="4.908475" y="2.08295625"/>
<vertex x="4.92" y="2.1999875"/>
<vertex x="4.92" y="3.0000125"/>
<vertex x="4.908475" y="3.11704375"/>
<vertex x="4.874334375" y="3.22959375"/>
<vertex x="4.81888125" y="3.33334375"/>
<vertex x="4.744265625" y="3.424265625"/>
<vertex x="4.65334375" y="3.49888125"/>
<vertex x="4.54959375" y="3.554334375"/>
<vertex x="4.43704375" y="3.588475"/>
<vertex x="4.32" y="3.600003125"/>
<vertex x="4.20295625" y="3.588475"/>
<vertex x="4.09040625" y="3.554334375"/>
<vertex x="3.98665625" y="3.49888125"/>
<vertex x="3.895734375" y="3.424265625"/>
<vertex x="3.82111875" y="3.33334375"/>
<vertex x="3.765665625" y="3.22959375"/>
<vertex x="3.731525" y="3.11704375"/>
<vertex x="3.72" y="3.0000125"/>
<vertex x="3.72" y="2.1999875"/>
<vertex x="3.731525" y="2.08295625"/>
<vertex x="3.765665625" y="1.97040625"/>
<vertex x="3.82111875" y="1.86665625"/>
<vertex x="3.895734375" y="1.775734375"/>
<vertex x="3.98665625" y="1.70111875"/>
<vertex x="4.09040625" y="1.645665625"/>
</polygon>
<polygon width="0.01" layer="30" pour="solid">
<vertex x="4.20295625" y="1.611525"/>
<vertex x="4.32" y="1.599996875"/>
<vertex x="4.43704375" y="1.611525"/>
<vertex x="4.54959375" y="1.645665625"/>
<vertex x="4.65334375" y="1.70111875"/>
<vertex x="4.744265625" y="1.775734375"/>
<vertex x="4.81888125" y="1.86665625"/>
<vertex x="4.874334375" y="1.97040625"/>
<vertex x="4.908475" y="2.08295625"/>
<vertex x="4.92" y="2.1999875"/>
<vertex x="4.92" y="3.0000125"/>
<vertex x="4.908475" y="3.11704375"/>
<vertex x="4.874334375" y="3.22959375"/>
<vertex x="4.81888125" y="3.33334375"/>
<vertex x="4.744265625" y="3.424265625"/>
<vertex x="4.65334375" y="3.49888125"/>
<vertex x="4.54959375" y="3.554334375"/>
<vertex x="4.43704375" y="3.588475"/>
<vertex x="4.32" y="3.600003125"/>
<vertex x="4.20295625" y="3.588475"/>
<vertex x="4.09040625" y="3.554334375"/>
<vertex x="3.98665625" y="3.49888125"/>
<vertex x="3.895734375" y="3.424265625"/>
<vertex x="3.82111875" y="3.33334375"/>
<vertex x="3.765665625" y="3.22959375"/>
<vertex x="3.731525" y="3.11704375"/>
<vertex x="3.72" y="3.0000125"/>
<vertex x="3.72" y="2.1999875"/>
<vertex x="3.731525" y="2.08295625"/>
<vertex x="3.765665625" y="1.97040625"/>
<vertex x="3.82111875" y="1.86665625"/>
<vertex x="3.895734375" y="1.775734375"/>
<vertex x="3.98665625" y="1.70111875"/>
<vertex x="4.09040625" y="1.645665625"/>
</polygon>
<wire x1="-4.47" y1="7.35" x2="-4.47" y2="0" width="0.127" layer="51"/>
<wire x1="-4.47" y1="0" x2="4.47" y2="0" width="0.127" layer="51"/>
<wire x1="4.47" y1="0" x2="4.47" y2="7.35" width="0.127" layer="51"/>
<wire x1="4.47" y1="7.35" x2="-4.47" y2="7.35" width="0.127" layer="51"/>
<wire x1="4.47" y1="0" x2="9.25" y2="0" width="0.127" layer="51"/>
<wire x1="-4.47" y1="5.35" x2="-4.47" y2="3.85" width="0.127" layer="21"/>
<wire x1="4.47" y1="5.35" x2="4.47" y2="3.85" width="0.127" layer="21"/>
<wire x1="4.47" y1="1.35" x2="4.47" y2="0" width="0.127" layer="21"/>
<wire x1="-4.47" y1="1.35" x2="-4.47" y2="0" width="0.127" layer="21"/>
<wire x1="-5.07" y1="8.17" x2="-5.07" y2="-0.25" width="0.05" layer="39"/>
<wire x1="-5.07" y1="-0.25" x2="5.07" y2="-0.25" width="0.05" layer="39"/>
<wire x1="5.07" y1="-0.25" x2="5.07" y2="8.17" width="0.05" layer="39"/>
<wire x1="5.07" y1="8.17" x2="-5.07" y2="8.17" width="0.05" layer="39"/>
<circle x="-3.2" y="8.5" radius="0.1" width="0.2" layer="21"/>
<circle x="-3.2" y="8.5" radius="0.1" width="0.2" layer="51"/>
<text x="5.2" y="0.2" size="1" layer="51">PCB EDGE</text>
<text x="-5.25" y="10.39" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.25" y="9.1" size="1.27" layer="27">&gt;VALUE</text>
<pad name="SH1" x="-4.32" y="6.78" drill="0.6" diameter="1" stop="no"/>
<pad name="SH2" x="4.32" y="6.78" drill="0.6" diameter="1" stop="no"/>
<pad name="SH3" x="-4.32" y="2.6" drill="0.6" diameter="1" stop="no"/>
<pad name="SH4" x="4.32" y="2.6" drill="0.6" diameter="1" stop="no"/>
<smd name="A6" x="-0.25" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="B7" x="-0.75" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="A5" x="-1.25" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="B8" x="-1.75" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="A7" x="0.25" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="B6" x="0.75" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="A8" x="1.25" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="B5" x="1.75" y="7.345" dx="0.3" dy="1.15" layer="1"/>
<smd name="A4_B9" x="-2.4" y="7.345" dx="0.6" dy="1.15" layer="1"/>
<smd name="A1_B12" x="-3.2" y="7.345" dx="0.6" dy="1.15" layer="1"/>
<smd name="B4_A9" x="2.4" y="7.345" dx="0.6" dy="1.15" layer="1"/>
<smd name="B1_A12" x="3.2" y="7.345" dx="0.6" dy="1.15" layer="1"/>
<hole x="-2.89" y="6.28" drill="0.65"/>
<hole x="2.89" y="6.28" drill="0.65"/>
</package>
</packages>
<symbols>
<symbol name="UJ20-C-H-G-SMT-1-P16-TR" library_version="1">
<wire x1="7.62" y1="22.86" x2="7.62" y2="-22.86" width="0.254" layer="94"/>
<wire x1="7.62" y1="-22.86" x2="-7.62" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-22.86" x2="-7.62" y2="22.86" width="0.254" layer="94"/>
<wire x1="-7.62" y1="22.86" x2="7.62" y2="22.86" width="0.254" layer="94"/>
<text x="-7.62" y="23.622" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-23.622" size="1.778" layer="96" align="top-left">&gt;VALUE</text>
<pin name="VBUS" x="12.7" y="20.32" length="middle" direction="pas" rot="R180"/>
<pin name="SHIELD" x="12.7" y="-20.32" length="middle" direction="pas" rot="R180"/>
<pin name="DN1" x="12.7" y="15.24" length="middle" direction="pas" rot="R180"/>
<pin name="DP1" x="12.7" y="12.7" length="middle" direction="pas" rot="R180"/>
<pin name="DN2" x="12.7" y="7.62" length="middle" direction="pas" rot="R180"/>
<pin name="DP2" x="12.7" y="5.08" length="middle" direction="pas" rot="R180"/>
<pin name="GND" x="12.7" y="-15.24" length="middle" direction="pas" rot="R180"/>
<pin name="CC1" x="12.7" y="0" length="middle" direction="pas" rot="R180"/>
<pin name="SBU1" x="12.7" y="-2.54" length="middle" direction="pas" rot="R180"/>
<pin name="CC2" x="12.7" y="-7.62" length="middle" direction="pas" rot="R180"/>
<pin name="SBU2" x="12.7" y="-10.16" length="middle" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="UJ20-C-H-G-SMT-1-P16-TR" prefix="J" library_version="1">
<gates>
<gate name="G$1" symbol="UJ20-C-H-G-SMT-1-P16-TR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SAMESKY_UJ20-C-H-G-SMT-1-P16-TR">
<connects>
<connect gate="G$1" pin="CC1" pad="A5"/>
<connect gate="G$1" pin="CC2" pad="B5"/>
<connect gate="G$1" pin="DN1" pad="A7"/>
<connect gate="G$1" pin="DN2" pad="B7"/>
<connect gate="G$1" pin="DP1" pad="A6"/>
<connect gate="G$1" pin="DP2" pad="B6"/>
<connect gate="G$1" pin="GND" pad="A1_B12 B1_A12"/>
<connect gate="G$1" pin="SBU1" pad="A8"/>
<connect gate="G$1" pin="SBU2" pad="B8"/>
<connect gate="G$1" pin="SHIELD" pad="SH1 SH2 SH3 SH4"/>
<connect gate="G$1" pin="VBUS" pad="A4_B9 B4_A9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MANUFACTURER" value="Same Sky"/>
<attribute name="MAXIMUM_PACKAGE_HEIGHT" value="3.46mm"/>
<attribute name="PARTREV" value="1.0"/>
<attribute name="STANDARD" value="Manufacturer Recommendations"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="PCA9685BS_118" urn="urn:adsk.wipprod:fs.file:vf.ex5Q7jXbQ2igd7ijObffyQ">
<description>&lt;NXP - PCA9685BS,118 - LED Driver, 16 Bit, I2C Bus, 12-bit PWM 24 Hz to 1526 Hz, RGBA color, 2.3 V to 5.5 V in, HVQFN-28&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="QFN65P600X600X100-29N" library_version="5">
<description>&lt;b&gt;HVQFN-28&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="-2.85" y="1.95" dx="1.05" dy="0.35" layer="1"/>
<smd name="2" x="-2.85" y="1.3" dx="1.05" dy="0.35" layer="1"/>
<smd name="3" x="-2.85" y="0.65" dx="1.05" dy="0.35" layer="1"/>
<smd name="4" x="-2.85" y="0" dx="1.05" dy="0.35" layer="1"/>
<smd name="5" x="-2.85" y="-0.65" dx="1.05" dy="0.35" layer="1"/>
<smd name="6" x="-2.85" y="-1.3" dx="1.05" dy="0.35" layer="1"/>
<smd name="7" x="-2.85" y="-1.95" dx="1.05" dy="0.35" layer="1"/>
<smd name="8" x="-1.95" y="-2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="9" x="-1.3" y="-2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="10" x="-0.65" y="-2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="11" x="0" y="-2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="12" x="0.65" y="-2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="13" x="1.3" y="-2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="14" x="1.95" y="-2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="15" x="2.85" y="-1.95" dx="1.05" dy="0.35" layer="1"/>
<smd name="16" x="2.85" y="-1.3" dx="1.05" dy="0.35" layer="1"/>
<smd name="17" x="2.85" y="-0.65" dx="1.05" dy="0.35" layer="1"/>
<smd name="18" x="2.85" y="0" dx="1.05" dy="0.35" layer="1"/>
<smd name="19" x="2.85" y="0.65" dx="1.05" dy="0.35" layer="1"/>
<smd name="20" x="2.85" y="1.3" dx="1.05" dy="0.35" layer="1"/>
<smd name="21" x="2.85" y="1.95" dx="1.05" dy="0.35" layer="1"/>
<smd name="22" x="1.95" y="2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="23" x="1.3" y="2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="24" x="0.65" y="2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="25" x="0" y="2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="26" x="-0.65" y="2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="27" x="-1.3" y="2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<smd name="28" x="-1.95" y="2.85" dx="1.05" dy="0.35" layer="1" rot="R90"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-3.6" y1="3.6" x2="3.6" y2="3.6" width="0.05" layer="51"/>
<wire x1="3.6" y1="3.6" x2="3.6" y2="-3.6" width="0.05" layer="51"/>
<wire x1="3.6" y1="-3.6" x2="-3.6" y2="-3.6" width="0.05" layer="51"/>
<wire x1="-3.6" y1="-3.6" x2="-3.6" y2="3.6" width="0.05" layer="51"/>
<wire x1="-3" y1="3" x2="3" y2="3" width="0.1" layer="51"/>
<wire x1="3" y1="3" x2="3" y2="-3" width="0.1" layer="51"/>
<wire x1="3" y1="-3" x2="-3" y2="-3" width="0.1" layer="51"/>
<wire x1="-3" y1="-3" x2="-3" y2="3" width="0.1" layer="51"/>
<wire x1="-3" y1="2.35" x2="-2.35" y2="3" width="0.1" layer="51"/>
<circle x="-3.3745" y="2.925" radius="0.1625" width="0.325" layer="25"/>
</package>
</packages>
<symbols>
<symbol name="PCA9685BS,118" library_version="5">
<wire x1="5.08" y1="12.7" x2="27.94" y2="12.7" width="0.254" layer="94"/>
<wire x1="27.94" y1="-27.94" x2="27.94" y2="12.7" width="0.254" layer="94"/>
<wire x1="27.94" y1="-27.94" x2="5.08" y2="-27.94" width="0.254" layer="94"/>
<wire x1="5.08" y1="12.7" x2="5.08" y2="-27.94" width="0.254" layer="94"/>
<text x="29.21" y="17.78" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="29.21" y="15.24" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="A3" x="0" y="0" length="middle"/>
<pin name="A4" x="0" y="-2.54" length="middle"/>
<pin name="LED0" x="0" y="-5.08" length="middle"/>
<pin name="LED1" x="0" y="-7.62" length="middle"/>
<pin name="LED2" x="0" y="-10.16" length="middle"/>
<pin name="LED3" x="0" y="-12.7" length="middle"/>
<pin name="LED4" x="0" y="-15.24" length="middle"/>
<pin name="LED5" x="7.62" y="-33.02" length="middle" rot="R90"/>
<pin name="LED6" x="10.16" y="-33.02" length="middle" rot="R90"/>
<pin name="LED7" x="12.7" y="-33.02" length="middle" rot="R90"/>
<pin name="VSS" x="15.24" y="-33.02" length="middle" rot="R90"/>
<pin name="LED8" x="17.78" y="-33.02" length="middle" rot="R90"/>
<pin name="LED9" x="20.32" y="-33.02" length="middle" rot="R90"/>
<pin name="LED10" x="22.86" y="-33.02" length="middle" rot="R90"/>
<pin name="A5" x="33.02" y="0" length="middle" rot="R180"/>
<pin name="!OE" x="33.02" y="-2.54" length="middle" rot="R180"/>
<pin name="LED15" x="33.02" y="-5.08" length="middle" rot="R180"/>
<pin name="LED14" x="33.02" y="-7.62" length="middle" rot="R180"/>
<pin name="LED13" x="33.02" y="-10.16" length="middle" rot="R180"/>
<pin name="LED12" x="33.02" y="-12.7" length="middle" rot="R180"/>
<pin name="LED11" x="33.02" y="-15.24" length="middle" rot="R180"/>
<pin name="A2" x="10.16" y="17.78" length="middle" rot="R270"/>
<pin name="A1" x="12.7" y="17.78" length="middle" rot="R270"/>
<pin name="A0" x="15.24" y="17.78" length="middle" rot="R270"/>
<pin name="VDD" x="17.78" y="17.78" length="middle" rot="R270"/>
<pin name="SDA" x="20.32" y="17.78" length="middle" rot="R270"/>
<pin name="SCL" x="22.86" y="17.78" length="middle" rot="R270"/>
<pin name="EXTCLK" x="25.4" y="17.78" length="middle" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PCA9685BS,118" prefix="IC" library_version="5">
<description>&lt;b&gt;NXP - PCA9685BS,118 - LED Driver, 16 Bit, I2C Bus, 12-bit PWM 24 Hz to 1526 Hz, RGBA color, 2.3 V to 5.5 V in, HVQFN-28&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://www.nxp.com/docs/en/data-sheet/PCA9685.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="PCA9685BS,118" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QFN65P600X600X100-29N">
<connects>
<connect gate="G$1" pin="!OE" pad="20"/>
<connect gate="G$1" pin="A0" pad="26"/>
<connect gate="G$1" pin="A1" pad="27"/>
<connect gate="G$1" pin="A2" pad="28"/>
<connect gate="G$1" pin="A3" pad="1"/>
<connect gate="G$1" pin="A4" pad="2"/>
<connect gate="G$1" pin="A5" pad="21"/>
<connect gate="G$1" pin="EXTCLK" pad="22"/>
<connect gate="G$1" pin="LED0" pad="3"/>
<connect gate="G$1" pin="LED1" pad="4"/>
<connect gate="G$1" pin="LED10" pad="14"/>
<connect gate="G$1" pin="LED11" pad="15"/>
<connect gate="G$1" pin="LED12" pad="16"/>
<connect gate="G$1" pin="LED13" pad="17"/>
<connect gate="G$1" pin="LED14" pad="18"/>
<connect gate="G$1" pin="LED15" pad="19"/>
<connect gate="G$1" pin="LED2" pad="5"/>
<connect gate="G$1" pin="LED3" pad="6"/>
<connect gate="G$1" pin="LED4" pad="7"/>
<connect gate="G$1" pin="LED5" pad="8"/>
<connect gate="G$1" pin="LED6" pad="9"/>
<connect gate="G$1" pin="LED7" pad="10"/>
<connect gate="G$1" pin="LED8" pad="12"/>
<connect gate="G$1" pin="LED9" pad="13"/>
<connect gate="G$1" pin="SCL" pad="23"/>
<connect gate="G$1" pin="SDA" pad="24"/>
<connect gate="G$1" pin="VDD" pad="25"/>
<connect gate="G$1" pin="VSS" pad="11"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value="NXP - PCA9685BS,118 - LED Driver, 16 Bit, I2C Bus, 12-bit PWM 24 Hz to 1526 Hz, RGBA color, 2.3 V to 5.5 V in, HVQFN-28" constant="no"/>
<attribute name="HEIGHT" value="1mm" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="NXP" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="PCA9685BS,118" constant="no"/>
<attribute name="MOUSER_PART_NUMBER" value="771-PCA9685BS118" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/NXP-Semiconductors/PCA9685BS118?qs=beN0Cyoe8Yle51zseU5uxw%3D%3D" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="TL1963A-33DCYR" urn="urn:adsk.wipprod:fs.file:vf.nukNfVCiQSiYwS2wA_aO-Q">
<description>&lt;1.5-A Low-Noise Fast-Transient-Response Low-Dropout Regulator&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="SOT230P700X180-4N" library_version="1">
<description>&lt;b&gt;SOT-223-4&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="-3.1" y="2.3" dx="1.8" dy="0.95" layer="1"/>
<smd name="2" x="-3.1" y="0" dx="1.8" dy="0.95" layer="1"/>
<smd name="3" x="-3.1" y="-2.3" dx="1.8" dy="0.95" layer="1"/>
<smd name="4" x="3.1" y="0" dx="3.2" dy="1.8" layer="1" rot="R90"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-4.25" y1="3.6" x2="4.25" y2="3.6" width="0.05" layer="51"/>
<wire x1="4.25" y1="3.6" x2="4.25" y2="-3.6" width="0.05" layer="51"/>
<wire x1="4.25" y1="-3.6" x2="-4.25" y2="-3.6" width="0.05" layer="51"/>
<wire x1="-4.25" y1="-3.6" x2="-4.25" y2="3.6" width="0.05" layer="51"/>
<wire x1="-1.75" y1="3.25" x2="1.75" y2="3.25" width="0.1" layer="51"/>
<wire x1="1.75" y1="3.25" x2="1.75" y2="-3.25" width="0.1" layer="51"/>
<wire x1="1.75" y1="-3.25" x2="-1.75" y2="-3.25" width="0.1" layer="51"/>
<wire x1="-1.75" y1="-3.25" x2="-1.75" y2="3.25" width="0.1" layer="51"/>
<wire x1="-1.75" y1="0.95" x2="0.55" y2="3.25" width="0.1" layer="51"/>
<wire x1="-1.75" y1="3.25" x2="1.75" y2="3.25" width="0.2" layer="21"/>
<wire x1="1.75" y1="3.25" x2="1.75" y2="-3.25" width="0.2" layer="21"/>
<wire x1="1.75" y1="-3.25" x2="-1.75" y2="-3.25" width="0.2" layer="21"/>
<wire x1="-1.75" y1="-3.25" x2="-1.75" y2="3.25" width="0.2" layer="21"/>
<wire x1="-4" y1="3.125" x2="-2.2" y2="3.125" width="0.2" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="TL1963A-33DCYR" library_version="1">
<wire x1="5.08" y1="2.54" x2="25.4" y2="2.54" width="0.254" layer="94"/>
<wire x1="25.4" y1="-7.62" x2="25.4" y2="2.54" width="0.254" layer="94"/>
<wire x1="25.4" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<text x="26.67" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="26.67" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="IN" x="0" y="0" length="middle" direction="in"/>
<pin name="GND_1" x="0" y="-2.54" length="middle" direction="pwr"/>
<pin name="OUT" x="0" y="-5.08" length="middle" direction="out"/>
<pin name="GND_2" x="30.48" y="0" length="middle" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TL1963A-33DCYR" prefix="PS" library_version="1">
<description>&lt;b&gt;1.5-A Low-Noise Fast-Transient-Response Low-Dropout Regulator&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://www.ti.com/lit/gpn/tl1963a"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="TL1963A-33DCYR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT230P700X180-4N">
<connects>
<connect gate="G$1" pin="GND_1" pad="2"/>
<connect gate="G$1" pin="GND_2" pad="4"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER_PART_NUMBER" value="595-TL1963A-33DCYR" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Texas-Instruments/TL1963A-33DCYR?qs=IK5e5L0zOXhRu%2FNTAfJNEA%3D%3D" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Texas Instruments" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="TL1963A-33DCYR" constant="no"/>
<attribute name="DESCRIPTION" value="1.5-A Low-Noise Fast-Transient-Response Low-Dropout Regulator" constant="no"/>
<attribute name="HEIGHT" value="1.8mm" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="128X32_SSD1306_I2C_LCD" urn="urn:adsk.wipprod:fs.file:vf.zh_29fpLRrK5zHscOdJN4g">
<packages>
<package name="128X32_SSD1306_I2C_LCD_" library_version="24">
<description>Single-row, 4-pin Pin Header (Male) Straight, 2.54 mm (0.10 in) col pitch, 5.84 mm mating length, 10.16 X 5.08 X 8.38 mm body
 &lt;p&gt;Single-row (1X4), 4-pin Pin Header (Male) Straight package with 2.54 mm (0.10 in) col pitch, 0.64 mm lead width, 3.00 mm tail length and 5.84 mm mating length  with overall size 10.16 X 5.08 X 8.38 mm, pin pattern - clockwise from top left&lt;/p&gt;</description>
<pad name="SDA" x="1.5" y="9.81" drill="1.1051" diameter="1.7051" rot="R180"/>
<pad name="SCL" x="1.5" y="7.27" drill="1.1051" diameter="1.7051" rot="R180"/>
<pad name="VCC" x="1.5" y="4.73" drill="1.1051" diameter="1.7051"/>
<pad name="GND" x="1.5" y="2.19" drill="1.1051" diameter="1.7051" rot="R180"/>
<text x="22.86" y="5.199" size="1.27" layer="25" align="bottom-center">128X32_SSD1306_I2C_LCD</text>
<wire x1="0" y1="0" x2="0" y2="12" width="0.127" layer="21"/>
<wire x1="0" y1="0" x2="38" y2="0" width="0.127" layer="21"/>
<wire x1="0" y1="12" x2="38" y2="12" width="0.127" layer="21"/>
<wire x1="38" y1="0" x2="38" y2="12" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="128X32_SSD1306_I2C_LCD" library_version="24">
<description>128 x 32 SSD1306 I2C LCD</description>
<wire x1="0" y1="0" x2="0" y2="20.32" width="0.254" layer="94"/>
<wire x1="0" y1="20.32" x2="43.18" y2="20.32" width="0.254" layer="94"/>
<wire x1="43.18" y1="20.32" x2="43.18" y2="0" width="0.254" layer="94"/>
<wire x1="43.18" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<pin name="GND" x="-5.08" y="2.54" length="middle"/>
<pin name="VCC" x="-5.08" y="7.62" length="middle"/>
<pin name="SCL" x="-5.08" y="12.7" length="middle"/>
<pin name="SDA" x="-5.08" y="17.78" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="128X32_SSD1306_I2C_LCD" library_version="24">
<description>128 x 32 SSD1306 I2C LCD</description>
<gates>
<gate name="G$1" symbol="128X32_SSD1306_I2C_LCD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="128X32_SSD1306_I2C_LCD_">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name="">
<attribute name="CATEGORY_L1" value="" constant="no"/>
<attribute name="DATASHEET" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="CATEGORY_L2" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="VALUE" value="" constant="no"/>
<attribute name="VENDOR" value="" constant="no"/>
<attribute name="VPN" value="" constant="no"/>
<attribute name="PACKAGE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="XC6206P122MR-G" urn="urn:adsk.wipprod:fs.file:vf.NEs_bSMgQmembkkqPoqipw">
<description>&lt;LDO Voltage Regulators 1uA Low Quiescent 3 Terminal, Low ESR Cap. Compatible, Voltage Regulator&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="SOT95P280X130-3N" library_version="1">
<description>&lt;b&gt;SOT-23&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="-1.4" y="0.95" dx="0.9" dy="0.6" layer="1"/>
<smd name="2" x="-1.4" y="-0.95" dx="0.9" dy="0.6" layer="1"/>
<smd name="3" x="1.4" y="0" dx="0.9" dy="0.6" layer="1"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-2.1" y1="1.8" x2="2.1" y2="1.8" width="0.05" layer="51"/>
<wire x1="2.1" y1="1.8" x2="2.1" y2="-1.8" width="0.05" layer="51"/>
<wire x1="2.1" y1="-1.8" x2="-2.1" y2="-1.8" width="0.05" layer="51"/>
<wire x1="-2.1" y1="-1.8" x2="-2.1" y2="1.8" width="0.05" layer="51"/>
<wire x1="-0.825" y1="1.45" x2="0.825" y2="1.45" width="0.1" layer="51"/>
<wire x1="0.825" y1="1.45" x2="0.825" y2="-1.45" width="0.1" layer="51"/>
<wire x1="0.825" y1="-1.45" x2="-0.825" y2="-1.45" width="0.1" layer="51"/>
<wire x1="-0.825" y1="-1.45" x2="-0.825" y2="1.45" width="0.1" layer="51"/>
<wire x1="-0.825" y1="0.5" x2="0.125" y2="1.45" width="0.1" layer="51"/>
<wire x1="-0.6" y1="1.45" x2="0.6" y2="1.45" width="0.2" layer="21"/>
<wire x1="0.6" y1="1.45" x2="0.6" y2="-1.45" width="0.2" layer="21"/>
<wire x1="0.6" y1="-1.45" x2="-0.6" y2="-1.45" width="0.2" layer="21"/>
<wire x1="-0.6" y1="-1.45" x2="-0.6" y2="1.45" width="0.2" layer="21"/>
<wire x1="-1.85" y1="1.5" x2="-0.95" y2="1.5" width="0.2" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="XC6206P122MR-G" library_version="1">
<wire x1="5.08" y1="2.54" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="-5.08" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<text x="24.13" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="24.13" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="VSS" x="0" y="0" length="middle"/>
<pin name="VOUT" x="0" y="-2.54" length="middle"/>
<pin name="VIN" x="27.94" y="0" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="XC6206P122MR-G" prefix="IC" library_version="1">
<description>&lt;b&gt;LDO Voltage Regulators 1uA Low Quiescent 3 Terminal, Low ESR Cap. Compatible, Voltage Regulator&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="https://www.torexsemi.com/file/xc6206/XC6206.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="XC6206P122MR-G" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT95P280X130-3N">
<connects>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT" pad="2"/>
<connect gate="G$1" pin="VSS" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER_PART_NUMBER" value="865-XC6206P122MR-G" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Torex-Semiconductor/XC6206P122MR-G?qs=AsjdqWjXhJ%2F35%2FU%2FZk2JYg%3D%3D" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Torex" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="XC6206P122MR-G" constant="no"/>
<attribute name="DESCRIPTION" value="LDO Voltage Regulators 1uA Low Quiescent 3 Terminal, Low ESR Cap. Compatible, Voltage Regulator" constant="no"/>
<attribute name="HEIGHT" value="1.3mm" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="XC6206P282MR-G" urn="urn:adsk.wipprod:fs.file:vf.dxXTFAhhT2yqCCWQlP4POQ">
<description>&lt;LDO Voltage Regulators 1uA Low Quiescent 3 Terminal, Low ESR Cap. Compatible, Voltage Regulator&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="SOT95P280X130-3N" library_version="1">
<description>&lt;b&gt;XC6206P282MR-G&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="-1.4" y="0.95" dx="0.9" dy="0.6" layer="1"/>
<smd name="2" x="-1.4" y="-0.95" dx="0.9" dy="0.6" layer="1"/>
<smd name="3" x="1.4" y="0" dx="0.9" dy="0.6" layer="1"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-2.1" y1="1.8" x2="2.1" y2="1.8" width="0.05" layer="51"/>
<wire x1="2.1" y1="1.8" x2="2.1" y2="-1.8" width="0.05" layer="51"/>
<wire x1="2.1" y1="-1.8" x2="-2.1" y2="-1.8" width="0.05" layer="51"/>
<wire x1="-2.1" y1="-1.8" x2="-2.1" y2="1.8" width="0.05" layer="51"/>
<wire x1="-0.825" y1="1.45" x2="0.825" y2="1.45" width="0.1" layer="51"/>
<wire x1="0.825" y1="1.45" x2="0.825" y2="-1.45" width="0.1" layer="51"/>
<wire x1="0.825" y1="-1.45" x2="-0.825" y2="-1.45" width="0.1" layer="51"/>
<wire x1="-0.825" y1="-1.45" x2="-0.825" y2="1.45" width="0.1" layer="51"/>
<wire x1="-0.825" y1="0.5" x2="0.125" y2="1.45" width="0.1" layer="51"/>
<wire x1="-0.6" y1="1.45" x2="0.6" y2="1.45" width="0.2" layer="21"/>
<wire x1="0.6" y1="1.45" x2="0.6" y2="-1.45" width="0.2" layer="21"/>
<wire x1="0.6" y1="-1.45" x2="-0.6" y2="-1.45" width="0.2" layer="21"/>
<wire x1="-0.6" y1="-1.45" x2="-0.6" y2="1.45" width="0.2" layer="21"/>
<wire x1="-1.85" y1="1.5" x2="-0.95" y2="1.5" width="0.2" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="XC6206P282MR-G" library_version="1">
<wire x1="5.08" y1="2.54" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="-5.08" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<text x="24.13" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="24.13" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="VSS" x="0" y="0" length="middle"/>
<pin name="VOUT" x="0" y="-2.54" length="middle"/>
<pin name="VIN" x="27.94" y="0" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="XC6206P282MR-G" prefix="IC" library_version="1">
<description>&lt;b&gt;LDO Voltage Regulators 1uA Low Quiescent 3 Terminal, Low ESR Cap. Compatible, Voltage Regulator&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="https://www.torexsemi.com/file/xc6206/XC6206.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="XC6206P282MR-G" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT95P280X130-3N">
<connects>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT" pad="2"/>
<connect gate="G$1" pin="VSS" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER_PART_NUMBER" value="865-XC6206P282MR-G" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Torex-Semiconductor/XC6206P282MR-G?qs=AsjdqWjXhJ%2Fpd3DOBopSeA%3D%3D" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Torex" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="XC6206P282MR-G" constant="no"/>
<attribute name="DESCRIPTION" value="LDO Voltage Regulators 1uA Low Quiescent 3 Terminal, Low ESR Cap. Compatible, Voltage Regulator" constant="no"/>
<attribute name="HEIGHT" value="1.3mm" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Capacitor" urn="urn:adsk.eagle:library:16290819">
<description>&lt;B&gt;Capacitors - Fixed, Variable, Trimmers</description>
<packages>
<package name="CAPC1005X60" urn="urn:adsk.eagle:footprint:16290849/5" library_version="19">
<description>Chip, 1.00 X 0.50 X 0.60 mm body
&lt;p&gt;Chip package with body size 1.00 X 0.50 X 0.60 mm&lt;/p&gt;</description>
<wire x1="0.55" y1="0.6286" x2="-0.55" y2="0.6286" width="0.127" layer="21"/>
<wire x1="0.55" y1="-0.6286" x2="-0.55" y2="-0.6286" width="0.127" layer="21"/>
<wire x1="0.55" y1="-0.3" x2="-0.55" y2="-0.3" width="0.12" layer="51"/>
<wire x1="-0.55" y1="-0.3" x2="-0.55" y2="0.3" width="0.12" layer="51"/>
<wire x1="-0.55" y1="0.3" x2="0.55" y2="0.3" width="0.12" layer="51"/>
<wire x1="0.55" y1="0.3" x2="0.55" y2="-0.3" width="0.12" layer="51"/>
<smd name="1" x="-0.4846" y="0" dx="0.56" dy="0.6291" layer="1"/>
<smd name="2" x="0.4846" y="0" dx="0.56" dy="0.6291" layer="1"/>
<text x="0" y="1.2636" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.2636" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC1110X102" urn="urn:adsk.eagle:footprint:16290845/5" library_version="19">
<description>Chip, 1.17 X 1.02 X 1.02 mm body
&lt;p&gt;Chip package with body size 1.17 X 1.02 X 1.02 mm&lt;/p&gt;</description>
<wire x1="0.66" y1="0.9552" x2="-0.66" y2="0.9552" width="0.127" layer="21"/>
<wire x1="0.66" y1="-0.9552" x2="-0.66" y2="-0.9552" width="0.127" layer="21"/>
<wire x1="0.66" y1="-0.635" x2="-0.66" y2="-0.635" width="0.12" layer="51"/>
<wire x1="-0.66" y1="-0.635" x2="-0.66" y2="0.635" width="0.12" layer="51"/>
<wire x1="-0.66" y1="0.635" x2="0.66" y2="0.635" width="0.12" layer="51"/>
<wire x1="0.66" y1="0.635" x2="0.66" y2="-0.635" width="0.12" layer="51"/>
<smd name="1" x="-0.5388" y="0" dx="0.6626" dy="1.2823" layer="1"/>
<smd name="2" x="0.5388" y="0" dx="0.6626" dy="1.2823" layer="1"/>
<text x="0" y="1.5902" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.5902" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC1608X85" urn="urn:adsk.eagle:footprint:16290847/5" library_version="19">
<description>Chip, 1.60 X 0.80 X 0.85 mm body
&lt;p&gt;Chip package with body size 1.60 X 0.80 X 0.85 mm&lt;/p&gt;</description>
<wire x1="0.875" y1="0.7991" x2="-0.875" y2="0.7991" width="0.127" layer="21"/>
<wire x1="0.875" y1="-0.7991" x2="-0.875" y2="-0.7991" width="0.127" layer="21"/>
<wire x1="0.875" y1="-0.475" x2="-0.875" y2="-0.475" width="0.12" layer="51"/>
<wire x1="-0.875" y1="-0.475" x2="-0.875" y2="0.475" width="0.12" layer="51"/>
<wire x1="-0.875" y1="0.475" x2="0.875" y2="0.475" width="0.12" layer="51"/>
<wire x1="0.875" y1="0.475" x2="0.875" y2="-0.475" width="0.12" layer="51"/>
<smd name="1" x="-0.7746" y="0" dx="0.9209" dy="0.9702" layer="1"/>
<smd name="2" x="0.7746" y="0" dx="0.9209" dy="0.9702" layer="1"/>
<text x="0" y="1.4341" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.4341" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC2012X110" urn="urn:adsk.eagle:footprint:16290848/5" library_version="19">
<description>Chip, 2.00 X 1.25 X 1.10 mm body
&lt;p&gt;Chip package with body size 2.00 X 1.25 X 1.10 mm&lt;/p&gt;</description>
<wire x1="1.1" y1="1.0467" x2="-1.1" y2="1.0467" width="0.127" layer="21"/>
<wire x1="1.1" y1="-1.0467" x2="-1.1" y2="-1.0467" width="0.127" layer="21"/>
<wire x1="1.1" y1="-0.725" x2="-1.1" y2="-0.725" width="0.12" layer="51"/>
<wire x1="-1.1" y1="-0.725" x2="-1.1" y2="0.725" width="0.12" layer="51"/>
<wire x1="-1.1" y1="0.725" x2="1.1" y2="0.725" width="0.12" layer="51"/>
<wire x1="1.1" y1="0.725" x2="1.1" y2="-0.725" width="0.12" layer="51"/>
<smd name="1" x="-0.8754" y="0" dx="1.1646" dy="1.4653" layer="1"/>
<smd name="2" x="0.8754" y="0" dx="1.1646" dy="1.4653" layer="1"/>
<text x="0" y="1.6817" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.6817" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC3216X135" urn="urn:adsk.eagle:footprint:16290836/5" library_version="19">
<description>Chip, 3.20 X 1.60 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 1.60 X 1.35 mm&lt;/p&gt;</description>
<wire x1="1.7" y1="1.2217" x2="-1.7" y2="1.2217" width="0.127" layer="21"/>
<wire x1="1.7" y1="-1.2217" x2="-1.7" y2="-1.2217" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.9" x2="-1.7" y2="-0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-0.9" x2="-1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="0.9" x2="1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="1.7" y1="0.9" x2="1.7" y2="-0.9" width="0.12" layer="51"/>
<smd name="1" x="-1.4754" y="0" dx="1.1646" dy="1.8153" layer="1"/>
<smd name="2" x="1.4754" y="0" dx="1.1646" dy="1.8153" layer="1"/>
<text x="0" y="1.8567" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.8567" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC3225X135" urn="urn:adsk.eagle:footprint:16290843/5" library_version="19">
<description>Chip, 3.20 X 2.50 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 2.50 X 1.35 mm&lt;/p&gt;</description>
<wire x1="1.7" y1="1.6717" x2="-1.7" y2="1.6717" width="0.127" layer="21"/>
<wire x1="1.7" y1="-1.6717" x2="-1.7" y2="-1.6717" width="0.12" layer="21"/>
<wire x1="1.7" y1="-1.35" x2="-1.7" y2="-1.35" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-1.35" x2="-1.7" y2="1.35" width="0.12" layer="51"/>
<wire x1="-1.7" y1="1.35" x2="1.7" y2="1.35" width="0.12" layer="51"/>
<wire x1="1.7" y1="1.35" x2="1.7" y2="-1.35" width="0.12" layer="51"/>
<smd name="1" x="-1.4754" y="0" dx="1.1646" dy="2.7153" layer="1"/>
<smd name="2" x="1.4754" y="0" dx="1.1646" dy="2.7153" layer="1"/>
<text x="0" y="2.3067" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.3067" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC4532X135" urn="urn:adsk.eagle:footprint:16290841/5" library_version="19">
<description>Chip, 4.50 X 3.20 X 1.35 mm body
&lt;p&gt;Chip package with body size 4.50 X 3.20 X 1.35 mm&lt;/p&gt;</description>
<wire x1="2.4" y1="2.0217" x2="-2.4" y2="2.0217" width="0.127" layer="21"/>
<wire x1="2.4" y1="-2.0217" x2="-2.4" y2="-2.0217" width="0.127" layer="21"/>
<wire x1="2.4" y1="-1.7" x2="-2.4" y2="-1.7" width="0.12" layer="51"/>
<wire x1="-2.4" y1="-1.7" x2="-2.4" y2="1.7" width="0.12" layer="51"/>
<wire x1="-2.4" y1="1.7" x2="2.4" y2="1.7" width="0.12" layer="51"/>
<wire x1="2.4" y1="1.7" x2="2.4" y2="-1.7" width="0.12" layer="51"/>
<smd name="1" x="-2.0565" y="0" dx="1.3973" dy="3.4153" layer="1"/>
<smd name="2" x="2.0565" y="0" dx="1.3973" dy="3.4153" layer="1"/>
<text x="0" y="2.6567" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.6567" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM3216X180" urn="urn:adsk.eagle:footprint:16290835/5" library_version="19">
<description>Molded Body, 3.20 X 1.60 X 1.80 mm body
&lt;p&gt;Molded Body package with body size 3.20 X 1.60 X 1.80 mm&lt;/p&gt;</description>
<wire x1="-1.7" y1="0.9084" x2="1.7" y2="0.9084" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-0.9084" x2="1.7" y2="-0.9084" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.9" x2="-1.7" y2="-0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="-0.9" x2="-1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="-1.7" y1="0.9" x2="1.7" y2="0.9" width="0.12" layer="51"/>
<wire x1="1.7" y1="0.9" x2="1.7" y2="-0.9" width="0.12" layer="51"/>
<smd name="1" x="-1.3099" y="0" dx="1.7955" dy="1.1887" layer="1"/>
<smd name="2" x="1.3099" y="0" dx="1.7955" dy="1.1887" layer="1"/>
<text x="0" y="1.5434" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-1.5434" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM3528X210" urn="urn:adsk.eagle:footprint:16290844/5" library_version="19">
<description>Molded Body, 3.50 X 2.80 X 2.10 mm body
&lt;p&gt;Molded Body package with body size 3.50 X 2.80 X 2.10 mm&lt;/p&gt;</description>
<wire x1="-1.85" y1="1.5" x2="1.85" y2="1.5" width="0.127" layer="21"/>
<wire x1="-1.85" y1="-1.5" x2="1.85" y2="-1.5" width="0.127" layer="21"/>
<wire x1="1.85" y1="-1.5" x2="-1.85" y2="-1.5" width="0.12" layer="51"/>
<wire x1="-1.85" y1="-1.5" x2="-1.85" y2="1.5" width="0.12" layer="51"/>
<wire x1="-1.85" y1="1.5" x2="1.85" y2="1.5" width="0.12" layer="51"/>
<wire x1="1.85" y1="1.5" x2="1.85" y2="-1.5" width="0.12" layer="51"/>
<smd name="1" x="-1.4599" y="0" dx="1.7955" dy="2.2036" layer="1"/>
<smd name="2" x="1.4599" y="0" dx="1.7955" dy="2.2036" layer="1"/>
<text x="0" y="2.135" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.135" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM6032X280" urn="urn:adsk.eagle:footprint:16290839/5" library_version="19">
<description>Molded Body, 6.00 X 3.20 X 2.80 mm body
&lt;p&gt;Molded Body package with body size 6.00 X 3.20 X 2.80 mm&lt;/p&gt;</description>
<wire x1="-3.15" y1="1.75" x2="3.15" y2="1.75" width="0.127" layer="21"/>
<wire x1="-3.15" y1="-1.75" x2="3.15" y2="-1.75" width="0.127" layer="21"/>
<wire x1="3.15" y1="-1.75" x2="-3.15" y2="-1.75" width="0.12" layer="51"/>
<wire x1="-3.15" y1="-1.75" x2="-3.15" y2="1.75" width="0.12" layer="51"/>
<wire x1="-3.15" y1="1.75" x2="3.15" y2="1.75" width="0.12" layer="51"/>
<wire x1="3.15" y1="1.75" x2="3.15" y2="-1.75" width="0.12" layer="51"/>
<smd name="1" x="-2.4712" y="0" dx="2.368" dy="2.2036" layer="1"/>
<smd name="2" x="2.4712" y="0" dx="2.368" dy="2.2036" layer="1"/>
<text x="0" y="2.385" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.385" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPM7343X310" urn="urn:adsk.eagle:footprint:16290840/5" library_version="19">
<description>Molded Body, 7.30 X 4.30 X 3.10 mm body
&lt;p&gt;Molded Body package with body size 7.30 X 4.30 X 3.10 mm&lt;/p&gt;</description>
<wire x1="-3.8" y1="2.3" x2="3.8" y2="2.3" width="0.127" layer="21"/>
<wire x1="-3.8" y1="-2.3" x2="3.8" y2="-2.3" width="0.127" layer="21"/>
<wire x1="3.8" y1="-2.3" x2="-3.8" y2="-2.3" width="0.12" layer="51"/>
<wire x1="-3.8" y1="-2.3" x2="-3.8" y2="2.3" width="0.12" layer="51"/>
<wire x1="-3.8" y1="2.3" x2="3.8" y2="2.3" width="0.12" layer="51"/>
<wire x1="3.8" y1="2.3" x2="3.8" y2="-2.3" width="0.12" layer="51"/>
<smd name="1" x="-3.1212" y="0" dx="2.368" dy="2.4036" layer="1"/>
<smd name="2" x="3.1212" y="0" dx="2.368" dy="2.4036" layer="1"/>
<text x="0" y="2.935" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.935" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPC4564X110" urn="urn:adsk.eagle:footprint:16290837/5" library_version="19">
<description>Chip, 4.50 X 6.40 X 1.10 mm body
&lt;p&gt;Chip package with body size 4.50 X 6.40 X 1.10 mm&lt;/p&gt;</description>
<wire x1="2.4" y1="3.7179" x2="-2.4" y2="3.7179" width="0.127" layer="21"/>
<wire x1="2.4" y1="-3.7179" x2="-2.4" y2="-3.7179" width="0.127" layer="21"/>
<wire x1="2.4" y1="-3.4" x2="-2.4" y2="-3.4" width="0.12" layer="51"/>
<wire x1="-2.4" y1="-3.4" x2="-2.4" y2="3.4" width="0.12" layer="51"/>
<wire x1="-2.4" y1="3.4" x2="2.4" y2="3.4" width="0.12" layer="51"/>
<wire x1="2.4" y1="3.4" x2="2.4" y2="-3.4" width="0.12" layer="51"/>
<smd name="1" x="-2.0565" y="0" dx="1.3973" dy="6.8078" layer="1"/>
<smd name="2" x="2.0565" y="0" dx="1.3973" dy="6.8078" layer="1"/>
<text x="0" y="4.3529" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-4.3529" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPRD550W60D1025H1250B" urn="urn:adsk.eagle:footprint:16290829/5" library_version="19">
<description>Radial Non-Polarized Capacitor, 5.50 mm pitch, 10.25 mm body diameter, 12.50 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 5.50 mm pitch (lead spacing), 0.60 mm lead diameter, 10.25 mm body diameter and 12.50 mm body height&lt;/p&gt;</description>
<circle x="0" y="0" radius="5.25" width="0.127" layer="21"/>
<circle x="0" y="0" radius="5.25" width="0.12" layer="51"/>
<pad name="1" x="-2.75" y="0" drill="0.8" diameter="1.4"/>
<pad name="2" x="2.75" y="0" drill="0.8" diameter="1.4"/>
<text x="0" y="5.885" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-5.885" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
<package name="CAPRD2261W240D5080H5555B" urn="urn:adsk.eagle:footprint:16290850/5" library_version="19">
<description>Radial Non-Polarized Capacitor, 22.61 mm pitch, 50.80 mm body diameter, 55.55 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 22.61 mm pitch (lead spacing), 2.40 mm lead diameter, 50.80 mm body diameter and 55.55 mm body height&lt;/p&gt;</description>
<circle x="0" y="0" radius="25.79" width="0.127" layer="21"/>
<circle x="0" y="0" radius="25.79" width="0.12" layer="51"/>
<pad name="1" x="-11.305" y="0" drill="2.6" diameter="3.9"/>
<pad name="2" x="11.305" y="0" drill="2.6" diameter="3.9"/>
<text x="0" y="26.425" size="1.27" layer="25" align="bottom-center">&gt;NAME</text>
<text x="0" y="-26.425" size="1.27" layer="27" align="top-center">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="CAPC1005X60" urn="urn:adsk.eagle:package:16290895/5" type="model">
<description>Chip, 1.00 X 0.50 X 0.60 mm body
&lt;p&gt;Chip package with body size 1.00 X 0.50 X 0.60 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC1005X60"/>
</packageinstances>
</package3d>
<package3d name="CAPC1110X102" urn="urn:adsk.eagle:package:16290904/5" type="model">
<description>Chip, 1.17 X 1.02 X 1.02 mm body
&lt;p&gt;Chip package with body size 1.17 X 1.02 X 1.02 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC1110X102"/>
</packageinstances>
</package3d>
<package3d name="CAPC1608X85" urn="urn:adsk.eagle:package:16290898/5" type="model">
<description>Chip, 1.60 X 0.80 X 0.85 mm body
&lt;p&gt;Chip package with body size 1.60 X 0.80 X 0.85 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC1608X85"/>
</packageinstances>
</package3d>
<package3d name="CAPC2012X110" urn="urn:adsk.eagle:package:16290897/5" type="model">
<description>Chip, 2.00 X 1.25 X 1.10 mm body
&lt;p&gt;Chip package with body size 2.00 X 1.25 X 1.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC2012X110"/>
</packageinstances>
</package3d>
<package3d name="CAPC3216X135" urn="urn:adsk.eagle:package:16290893/5" type="model">
<description>Chip, 3.20 X 1.60 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 1.60 X 1.35 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC3216X135"/>
</packageinstances>
</package3d>
<package3d name="CAPC3225X135" urn="urn:adsk.eagle:package:16290903/5" type="model">
<description>Chip, 3.20 X 2.50 X 1.35 mm body
&lt;p&gt;Chip package with body size 3.20 X 2.50 X 1.35 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC3225X135"/>
</packageinstances>
</package3d>
<package3d name="CAPC4532X135" urn="urn:adsk.eagle:package:16290900/5" type="model">
<description>Chip, 4.50 X 3.20 X 1.35 mm body
&lt;p&gt;Chip package with body size 4.50 X 3.20 X 1.35 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC4532X135"/>
</packageinstances>
</package3d>
<package3d name="CAPM3216X180" urn="urn:adsk.eagle:package:16290894/5" type="model">
<description>Molded Body, 3.20 X 1.60 X 1.80 mm body
&lt;p&gt;Molded Body package with body size 3.20 X 1.60 X 1.80 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM3216X180"/>
</packageinstances>
</package3d>
<package3d name="CAPM3528X210" urn="urn:adsk.eagle:package:16290902/5" type="model">
<description>Molded Body, 3.50 X 2.80 X 2.10 mm body
&lt;p&gt;Molded Body package with body size 3.50 X 2.80 X 2.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM3528X210"/>
</packageinstances>
</package3d>
<package3d name="CAPM6032X280" urn="urn:adsk.eagle:package:16290896/5" type="model">
<description>Molded Body, 6.00 X 3.20 X 2.80 mm body
&lt;p&gt;Molded Body package with body size 6.00 X 3.20 X 2.80 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM6032X280"/>
</packageinstances>
</package3d>
<package3d name="CAPM7343X310" urn="urn:adsk.eagle:package:16290891/5" type="model">
<description>Molded Body, 7.30 X 4.30 X 3.10 mm body
&lt;p&gt;Molded Body package with body size 7.30 X 4.30 X 3.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPM7343X310"/>
</packageinstances>
</package3d>
<package3d name="CAPC4564X110L" urn="urn:adsk.eagle:package:16290887/6" type="model">
<description>Chip, 4.50 X 6.40 X 1.10 mm body
&lt;p&gt;Chip package with body size 4.50 X 6.40 X 1.10 mm&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPC4564X110"/>
</packageinstances>
</package3d>
<package3d name="CAPRD550W60D1025H1250B" urn="urn:adsk.eagle:package:16290858/5" type="model">
<description>Radial Non-Polarized Capacitor, 5.50 mm pitch, 10.25 mm body diameter, 12.50 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 5.50 mm pitch (lead spacing), 0.60 mm lead diameter, 10.25 mm body diameter and 12.50 mm body height&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPRD550W60D1025H1250B"/>
</packageinstances>
</package3d>
<package3d name="CAPRD2261W240D5080H5555B" urn="urn:adsk.eagle:package:16290864/5" type="model">
<description>Radial Non-Polarized Capacitor, 22.61 mm pitch, 50.80 mm body diameter, 55.55 mm body height
&lt;p&gt;Radial Non-Polarized Capacitor package with 22.61 mm pitch (lead spacing), 2.40 mm lead diameter, 50.80 mm body diameter and 55.55 mm body height&lt;/p&gt;</description>
<packageinstances>
<packageinstance name="CAPRD2261W240D5080H5555B"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="C-US" urn="urn:adsk.eagle:symbol:16290822/1" library_version="19">
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-1.016" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-1" x2="2.4892" y2="-1.8542" width="0.254" layer="94" curve="-37.878202"/>
<wire x1="-2.4668" y1="-1.8504" x2="0" y2="-1.0161" width="0.254" layer="94" curve="-37.373024"/>
<text x="1.016" y="0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.016" y="-4.191" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C-US" urn="urn:adsk.eagle:component:16290907/8" prefix="C" uservalue="yes" library_version="19">
<description>&lt;B&gt;Capacitor - ANSI</description>
<gates>
<gate name="G$1" symbol="C-US" x="0" y="0"/>
</gates>
<devices>
<device name="CHIP-0402(1005-METRIC)" package="CAPC1005X60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290895/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0504(1310-METRIC)" package="CAPC1110X102">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290904/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0603(1608-METRIC)" package="CAPC1608X85">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290898/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-0805(2012-METRIC)" package="CAPC2012X110">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290897/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1206(3216-METRIC)" package="CAPC3216X135">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290893/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1210(3225-METRIC)" package="CAPC3225X135">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290903/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1812(4532-METRIC)" package="CAPC4532X135">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290900/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-1206(3216-METRIC)" package="CAPM3216X180">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290894/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-1411(3528-METRIC)" package="CAPM3528X210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290902/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-2412(6032-METRIC)" package="CAPM6032X280">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290896/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TANTALUM-2917(7343-METRIC)" package="CAPM7343X310">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290891/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="CHIP-1825(4564-METRIC)" package="CAPC4564X110">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290887/6"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="RADIAL-12.5MM-DIA" package="CAPRD550W60D1025H1250B">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290858/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="RADIAL-55.5MM-DIA" package="CAPRD2261W240D5080H5555B">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16290864/5"/>
</package3dinstances>
<technologies>
<technology name="_">
<attribute name="CATEGORY" value="Capacitor" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
<attribute name="VOLTAGE_RATING" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="C">
<pinmap gate="G$1" pin="1" pinorder="1"/>
<pinmap gate="G$1" pin="2" pinorder="2"/>
</pinmapping>
</spice>
</deviceset>
</devicesets>
</library>
<library name="F31W-1A7H1-11024" urn="urn:adsk.wipprod:fs.file:vf.EZrXyWqySOG1myyUO6Dz7w">
<description>&lt;Flex Connector, 0.50mm Pitch, Height 4.25mm, Vertical, Slider type, ZIF, 24 position, Without MYLAR&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="F31W1A7H111024" library_version="3">
<description>&lt;b&gt;F31W-1A7H1-11024-1&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="5.75" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="2" x="5.25" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="3" x="4.75" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="4" x="4.25" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="5" x="3.75" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="6" x="3.25" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="7" x="2.75" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="8" x="2.25" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="9" x="1.75" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="10" x="1.25" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="11" x="0.75" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="12" x="0.25" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="13" x="-0.25" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="14" x="-0.75" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="15" x="-1.25" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="16" x="-1.75" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="17" x="-2.25" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="18" x="-2.75" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="19" x="-3.25" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="20" x="-3.75" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="21" x="-4.25" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="22" x="-4.75" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="23" x="-5.25" y="1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="24" x="-5.75" y="-1.4" dx="1.5" dy="0.4" layer="1" rot="R90"/>
<smd name="MP1" x="7" y="1.4" dx="1.5" dy="1.1" layer="1" rot="R90"/>
<smd name="MP2" x="7" y="-1.4" dx="1.5" dy="1.1" layer="1" rot="R90"/>
<smd name="MP3" x="-7" y="1.4" dx="1.5" dy="1.1" layer="1" rot="R90"/>
<smd name="MP4" x="-7" y="-1.4" dx="1.5" dy="1.1" layer="1" rot="R90"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-9.55" y1="1.175" x2="9.55" y2="1.175" width="0.1" layer="51"/>
<wire x1="9.55" y1="1.175" x2="9.55" y2="-1.915" width="0.1" layer="51"/>
<wire x1="9.55" y1="-1.915" x2="-9.55" y2="-1.915" width="0.1" layer="51"/>
<wire x1="-9.55" y1="-1.915" x2="-9.55" y2="1.175" width="0.1" layer="51"/>
<wire x1="-10.55" y1="3.15" x2="10.55" y2="3.15" width="0.1" layer="51"/>
<wire x1="10.55" y1="3.15" x2="10.55" y2="-3.15" width="0.1" layer="51"/>
<wire x1="10.55" y1="-3.15" x2="-10.55" y2="-3.15" width="0.1" layer="51"/>
<wire x1="-10.55" y1="-3.15" x2="-10.55" y2="3.15" width="0.1" layer="51"/>
<wire x1="-8" y1="-1.915" x2="-9.55" y2="-1.915" width="0.2" layer="21"/>
<wire x1="-9.55" y1="-1.915" x2="-9.55" y2="1.175" width="0.2" layer="21"/>
<wire x1="-9.55" y1="1.175" x2="-7.8" y2="1.175" width="0.2" layer="21"/>
<wire x1="7.8" y1="1.175" x2="9.55" y2="1.175" width="0.2" layer="21"/>
<wire x1="9.55" y1="1.175" x2="9.55" y2="-1.915" width="0.2" layer="21"/>
<wire x1="9.55" y1="-1.915" x2="7.8" y2="-1.915" width="0.2" layer="21"/>
<wire x1="5.75" y1="2.7" x2="5.75" y2="2.6" width="0.1" layer="21" curve="180"/>
<wire x1="5.75" y1="2.6" x2="5.75" y2="2.7" width="0.1" layer="21" curve="180"/>
</package>
</packages>
<symbols>
<symbol name="F31W-1A7H1-11024" library_version="1">
<wire x1="5.08" y1="2.54" x2="20.32" y2="2.54" width="0.254" layer="94"/>
<wire x1="20.32" y1="-35.56" x2="20.32" y2="2.54" width="0.254" layer="94"/>
<wire x1="20.32" y1="-35.56" x2="5.08" y2="-35.56" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-35.56" width="0.254" layer="94"/>
<text x="21.59" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="21.59" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="1" x="25.4" y="-30.48" length="middle" rot="R180"/>
<pin name="2" x="0" y="-30.48" length="middle"/>
<pin name="3" x="25.4" y="-27.94" length="middle" rot="R180"/>
<pin name="4" x="0" y="-27.94" length="middle"/>
<pin name="5" x="25.4" y="-25.4" length="middle" rot="R180"/>
<pin name="6" x="0" y="-25.4" length="middle"/>
<pin name="7" x="25.4" y="-22.86" length="middle" rot="R180"/>
<pin name="8" x="0" y="-22.86" length="middle"/>
<pin name="9" x="25.4" y="-20.32" length="middle" rot="R180"/>
<pin name="10" x="0" y="-20.32" length="middle"/>
<pin name="11" x="25.4" y="-17.78" length="middle" rot="R180"/>
<pin name="12" x="0" y="-17.78" length="middle"/>
<pin name="13" x="25.4" y="-15.24" length="middle" rot="R180"/>
<pin name="14" x="0" y="-15.24" length="middle"/>
<pin name="15" x="25.4" y="-12.7" length="middle" rot="R180"/>
<pin name="16" x="0" y="-12.7" length="middle"/>
<pin name="17" x="25.4" y="-10.16" length="middle" rot="R180"/>
<pin name="18" x="0" y="-10.16" length="middle"/>
<pin name="19" x="25.4" y="-7.62" length="middle" rot="R180"/>
<pin name="20" x="0" y="-7.62" length="middle"/>
<pin name="21" x="25.4" y="-5.08" length="middle" rot="R180"/>
<pin name="22" x="0" y="-5.08" length="middle"/>
<pin name="23" x="25.4" y="-2.54" length="middle" rot="R180"/>
<pin name="24" x="0" y="-2.54" length="middle"/>
<pin name="MP1" x="25.4" y="-33.02" length="middle" rot="R180"/>
<pin name="MP2" x="0" y="-33.02" length="middle"/>
<pin name="MP3" x="25.4" y="0" length="middle" rot="R180"/>
<pin name="MP4" x="0" y="0" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="F31W-1A7H1-11024" prefix="J" library_version="3">
<description>&lt;b&gt;Flex Connector, 0.50mm Pitch, Height 4.25mm, Vertical, Slider type, ZIF, 24 position, Without MYLAR&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="https://cdn.amphenol-cs.com/media/wysiwyg/files/documentation/datasheet/flex/ffc_fpc_050mm_f31w_f31z_f314_f336.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="F31W-1A7H1-11024" x="0" y="0"/>
</gates>
<devices>
<device name="" package="F31W1A7H111024">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="24" pad="24"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
<connect gate="G$1" pin="MP1" pad="MP1"/>
<connect gate="G$1" pin="MP2" pad="MP2"/>
<connect gate="G$1" pin="MP3" pad="MP3"/>
<connect gate="G$1" pin="MP4" pad="MP4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER_PART_NUMBER" value="649-F31W-1A7H1-11024" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Amphenol-Aorora/F31W-1A7H1-11024?qs=xZ%2FP%252Ba9zWqa0iq%252BjDeduug%3D%3D" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Amphenol" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="F31W-1A7H1-11024" constant="no"/>
<attribute name="DESCRIPTION" value="Flex Connector, 0.50mm Pitch, Height 4.25mm, Vertical, Slider type, ZIF, 24 position, Without MYLAR" constant="no"/>
<attribute name="HEIGHT" value="4.45mm" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ESP32-S3-WROOM-1U-N16R8" urn="urn:adsk.wipprod:fs.file:vf.cnL6V3VESOau68oAUQhTdg">
<description>&lt;WiFi Modules - 802.11 [Engineering Samples] SMD Module, ESP32-S3R8, 8 MB Octal PSRAM Die, 16 MB Quad SPI Flash, IPEX Antenna Connector&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="ESP32S3WROOM1UN16R8" library_version="1">
<description>&lt;b&gt;ESP32-S3-WROOM-1U-N16R8&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="-8.75" y="8.41" dx="1.5" dy="0.9" layer="1"/>
<smd name="2" x="-8.75" y="7.14" dx="1.5" dy="0.9" layer="1"/>
<smd name="3" x="-8.75" y="5.87" dx="1.5" dy="0.9" layer="1"/>
<smd name="4" x="-8.75" y="4.6" dx="1.5" dy="0.9" layer="1"/>
<smd name="5" x="-8.75" y="3.33" dx="1.5" dy="0.9" layer="1"/>
<smd name="6" x="-8.75" y="2.06" dx="1.5" dy="0.9" layer="1"/>
<smd name="7" x="-8.75" y="0.79" dx="1.5" dy="0.9" layer="1"/>
<smd name="8" x="-8.75" y="-0.48" dx="1.5" dy="0.9" layer="1"/>
<smd name="9" x="-8.75" y="-1.75" dx="1.5" dy="0.9" layer="1"/>
<smd name="10" x="-8.75" y="-3.02" dx="1.5" dy="0.9" layer="1"/>
<smd name="11" x="-8.75" y="-4.29" dx="1.5" dy="0.9" layer="1"/>
<smd name="12" x="-8.75" y="-5.56" dx="1.5" dy="0.9" layer="1"/>
<smd name="13" x="-8.75" y="-6.83" dx="1.5" dy="0.9" layer="1"/>
<smd name="14" x="-8.75" y="-8.1" dx="1.5" dy="0.9" layer="1"/>
<smd name="15" x="-6.985" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="16" x="-5.715" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="17" x="-4.445" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="18" x="-3.175" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="19" x="-1.905" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="20" x="-0.635" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="21" x="0.635" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="22" x="1.905" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="23" x="3.175" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="24" x="4.445" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="25" x="5.715" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="26" x="6.985" y="-9.35" dx="1.5" dy="0.9" layer="1" rot="R90"/>
<smd name="27" x="8.75" y="-8.1" dx="1.5" dy="0.9" layer="1"/>
<smd name="28" x="8.75" y="-6.83" dx="1.5" dy="0.9" layer="1"/>
<smd name="29" x="8.75" y="-5.56" dx="1.5" dy="0.9" layer="1"/>
<smd name="30" x="8.75" y="-4.29" dx="1.5" dy="0.9" layer="1"/>
<smd name="31" x="8.75" y="-3.02" dx="1.5" dy="0.9" layer="1"/>
<smd name="32" x="8.75" y="-1.75" dx="1.5" dy="0.9" layer="1"/>
<smd name="33" x="8.75" y="-0.48" dx="1.5" dy="0.9" layer="1"/>
<smd name="34" x="8.75" y="0.79" dx="1.5" dy="0.9" layer="1"/>
<smd name="35" x="8.75" y="2.06" dx="1.5" dy="0.9" layer="1"/>
<smd name="36" x="8.75" y="3.33" dx="1.5" dy="0.9" layer="1"/>
<smd name="37" x="8.75" y="4.6" dx="1.5" dy="0.9" layer="1"/>
<smd name="38" x="8.75" y="5.87" dx="1.5" dy="0.9" layer="1"/>
<smd name="39" x="8.75" y="7.14" dx="1.5" dy="0.9" layer="1"/>
<smd name="40" x="8.75" y="8.41" dx="1.5" dy="0.9" layer="1"/>
<smd name="41" x="-1.5" y="0.69" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="42" x="-1.5" y="2.09" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="43" x="-2.9" y="2.09" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="44" x="-2.9" y="0.69" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="45" x="-2.9" y="-0.71" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="46" x="-1.5" y="-0.71" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="47" x="-0.1" y="-0.71" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="48" x="-0.1" y="0.69" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<smd name="49" x="-0.1" y="2.09" dx="0.9" dy="0.9" layer="1" rot="R90"/>
<text x="0" y="-0.25" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="-0.25" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-9" y1="9.6" x2="9" y2="9.6" width="0.1" layer="51"/>
<wire x1="9" y1="9.6" x2="9" y2="-9.6" width="0.1" layer="51"/>
<wire x1="9" y1="-9.6" x2="-9" y2="-9.6" width="0.1" layer="51"/>
<wire x1="-9" y1="-9.6" x2="-9" y2="9.6" width="0.1" layer="51"/>
<wire x1="-10.5" y1="10.6" x2="10.5" y2="10.6" width="0.1" layer="51"/>
<wire x1="10.5" y1="10.6" x2="10.5" y2="-11.1" width="0.1" layer="51"/>
<wire x1="10.5" y1="-11.1" x2="-10.5" y2="-11.1" width="0.1" layer="51"/>
<wire x1="-10.5" y1="-11.1" x2="-10.5" y2="10.6" width="0.1" layer="51"/>
<wire x1="-10" y1="8.4" x2="-9.9" y2="8.4" width="0.1" layer="21" curve="180"/>
<wire x1="-9.9" y1="8.4" x2="-10" y2="8.4" width="0.1" layer="21" curve="180"/>
<wire x1="-9" y1="9.6" x2="9" y2="9.6" width="0.2" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="ESP32-S3-WROOM-1U-N16R8" library_version="1">
<wire x1="5.08" y1="2.54" x2="27.94" y2="2.54" width="0.254" layer="94"/>
<wire x1="27.94" y1="-63.5" x2="27.94" y2="2.54" width="0.254" layer="94"/>
<wire x1="27.94" y1="-63.5" x2="5.08" y2="-63.5" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-63.5" width="0.254" layer="94"/>
<text x="29.21" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="29.21" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="GND_1" x="0" y="0" length="middle"/>
<pin name="3V3" x="0" y="-2.54" length="middle"/>
<pin name="EN" x="0" y="-5.08" length="middle"/>
<pin name="IO4" x="0" y="-7.62" length="middle"/>
<pin name="IO5" x="0" y="-10.16" length="middle"/>
<pin name="IO6" x="0" y="-12.7" length="middle"/>
<pin name="IO7" x="0" y="-15.24" length="middle"/>
<pin name="IO15" x="0" y="-17.78" length="middle"/>
<pin name="IO16" x="0" y="-20.32" length="middle"/>
<pin name="IO17" x="0" y="-22.86" length="middle"/>
<pin name="IO18" x="0" y="-25.4" length="middle"/>
<pin name="IO8" x="0" y="-27.94" length="middle"/>
<pin name="IO19" x="0" y="-30.48" length="middle"/>
<pin name="IO20" x="0" y="-33.02" length="middle"/>
<pin name="IO3" x="0" y="-35.56" length="middle"/>
<pin name="IO46" x="0" y="-38.1" length="middle"/>
<pin name="IO9" x="0" y="-40.64" length="middle"/>
<pin name="IO10" x="0" y="-43.18" length="middle"/>
<pin name="IO11" x="0" y="-45.72" length="middle"/>
<pin name="IO12" x="0" y="-48.26" length="middle"/>
<pin name="IO13" x="0" y="-50.8" length="middle"/>
<pin name="IO14" x="0" y="-53.34" length="middle"/>
<pin name="IO21" x="0" y="-55.88" length="middle"/>
<pin name="IO47" x="0" y="-58.42" length="middle"/>
<pin name="IO48" x="0" y="-60.96" length="middle"/>
<pin name="IO45" x="33.02" y="0" length="middle" rot="R180"/>
<pin name="IO0" x="33.02" y="-2.54" length="middle" rot="R180"/>
<pin name="IO35" x="33.02" y="-5.08" length="middle" rot="R180"/>
<pin name="IO36" x="33.02" y="-7.62" length="middle" rot="R180"/>
<pin name="IO37" x="33.02" y="-10.16" length="middle" rot="R180"/>
<pin name="IO38" x="33.02" y="-12.7" length="middle" rot="R180"/>
<pin name="IO39" x="33.02" y="-15.24" length="middle" rot="R180"/>
<pin name="IO40" x="33.02" y="-17.78" length="middle" rot="R180"/>
<pin name="IO41" x="33.02" y="-20.32" length="middle" rot="R180"/>
<pin name="IO42" x="33.02" y="-22.86" length="middle" rot="R180"/>
<pin name="RXD0" x="33.02" y="-25.4" length="middle" rot="R180"/>
<pin name="TXD0" x="33.02" y="-27.94" length="middle" rot="R180"/>
<pin name="IO2" x="33.02" y="-30.48" length="middle" rot="R180"/>
<pin name="IO1" x="33.02" y="-33.02" length="middle" rot="R180"/>
<pin name="GND_2" x="33.02" y="-35.56" length="middle" rot="R180"/>
<pin name="GND_3" x="33.02" y="-38.1" length="middle" rot="R180"/>
<pin name="GND_4" x="33.02" y="-40.64" length="middle" rot="R180"/>
<pin name="GND_5" x="33.02" y="-43.18" length="middle" rot="R180"/>
<pin name="GND_6" x="33.02" y="-45.72" length="middle" rot="R180"/>
<pin name="GND_7" x="33.02" y="-48.26" length="middle" rot="R180"/>
<pin name="GND_8" x="33.02" y="-50.8" length="middle" rot="R180"/>
<pin name="GND_9" x="33.02" y="-53.34" length="middle" rot="R180"/>
<pin name="GND_10" x="33.02" y="-55.88" length="middle" rot="R180"/>
<pin name="GND_11" x="33.02" y="-58.42" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ESP32-S3-WROOM-1U-N16R8" prefix="IC" library_version="1">
<description>&lt;b&gt;WiFi Modules - 802.11 [Engineering Samples] SMD Module, ESP32-S3R8, 8 MB Octal PSRAM Die, 16 MB Quad SPI Flash, IPEX Antenna Connector&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="https://www.espressif.com/sites/default/files/documentation/esp32-s3-wroom-1_wroom-1u_datasheet_en.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="ESP32-S3-WROOM-1U-N16R8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ESP32S3WROOM1UN16R8">
<connects>
<connect gate="G$1" pin="3V3" pad="2"/>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND_1" pad="1"/>
<connect gate="G$1" pin="GND_10" pad="48"/>
<connect gate="G$1" pin="GND_11" pad="49"/>
<connect gate="G$1" pin="GND_2" pad="40"/>
<connect gate="G$1" pin="GND_3" pad="41"/>
<connect gate="G$1" pin="GND_4" pad="42"/>
<connect gate="G$1" pin="GND_5" pad="43"/>
<connect gate="G$1" pin="GND_6" pad="44"/>
<connect gate="G$1" pin="GND_7" pad="45"/>
<connect gate="G$1" pin="GND_8" pad="46"/>
<connect gate="G$1" pin="GND_9" pad="47"/>
<connect gate="G$1" pin="IO0" pad="27"/>
<connect gate="G$1" pin="IO1" pad="39"/>
<connect gate="G$1" pin="IO10" pad="18"/>
<connect gate="G$1" pin="IO11" pad="19"/>
<connect gate="G$1" pin="IO12" pad="20"/>
<connect gate="G$1" pin="IO13" pad="21"/>
<connect gate="G$1" pin="IO14" pad="22"/>
<connect gate="G$1" pin="IO15" pad="8"/>
<connect gate="G$1" pin="IO16" pad="9"/>
<connect gate="G$1" pin="IO17" pad="10"/>
<connect gate="G$1" pin="IO18" pad="11"/>
<connect gate="G$1" pin="IO19" pad="13"/>
<connect gate="G$1" pin="IO2" pad="38"/>
<connect gate="G$1" pin="IO20" pad="14"/>
<connect gate="G$1" pin="IO21" pad="23"/>
<connect gate="G$1" pin="IO3" pad="15"/>
<connect gate="G$1" pin="IO35" pad="28"/>
<connect gate="G$1" pin="IO36" pad="29"/>
<connect gate="G$1" pin="IO37" pad="30"/>
<connect gate="G$1" pin="IO38" pad="31"/>
<connect gate="G$1" pin="IO39" pad="32"/>
<connect gate="G$1" pin="IO4" pad="4"/>
<connect gate="G$1" pin="IO40" pad="33"/>
<connect gate="G$1" pin="IO41" pad="34"/>
<connect gate="G$1" pin="IO42" pad="35"/>
<connect gate="G$1" pin="IO45" pad="26"/>
<connect gate="G$1" pin="IO46" pad="16"/>
<connect gate="G$1" pin="IO47" pad="24"/>
<connect gate="G$1" pin="IO48" pad="25"/>
<connect gate="G$1" pin="IO5" pad="5"/>
<connect gate="G$1" pin="IO6" pad="6"/>
<connect gate="G$1" pin="IO7" pad="7"/>
<connect gate="G$1" pin="IO8" pad="12"/>
<connect gate="G$1" pin="IO9" pad="17"/>
<connect gate="G$1" pin="RXD0" pad="36"/>
<connect gate="G$1" pin="TXD0" pad="37"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER_PART_NUMBER" value="356-ESP32S3WM1UN16R8" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Espressif-Systems/ESP32-S3-WROOM-1U-N16R8?qs=Li%252BoUPsLEns6V0Pr5KRJtw%3D%3D" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Espressif Systems" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="ESP32-S3-WROOM-1U-N16R8" constant="no"/>
<attribute name="DESCRIPTION" value="WiFi Modules - 802.11 [Engineering Samples] SMD Module, ESP32-S3R8, 8 MB Octal PSRAM Die, 16 MB Quad SPI Flash, IPEX Antenna Connector" constant="no"/>
<attribute name="HEIGHT" value="3.35mm" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="H5" library="holes" library_urn="urn:adsk.eagle:library:237" deviceset="MOUNT-PAD-ROUND" device="2.8" package3d_urn="urn:adsk.eagle:package:14281/1"/>
<part name="H6" library="holes" library_urn="urn:adsk.eagle:library:237" deviceset="MOUNT-PAD-ROUND" device="2.8" package3d_urn="urn:adsk.eagle:package:14281/1"/>
<part name="H7" library="holes" library_urn="urn:adsk.eagle:library:237" deviceset="MOUNT-PAD-ROUND" device="2.8" package3d_urn="urn:adsk.eagle:package:14281/1"/>
<part name="H8" library="holes" library_urn="urn:adsk.eagle:library:237" deviceset="MOUNT-PAD-ROUND" device="2.8" package3d_urn="urn:adsk.eagle:package:14281/1"/>
<part name="U$1" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 6"/>
<part name="U$2" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 7"/>
<part name="U$3" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 8"/>
<part name="U$4" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 9"/>
<part name="U$5" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 10"/>
<part name="U$6" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 11"/>
<part name="U$7" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 12"/>
<part name="U$8" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 13"/>
<part name="U$9" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 14"/>
<part name="U$11" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 4"/>
<part name="U$12" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 5"/>
<part name="U$13" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 1"/>
<part name="U$15" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 2"/>
<part name="U$16" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 16"/>
<part name="U$17" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 17"/>
<part name="U$18" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 18"/>
<part name="U$19" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 19"/>
<part name="U$20" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 21"/>
<part name="U$21" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 20"/>
<part name="U$22" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 22"/>
<part name="U$23" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 23"/>
<part name="U$24" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 24"/>
<part name="U$25" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 25"/>
<part name="SUPPLY7" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY12" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY13" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY14" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY15" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY16" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY17" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY18" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY19" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY20" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY21" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY22" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY23" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY24" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY25" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY26" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY27" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY28" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY29" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY30" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY31" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY32" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY33" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY34" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY35" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="U$14" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 3"/>
<part name="U$10" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 15"/>
<part name="SUPPLY4" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY6" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY9" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY10" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY47" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY48" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY49" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY50" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY51" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY52" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY53" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY54" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY55" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY56" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY57" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY59" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY60" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY61" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY62" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY63" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY64" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY65" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY66" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY67" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY58" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="J1" library="Connector" library_urn="urn:adsk.eagle:library:16378166" deviceset="2828XX-2" device="282837-2" package3d_urn="urn:adsk.eagle:package:24957621/2" value="TERM-BLK-2P"/>
<part name="SUPPLY11" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY3" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY1" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="D1" library="LED" library_urn="urn:adsk.eagle:library:22900745" deviceset="CHIP-FLAT-B" device="_0603-0.80MM" package3d_urn="urn:adsk.eagle:package:24294774/1" value="LED_BLUE"/>
<part name="R1" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="470"/>
<part name="SUPPLY36" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY37" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY8" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="U$26" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 26"/>
<part name="U$27" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 27"/>
<part name="U$28" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 28"/>
<part name="U$29" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 29"/>
<part name="U$30" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 30"/>
<part name="U$31" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 31"/>
<part name="U$32" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="PINHD-1X03" device="_1X03M" package3d_urn="urn:adsk.eagle:package:22458/2" value="Servo 32"/>
<part name="SUPPLY40" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY41" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY42" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY43" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY44" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY45" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY46" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY69" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY70" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY71" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY72" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY73" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY74" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY76" library="Tutorial - Fusion 360" library_urn="urn:adsk.eagle:library:16997205" deviceset="VCC-CIRCLE" device="" value="VCC"/>
<part name="SUPPLY83" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY86" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY88" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="S1" library="B3U-1000P" library_urn="urn:adsk.wipprod:fs.file:vf.XJbiwRhKSp-iOlNm4yOdNw" deviceset="B3U-1000P" device=""/>
<part name="S2" library="B3U-1000P" library_urn="urn:adsk.wipprod:fs.file:vf.XJbiwRhKSp-iOlNm4yOdNw" deviceset="B3U-1000P" device=""/>
<part name="SUPPLY89" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY90" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY94" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY95" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY96" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY97" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY98" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="R11" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="5.1K"/>
<part name="R12" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="5.1K"/>
<part name="SUPPLY99" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY100" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="J2" library="UJ20-C-H-G-SMT-1-P16-TR" library_urn="urn:adsk.wipprod:fs.file:vf.VgEXy_XXReqS1Zb8YyEAgA" deviceset="UJ20-C-H-G-SMT-1-P16-TR" device=""/>
<part name="C7" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value=".1uF"/>
<part name="SUPPLY2" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="C11" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="1uF"/>
<part name="R2" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="5.1K"/>
<part name="C1" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value=".1uF"/>
<part name="C2" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="10uF"/>
<part name="C3" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="10uF"/>
<part name="SUPPLY5" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY38" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY39" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY68" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY75" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY77" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="C5" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="10uF"/>
<part name="SUPPLY78" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY79" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="R23" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="10K"/>
<part name="R24" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="10K"/>
<part name="C4" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="10uF"/>
<part name="IC2" library="PCA9685BS_118" library_urn="urn:adsk.wipprod:fs.file:vf.ex5Q7jXbQ2igd7ijObffyQ" deviceset="PCA9685BS,118" device=""/>
<part name="IC3" library="PCA9685BS_118" library_urn="urn:adsk.wipprod:fs.file:vf.ex5Q7jXbQ2igd7ijObffyQ" deviceset="PCA9685BS,118" device=""/>
<part name="PS1" library="TL1963A-33DCYR" library_urn="urn:adsk.wipprod:fs.file:vf.nukNfVCiQSiYwS2wA_aO-Q" deviceset="TL1963A-33DCYR" device=""/>
<part name="SUPPLY80" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="U$33" library="128X32_SSD1306_I2C_LCD" library_urn="urn:adsk.wipprod:fs.file:vf.zh_29fpLRrK5zHscOdJN4g" deviceset="128X32_SSD1306_I2C_LCD" device=""/>
<part name="IC4" library="XC6206P122MR-G" library_urn="urn:adsk.wipprod:fs.file:vf.NEs_bSMgQmembkkqPoqipw" deviceset="XC6206P122MR-G" device=""/>
<part name="C6" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value=".1uF"/>
<part name="C8" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="10uF"/>
<part name="SUPPLY81" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY82" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="C9" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="10uF"/>
<part name="C10" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value=".1uF"/>
<part name="IC6" library="XC6206P282MR-G" library_urn="urn:adsk.wipprod:fs.file:vf.dxXTFAhhT2yqCCWQlP4POQ" deviceset="XC6206P282MR-G" device=""/>
<part name="SUPPLY84" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="C13" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value="10uF"/>
<part name="SUPPLY85" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="J4" library="F31W-1A7H1-11024" library_urn="urn:adsk.wipprod:fs.file:vf.EZrXyWqySOG1myyUO6Dz7w" deviceset="F31W-1A7H1-11024" device="" value="F31W-1A7H1-11024"/>
<part name="SUPPLY102" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY103" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY104" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="R4" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0603(1608-METRIC)" package3d_urn="urn:adsk.eagle:package:16378565/5" technology="_" value="1K"/>
<part name="SUPPLY105" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="C15" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value=".1uF"/>
<part name="SUPPLY106" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY107" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="SUPPLY108" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="C16" library="Capacitor" library_urn="urn:adsk.eagle:library:16290819" deviceset="C-US" device="CHIP-0805(2012-METRIC)" package3d_urn="urn:adsk.eagle:package:16290897/5" technology="_" value="15pF"/>
<part name="SUPPLY87" library="Power_Symbols" library_urn="urn:adsk.eagle:library:16502351" deviceset="GND-BAR" device="" value="GND"/>
<part name="C14" library="Tinkercad" library_urn="urn:adsk.eagle:library:30890021" deviceset="CAPACITOR" device="CHIP-0504(1310-METRIC)" package3d_urn="urn:adsk.eagle:package:16290904/5" technology="_" value=".1uF"/>
<part name="R3" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="10K"/>
<part name="R5" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="10K"/>
<part name="R6" library="Resistor" library_urn="urn:adsk.eagle:library:16378527" deviceset="R" device="CHIP-0402(1005-METRIC)" package3d_urn="urn:adsk.eagle:package:16378568/5" technology="_" value="10K"/>
<part name="IC5" library="ESP32-S3-WROOM-1U-N16R8" library_urn="urn:adsk.wipprod:fs.file:vf.cnL6V3VESOau68oAUQhTdg" deviceset="ESP32-S3-WROOM-1U-N16R8" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="35.56" y="91.44" size="3.81" layer="97">SSD1306 LCD</text>
<text x="172.72" y="-129.54" size="3.81" layer="97">I2C Address: 0x40</text>
<text x="30.48" y="86.36" size="3.81" layer="97">I2C Address: 0x3C</text>
<text x="261.62" y="-129.54" size="3.81" layer="97">I2C Address: 0x41</text>
</plain>
<instances>
<instance part="H5" gate="G$1" x="104.14" y="114.3" smashed="yes">
<attribute name="NAME" x="106.934" y="114.8842" size="1.778" layer="95"/>
<attribute name="VALUE" x="106.934" y="111.8362" size="1.778" layer="96"/>
</instance>
<instance part="H6" gate="G$1" x="104.14" y="106.68" smashed="yes">
<attribute name="NAME" x="106.934" y="107.2642" size="1.778" layer="95"/>
<attribute name="VALUE" x="106.934" y="104.2162" size="1.778" layer="96"/>
</instance>
<instance part="H7" gate="G$1" x="104.14" y="99.06" smashed="yes">
<attribute name="NAME" x="106.934" y="99.6442" size="1.778" layer="95"/>
<attribute name="VALUE" x="106.934" y="96.5962" size="1.778" layer="96"/>
</instance>
<instance part="H8" gate="G$1" x="104.14" y="91.44" smashed="yes">
<attribute name="NAME" x="106.934" y="92.0242" size="1.778" layer="95"/>
<attribute name="VALUE" x="106.934" y="88.9762" size="1.778" layer="96"/>
</instance>
<instance part="U$1" gate="G$1" x="101.6" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="106.68" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$2" gate="G$1" x="119.38" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="124.46" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$3" gate="G$1" x="137.16" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="142.24" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$4" gate="G$1" x="12.7" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="17.78" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$5" gate="G$1" x="30.48" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="35.56" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$6" gate="G$1" x="48.26" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="53.34" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$7" gate="G$1" x="66.04" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="71.12" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$8" gate="G$1" x="83.82" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="88.9" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$9" gate="G$1" x="101.6" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="106.68" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$11" gate="G$1" x="66.04" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="71.12" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$12" gate="G$1" x="83.82" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="88.9" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$13" gate="G$1" x="12.7" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="17.78" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$15" gate="G$1" x="30.48" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="35.56" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$16" gate="G$1" x="137.16" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="142.24" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$17" gate="G$1" x="12.7" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="17.78" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$18" gate="G$1" x="30.48" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="35.56" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$19" gate="G$1" x="48.26" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="53.34" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$20" gate="G$1" x="83.82" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="88.9" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$21" gate="G$1" x="66.04" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="71.12" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$22" gate="G$1" x="101.6" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="106.68" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$23" gate="G$1" x="119.38" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="124.46" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$24" gate="G$1" x="137.16" y="-66.04" smashed="yes" rot="R90">
<attribute name="VALUE" x="142.24" y="-58.42" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$25" gate="G$1" x="12.7" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="17.78" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY7" gate="G$1" x="10.16" y="2.54" smashed="yes">
<attribute name="VALUE" x="10.16" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY12" gate="G$1" x="81.28" y="2.54" smashed="yes">
<attribute name="VALUE" x="81.28" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY13" gate="G$1" x="63.5" y="2.54" smashed="yes">
<attribute name="VALUE" x="63.5" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY14" gate="G$1" x="45.72" y="2.54" smashed="yes">
<attribute name="VALUE" x="45.72" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY15" gate="G$1" x="27.94" y="2.54" smashed="yes">
<attribute name="VALUE" x="27.94" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY16" gate="G$1" x="10.16" y="-111.76" smashed="yes">
<attribute name="VALUE" x="7.62" y="-113.665" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY17" gate="G$1" x="134.62" y="-73.66" smashed="yes">
<attribute name="VALUE" x="134.62" y="-75.565" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY18" gate="G$1" x="116.84" y="-73.66" smashed="yes">
<attribute name="VALUE" x="116.84" y="-75.565" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY19" gate="G$1" x="99.06" y="-73.66" smashed="yes">
<attribute name="VALUE" x="99.06" y="-75.565" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY20" gate="G$1" x="63.5" y="-76.2" smashed="yes">
<attribute name="VALUE" x="63.5" y="-78.105" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY21" gate="G$1" x="45.72" y="-76.2" smashed="yes">
<attribute name="VALUE" x="45.72" y="-78.105" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY22" gate="G$1" x="27.94" y="-76.2" smashed="yes">
<attribute name="VALUE" x="27.94" y="-78.105" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY23" gate="G$1" x="10.16" y="-76.2" smashed="yes">
<attribute name="VALUE" x="10.16" y="-78.105" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY24" gate="G$1" x="134.62" y="-38.1" smashed="yes">
<attribute name="VALUE" x="134.62" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY25" gate="G$1" x="81.28" y="-73.66" smashed="yes">
<attribute name="VALUE" x="81.28" y="-75.565" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY26" gate="G$1" x="116.84" y="-38.1" smashed="yes">
<attribute name="VALUE" x="116.84" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY27" gate="G$1" x="99.06" y="-38.1" smashed="yes">
<attribute name="VALUE" x="99.06" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY28" gate="G$1" x="81.28" y="-38.1" smashed="yes">
<attribute name="VALUE" x="81.28" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY29" gate="G$1" x="63.5" y="-38.1" smashed="yes">
<attribute name="VALUE" x="63.5" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY30" gate="G$1" x="45.72" y="-38.1" smashed="yes">
<attribute name="VALUE" x="45.72" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY31" gate="G$1" x="27.94" y="-38.1" smashed="yes">
<attribute name="VALUE" x="27.94" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY32" gate="G$1" x="10.16" y="-38.1" smashed="yes">
<attribute name="VALUE" x="10.16" y="-40.005" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY33" gate="G$1" x="134.62" y="2.54" smashed="yes">
<attribute name="VALUE" x="134.62" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY34" gate="G$1" x="116.84" y="2.54" smashed="yes">
<attribute name="VALUE" x="116.84" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY35" gate="G$1" x="99.06" y="2.54" smashed="yes">
<attribute name="VALUE" x="99.06" y="0.635" size="1.778" layer="96" align="center"/>
</instance>
<instance part="U$14" gate="G$1" x="48.26" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="53.34" y="20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$10" gate="G$1" x="119.38" y="-27.94" smashed="yes" rot="R90">
<attribute name="VALUE" x="124.46" y="-20.32" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY4" gate="G$1" x="12.7" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="12.827" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY6" gate="G$1" x="30.48" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="30.607" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY9" gate="G$1" x="48.26" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="48.387" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY10" gate="G$1" x="66.04" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="66.167" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY47" gate="G$1" x="83.82" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="83.947" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY48" gate="G$1" x="101.6" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="101.727" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY49" gate="G$1" x="119.38" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="119.507" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY50" gate="G$1" x="137.16" y="-2.54" smashed="yes" rot="R180">
<attribute name="VALUE" x="137.287" y="-5.715" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY51" gate="G$1" x="12.7" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="12.827" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY52" gate="G$1" x="30.48" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="30.607" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY53" gate="G$1" x="48.26" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="48.387" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY54" gate="G$1" x="66.04" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="66.167" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY55" gate="G$1" x="83.82" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="83.947" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY56" gate="G$1" x="101.6" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="101.727" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY57" gate="G$1" x="119.38" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="119.507" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY59" gate="G$1" x="12.7" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="12.827" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY60" gate="G$1" x="30.48" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="30.607" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY61" gate="G$1" x="48.26" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="48.387" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY62" gate="G$1" x="66.04" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="66.167" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY63" gate="G$1" x="83.82" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="83.947" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY64" gate="G$1" x="101.6" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="101.727" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY65" gate="G$1" x="119.38" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="119.507" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY66" gate="G$1" x="137.16" y="-81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="137.287" y="-84.455" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY67" gate="G$1" x="12.7" y="-119.38" smashed="yes" rot="R180">
<attribute name="VALUE" x="12.827" y="-122.555" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY58" gate="G$1" x="137.16" y="-43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="137.287" y="-46.355" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="J1" gate="G$1" x="327.66" y="99.06" smashed="yes">
<attribute name="VALUE" x="332.74" y="93.726" size="1.778" layer="96" align="top-center"/>
<attribute name="NAME" x="327.66" y="104.394" size="1.778" layer="95" align="bottom-center"/>
</instance>
<instance part="SUPPLY11" gate="G$1" x="322.58" y="88.9" smashed="yes">
<attribute name="VALUE" x="322.58" y="86.995" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY3" gate="G$1" x="322.58" y="109.22" smashed="yes">
<attribute name="VALUE" x="322.453" y="112.395" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="SUPPLY1" gate="G$1" x="200.66" y="116.84" smashed="yes" rot="R180">
<attribute name="VALUE" x="200.66" y="118.745" size="1.778" layer="96" rot="R180" align="center"/>
</instance>
<instance part="D1" gate="G$1" x="281.94" y="106.68" smashed="yes" rot="R180">
<attribute name="NAME" x="279.4" y="109.982" size="1.778" layer="95" align="top-right"/>
<attribute name="VALUE" x="286.258" y="114.3" size="1.778" layer="96" rot="R90" align="top-right"/>
</instance>
<instance part="R1" gate="G$1" x="281.94" y="96.52" smashed="yes" rot="R90">
<attribute name="NAME" x="279.4" y="96.52" size="1.778" layer="95" rot="R90" align="center"/>
<attribute name="VALUE" x="284.48" y="96.52" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY36" gate="G$1" x="162.56" y="58.42" smashed="yes" rot="R270">
<attribute name="VALUE" x="160.655" y="58.42" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY37" gate="G$1" x="218.44" y="0" smashed="yes" rot="R90">
<attribute name="VALUE" x="220.345" y="0" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY8" gate="G$1" x="281.94" y="116.84" smashed="yes" rot="R180">
<attribute name="VALUE" x="279.4" y="118.745" size="1.778" layer="96" rot="R180" align="center"/>
</instance>
<instance part="U$26" gate="G$1" x="30.48" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="35.56" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$27" gate="G$1" x="48.26" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="53.34" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$28" gate="G$1" x="66.04" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="71.12" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$29" gate="G$1" x="83.82" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="88.9" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$30" gate="G$1" x="101.6" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="106.68" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$31" gate="G$1" x="119.38" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="124.46" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$32" gate="G$1" x="137.16" y="-104.14" smashed="yes" rot="R90">
<attribute name="VALUE" x="142.24" y="-96.52" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY40" gate="G$1" x="27.94" y="-111.76" smashed="yes">
<attribute name="VALUE" x="27.94" y="-113.665" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY41" gate="G$1" x="30.48" y="-119.38" smashed="yes" rot="R180">
<attribute name="VALUE" x="30.607" y="-122.555" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY42" gate="G$1" x="45.72" y="-111.76" smashed="yes">
<attribute name="VALUE" x="45.72" y="-113.665" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY43" gate="G$1" x="63.5" y="-111.76" smashed="yes">
<attribute name="VALUE" x="63.5" y="-113.665" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY44" gate="G$1" x="81.28" y="-111.76" smashed="yes">
<attribute name="VALUE" x="81.28" y="-113.665" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY45" gate="G$1" x="99.06" y="-111.76" smashed="yes">
<attribute name="VALUE" x="99.06" y="-113.665" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY46" gate="G$1" x="116.84" y="-111.76" smashed="yes">
<attribute name="VALUE" x="116.84" y="-113.665" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY69" gate="G$1" x="134.62" y="-114.3" smashed="yes">
<attribute name="VALUE" x="134.62" y="-116.205" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY70" gate="G$1" x="48.26" y="-119.38" smashed="yes" rot="R180">
<attribute name="VALUE" x="48.387" y="-122.555" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY71" gate="G$1" x="66.04" y="-119.38" smashed="yes" rot="R180">
<attribute name="VALUE" x="66.167" y="-122.555" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY72" gate="G$1" x="83.82" y="-121.92" smashed="yes" rot="R180">
<attribute name="VALUE" x="83.947" y="-125.095" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY73" gate="G$1" x="101.6" y="-121.92" smashed="yes" rot="R180">
<attribute name="VALUE" x="101.727" y="-125.095" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY74" gate="G$1" x="119.38" y="-119.38" smashed="yes" rot="R180">
<attribute name="VALUE" x="119.507" y="-122.555" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY76" gate="G$1" x="137.16" y="-119.38" smashed="yes" rot="R180">
<attribute name="VALUE" x="137.287" y="-122.555" size="1.778" layer="96" rot="R180" align="bottom-center"/>
</instance>
<instance part="SUPPLY83" gate="G$1" x="281.94" y="-119.38" smashed="yes">
<attribute name="VALUE" x="281.94" y="-121.285" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY86" gate="G$1" x="304.8" y="-22.86" smashed="yes" rot="R90">
<attribute name="VALUE" x="306.705" y="-22.86" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY88" gate="G$1" x="292.1" y="-53.34" smashed="yes" rot="R180">
<attribute name="VALUE" x="292.1" y="-51.435" size="1.778" layer="96" rot="R180" align="center"/>
</instance>
<instance part="S1" gate="G$1" x="45.72" y="45.72" smashed="yes" rot="R180">
<attribute name="NAME" x="29.21" y="38.1" size="1.778" layer="95" rot="R180" align="center-left"/>
<attribute name="VALUE" x="29.21" y="40.64" size="1.778" layer="96" rot="R180" align="center-left"/>
</instance>
<instance part="S2" gate="G$1" x="106.68" y="45.72" smashed="yes" rot="R180">
<attribute name="NAME" x="90.17" y="38.1" size="1.778" layer="95" rot="R180" align="center-left"/>
<attribute name="VALUE" x="90.17" y="40.64" size="1.778" layer="96" rot="R180" align="center-left"/>
</instance>
<instance part="SUPPLY89" gate="G$1" x="304.8" y="-76.2" smashed="yes" rot="R90">
<attribute name="VALUE" x="306.705" y="-76.2" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY90" gate="G$1" x="58.42" y="45.72" smashed="yes" rot="R90">
<attribute name="VALUE" x="60.325" y="45.72" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY94" gate="G$1" x="96.52" y="114.3" smashed="yes" rot="R270">
<attribute name="VALUE" x="94.615" y="114.3" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY95" gate="G$1" x="96.52" y="106.68" smashed="yes" rot="R270">
<attribute name="VALUE" x="94.615" y="106.68" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY96" gate="G$1" x="96.52" y="99.06" smashed="yes" rot="R270">
<attribute name="VALUE" x="94.615" y="99.06" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY97" gate="G$1" x="96.52" y="91.44" smashed="yes" rot="R270">
<attribute name="VALUE" x="94.615" y="91.44" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY98" gate="G$1" x="416.56" y="-96.52" smashed="yes" rot="R90">
<attribute name="VALUE" x="418.465" y="-96.52" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="R11" gate="G$1" x="406.4" y="-88.9" smashed="yes">
<attribute name="VALUE" x="406.4" y="-86.36" size="1.778" layer="96" align="center"/>
</instance>
<instance part="R12" gate="G$1" x="406.4" y="-81.28" smashed="yes">
<attribute name="VALUE" x="406.4" y="-78.74" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY99" gate="G$1" x="416.56" y="-81.28" smashed="yes" rot="R90">
<attribute name="VALUE" x="418.465" y="-81.28" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY100" gate="G$1" x="416.56" y="-88.9" smashed="yes" rot="R90">
<attribute name="VALUE" x="418.465" y="-88.9" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="J2" gate="G$1" x="383.54" y="-81.28" smashed="yes">
<attribute name="NAME" x="375.92" y="-57.658" size="1.778" layer="95"/>
<attribute name="VALUE" x="375.92" y="-104.902" size="1.778" layer="96" align="top-left"/>
</instance>
<instance part="C7" gate="G$1" x="182.88" y="104.14" smashed="yes" rot="R270">
<attribute name="NAME" x="185.42" y="106.68" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="178.816" y="106.68" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="SUPPLY2" gate="G$1" x="121.92" y="43.18" smashed="yes" rot="R90">
<attribute name="VALUE" x="123.825" y="43.18" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="C11" gate="G$1" x="114.3" y="48.26" smashed="yes" rot="R90">
<attribute name="NAME" x="111.76" y="45.72" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="118.364" y="45.72" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R2" gate="G$1" x="114.3" y="55.88" smashed="yes" rot="R270">
<attribute name="VALUE" x="116.84" y="55.88" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="C1" gate="G$1" x="218.44" y="104.14" smashed="yes" rot="R270">
<attribute name="NAME" x="220.98" y="106.68" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="214.376" y="106.68" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="C2" gate="G$1" x="172.72" y="104.14" smashed="yes" rot="R270">
<attribute name="NAME" x="175.26" y="106.68" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="168.656" y="106.68" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="C3" gate="G$1" x="294.64" y="-22.86" smashed="yes">
<attribute name="NAME" x="292.1" y="-20.32" size="1.778" layer="95"/>
<attribute name="VALUE" x="289.56" y="-26.924" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY5" gate="G$1" x="279.4" y="-53.34" smashed="yes" rot="R180">
<attribute name="VALUE" x="279.4" y="-51.435" size="1.778" layer="96" rot="R180" align="center"/>
</instance>
<instance part="SUPPLY38" gate="G$1" x="261.62" y="-76.2" smashed="yes" rot="R270">
<attribute name="VALUE" x="259.715" y="-76.2" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY39" gate="G$1" x="193.04" y="-119.38" smashed="yes">
<attribute name="VALUE" x="193.04" y="-121.285" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY68" gate="G$1" x="215.9" y="-22.86" smashed="yes" rot="R90">
<attribute name="VALUE" x="217.805" y="-22.86" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY75" gate="G$1" x="203.2" y="-53.34" smashed="yes" rot="R180">
<attribute name="VALUE" x="203.2" y="-51.435" size="1.778" layer="96" rot="R180" align="center"/>
</instance>
<instance part="SUPPLY77" gate="G$1" x="215.9" y="-76.2" smashed="yes" rot="R90">
<attribute name="VALUE" x="217.805" y="-76.2" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="C5" gate="G$1" x="205.74" y="-22.86" smashed="yes">
<attribute name="NAME" x="203.2" y="-20.32" size="1.778" layer="95"/>
<attribute name="VALUE" x="200.66" y="-26.924" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY78" gate="G$1" x="190.5" y="-53.34" smashed="yes" rot="R180">
<attribute name="VALUE" x="190.5" y="-51.435" size="1.778" layer="96" rot="R180" align="center"/>
</instance>
<instance part="SUPPLY79" gate="G$1" x="172.72" y="-76.2" smashed="yes" rot="R270">
<attribute name="VALUE" x="170.815" y="-76.2" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="R23" gate="G$1" x="223.52" y="33.02" smashed="yes">
<attribute name="VALUE" x="223.52" y="35.56" size="1.778" layer="96" align="center"/>
</instance>
<instance part="R24" gate="G$1" x="223.52" y="20.32" smashed="yes">
<attribute name="VALUE" x="223.52" y="22.86" size="1.778" layer="96" align="center"/>
</instance>
<instance part="C4" gate="G$1" x="228.6" y="104.14" smashed="yes" rot="R270">
<attribute name="NAME" x="231.14" y="106.68" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="224.536" y="106.68" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="IC2" gate="G$1" x="266.7" y="-76.2" smashed="yes">
<attribute name="NAME" x="295.91" y="-58.42" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="295.91" y="-60.96" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="IC3" gate="G$1" x="177.8" y="-76.2" smashed="yes">
<attribute name="NAME" x="207.01" y="-58.42" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="207.01" y="-60.96" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="PS1" gate="G$1" x="203.2" y="101.6" smashed="yes" rot="R270">
<attribute name="NAME" x="193.04" y="80.01" size="1.778" layer="95" rot="R270" align="center-left"/>
<attribute name="VALUE" x="208.28" y="95.25" size="1.778" layer="96" rot="R270" align="center-left"/>
</instance>
<instance part="SUPPLY80" gate="G$1" x="17.78" y="99.06" smashed="yes" rot="R270">
<attribute name="VALUE" x="15.875" y="99.06" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="U$33" gate="G$1" x="30.48" y="96.52" smashed="yes"/>
<instance part="IC4" gate="G$1" x="398.78" y="111.76" smashed="yes">
<attribute name="NAME" x="422.91" y="119.38" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="422.91" y="116.84" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="C6" gate="G$1" x="381" y="109.22" smashed="yes" rot="R270">
<attribute name="NAME" x="383.54" y="111.76" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="376.936" y="111.76" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="C8" gate="G$1" x="391.16" y="109.22" smashed="yes" rot="R270">
<attribute name="NAME" x="393.7" y="111.76" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="387.096" y="114.3" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="SUPPLY81" gate="G$1" x="373.38" y="114.3" smashed="yes" rot="R270">
<attribute name="VALUE" x="371.475" y="114.3" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY82" gate="G$1" x="373.38" y="88.9" smashed="yes" rot="R270">
<attribute name="VALUE" x="371.475" y="88.9" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="C9" gate="G$1" x="391.16" y="83.82" smashed="yes" rot="R270">
<attribute name="NAME" x="393.7" y="86.36" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="387.096" y="88.9" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="C10" gate="G$1" x="381" y="83.82" smashed="yes" rot="R270">
<attribute name="NAME" x="383.54" y="86.36" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="376.936" y="86.36" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="IC6" gate="G$1" x="398.78" y="86.36" smashed="yes">
<attribute name="NAME" x="422.91" y="81.28" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="422.91" y="78.74" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="SUPPLY84" gate="G$1" x="416.56" y="99.06" smashed="yes" rot="R270">
<attribute name="VALUE" x="414.655" y="99.06" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="C13" gate="G$1" x="426.72" y="99.06" smashed="yes">
<attribute name="NAME" x="424.18" y="101.6" size="1.778" layer="95"/>
<attribute name="VALUE" x="421.64" y="94.996" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY85" gate="G$1" x="259.08" y="45.72" smashed="yes" rot="R270">
<attribute name="VALUE" x="257.175" y="45.72" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="J4" gate="G$1" x="299.72" y="45.72" smashed="yes">
<attribute name="NAME" x="321.31" y="53.34" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="321.31" y="50.8" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="SUPPLY102" gate="G$1" x="259.08" y="12.7" smashed="yes" rot="R270">
<attribute name="VALUE" x="257.175" y="12.7" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY103" gate="G$1" x="370.84" y="45.72" smashed="yes" rot="R90">
<attribute name="VALUE" x="372.745" y="45.72" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="SUPPLY104" gate="G$1" x="370.84" y="12.7" smashed="yes" rot="R90">
<attribute name="VALUE" x="372.745" y="12.7" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="R4" gate="G$1" x="360.68" y="35.56" smashed="yes">
<attribute name="NAME" x="360.68" y="38.1" size="1.778" layer="95" align="center"/>
<attribute name="VALUE" x="360.68" y="33.02" size="1.778" layer="96" align="center"/>
</instance>
<instance part="SUPPLY105" gate="G$1" x="370.84" y="35.56" smashed="yes" rot="R90">
<attribute name="VALUE" x="372.745" y="35.56" size="1.778" layer="96" rot="R90" align="center"/>
</instance>
<instance part="C15" gate="G$1" x="269.24" y="30.48" smashed="yes">
<attribute name="NAME" x="266.7" y="33.02" size="1.778" layer="95"/>
<attribute name="VALUE" x="266.7" y="26.416" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY106" gate="G$1" x="259.08" y="30.48" smashed="yes" rot="R270">
<attribute name="VALUE" x="257.175" y="30.48" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY107" gate="G$1" x="284.48" y="25.4" smashed="yes" rot="R270">
<attribute name="VALUE" x="282.575" y="25.4" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="SUPPLY108" gate="G$1" x="259.08" y="22.86" smashed="yes" rot="R270">
<attribute name="VALUE" x="257.175" y="22.86" size="1.778" layer="96" rot="R270" align="center"/>
</instance>
<instance part="C16" gate="G$1" x="269.24" y="22.86" smashed="yes" rot="R270">
<attribute name="NAME" x="269.875" y="21.844" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="265.049" y="21.844" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="SUPPLY87" gate="G$1" x="403.86" y="30.48" smashed="yes">
<attribute name="VALUE" x="403.86" y="28.575" size="1.778" layer="96" align="center"/>
</instance>
<instance part="C14" gate="G$1" x="403.86" y="40.64" smashed="yes" rot="R90">
<attribute name="NAME" x="401.32" y="38.1" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="407.924" y="38.1" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R3" gate="G$1" x="411.48" y="45.72" smashed="yes">
<attribute name="VALUE" x="411.48" y="48.26" size="1.778" layer="96" align="center"/>
</instance>
<instance part="R5" gate="G$1" x="406.4" y="20.32" smashed="yes">
<attribute name="VALUE" x="406.4" y="22.86" size="1.778" layer="96" align="center"/>
</instance>
<instance part="R6" gate="G$1" x="406.4" y="15.24" smashed="yes">
<attribute name="VALUE" x="406.4" y="17.78" size="1.778" layer="96" align="center"/>
</instance>
<instance part="IC5" gate="G$1" x="180.34" y="58.42" smashed="yes">
<attribute name="NAME" x="209.55" y="66.04" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="209.55" y="63.5" size="1.778" layer="96" align="center-left"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="1"/>
<wire x1="27.94" y1="10.16" x2="27.94" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY15" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="45.72" y1="10.16" x2="45.72" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY14" gate="G$1" pin="GND"/>
<pinref part="U$14" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$11" gate="G$1" pin="1"/>
<wire x1="63.5" y1="10.16" x2="63.5" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY13" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$12" gate="G$1" pin="1"/>
<wire x1="81.28" y1="10.16" x2="81.28" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY12" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$13" gate="G$1" pin="1"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY7" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="1"/>
<wire x1="99.06" y1="10.16" x2="99.06" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY35" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="1"/>
<wire x1="116.84" y1="10.16" x2="116.84" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY34" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$3" gate="G$1" pin="1"/>
<wire x1="134.62" y1="10.16" x2="134.62" y2="5.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY33" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$4" gate="G$1" pin="1"/>
<wire x1="10.16" y1="-30.48" x2="10.16" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="SUPPLY32" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$5" gate="G$1" pin="1"/>
<wire x1="27.94" y1="-30.48" x2="27.94" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="SUPPLY31" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$6" gate="G$1" pin="1"/>
<wire x1="45.72" y1="-30.48" x2="45.72" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="SUPPLY30" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY29" gate="G$1" pin="GND"/>
<wire x1="63.5" y1="-35.56" x2="63.5" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="U$7" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$8" gate="G$1" pin="1"/>
<wire x1="81.28" y1="-30.48" x2="81.28" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="SUPPLY28" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY27" gate="G$1" pin="GND"/>
<wire x1="99.06" y1="-35.56" x2="99.06" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY26" gate="G$1" pin="GND"/>
<wire x1="116.84" y1="-35.56" x2="116.84" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY24" gate="G$1" pin="GND"/>
<wire x1="134.62" y1="-35.56" x2="134.62" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="U$16" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY23" gate="G$1" pin="GND"/>
<wire x1="10.16" y1="-73.66" x2="10.16" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="U$17" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY22" gate="G$1" pin="GND"/>
<wire x1="27.94" y1="-73.66" x2="27.94" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="U$18" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY21" gate="G$1" pin="GND"/>
<wire x1="45.72" y1="-73.66" x2="45.72" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="U$19" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY20" gate="G$1" pin="GND"/>
<wire x1="63.5" y1="-73.66" x2="63.5" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="U$21" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$20" gate="G$1" pin="1"/>
<wire x1="81.28" y1="-68.58" x2="81.28" y2="-71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY25" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY19" gate="G$1" pin="GND"/>
<wire x1="99.06" y1="-71.12" x2="99.06" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="U$22" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY18" gate="G$1" pin="GND"/>
<wire x1="116.84" y1="-71.12" x2="116.84" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="U$23" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY17" gate="G$1" pin="GND"/>
<wire x1="134.62" y1="-71.12" x2="134.62" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="U$24" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="SUPPLY16" gate="G$1" pin="GND"/>
<wire x1="10.16" y1="-109.22" x2="10.16" y2="-106.68" width="0.1524" layer="91"/>
<pinref part="U$25" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="322.58" y1="91.44" x2="322.58" y2="99.06" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="2"/>
<pinref part="SUPPLY11" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="200.66" y1="114.3" x2="200.66" y2="111.76" width="0.1524" layer="91"/>
<pinref part="SUPPLY1" gate="G$1" pin="GND"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="182.88" y1="109.22" x2="182.88" y2="111.76" width="0.1524" layer="91"/>
<wire x1="182.88" y1="111.76" x2="200.66" y2="111.76" width="0.1524" layer="91"/>
<wire x1="218.44" y1="109.22" x2="218.44" y2="111.76" width="0.1524" layer="91"/>
<wire x1="218.44" y1="111.76" x2="200.66" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="182.88" y1="111.76" x2="172.72" y2="111.76" width="0.1524" layer="91"/>
<wire x1="172.72" y1="111.76" x2="172.72" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<junction x="200.66" y="111.76"/>
<junction x="182.88" y="111.76"/>
<wire x1="218.44" y1="111.76" x2="228.6" y2="111.76" width="0.1524" layer="91"/>
<wire x1="228.6" y1="111.76" x2="228.6" y2="109.22" width="0.1524" layer="91"/>
<junction x="218.44" y="111.76"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="200.66" y1="111.76" x2="200.66" y2="101.6" width="0.1524" layer="91"/>
<pinref part="PS1" gate="G$1" pin="GND_1"/>
<pinref part="PS1" gate="G$1" pin="GND_2"/>
<wire x1="203.2" y1="71.12" x2="200.66" y2="71.12" width="0.1524" layer="91"/>
<wire x1="200.66" y1="71.12" x2="200.66" y2="101.6" width="0.1524" layer="91"/>
<junction x="200.66" y="101.6"/>
</segment>
<segment>
<pinref part="SUPPLY36" gate="G$1" pin="GND"/>
<wire x1="180.34" y1="58.42" x2="165.1" y2="58.42" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="GND_1"/>
</segment>
<segment>
<pinref part="SUPPLY37" gate="G$1" pin="GND"/>
<wire x1="215.9" y1="0" x2="213.36" y2="0" width="0.1524" layer="91"/>
<wire x1="213.36" y1="0" x2="213.36" y2="2.54" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="GND_2"/>
<pinref part="IC5" gate="G$1" pin="GND_3"/>
<wire x1="213.36" y1="2.54" x2="213.36" y2="5.08" width="0.1524" layer="91"/>
<wire x1="213.36" y1="5.08" x2="213.36" y2="7.62" width="0.1524" layer="91"/>
<wire x1="213.36" y1="7.62" x2="213.36" y2="10.16" width="0.1524" layer="91"/>
<wire x1="213.36" y1="10.16" x2="213.36" y2="12.7" width="0.1524" layer="91"/>
<wire x1="213.36" y1="12.7" x2="213.36" y2="15.24" width="0.1524" layer="91"/>
<wire x1="213.36" y1="15.24" x2="213.36" y2="17.78" width="0.1524" layer="91"/>
<wire x1="213.36" y1="17.78" x2="213.36" y2="20.32" width="0.1524" layer="91"/>
<wire x1="213.36" y1="20.32" x2="213.36" y2="22.86" width="0.1524" layer="91"/>
<junction x="213.36" y="20.32"/>
<pinref part="IC5" gate="G$1" pin="GND_4"/>
<junction x="213.36" y="17.78"/>
<pinref part="IC5" gate="G$1" pin="GND_5"/>
<junction x="213.36" y="15.24"/>
<pinref part="IC5" gate="G$1" pin="GND_6"/>
<junction x="213.36" y="12.7"/>
<pinref part="IC5" gate="G$1" pin="GND_7"/>
<junction x="213.36" y="10.16"/>
<pinref part="IC5" gate="G$1" pin="GND_8"/>
<junction x="213.36" y="7.62"/>
<pinref part="IC5" gate="G$1" pin="GND_9"/>
<junction x="213.36" y="5.08"/>
<pinref part="IC5" gate="G$1" pin="GND_10"/>
<junction x="213.36" y="2.54"/>
<pinref part="IC5" gate="G$1" pin="GND_11"/>
<junction x="213.36" y="0"/>
</segment>
<segment>
<pinref part="SUPPLY8" gate="G$1" pin="GND"/>
<wire x1="281.94" y1="114.3" x2="281.94" y2="111.76" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
</segment>
<segment>
<pinref part="U$26" gate="G$1" pin="1"/>
<wire x1="27.94" y1="-106.68" x2="27.94" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="SUPPLY40" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$27" gate="G$1" pin="1"/>
<wire x1="45.72" y1="-106.68" x2="45.72" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="SUPPLY42" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$28" gate="G$1" pin="1"/>
<wire x1="63.5" y1="-106.68" x2="63.5" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="SUPPLY43" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$29" gate="G$1" pin="1"/>
<wire x1="81.28" y1="-106.68" x2="81.28" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="SUPPLY44" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$30" gate="G$1" pin="1"/>
<wire x1="99.06" y1="-106.68" x2="99.06" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="SUPPLY45" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U$31" gate="G$1" pin="1"/>
<wire x1="116.84" y1="-106.68" x2="116.84" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="SUPPLY46" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="281.94" y1="-109.22" x2="281.94" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY83" gate="G$1" pin="GND"/>
<pinref part="IC2" gate="G$1" pin="VSS"/>
</segment>
<segment>
<pinref part="SUPPLY89" gate="G$1" pin="GND"/>
<wire x1="302.26" y1="-76.2" x2="302.26" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="302.26" y1="-76.2" x2="299.72" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="302.26" y1="-78.74" x2="299.72" y2="-78.74" width="0.1524" layer="91"/>
<junction x="302.26" y="-76.2"/>
<pinref part="IC2" gate="G$1" pin="A5"/>
<pinref part="IC2" gate="G$1" pin="!OE"/>
</segment>
<segment>
<pinref part="U$32" gate="G$1" pin="1"/>
<wire x1="134.62" y1="-106.68" x2="134.62" y2="-111.76" width="0.1524" layer="91"/>
<pinref part="SUPPLY69" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="H5" gate="G$1" pin="MOUNT"/>
<wire x1="101.6" y1="114.3" x2="99.06" y2="114.3" width="0.1524" layer="91"/>
<pinref part="SUPPLY94" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="H6" gate="G$1" pin="MOUNT"/>
<wire x1="101.6" y1="106.68" x2="99.06" y2="106.68" width="0.1524" layer="91"/>
<pinref part="SUPPLY95" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="H7" gate="G$1" pin="MOUNT"/>
<wire x1="101.6" y1="99.06" x2="99.06" y2="99.06" width="0.1524" layer="91"/>
<pinref part="SUPPLY96" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="H8" gate="G$1" pin="MOUNT"/>
<wire x1="101.6" y1="91.44" x2="99.06" y2="91.44" width="0.1524" layer="91"/>
<pinref part="SUPPLY97" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY98" gate="G$1" pin="GND"/>
<wire x1="396.24" y1="-96.52" x2="414.02" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="398.78" y1="-98.9838" x2="398.78" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="398.78" y1="-96.52" x2="396.24" y2="-96.52" width="0.1524" layer="91"/>
<junction x="396.24" y="-96.52"/>
<pinref part="J2" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="411.48" y1="-81.28" x2="414.02" y2="-81.28" width="0.1524" layer="91"/>
<pinref part="SUPPLY99" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="411.48" y1="-88.9" x2="414.02" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="SUPPLY100" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="396.24" y1="-101.6" x2="398.78" y2="-101.6" width="0.1524" layer="91"/>
<wire x1="398.78" y1="-101.6" x2="398.78" y2="-101.6762" width="0.1524" layer="91"/>
<wire x1="398.78" y1="-101.6" x2="398.78" y2="-99.06" width="0.1524" layer="91"/>
<junction x="398.78" y="-101.6"/>
<pinref part="J2" gate="G$1" pin="SHIELD"/>
</segment>
<segment>
<pinref part="S1" gate="G$1" pin="A"/>
<pinref part="SUPPLY90" gate="G$1" pin="GND"/>
<wire x1="45.72" y1="45.72" x2="55.88" y2="45.72" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="S2" gate="G$1" pin="A"/>
<wire x1="106.68" y1="45.72" x2="106.68" y2="43.18" width="0.1524" layer="91"/>
<wire x1="106.68" y1="43.18" x2="114.3" y2="43.18" width="0.1524" layer="91"/>
<pinref part="SUPPLY2" gate="G$1" pin="GND"/>
<pinref part="C11" gate="G$1" pin="2"/>
<wire x1="114.3" y1="43.18" x2="119.38" y2="43.18" width="0.1524" layer="91"/>
<junction x="114.3" y="43.18"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="297.18" y1="-22.86" x2="302.26" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="SUPPLY86" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="276.86" y1="-55.88" x2="279.4" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="SUPPLY5" gate="G$1" pin="GND"/>
<wire x1="279.4" y1="-55.88" x2="279.4" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="276.86" y1="-55.88" x2="276.86" y2="-58.42" width="0.1524" layer="91"/>
<junction x="279.4" y="-55.88"/>
<pinref part="IC2" gate="G$1" pin="A2"/>
<pinref part="IC2" gate="G$1" pin="A1"/>
</segment>
<segment>
<wire x1="193.04" y1="-109.22" x2="193.04" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY39" gate="G$1" pin="GND"/>
<pinref part="IC3" gate="G$1" pin="VSS"/>
</segment>
<segment>
<wire x1="203.2" y1="-58.42" x2="203.2" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="SUPPLY75" gate="G$1" pin="GND"/>
<pinref part="IC3" gate="G$1" pin="EXTCLK"/>
</segment>
<segment>
<pinref part="SUPPLY77" gate="G$1" pin="GND"/>
<wire x1="213.36" y1="-76.2" x2="213.36" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-76.2" x2="210.82" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-78.74" x2="210.82" y2="-78.74" width="0.1524" layer="91"/>
<junction x="213.36" y="-76.2"/>
<pinref part="IC3" gate="G$1" pin="A5"/>
<pinref part="IC3" gate="G$1" pin="!OE"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="208.28" y1="-22.86" x2="213.36" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="SUPPLY68" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY79" gate="G$1" pin="GND"/>
<wire x1="175.26" y1="-76.2" x2="177.8" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="175.26" y1="-78.74" x2="177.8" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="175.26" y1="-78.74" x2="175.26" y2="-76.2" width="0.1524" layer="91"/>
<junction x="175.26" y="-76.2"/>
<pinref part="IC3" gate="G$1" pin="A3"/>
<pinref part="IC3" gate="G$1" pin="A4"/>
</segment>
<segment>
<wire x1="187.96" y1="-55.88" x2="190.5" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-55.88" x2="193.04" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="SUPPLY78" gate="G$1" pin="GND"/>
<wire x1="187.96" y1="-55.88" x2="187.96" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-55.88" x2="190.5" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="193.04" y1="-55.88" x2="193.04" y2="-58.42" width="0.1524" layer="91"/>
<junction x="190.5" y="-55.88"/>
<pinref part="IC3" gate="G$1" pin="A2"/>
<pinref part="IC3" gate="G$1" pin="A1"/>
<pinref part="IC3" gate="G$1" pin="A0"/>
</segment>
<segment>
<wire x1="25.4" y1="99.06" x2="20.32" y2="99.06" width="0.1524" layer="91"/>
<pinref part="SUPPLY80" gate="G$1" pin="GND"/>
<pinref part="U$33" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="VSS"/>
<wire x1="398.78" y1="111.76" x2="398.78" y2="114.3" width="0.1524" layer="91"/>
<wire x1="398.78" y1="114.3" x2="391.16" y2="114.3" width="0.1524" layer="91"/>
<wire x1="391.16" y1="114.3" x2="381" y2="114.3" width="0.1524" layer="91"/>
<wire x1="381" y1="114.3" x2="375.92" y2="114.3" width="0.1524" layer="91"/>
<pinref part="SUPPLY81" gate="G$1" pin="GND"/>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="C8" gate="G$1" pin="2"/>
<junction x="391.16" y="114.3"/>
<junction x="381" y="114.3"/>
</segment>
<segment>
<wire x1="398.78" y1="86.36" x2="398.78" y2="88.9" width="0.1524" layer="91"/>
<wire x1="398.78" y1="88.9" x2="391.16" y2="88.9" width="0.1524" layer="91"/>
<pinref part="SUPPLY82" gate="G$1" pin="GND"/>
<pinref part="IC6" gate="G$1" pin="VSS"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="391.16" y1="88.9" x2="381" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="381" y1="88.9" x2="375.92" y2="88.9" width="0.1524" layer="91"/>
<junction x="391.16" y="88.9"/>
<junction x="381" y="88.9"/>
</segment>
<segment>
<pinref part="SUPPLY84" gate="G$1" pin="GND"/>
<wire x1="419.1" y1="99.06" x2="421.64" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="SUPPLY102" gate="G$1" pin="GND"/>
<wire x1="299.72" y1="12.7" x2="261.62" y2="12.7" width="0.1524" layer="91"/>
<pinref part="J4" gate="G$1" pin="MP2"/>
</segment>
<segment>
<pinref part="SUPPLY85" gate="G$1" pin="GND"/>
<wire x1="299.72" y1="45.72" x2="261.62" y2="45.72" width="0.1524" layer="91"/>
<pinref part="J4" gate="G$1" pin="MP4"/>
</segment>
<segment>
<wire x1="325.12" y1="45.72" x2="327.66" y2="45.72" width="0.1524" layer="91"/>
<pinref part="SUPPLY103" gate="G$1" pin="GND"/>
<wire x1="327.66" y1="45.72" x2="368.3" y2="45.72" width="0.1524" layer="91"/>
<wire x1="325.12" y1="43.18" x2="327.66" y2="43.18" width="0.1524" layer="91"/>
<wire x1="327.66" y1="43.18" x2="327.66" y2="45.72" width="0.1524" layer="91"/>
<junction x="327.66" y="45.72"/>
<pinref part="J4" gate="G$1" pin="23"/>
<pinref part="J4" gate="G$1" pin="MP3"/>
</segment>
<segment>
<wire x1="325.12" y1="12.7" x2="368.3" y2="12.7" width="0.1524" layer="91"/>
<pinref part="SUPPLY104" gate="G$1" pin="GND"/>
<pinref part="J4" gate="G$1" pin="MP1"/>
</segment>
<segment>
<wire x1="365.76" y1="35.56" x2="368.3" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="SUPPLY105" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="264.16" y1="30.48" x2="261.62" y2="30.48" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="2"/>
<pinref part="SUPPLY106" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="299.72" y1="25.4" x2="287.02" y2="25.4" width="0.1524" layer="91"/>
<pinref part="SUPPLY107" gate="G$1" pin="GND"/>
<pinref part="J4" gate="G$1" pin="10"/>
</segment>
<segment>
<wire x1="261.62" y1="22.86" x2="264.16" y2="22.86" width="0.1524" layer="91"/>
<pinref part="SUPPLY108" gate="G$1" pin="GND"/>
<pinref part="C16" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="SUPPLY87" gate="G$1" pin="GND"/>
<wire x1="403.86" y1="33.02" x2="403.86" y2="35.56" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="2"/>
</segment>
</net>
<net name="S9" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="3"/>
<wire x1="15.24" y1="-30.48" x2="15.24" y2="-38.1" width="0.1524" layer="91"/>
<label x="15.24" y="-38.1" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="195.58" y1="-109.22" x2="195.58" y2="-111.76" width="0.1524" layer="91"/>
<label x="195.58" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED8"/>
</segment>
</net>
<net name="S10" class="0">
<segment>
<pinref part="U$5" gate="G$1" pin="3"/>
<wire x1="33.02" y1="-30.48" x2="33.02" y2="-38.1" width="0.1524" layer="91"/>
<label x="33.02" y="-38.1" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="198.12" y1="-109.22" x2="198.12" y2="-111.76" width="0.1524" layer="91"/>
<label x="198.12" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED9"/>
</segment>
</net>
<net name="S11" class="0">
<segment>
<pinref part="U$6" gate="G$1" pin="3"/>
<wire x1="50.8" y1="-30.48" x2="50.8" y2="-35.56" width="0.1524" layer="91"/>
<label x="50.8" y="-35.56" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="200.66" y1="-109.22" x2="200.66" y2="-111.76" width="0.1524" layer="91"/>
<label x="200.66" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED10"/>
</segment>
</net>
<net name="S8" class="0">
<segment>
<pinref part="U$3" gate="G$1" pin="3"/>
<wire x1="139.7" y1="10.16" x2="139.7" y2="2.54" width="0.1524" layer="91"/>
<label x="139.7" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="190.5" y1="-109.22" x2="190.5" y2="-111.76" width="0.1524" layer="91"/>
<label x="190.5" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED7"/>
</segment>
</net>
<net name="S12" class="0">
<segment>
<pinref part="U$7" gate="G$1" pin="3"/>
<wire x1="68.58" y1="-30.48" x2="68.58" y2="-35.56" width="0.1524" layer="91"/>
<label x="68.58" y="-35.56" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="-91.44" x2="213.36" y2="-91.44" width="0.1524" layer="91"/>
<label x="213.36" y="-91.44" size="1.27" layer="95" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED11"/>
</segment>
</net>
<net name="S13" class="0">
<segment>
<pinref part="U$8" gate="G$1" pin="3"/>
<wire x1="86.36" y1="-30.48" x2="86.36" y2="-35.56" width="0.1524" layer="91"/>
<label x="86.36" y="-35.56" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="-88.9" x2="213.36" y2="-88.9" width="0.1524" layer="91"/>
<label x="213.36" y="-88.9" size="1.27" layer="95" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED12"/>
</segment>
</net>
<net name="S14" class="0">
<segment>
<pinref part="U$9" gate="G$1" pin="3"/>
<wire x1="104.14" y1="-30.48" x2="104.14" y2="-35.56" width="0.1524" layer="91"/>
<label x="104.14" y="-35.56" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="-86.36" x2="213.36" y2="-86.36" width="0.1524" layer="91"/>
<label x="213.36" y="-86.36" size="1.27" layer="95" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED13"/>
</segment>
</net>
<net name="S15" class="0">
<segment>
<pinref part="U$10" gate="G$1" pin="3"/>
<wire x1="121.92" y1="-30.48" x2="121.92" y2="-35.56" width="0.1524" layer="91"/>
<label x="121.92" y="-35.56" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="-83.82" x2="213.36" y2="-83.82" width="0.1524" layer="91"/>
<label x="213.36" y="-83.82" size="1.27" layer="95" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED14"/>
</segment>
</net>
<net name="S16" class="0">
<segment>
<pinref part="U$16" gate="G$1" pin="3"/>
<wire x1="139.7" y1="-30.48" x2="139.7" y2="-35.56" width="0.1524" layer="91"/>
<label x="139.7" y="-35.56" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="210.82" y1="-81.28" x2="213.36" y2="-81.28" width="0.1524" layer="91"/>
<label x="213.36" y="-81.28" size="1.27" layer="95" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED15"/>
</segment>
</net>
<net name="S17" class="0">
<segment>
<pinref part="U$17" gate="G$1" pin="3"/>
<wire x1="15.24" y1="-68.58" x2="15.24" y2="-73.66" width="0.1524" layer="91"/>
<label x="15.24" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="266.7" y1="-81.28" x2="264.16" y2="-81.28" width="0.1524" layer="91"/>
<label x="264.16" y="-81.28" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED0"/>
</segment>
</net>
<net name="S4" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="3"/>
<wire x1="68.58" y1="10.16" x2="68.58" y2="2.54" width="0.1524" layer="91"/>
<label x="68.58" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="177.8" y1="-88.9" x2="175.26" y2="-88.9" width="0.1524" layer="91"/>
<label x="175.26" y="-88.9" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED3"/>
</segment>
</net>
<net name="S3" class="0">
<segment>
<pinref part="U$14" gate="G$1" pin="3"/>
<wire x1="50.8" y1="10.16" x2="50.8" y2="2.54" width="0.1524" layer="91"/>
<label x="50.8" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="177.8" y1="-86.36" x2="175.26" y2="-86.36" width="0.1524" layer="91"/>
<label x="175.26" y="-86.36" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED2"/>
</segment>
</net>
<net name="S2" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="3"/>
<wire x1="33.02" y1="10.16" x2="33.02" y2="2.54" width="0.1524" layer="91"/>
<label x="33.02" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="177.8" y1="-83.82" x2="175.26" y2="-83.82" width="0.1524" layer="91"/>
<label x="175.26" y="-83.82" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED1"/>
</segment>
</net>
<net name="S1" class="0">
<segment>
<pinref part="U$13" gate="G$1" pin="3"/>
<wire x1="15.24" y1="10.16" x2="15.24" y2="2.54" width="0.1524" layer="91"/>
<label x="15.24" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="177.8" y1="-81.28" x2="175.26" y2="-81.28" width="0.1524" layer="91"/>
<label x="175.26" y="-81.28" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED0"/>
</segment>
</net>
<net name="S23" class="0">
<segment>
<pinref part="U$23" gate="G$1" pin="3"/>
<wire x1="121.92" y1="-68.58" x2="121.92" y2="-73.66" width="0.1524" layer="91"/>
<label x="121.92" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="276.86" y1="-109.22" x2="276.86" y2="-111.76" width="0.1524" layer="91"/>
<label x="276.86" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED6"/>
</segment>
</net>
<net name="S24" class="0">
<segment>
<pinref part="U$24" gate="G$1" pin="3"/>
<wire x1="139.7" y1="-68.58" x2="139.7" y2="-73.66" width="0.1524" layer="91"/>
<label x="139.7" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="279.4" y1="-109.22" x2="279.4" y2="-111.76" width="0.1524" layer="91"/>
<label x="279.4" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED7"/>
</segment>
</net>
<net name="S25" class="0">
<segment>
<pinref part="U$25" gate="G$1" pin="3"/>
<wire x1="15.24" y1="-106.68" x2="15.24" y2="-111.76" width="0.1524" layer="91"/>
<label x="15.24" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="284.48" y1="-109.22" x2="284.48" y2="-111.76" width="0.1524" layer="91"/>
<label x="284.48" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED8"/>
</segment>
</net>
<net name="S5" class="0">
<segment>
<pinref part="U$12" gate="G$1" pin="3"/>
<wire x1="86.36" y1="10.16" x2="86.36" y2="2.54" width="0.1524" layer="91"/>
<label x="86.36" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="177.8" y1="-91.44" x2="175.26" y2="-91.44" width="0.1524" layer="91"/>
<label x="175.26" y="-91.44" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED4"/>
</segment>
</net>
<net name="S6" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="3"/>
<wire x1="104.14" y1="10.16" x2="104.14" y2="2.54" width="0.1524" layer="91"/>
<label x="104.14" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="185.42" y1="-109.22" x2="185.42" y2="-111.76" width="0.1524" layer="91"/>
<label x="185.42" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED5"/>
</segment>
</net>
<net name="S7" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="3"/>
<wire x1="121.92" y1="10.16" x2="121.92" y2="2.54" width="0.1524" layer="91"/>
<label x="121.92" y="2.54" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="187.96" y1="-109.22" x2="187.96" y2="-111.76" width="0.1524" layer="91"/>
<label x="187.96" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="LED6"/>
</segment>
</net>
<net name="S18" class="0">
<segment>
<pinref part="U$18" gate="G$1" pin="3"/>
<wire x1="33.02" y1="-68.58" x2="33.02" y2="-73.66" width="0.1524" layer="91"/>
<label x="33.02" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="266.7" y1="-83.82" x2="264.16" y2="-83.82" width="0.1524" layer="91"/>
<label x="264.16" y="-83.82" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED1"/>
</segment>
</net>
<net name="S19" class="0">
<segment>
<pinref part="U$19" gate="G$1" pin="3"/>
<wire x1="50.8" y1="-68.58" x2="50.8" y2="-73.66" width="0.1524" layer="91"/>
<label x="50.8" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="266.7" y1="-86.36" x2="264.16" y2="-86.36" width="0.1524" layer="91"/>
<label x="264.16" y="-86.36" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED2"/>
</segment>
</net>
<net name="S20" class="0">
<segment>
<pinref part="U$21" gate="G$1" pin="3"/>
<wire x1="68.58" y1="-68.58" x2="68.58" y2="-73.66" width="0.1524" layer="91"/>
<label x="68.58" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="266.7" y1="-88.9" x2="264.16" y2="-88.9" width="0.1524" layer="91"/>
<label x="264.16" y="-88.9" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED3"/>
</segment>
</net>
<net name="S21" class="0">
<segment>
<pinref part="U$20" gate="G$1" pin="3"/>
<wire x1="86.36" y1="-68.58" x2="86.36" y2="-73.66" width="0.1524" layer="91"/>
<label x="86.36" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="266.7" y1="-91.44" x2="264.16" y2="-91.44" width="0.1524" layer="91"/>
<label x="264.16" y="-91.44" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED4"/>
</segment>
</net>
<net name="S22" class="0">
<segment>
<pinref part="U$22" gate="G$1" pin="3"/>
<wire x1="104.14" y1="-68.58" x2="104.14" y2="-73.66" width="0.1524" layer="91"/>
<label x="104.14" y="-73.66" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="274.32" y1="-109.22" x2="274.32" y2="-111.76" width="0.1524" layer="91"/>
<label x="274.32" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED5"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="U$13" gate="G$1" pin="2"/>
<wire x1="12.7" y1="0" x2="12.7" y2="10.16" width="0.1524" layer="91"/>
<pinref part="SUPPLY4" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$15" gate="G$1" pin="2"/>
<wire x1="30.48" y1="10.16" x2="30.48" y2="0" width="0.1524" layer="91"/>
<pinref part="SUPPLY6" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$14" gate="G$1" pin="2"/>
<wire x1="48.26" y1="10.16" x2="48.26" y2="0" width="0.1524" layer="91"/>
<pinref part="SUPPLY9" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$11" gate="G$1" pin="2"/>
<wire x1="66.04" y1="10.16" x2="66.04" y2="0" width="0.1524" layer="91"/>
<pinref part="SUPPLY10" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$12" gate="G$1" pin="2"/>
<wire x1="83.82" y1="0" x2="83.82" y2="10.16" width="0.1524" layer="91"/>
<pinref part="SUPPLY47" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="SUPPLY48" gate="G$1" pin="VCC"/>
<wire x1="101.6" y1="0" x2="101.6" y2="10.16" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="SUPPLY49" gate="G$1" pin="VCC"/>
<wire x1="119.38" y1="0" x2="119.38" y2="10.16" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U$3" gate="G$1" pin="2"/>
<wire x1="137.16" y1="10.16" x2="137.16" y2="0" width="0.1524" layer="91"/>
<pinref part="SUPPLY50" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$4" gate="G$1" pin="2"/>
<wire x1="12.7" y1="-30.48" x2="12.7" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY51" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$5" gate="G$1" pin="2"/>
<wire x1="30.48" y1="-30.48" x2="30.48" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY52" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="SUPPLY53" gate="G$1" pin="VCC"/>
<wire x1="48.26" y1="-40.64" x2="48.26" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U$7" gate="G$1" pin="2"/>
<wire x1="66.04" y1="-30.48" x2="66.04" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY54" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$8" gate="G$1" pin="2"/>
<wire x1="83.82" y1="-30.48" x2="83.82" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY55" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$9" gate="G$1" pin="2"/>
<wire x1="101.6" y1="-30.48" x2="101.6" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY56" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$10" gate="G$1" pin="2"/>
<wire x1="119.38" y1="-30.48" x2="119.38" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY57" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$17" gate="G$1" pin="2"/>
<wire x1="12.7" y1="-68.58" x2="12.7" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY59" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$18" gate="G$1" pin="2"/>
<wire x1="30.48" y1="-68.58" x2="30.48" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY60" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$19" gate="G$1" pin="2"/>
<wire x1="48.26" y1="-68.58" x2="48.26" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY61" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$21" gate="G$1" pin="2"/>
<wire x1="66.04" y1="-68.58" x2="66.04" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY62" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$20" gate="G$1" pin="2"/>
<wire x1="83.82" y1="-68.58" x2="83.82" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY63" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$22" gate="G$1" pin="2"/>
<wire x1="101.6" y1="-68.58" x2="101.6" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY64" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$23" gate="G$1" pin="2"/>
<wire x1="119.38" y1="-68.58" x2="119.38" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY65" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$24" gate="G$1" pin="2"/>
<wire x1="137.16" y1="-68.58" x2="137.16" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY66" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$25" gate="G$1" pin="2"/>
<wire x1="12.7" y1="-106.68" x2="12.7" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY67" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="SUPPLY58" gate="G$1" pin="VCC"/>
<wire x1="137.16" y1="-40.64" x2="137.16" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="U$16" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="SUPPLY3" gate="G$1" pin="VCC"/>
<wire x1="322.58" y1="106.68" x2="322.58" y2="101.6" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$26" gate="G$1" pin="2"/>
<wire x1="30.48" y1="-106.68" x2="30.48" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY41" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$27" gate="G$1" pin="2"/>
<wire x1="48.26" y1="-106.68" x2="48.26" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY70" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$28" gate="G$1" pin="2"/>
<wire x1="66.04" y1="-106.68" x2="66.04" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY71" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$29" gate="G$1" pin="2"/>
<wire x1="83.82" y1="-106.68" x2="83.82" y2="-119.38" width="0.1524" layer="91"/>
<pinref part="SUPPLY72" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$30" gate="G$1" pin="2"/>
<wire x1="101.6" y1="-106.68" x2="101.6" y2="-119.38" width="0.1524" layer="91"/>
<pinref part="SUPPLY73" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$31" gate="G$1" pin="2"/>
<wire x1="119.38" y1="-106.68" x2="119.38" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY74" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="U$32" gate="G$1" pin="2"/>
<wire x1="137.16" y1="-106.68" x2="137.16" y2="-116.84" width="0.1524" layer="91"/>
<pinref part="SUPPLY76" gate="G$1" pin="VCC"/>
</segment>
</net>
<net name="D+" class="0">
<segment>
<label x="175.26" y="25.4" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<wire x1="180.34" y1="25.4" x2="175.26" y2="25.4" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="IO20"/>
</segment>
<segment>
<wire x1="396.24" y1="-68.58" x2="381" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="381" y1="-68.58" x2="381" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="396.24" y1="-76.2" x2="414.02" y2="-76.2" width="0.1524" layer="91"/>
<label x="414.02" y="-76.2" size="1.27" layer="95" xref="yes"/>
<wire x1="396.24" y1="-76.2" x2="381" y2="-76.2" width="0.1524" layer="91"/>
<junction x="396.24" y="-76.2"/>
<pinref part="J2" gate="G$1" pin="DP1"/>
<pinref part="J2" gate="G$1" pin="DP2"/>
</segment>
</net>
<net name="D-" class="0">
<segment>
<label x="175.26" y="27.94" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<wire x1="175.26" y1="27.94" x2="180.34" y2="27.94" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="IO19"/>
</segment>
<segment>
<wire x1="396.24" y1="-73.66" x2="403.86" y2="-73.66" width="0.1524" layer="91"/>
<wire x1="403.86" y1="-73.66" x2="403.86" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="403.86" y1="-66.04" x2="396.24" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="403.86" y1="-66.04" x2="414.02" y2="-66.04" width="0.1524" layer="91"/>
<label x="414.02" y="-66.04" size="1.27" layer="95" xref="yes"/>
<junction x="403.86" y="-66.04"/>
<pinref part="J2" gate="G$1" pin="DN1"/>
<pinref part="J2" gate="G$1" pin="DN2"/>
</segment>
</net>
<net name="VCC_5V" class="0">
<segment>
<label x="238.76" y="101.6" size="1.27" layer="95" xref="yes"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="218.44" y1="101.6" x2="228.6" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="228.6" y1="101.6" x2="238.76" y2="101.6" width="0.1524" layer="91"/>
<junction x="218.44" y="101.6"/>
<junction x="228.6" y="101.6"/>
<wire x1="218.44" y1="101.6" x2="203.2" y2="101.6" width="0.1524" layer="91"/>
<pinref part="PS1" gate="G$1" pin="IN"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="281.94" y1="91.44" x2="281.94" y2="88.9" width="0.1524" layer="91"/>
<label x="281.94" y="88.9" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<label x="284.48" y="-20.32" size="1.27" layer="95" rot="R90" xref="yes"/>
<wire x1="284.48" y1="-58.42" x2="284.48" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="284.48" y1="-22.86" x2="284.48" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="289.56" y1="-22.86" x2="284.48" y2="-22.86" width="0.1524" layer="91"/>
<junction x="284.48" y="-22.86"/>
<pinref part="IC2" gate="G$1" pin="VDD"/>
</segment>
<segment>
<wire x1="396.24" y1="-60.96" x2="408.94" y2="-60.96" width="0.1524" layer="91"/>
<label x="408.94" y="-60.96" size="1.27" layer="95" xref="yes"/>
<pinref part="J2" gate="G$1" pin="VBUS"/>
</segment>
<segment>
<label x="195.58" y="-20.32" size="1.27" layer="95" rot="R90" xref="yes"/>
<wire x1="195.58" y1="-58.42" x2="195.58" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="195.58" y1="-22.86" x2="195.58" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="200.66" y1="-22.86" x2="195.58" y2="-22.86" width="0.1524" layer="91"/>
<junction x="195.58" y="-22.86"/>
<pinref part="IC3" gate="G$1" pin="VDD"/>
</segment>
<segment>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="228.6" y1="33.02" x2="231.14" y2="33.02" width="0.1524" layer="91"/>
<label x="231.14" y="33.02" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="R24" gate="G$1" pin="2"/>
<wire x1="228.6" y1="20.32" x2="231.14" y2="20.32" width="0.1524" layer="91"/>
<label x="231.14" y="20.32" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<wire x1="281.94" y1="-58.42" x2="281.94" y2="-20.32" width="0.1524" layer="91"/>
<label x="281.94" y="-20.32" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="A0"/>
</segment>
</net>
<net name="VCC_3.3V" class="0">
<segment>
<label x="162.56" y="101.6" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="182.88" y1="101.6" x2="172.72" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="172.72" y1="101.6" x2="162.56" y2="101.6" width="0.1524" layer="91"/>
<junction x="182.88" y="101.6"/>
<junction x="172.72" y="101.6"/>
<wire x1="182.88" y1="101.6" x2="198.12" y2="101.6" width="0.1524" layer="91"/>
<pinref part="PS1" gate="G$1" pin="OUT"/>
</segment>
<segment>
<wire x1="180.34" y1="55.88" x2="175.26" y2="55.88" width="0.1524" layer="91"/>
<label x="175.26" y="55.88" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="3V3"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="114.3" y1="60.96" x2="114.3" y2="63.5" width="0.1524" layer="91"/>
<label x="114.3" y="63.5" size="1.27" layer="95" rot="R90" xref="yes"/>
</segment>
<segment>
<wire x1="25.4" y1="104.14" x2="20.32" y2="104.14" width="0.1524" layer="91"/>
<label x="20.32" y="104.14" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$33" gate="G$1" pin="VCC"/>
</segment>
<segment>
<wire x1="426.72" y1="86.36" x2="431.8" y2="86.36" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="VIN"/>
<pinref part="IC4" gate="G$1" pin="VIN"/>
<wire x1="431.8" y1="86.36" x2="431.8" y2="99.06" width="0.1524" layer="91"/>
<wire x1="431.8" y1="99.06" x2="431.8" y2="111.76" width="0.1524" layer="91"/>
<wire x1="426.72" y1="111.76" x2="431.8" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="429.26" y1="99.06" x2="431.8" y2="99.06" width="0.1524" layer="91"/>
<junction x="431.8" y="99.06"/>
<wire x1="431.8" y1="99.06" x2="434.34" y2="99.06" width="0.1524" layer="91"/>
<label x="434.34" y="99.06" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<wire x1="299.72" y1="30.48" x2="274.32" y2="30.48" width="0.1524" layer="91"/>
<wire x1="274.32" y1="30.48" x2="271.78" y2="30.48" width="0.1524" layer="91"/>
<label x="274.32" y="33.02" size="1.27" layer="95" xref="yes"/>
<pinref part="C15" gate="G$1" pin="1"/>
<wire x1="274.32" y1="33.02" x2="274.32" y2="30.48" width="0.1524" layer="91"/>
<junction x="274.32" y="30.48"/>
<pinref part="J4" gate="G$1" pin="14"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="416.56" y1="45.72" x2="419.1" y2="45.72" width="0.1524" layer="91"/>
<label x="419.1" y="45.72" size="1.27" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="411.48" y1="20.32" x2="414.02" y2="20.32" width="0.1524" layer="91"/>
<wire x1="414.02" y1="20.32" x2="419.1" y2="20.32" width="0.1524" layer="91"/>
<wire x1="414.02" y1="20.32" x2="414.02" y2="15.24" width="0.1524" layer="91"/>
<wire x1="414.02" y1="15.24" x2="411.48" y2="15.24" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<label x="419.1" y="20.32" size="1.27" layer="95" xref="yes"/>
<junction x="414.02" y="20.32"/>
</segment>
</net>
<net name="RESET" class="0">
<segment>
<wire x1="180.34" y1="53.34" x2="175.26" y2="53.34" width="0.1524" layer="91"/>
<label x="175.26" y="53.34" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="EN"/>
</segment>
<segment>
<pinref part="S2" gate="G$1" pin="K"/>
<wire x1="106.68" y1="48.26" x2="106.68" y2="50.8" width="0.1524" layer="91"/>
<wire x1="106.68" y1="50.8" x2="114.3" y2="50.8" width="0.1524" layer="91"/>
<label x="121.92" y="50.8" size="1.27" layer="95" xref="yes"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="114.3" y1="50.8" x2="121.92" y2="50.8" width="0.1524" layer="91"/>
<junction x="114.3" y="50.8"/>
<pinref part="R2" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="281.94" y1="101.6" x2="281.94" y2="104.14" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="A"/>
</segment>
</net>
<net name="BOOT" class="0">
<segment>
<wire x1="213.36" y1="55.88" x2="231.14" y2="55.88" width="0.1524" layer="91"/>
<label x="231.14" y="55.88" size="1.27" layer="95" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO0"/>
</segment>
<segment>
<label x="48.26" y="48.26" size="1.27" layer="95" xref="yes"/>
<wire x1="48.26" y1="48.26" x2="45.72" y2="48.26" width="0.1524" layer="91"/>
<pinref part="S1" gate="G$1" pin="K"/>
</segment>
</net>
<net name="S26" class="0">
<segment>
<pinref part="U$26" gate="G$1" pin="3"/>
<wire x1="33.02" y1="-106.68" x2="33.02" y2="-111.76" width="0.1524" layer="91"/>
<label x="33.02" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="287.02" y1="-109.22" x2="287.02" y2="-111.76" width="0.1524" layer="91"/>
<label x="287.02" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED9"/>
</segment>
</net>
<net name="S27" class="0">
<segment>
<pinref part="U$27" gate="G$1" pin="3"/>
<wire x1="50.8" y1="-106.68" x2="50.8" y2="-111.76" width="0.1524" layer="91"/>
<label x="50.8" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="289.56" y1="-109.22" x2="289.56" y2="-111.76" width="0.1524" layer="91"/>
<label x="289.56" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED10"/>
</segment>
</net>
<net name="S28" class="0">
<segment>
<pinref part="U$28" gate="G$1" pin="3"/>
<wire x1="68.58" y1="-106.68" x2="68.58" y2="-111.76" width="0.1524" layer="91"/>
<label x="68.58" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="299.72" y1="-91.44" x2="302.26" y2="-91.44" width="0.1524" layer="91"/>
<label x="302.26" y="-91.44" size="1.27" layer="95" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED11"/>
</segment>
</net>
<net name="S29" class="0">
<segment>
<wire x1="299.72" y1="-88.9" x2="302.26" y2="-88.9" width="0.1524" layer="91"/>
<label x="302.26" y="-88.9" size="1.27" layer="95" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED12"/>
</segment>
<segment>
<pinref part="U$29" gate="G$1" pin="3"/>
<wire x1="86.36" y1="-106.68" x2="86.36" y2="-111.76" width="0.1524" layer="91"/>
<label x="86.36" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
</net>
<net name="S31" class="0">
<segment>
<pinref part="U$31" gate="G$1" pin="3"/>
<wire x1="121.92" y1="-106.68" x2="121.92" y2="-111.76" width="0.1524" layer="91"/>
<label x="121.92" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="299.72" y1="-83.82" x2="302.26" y2="-83.82" width="0.1524" layer="91"/>
<label x="302.26" y="-83.82" size="1.27" layer="95" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED14"/>
</segment>
</net>
<net name="S32" class="0">
<segment>
<pinref part="U$32" gate="G$1" pin="3"/>
<wire x1="139.7" y1="-106.68" x2="139.7" y2="-111.76" width="0.1524" layer="91"/>
<label x="139.7" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<wire x1="299.72" y1="-81.28" x2="302.26" y2="-81.28" width="0.1524" layer="91"/>
<label x="302.26" y="-81.28" size="1.27" layer="95" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED15"/>
</segment>
</net>
<net name="S30" class="0">
<segment>
<wire x1="299.72" y1="-86.36" x2="302.26" y2="-86.36" width="0.1524" layer="91"/>
<label x="302.26" y="-86.36" size="1.27" layer="95" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="LED13"/>
</segment>
<segment>
<pinref part="U$30" gate="G$1" pin="3"/>
<wire x1="104.14" y1="-106.68" x2="104.14" y2="-111.76" width="0.1524" layer="91"/>
<label x="104.14" y="-111.76" size="1.27" layer="95" rot="R270" xref="yes"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<wire x1="213.36" y1="25.4" x2="215.9" y2="25.4" width="0.1524" layer="91"/>
<label x="231.14" y="25.4" size="1.27" layer="95" xref="yes"/>
<pinref part="R24" gate="G$1" pin="1"/>
<wire x1="215.9" y1="25.4" x2="231.14" y2="25.4" width="0.1524" layer="91"/>
<wire x1="218.44" y1="20.32" x2="215.9" y2="20.32" width="0.1524" layer="91"/>
<wire x1="215.9" y1="20.32" x2="215.9" y2="25.4" width="0.1524" layer="91"/>
<junction x="215.9" y="25.4"/>
<pinref part="IC5" gate="G$1" pin="IO1"/>
</segment>
<segment>
<wire x1="287.02" y1="-58.42" x2="287.02" y2="-35.56" width="0.1524" layer="91"/>
<label x="287.02" y="-35.56" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="SDA"/>
</segment>
<segment>
<wire x1="198.12" y1="-58.42" x2="198.12" y2="-35.56" width="0.1524" layer="91"/>
<label x="198.12" y="-35.56" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="SDA"/>
</segment>
<segment>
<wire x1="25.4" y1="114.3" x2="20.32" y2="114.3" width="0.1524" layer="91"/>
<label x="20.32" y="114.3" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$33" gate="G$1" pin="SDA"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<wire x1="213.36" y1="27.94" x2="215.9" y2="27.94" width="0.1524" layer="91"/>
<label x="231.14" y="27.94" size="1.27" layer="95" xref="yes"/>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="215.9" y1="27.94" x2="231.14" y2="27.94" width="0.1524" layer="91"/>
<wire x1="218.44" y1="33.02" x2="215.9" y2="33.02" width="0.1524" layer="91"/>
<wire x1="215.9" y1="33.02" x2="215.9" y2="27.94" width="0.1524" layer="91"/>
<junction x="215.9" y="27.94"/>
<pinref part="IC5" gate="G$1" pin="IO2"/>
</segment>
<segment>
<wire x1="289.56" y1="-58.42" x2="289.56" y2="-45.72" width="0.1524" layer="91"/>
<label x="289.56" y="-45.72" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="IC2" gate="G$1" pin="SCL"/>
</segment>
<segment>
<wire x1="200.66" y1="-58.42" x2="200.66" y2="-45.72" width="0.1524" layer="91"/>
<label x="200.66" y="-45.72" size="1.27" layer="95" rot="R90" xref="yes"/>
<pinref part="IC3" gate="G$1" pin="SCL"/>
</segment>
<segment>
<wire x1="25.4" y1="109.22" x2="20.32" y2="109.22" width="0.1524" layer="91"/>
<label x="20.32" y="109.22" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$33" gate="G$1" pin="SCL"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="396.24" y1="-81.28" x2="401.32" y2="-81.28" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="1"/>
<pinref part="J2" gate="G$1" pin="CC1"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="396.24" y1="-88.9" x2="401.32" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="J2" gate="G$1" pin="CC2"/>
</segment>
</net>
<net name="GND1" class="0">
<segment>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="266.7" y1="-78.74" x2="266.7" y2="-77.5462" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="A4"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="292.1" y1="-58.42" x2="292.1" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="SUPPLY88" gate="G$1" pin="GND"/>
<pinref part="IC2" gate="G$1" pin="EXTCLK"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="SUPPLY38" gate="G$1" pin="GND"/>
<wire x1="264.16" y1="-76.2" x2="266.7" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="266.7" y1="-77.3938" x2="266.7" y2="-76.2" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="A3"/>
</segment>
</net>
<net name="VCC_1.2V" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="VOUT"/>
<wire x1="398.78" y1="109.22" x2="398.78" y2="106.68" width="0.1524" layer="91"/>
<wire x1="398.78" y1="106.68" x2="391.16" y2="106.68" width="0.1524" layer="91"/>
<label x="373.38" y="106.68" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="391.16" y1="106.68" x2="381" y2="106.68" width="0.1524" layer="91"/>
<wire x1="381" y1="106.68" x2="373.38" y2="106.68" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<junction x="391.16" y="106.68"/>
<junction x="381" y="106.68"/>
</segment>
<segment>
<wire x1="325.12" y1="33.02" x2="330.2" y2="33.02" width="0.1524" layer="91"/>
<label x="330.2" y="33.02" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="15"/>
</segment>
</net>
<net name="VCC_2.8V" class="0">
<segment>
<wire x1="398.78" y1="83.82" x2="398.78" y2="81.28" width="0.1524" layer="91"/>
<wire x1="398.78" y1="81.28" x2="391.16" y2="81.28" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="VOUT"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="391.16" y1="81.28" x2="381" y2="81.28" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="381" y1="81.28" x2="373.38" y2="81.28" width="0.1524" layer="91"/>
<junction x="391.16" y="81.28"/>
<junction x="381" y="81.28"/>
<label x="373.38" y="81.28" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<wire x1="325.12" y1="40.64" x2="330.2" y2="40.64" width="0.1524" layer="91"/>
<label x="330.2" y="40.64" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="21"/>
</segment>
</net>
<net name="CAM_SDA" class="0">
<segment>
<wire x1="299.72" y1="40.64" x2="294.64" y2="40.64" width="0.1524" layer="91"/>
<label x="294.64" y="40.64" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="J4" gate="G$1" pin="22"/>
</segment>
<segment>
<wire x1="180.34" y1="50.8" x2="175.26" y2="50.8" width="0.1524" layer="91"/>
<label x="175.26" y="50.8" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO4"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="401.32" y1="15.24" x2="398.78" y2="15.24" width="0.1524" layer="91"/>
<label x="398.78" y="15.24" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="CAM_SCL" class="0">
<segment>
<wire x1="299.72" y1="38.1" x2="294.64" y2="38.1" width="0.1524" layer="91"/>
<label x="294.64" y="38.1" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="J4" gate="G$1" pin="20"/>
</segment>
<segment>
<wire x1="180.34" y1="48.26" x2="175.26" y2="48.26" width="0.1524" layer="91"/>
<label x="175.26" y="48.26" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO5"/>
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="401.32" y1="20.32" x2="398.78" y2="20.32" width="0.1524" layer="91"/>
<label x="398.78" y="20.32" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="CAM_RST" class="0">
<segment>
<wire x1="325.12" y1="38.1" x2="330.2" y2="38.1" width="0.1524" layer="91"/>
<label x="330.2" y="38.1" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="19"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="406.4" y1="45.72" x2="403.86" y2="45.72" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="403.86" y1="45.72" x2="398.78" y2="45.72" width="0.1524" layer="91"/>
<wire x1="403.86" y1="43.18" x2="403.86" y2="45.72" width="0.1524" layer="91"/>
<label x="398.78" y="45.72" size="1.27" layer="95" rot="R180" xref="yes"/>
<junction x="403.86" y="45.72"/>
</segment>
</net>
<net name="VSYNC" class="0">
<segment>
<wire x1="299.72" y1="35.56" x2="294.64" y2="35.56" width="0.1524" layer="91"/>
<label x="294.64" y="35.56" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="J4" gate="G$1" pin="18"/>
</segment>
<segment>
<wire x1="180.34" y1="45.72" x2="175.26" y2="45.72" width="0.1524" layer="91"/>
<label x="175.26" y="45.72" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO6"/>
</segment>
</net>
<net name="HREF" class="0">
<segment>
<wire x1="299.72" y1="33.02" x2="294.64" y2="33.02" width="0.1524" layer="91"/>
<label x="294.64" y="33.02" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="J4" gate="G$1" pin="16"/>
</segment>
<segment>
<wire x1="180.34" y1="43.18" x2="175.26" y2="43.18" width="0.1524" layer="91"/>
<label x="175.26" y="43.18" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO7"/>
</segment>
</net>
<net name="DATA9" class="0">
<segment>
<wire x1="325.12" y1="30.48" x2="330.2" y2="30.48" width="0.1524" layer="91"/>
<label x="330.2" y="30.48" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="13"/>
</segment>
<segment>
<wire x1="180.34" y1="38.1" x2="175.26" y2="38.1" width="0.1524" layer="91"/>
<label x="175.26" y="38.1" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO16"/>
</segment>
</net>
<net name="XCLK" class="0">
<segment>
<wire x1="299.72" y1="27.94" x2="294.64" y2="27.94" width="0.1524" layer="91"/>
<label x="294.64" y="27.94" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="J4" gate="G$1" pin="12"/>
</segment>
<segment>
<wire x1="180.34" y1="40.64" x2="175.26" y2="40.64" width="0.1524" layer="91"/>
<label x="175.26" y="40.64" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO15"/>
</segment>
</net>
<net name="DATA8" class="0">
<segment>
<wire x1="325.12" y1="27.94" x2="330.2" y2="27.94" width="0.1524" layer="91"/>
<label x="330.2" y="27.94" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="11"/>
</segment>
<segment>
<wire x1="180.34" y1="35.56" x2="175.26" y2="35.56" width="0.1524" layer="91"/>
<label x="175.26" y="35.56" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO17"/>
</segment>
</net>
<net name="DATA7" class="0">
<segment>
<wire x1="325.12" y1="25.4" x2="330.2" y2="25.4" width="0.1524" layer="91"/>
<label x="330.2" y="25.4" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="9"/>
</segment>
<segment>
<wire x1="180.34" y1="33.02" x2="175.26" y2="33.02" width="0.1524" layer="91"/>
<label x="175.26" y="33.02" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO18"/>
</segment>
</net>
<net name="PCLK" class="0">
<segment>
<label x="274.32" y="20.32" size="1.27" layer="95" xref="yes"/>
<pinref part="C16" gate="G$1" pin="1"/>
<wire x1="299.72" y1="22.86" x2="274.32" y2="22.86" width="0.1524" layer="91"/>
<wire x1="274.32" y1="22.86" x2="271.78" y2="22.86" width="0.1524" layer="91"/>
<wire x1="274.32" y1="22.86" x2="274.32" y2="20.32" width="0.1524" layer="91"/>
<junction x="274.32" y="22.86"/>
<pinref part="J4" gate="G$1" pin="8"/>
</segment>
<segment>
<wire x1="180.34" y1="7.62" x2="175.26" y2="7.62" width="0.1524" layer="91"/>
<label x="175.26" y="7.62" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO13"/>
</segment>
</net>
<net name="DATA4" class="0">
<segment>
<wire x1="325.12" y1="17.78" x2="330.2" y2="17.78" width="0.1524" layer="91"/>
<label x="330.2" y="17.78" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="3"/>
</segment>
<segment>
<wire x1="180.34" y1="30.48" x2="175.26" y2="30.48" width="0.1524" layer="91"/>
<label x="175.26" y="30.48" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO8"/>
</segment>
</net>
<net name="DATA3" class="0">
<segment>
<wire x1="299.72" y1="17.78" x2="294.64" y2="17.78" width="0.1524" layer="91"/>
<label x="294.64" y="17.78" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="J4" gate="G$1" pin="4"/>
</segment>
<segment>
<wire x1="180.34" y1="17.78" x2="175.26" y2="17.78" width="0.1524" layer="91"/>
<label x="175.26" y="17.78" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO9"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
</segment>
</net>
<net name="DATA5" class="0">
<segment>
<wire x1="325.12" y1="20.32" x2="330.2" y2="20.32" width="0.1524" layer="91"/>
<label x="330.2" y="20.32" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="5"/>
</segment>
<segment>
<wire x1="180.34" y1="15.24" x2="175.26" y2="15.24" width="0.1524" layer="91"/>
<label x="175.26" y="15.24" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO10"/>
</segment>
</net>
<net name="DATA2" class="0">
<segment>
<wire x1="299.72" y1="20.32" x2="294.64" y2="20.32" width="0.1524" layer="91"/>
<label x="294.64" y="20.32" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="J4" gate="G$1" pin="6"/>
</segment>
<segment>
<wire x1="180.34" y1="12.7" x2="175.26" y2="12.7" width="0.1524" layer="91"/>
<label x="175.26" y="12.7" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO11"/>
</segment>
</net>
<net name="DATA6" class="0">
<segment>
<wire x1="325.12" y1="22.86" x2="330.2" y2="22.86" width="0.1524" layer="91"/>
<label x="330.2" y="22.86" size="1.27" layer="95" xref="yes"/>
<pinref part="J4" gate="G$1" pin="7"/>
</segment>
<segment>
<wire x1="180.34" y1="10.16" x2="175.26" y2="10.16" width="0.1524" layer="91"/>
<label x="175.26" y="10.16" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="IC5" gate="G$1" pin="IO12"/>
</segment>
</net>
<net name="CAM_PWDN" class="0">
<segment>
<wire x1="325.12" y1="35.56" x2="342.9" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<label x="342.9" y="38.1" size="1.27" layer="95" xref="yes"/>
<wire x1="342.9" y1="35.56" x2="355.6" y2="35.56" width="0.1524" layer="91"/>
<wire x1="342.9" y1="35.56" x2="342.9" y2="38.1" width="0.1524" layer="91"/>
<junction x="342.9" y="35.56"/>
<pinref part="J4" gate="G$1" pin="17"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
<note version="8.4" severity="warning">
Since Version 8.4, EAGLE supports properties for SPICE simulation. 
Probes in schematics and SPICE mapping objects found in parts and library devices
will not be understood with this version. Update EAGLE to the latest version
for full support of SPICE simulation. 
</note>
</compatibility>
</eagle>
