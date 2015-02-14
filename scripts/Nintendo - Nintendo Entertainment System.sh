#!/bin/sh

SYSTEMID_NES=25
ABBREV_SYSTEMNAME_NES="NES"
SYSTEMNAME_NES="Nintendo - Nintendo Entertainment System"

GEN_DEVELOPER_NES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_NES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_NES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_NES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_developer_nes() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_NES} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_nes() {
   _gen_developer_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

_gen_publisher_nes() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_NES} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_nes() {
   _gen_publisher_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

_gen_releaseyear_nes() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_NES} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_nes() {
   _gen_releaseyear_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

_gen_releasemonth_nes() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_NES} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_nes() {
   _gen_releasemonth_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

_gen_nes() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_NES}" "${GEN_PUBLISHER_NES}" "${GEN_RELEASEYEAR_NES}" "${GEN_RELEASEMONTH_NES}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_nes() {
   #gen_dat_nes
   _gen_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}
