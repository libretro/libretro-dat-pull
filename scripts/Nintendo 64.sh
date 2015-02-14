#!/bin/sh

SYSTEMID_N64=23
ABBREV_SYSTEMNAME_N64="N64"
SYSTEMNAME_N64="Nintendo - Nintendo 64"

_gen_developer_n64() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_n64() {
   _gen_developer_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

_gen_publisher_n64() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_n64() {
   _gen_publisher_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

_gen_releaseyear_n64() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_n64() {
   _gen_releaseyear_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

_gen_releasemonth_n64() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_n64() {
   _gen_releasemonth_n64 "${ABBREV_SYSTEMNAME_N64}" "${SYSTEMNAME_N64}" ${SYSTEMID_N64}
}

gen_n64() {
   #gen_dat_n64
   gen_developer_n64
   gen_publisher_n64
   gen_releaseyear_n64
   gen_releasemonth_n64
}
