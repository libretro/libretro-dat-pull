#!/bin/sh

SYSTEMID_N64=23
ABBREV_SYSTEMNAME_N64="N64"
SYSTEMNAME_N64="Nintendo - Nintendo 64"

GEN_DEVELOPER_N64='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_N64='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_N64='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_N64='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_developer_n64() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_N64} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_n64() {
   _gen_developer_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

_gen_publisher_n64() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_N64} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_n64() {
   _gen_publisher_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

_gen_releaseyear_n64() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_N64} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_n64() {
   _gen_releaseyear_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

_gen_releasemonth_n64() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_N64} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_n64() {
   _gen_releasemonth_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

_gen_n64() {
   #DOESN'T WORK
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_N64}" "${GEN_PUBLISHER_N64}" "${GEN_RELEASEYEAR_N64}" "${GEN_RELEASEMONTH_N64}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_n64() {
   _gen_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

