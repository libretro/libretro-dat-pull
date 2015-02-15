#!/bin/sh

SYSTEMID_32X=29
ABBREV_SYSTEMNAME_32X="32X"
SYSTEMNAME_32X="Sega - 32X"

GEN_DEVELOPER_32X='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_32X='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_32X='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_32X='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_32x_developer_32x() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_32X} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_32x() {
   _32x_developer_32x "${ABBREV_SYSTEMNAME_32X}" "${SYSTEMNAME_32X}" ${SYSTEMID_32X}
}

_32x_publisher_32x() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_32X} "${1}" && mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_32x() {
   _32x_publisher_32x "${ABBREV_SYSTEMNAME_32X}" "${SYSTEMNAME_32X}" ${SYSTEMID_32X}
}

_32x_releaseyear_32x() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_32X} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_32x() {
   _32x_releaseyear_32x "${ABBREV_SYSTEMNAME_32X}" "${SYSTEMNAME_32X}" ${SYSTEMID_32X}
}

_32x_releasemonth_32x() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_32X} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_32x() {
   _32x_releasemonth_32x "${ABBREV_SYSTEMNAME_32X}" "${SYSTEMNAME_32X}" ${SYSTEMID_32X}
}

_gen_32x() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_32X}" "${GEN_PUBLISHER_32X}" "${GEN_RELEASEYEAR_32X}" "${GEN_RELEASEMONTH_32X}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_32x() {
   #gen_dat_32x
   _gen_32x "${ABBREV_SYSTEMNAME_32X}" "${SYSTEMNAME_32X}" ${SYSTEMID_32X}
}
