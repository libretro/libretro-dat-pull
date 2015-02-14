#!/bin/sh

SYSTEMID_NES=25
ABBREV_SYSTEMNAME_NES="NES"
SYSTEMNAME_NES="Nintendo - Nintendo Entertainment System"

_gen_developer_nes() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_nes() {
   _gen_developer_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

_gen_publisher_nes() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}" && mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_nes() {
   _gen_publisher_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

_gen_releaseyear_nes() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_nes() {
   _gen_releaseyear_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

_gen_releasemonth_nes() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_nes() {
   _gen_releasemonth_nes "${ABBREV_SYSTEMNAME_NES}" "${SYSTEMNAME_NES}" ${SYSTEMID_NES}
}

gen_nes() {
   #gen_dat_nes
   gen_developer_nes
   gen_publisher_nes
   gen_releaseyear_nes
   gen_releasemonth_nes
}
