cat <<EOT > ElectricVLSI/Libraries/FourBitAdder_CMOS.jelib
# header information:
HFourBitAdder_CMOS|9.08

# Views:
Vlayout|lay
Vschematic|sch
Vicon|ic

# Technologies:
Tmocmos|ScaleFORmocmos()D100.0|mocmosAnalog()BT|mocmosNumberOfMetalLayers()I3

EOT

# NAND Icon
sed -n '11,30p' ElectricVLSI/Libraries/FullAdder_CMOS.jelib | sed 's/pin@/pn_ni@/g' | sed 's/art@/at_ni@/g' >> ElectricVLSI/Libraries/FourBitAdder_CMOS.jelib
# NAND Schematic
sed -n '31,91p' ElectricVLSI/Libraries/FullAdder_CMOS.jelib | sed 's/pin@/pn_ns@/g' | sed 's/art@/at_ns@/g' >> ElectricVLSI/Libraries/FourBitAdder_CMOS.jelib
# FullAdder Schematic
sed -n '92,193p' ElectricVLSI/Libraries/FullAdder_CMOS.jelib | grep -v "^X" | sed 's/pin@/pn_fs@/g' | sed 's/art@/at_fs@/g' >> ElectricVLSI/Libraries/FourBitAdder_CMOS.jelib

# FullAdder Layout (from Lab3)
sed -n '37,598p' ElectricVLSI/Libraries/Lab3.jelib | sed 's/FullAddr/FullAdder/g' | sed 's/pin@/pn_fl@/g' | sed 's/contact@/ct_fl@/g' | sed 's/art@/at_fl@/g' >> ElectricVLSI/Libraries/FourBitAdder_CMOS.jelib

cat <<EOT >> ElectricVLSI/Libraries/FourBitAdder_CMOS.jelib

# Cell 4BitAdder;1{sch}
C4BitAdder;1{sch}||schematic|1773257698586|1774467521119|
IFullAdder;1{sch}|FA_U0@0||0|30|||D5G2;
IFullAdder;1{sch}|FA_U1@1||200|30|||D5G2;
IFullAdder;1{sch}|FA_U2@2||400|30|||D5G2;
IFullAdder;1{sch}|FA_U3@3||600|30|||D5G2;
Aschematic:wire|net@c0|||0|FA_U0@0|Cout|120|70.5|FA_U1@1|Cin|185|25
Aschematic:wire|net@c1|||0|FA_U1@1|Cout|320|70.5|FA_U2@2|Cin|385|25
Aschematic:wire|net@c2|||0|FA_U2@2|Cout|520|70.5|FA_U3@3|Cin|585|25
EA0||D5G2;|FA_U0@0|A|U
EB0||D5G2;|FA_U0@0|B|U
EA1||D5G2;|FA_U1@1|A|U
EB1||D5G2;|FA_U1@1|B|U
EA2||D5G2;|FA_U2@2|A|U
EB2||D5G2;|FA_U2@2|B|U
EA3||D5G2;|FA_U3@3|A|U
EB3||D5G2;|FA_U3@3|B|U
ECin||D5G2;|FA_U0@0|Cin|U
ESum0||D5G2;|FA_U0@0|Sum|U
ESum1||D5G2;|FA_U1@1|Sum|U
ESum2||D5G2;|FA_U2@2|Sum|U
ESum3||D5G2;|FA_U3@3|Sum|U
ECout||D5G2;|FA_U3@3|Cout|U

# Cell 4BitAdder;1{lay}
C4BitAdder;1{lay}||mocmos|1773257698586|1774467521119|
IFullAdder;1{lay}|FA_L0@0||0|0|||D5G2;
IFullAdder;1{lay}|FA_L1@1||250|0|||D5G2;
IFullAdder;1{lay}|FA_L2@2||500|0|||D5G2;
IFullAdder;1{lay}|FA_L3@3||750|0|||D5G2;
EA0||D5G2;|FA_L0@0|A|U
EB0||D5G2;|FA_L0@0|B|U
EA1||D5G2;|FA_L1@1|A|U
EB1||D5G2;|FA_L1@1|B|U
EA2||D5G2;|FA_L2@2|A|U
EB2||D5G2;|FA_L2@2|B|U
EA3||D5G2;|FA_L3@3|A|U
EB3||D5G2;|FA_L3@3|B|U
ECin||D5G2;|FA_L0@0|C|U
ESum0||D5G2;|FA_L0@0|Sum|U
ESum1||D5G2;|FA_L1@1|Sum|U
ESum2||D5G2;|FA_L2@2|Sum|U
ESum3||D5G2;|FA_L3@3|Sum|U
ECout||D5G2;|FA_L3@3|cout|U
AMetal-1|net@vdd0||2|S1800|FA_L0@0|vdd|18|40|FA_L1@1|vdd|268|40
AMetal-1|net@vdd1||2|S1800|FA_L1@1|vdd|268|40|FA_L2@2|vdd|518|40
AMetal-1|net@vdd2||2|S1800|FA_L2@2|vdd|518|40|FA_L3@3|vdd|768|40
AMetal-1|net@gnd0||2|S1800|FA_L0@0|gnd|35|-33.5|FA_L1@1|gnd|285|-33.5
AMetal-1|net@gnd1||2|S1800|FA_L1@1|gnd|285|-33.5|FA_L2@2|gnd|535|-33.5
AMetal-1|net@gnd2||2|S1800|FA_L2@2|gnd|535|-33.5|FA_L3@3|gnd|785|-33.5
AMetal-2|net@c0_lay||1|S1800|FA_L0@0|cout|153.5|-169.5|FA_L1@1|C|177.5|49
AMetal-2|net@c1_lay||1|S1800|FA_L1@1|cout|403.5|-169.5|FA_L2@2|C|427.5|49
AMetal-2|net@c2_lay||1|S1800|FA_L2@2|cout|653.5|-169.5|FA_L3@3|C|677.5|49
EVDD|vdd|D5G2;|FA_L0@0|vdd|U
EGND|gnd|D5G2;|FA_L0@0|gnd|U
X
EOT
