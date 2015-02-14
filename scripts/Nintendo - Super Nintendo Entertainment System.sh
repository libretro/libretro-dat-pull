#!/bin/sh

SYSTEMID_SNES=26
ABBREV_SYSTEMNAME_SNES="SNES"
SYSTEMNAME_SNES="Nintendo - Super Nintendo Entertainment System"

GEN_DEVELOPER_SNES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_SNES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_SNES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_SNES='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'
_gen_developer_snes() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_SNES} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_snes() {
   _gen_developer_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

_gen_publisher_snes() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_SNES} "${1}" && mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_snes() {
   _gen_publisher_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

_gen_releaseyear_snes() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_SNES} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_snes() {
   _gen_releaseyear_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

_gen_releasemonth_snes() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_SNES} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_snes() {
   _gen_releasemonth_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}

_gen_snes() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_SNES}" "${GEN_PUBLISHER_SNES}" "${GEN_RELEASEYEAR_SNES}" "${GEN_RELEASEMONTH_SNES}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_snes() {
   #gen_dat_snes
   _gen_snes "${ABBREV_SYSTEMNAME_SNES}" "${SYSTEMNAME_SNES}" ${SYSTEMID_SNES}
}
