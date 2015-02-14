#!/bin/sh

SYSTEMID_PS1=38
ABBREV_SYSTEMNAME_PS1="PSX"
SYSTEMNAME_PS1="Sony - PlayStation"

GEN_DAT_PS1='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName"}}'
GEN_DEVELOPER_PS1='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_PS1='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_PS1='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_PS1='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_dat_ps1() {
   echo "--- ${2} - DAT"
   $PYTHON ./generate-dat.py ${3} ${GEN_DAT_PS1} "${1}"
   mv "${1}.dat" "dat/${2}.dat"
}

gen_dat_ps1() {
   _gen_dat_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_developer_ps1() {
   echo "--- ${2} - DAT Developer"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_DEVELOPER_PS1} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_ps1() {
   _gen_developer_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_publisher_ps1() {
   echo "--- ${2} - DAT Publisher"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_PUBLISHER_PS1} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_ps1() {
   _gen_publisher_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_releaseyear_ps1() {
   echo "--- ${2} - DAT Releaseyear"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_PS1} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_ps1() {
   _gen_releaseyear_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_releasemonth_ps1() {
   echo "--- ${2} - DAT Releasemonth"
   $PYTHON ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_PS1} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_ps1() {
   _gen_releasemonth_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}

_gen_ps1() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_PS1}" "${GEN_PUBLISHER_PS1}" "${GEN_RELEASEYEAR_PS1}" "${GEN_RELEASEMONTH_PS1}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_ps1() {
   #gen_dat_ps1
   _gen_ps1 "${ABBREV_SYSTEMNAME_PS1}" "${SYSTEMNAME_PS1}" ${SYSTEMID_PS1}
}
