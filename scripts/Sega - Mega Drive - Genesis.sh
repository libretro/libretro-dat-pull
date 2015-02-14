#!/bin/sh

SYSTEMID_GEN=33
ABBREV_SYSTEMNAME_GEN="GEN"
SYSTEMNAME_GEN="Sega - Mega Drive - Genesis"

GEN_DEVELOPER_GEN='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_GEN='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_GEN='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_GEN='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_developer_gen() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_GEN} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_gen() {
   _gen_developer_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

_gen_publisher_gen() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_GEN} "${1}" && mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_gen() {
   _gen_publisher_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

_gen_releaseyear_gen() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_GEN} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_gen() {
   _gen_releaseyear_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

_gen_releasemonth_gen() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_GEN} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_gen() {
   _gen_releasemonth_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

_gen_gen() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_GEN}" "${GEN_PUBLISHER_GEN}" "${GEN_RELEASEYEAR_GEN}" "${GEN_RELEASEMONTH_GEN}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_gen() {
   #gen_dat_gen
   _gen_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}
