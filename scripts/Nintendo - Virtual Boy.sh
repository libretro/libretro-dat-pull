#!/bin/sh

SYSTEMID_VB=27
ABBREV_SYSTEMNAME_VB="VB"
SYSTEMNAME_VB="Nintendo - Virtual Boy"

GEN_DEVELOPER_VB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_VB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_VB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_VB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_developer_vb() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_VB} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_vb() {
   _gen_developer_vb "${ABBREV_SYSTEMNAME_VB}" "${SYSTEMNAME_VB}" ${SYSTEMID_VB}
}

_gen_publisher_vb() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_VB} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_vb() {
   _gen_publisher_vb "${ABBREV_SYSTEMNAME_VB}" "${SYSTEMNAME_VB}" ${SYSTEMID_VB}
}

_gen_releaseyear_vb() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_VB} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_vb() {
   _gen_releaseyear_vb "${ABBREV_SYSTEMNAME_VB}" "${SYSTEMNAME_VB}" ${SYSTEMID_VB}
}

_gen_releasemonth_vb() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_VB} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_vb() {
   _gen_releasemonth_vb "${ABBREV_SYSTEMNAME_VB}" "${SYSTEMNAME_VB}" ${SYSTEMID_VB}
}

_gen_vb() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_VB}" "${GEN_PUBLISHER_VB}" "${GEN_RELEASEYEAR_VB}" "${GEN_RELEASEMONTH_VB}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_vb() {
   #gen_dat_vb
   _gen_vb "${ABBREV_SYSTEMNAME_VB}" "${SYSTEMNAME_VB}" ${SYSTEMID_VB}
}
