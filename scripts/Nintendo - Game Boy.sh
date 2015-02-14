#!/bin/sh

SYSTEMID_GB=19
ABBREV_SYSTEMNAME_GB="GB"
SYSTEMNAME_GB="Nintendo - Game Boy"

GEN_DEVELOPER_GB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_GB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_GB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_GB='{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_developer_gb() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_GB} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_gb() {
   _gen_developer_gb "${ABBREV_SYSTEMNAME_GB}" "${SYSTEMNAME_GB}" ${SYSTEMID_GB}
}

_gen_publisher_gb() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_GB} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_gb() {
   _gen_publisher_gb "${ABBREV_SYSTEMNAME_GB}" "${SYSTEMNAME_GB}" ${SYSTEMID_GB}
}

_gen_releaseyear_gb() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_GB} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_gb() {
   _gen_releaseyear_gb "${ABBREV_SYSTEMNAME_GB}" "${SYSTEMNAME_GB}" ${SYSTEMID_GB}
}

_gen_releasemonth_gb() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_GB} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_gb() {
   _gen_releasemonth_gb "${ABBREV_SYSTEMNAME_GB}" "${SYSTEMNAME_GB}" ${SYSTEMID_GB}
}

_gen_gb() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_GB}" "${GEN_PUBLISHER_GB}" "${GEN_RELEASEYEAR_GB}" "${GEN_RELEASEMONTH_GB}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_gb() {
   #gen_dat_gb
   _gen_gb "${ABBREV_SYSTEMNAME_GB}" "${SYSTEMNAME_GB}" ${SYSTEMID_GB}
}
