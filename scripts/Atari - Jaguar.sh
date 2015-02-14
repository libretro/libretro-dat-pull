#!/bin/sh

SYSTEMID_JAG=7
ABBREV_SYSTEMNAME_JAG="JAG"
SYSTEMNAME_JAG="Atari - Jaguar"

GEN_DEVELOPER_JAG='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_JAG='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_JAG='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_JAG='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_jag_developer_jag() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_JAG} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_jag() {
   _jag_developer_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

_jag_publisher_jag() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_JAG} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_jag() {
   _jag_publisher_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

_jag_releaseyear_jag() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_JAG} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_jag() {
   _jag_releaseyear_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

_jag_releasemonth_jag() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_JAG} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_jag() {
   _jag_releasemonth_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

_gen_jag() {
   #gen_dat_jag
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_JAG}" "${GEN_PUBLISHER_JAG}" "${GEN_RELEASEYEAR_JAG}" "${GEN_RELEASEMONTH_JAG}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_jag() {
   #gen_dat_jag
   _gen_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}
