#!/bin/sh

SYSTEMID_PSP=39
ABBREV_SYSTEMNAME_PSP="PSP"
SYSTEMNAME_PSP="Sony - PlayStation Portable"

GEN_DAT_PSP='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName"}}'
GEN_DEVELOPER_PSP='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}'
GEN_PUBLISHER_PSP='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}'
GEN_RELEASEYEAR_PSP='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releaseyear":"Year"}}'
GEN_RELEASEMONTH_PSP='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releasemonth":"Month"}}'

_gen_dat_psp() {
   echo "--- ${2} - DAT"
   ./generate-dat.py ${3} ${GEN_DAT_PSP} "${1}"
   mv "${1}.dat" "dat/${2}.dat"
}

gen_dat_psp() {
   _gen_dat_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_developer_psp() {
   echo "--- ${2} - DAT Developer"
   ./generate-dat.py -s ${3} ${GEN_DEVELOPER_PSP} "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_psp() {
   _gen_developer_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_publisher_psp() {
   echo "--- ${2} - DAT Publisher"
   ./generate-dat.py -s ${3} ${GEN_PUBLISHER_PSP} "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_psp() {
   _gen_publisher_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_releaseyear_psp() {
   echo "--- ${2} - DAT Releaseyear"
   ./generate-dat.py -s ${3} ${GEN_RELEASEYEAR_PSP} "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_psp() {
   _gen_releaseyear_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_releasemonth_psp() {
   echo "--- ${2} - DAT Releasemonth"
   ./generate-dat.py -s ${3} ${GEN_RELEASEMONTH_PSP} "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_psp() {
   _gen_releasemonth_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_psp() {
   $PYTHON ./generate-dat.py -s ${3} "${GEN_DEVELOPER_PSP}" "${GEN_PUBLISHER_PSP}" "${GEN_RELEASEYEAR_PSP}" "${GEN_RELEASEMONTH_PSP}" "${1}"
   mv "${1}_1.dat" "metadat/developer/${2}.dat"
   mv "${1}_2.dat" "metadat/publisher/${2}.dat"
   mv "${1}_3.dat" "metadat/releaseyear/${2}.dat"
   mv "${1}_4.dat" "metadat/releasemonth/${2}.dat"
}

gen_psp() {
   #gen_dat_psp
   _gen_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}
