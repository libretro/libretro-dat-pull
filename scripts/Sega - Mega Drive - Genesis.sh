#!/bin/sh

SYSTEMID_GEN=33
ABBREV_SYSTEMNAME_GEN="GEN"
SYSTEMNAME_GEN="Sega - Mega Drive - Genesis"

_gen_developer_gen() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_gen() {
   _gen_developer_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

_gen_publisher_gen() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}" && mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_gen() {
   _gen_publisher_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

_gen_releaseyear_gen() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_gen() {
   _gen_releaseyear_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

_gen_releasemonth_gen() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_gen() {
   _gen_releasemonth_gen "${ABBREV_SYSTEMNAME_GEN}" "${SYSTEMNAME_GEN}" ${SYSTEMID_GEN}
}

gen_gen() {
   #gen_dat_gen
   gen_developer_gen
   gen_publisher_gen
   gen_releaseyear_gen
   gen_releasemonth_gen
}

