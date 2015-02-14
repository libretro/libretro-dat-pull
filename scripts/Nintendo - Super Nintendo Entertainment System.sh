#!/bin/sh

SYSTEMID_SNES=26
ABBREV_SYSTEMNAME_SNES="SNES"
SYSTEMNAME_SNES="Nintendo - Super Nintendo Entertainment System"

_gen_developer_snes() {
   echo "--- ${2} - DAT Developer"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_snes() {
   _gen_developer_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

_gen_publisher_snes() {
   echo "--- ${2} - DAT Publisher"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_snes() {
   _gen_publisher_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

_gen_releaseyear_snes() {
   echo "--- ${2} - DAT Releaseyear"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_snes() {
   _gen_releaseyear_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

_gen_releasemonth_snes() {
   echo "--- ${2} - DAT Releasemonth"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_snes() {
   _gen_releasemonth_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

gen_snes() {
   #gen_dat_snes
   gen_developer_snes
   gen_publisher_snes
   gen_releaseyear_snes
   gen_releasemonth_snes
}
