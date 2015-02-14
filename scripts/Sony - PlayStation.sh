#!/bin/sh

SYSTEMID_PS1=38
ABBREV_SYSTEMNAME_PS1="PSX"
SYSTEMNAME_PS1="Sony - PlayStation"

_gen_dat_ps1() {
   echo "--- ${2} - DAT"
   ./generate-dat.py ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName"}}' "${1}"
   mv "${1}.dat" "dat/${2}.dat"
}

gen_dat_ps1() {
   _gen_dat_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_developer_ps1() {
   echo "--- ${2} - DAT Developer"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_ps1() {
   _gen_developer_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_publisher_ps1() {
   echo "--- ${2} - DAT Publisher"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_ps1() {
   _gen_publisher_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_releaseyear_ps1() {
   echo "--- ${2} - DAT Releaseyear"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_ps1() {
   _gen_releaseyear_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_releasemonth_ps1() {
   echo "--- ${2} - DAT Releasemonth"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_ps1() {
   _gen_releasemonth_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

gen_ps1() {
   gen_dat_ps1
   gen_developer_ps1
   gen_publisher_ps1
   gen_releaseyear_ps1
   gen_releasemonth_ps1
}
