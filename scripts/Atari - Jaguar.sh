#!/bin/sh

SYSTEMID_JAG=7
ABBREV_SYSTEMNAME_JAG="JAG"
SYSTEMNAME_JAG="Atari - Jaguar"

_jag_developer_jag() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_jag() {
   _jag_developer_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

_jag_publisher_jag() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}" && mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_jag() {
   _jag_publisher_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

_jag_releaseyear_jag() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_jag() {
   _jag_releaseyear_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

_jag_releasemonth_jag() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_jag() {
   _jag_releasemonth_jag "${ABBREV_SYSTEMNAME_JAG}" "${SYSTEMNAME_JAG}" ${SYSTEMID_JAG}
}

gen_jag() {
   #gen_dat_jag
   gen_developer_jag
   gen_publisher_jag
   gen_releaseyear_jag
   gen_releasemonth_jag
}

