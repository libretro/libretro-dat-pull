#!/bin/sh

SYSTEMID_GBA=20
ABBREV_SYSTEMNAME_GBA="GBA"
SYSTEMNAME_GBA="Nintendo - Nintendo Game Boy Advance"

_gen_developer_gba() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_gba() {
   _gen_developer_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

_gen_publisher_gba() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}" && mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_gba() {
   _gen_publisher_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

_gen_releaseyear_gba() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_gba() {
   _gen_releaseyear_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

_gen_releasemonth_gba() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_gba() {
   _gen_releasemonth_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

gen_gba() {
   #gen_dat_gba
   gen_developer_gba
   gen_publisher_gba
   gen_releaseyear_gba
   gen_releasemonth_gba
}
