#!/bin/sh

SYSTEMID_GBC=21
ABBREV_SYSTEMNAME_GBC="GBC"
SYSTEMNAME_GBC="Nintendo - Game Boy Color"

GEN_DEVELOPER_GBC='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_GBC='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_GBC='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_GBC='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_developer_gbc() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_GBC} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_gbc() {
   _gen_developer_gbc "${ABBREV_SYSTEMNAME_GBC}" "${SYSTEMNAME_GBC}" ${SYSTEMID_GBC}
}

_gen_publisher_gbc() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_GBC} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_gbc() {
   _gen_publisher_gbc "${ABBREV_SYSTEMNAME_GBC}" "${SYSTEMNAME_GBC}" ${SYSTEMID_GBC}
}

_gen_releaseyear_gbc() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_GBC} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_gbc() {
   _gen_releaseyear_gbc "${ABBREV_SYSTEMNAME_GBC}" "${SYSTEMNAME_GBC}" ${SYSTEMID_GBC}
}

_gen_releasemonth_gbc() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_GBC} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_gbc() {
   _gen_releasemonth_gbc "${ABBREV_SYSTEMNAME_GBC}" "${SYSTEMNAME_GBC}" ${SYSTEMID_GBC}
}

_gen_gbc() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_GBC}" "${GEN_PUBLISHER_GBC}" "${GEN_RELEASEYEAR_GBC}" "${GEN_RELEASEMONTH_GBC}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_gbc() {
   #gen_dat_gbc
   _gen_gbc "${ABBREV_SYSTEMNAME_GBC}" "${SYSTEMNAME_GBC}" ${SYSTEMID_GBC}
}
