#!/bin/sh

SYSTEMID_GBA=20
ABBREV_SYSTEMNAME_GBA="GBA"
SYSTEMNAME_GBA="Nintendo - Game Boy Advance"

GEN_DEVELOPER_GBA='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_GBA='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_GBA='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_GBA='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_developer_gba() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_GBA} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_gba() {
   _gen_developer_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

_gen_publisher_gba() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_GBA} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_gba() {
   _gen_publisher_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

_gen_releaseyear_gba() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_GBA} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_gba() {
   _gen_releaseyear_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

_gen_releasemonth_gba() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_GBA} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_gba() {
   _gen_releasemonth_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}

_gen_gba() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_GBA}" "${GEN_PUBLISHER_GBA}" "${GEN_RELEASEYEAR_GBA}" "${GEN_RELEASEMONTH_GBA}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_gba() {
   #gen_dat_gba
   _gen_gba "${ABBREV_SYSTEMNAME_GBA}" "${SYSTEMNAME_GBA}" ${SYSTEMID_GBA}
}
