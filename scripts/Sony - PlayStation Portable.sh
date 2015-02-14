#!/bin/sh

SYSTEMID_PSP=39
ABBREV_SYSTEMNAME_PSP="PSP"
SYSTEMNAME_PSP="Sony - PlayStation Portable"

_gen_dat_psp() {
   echo "--- ${2} - DAT"
   ./generate-dat.py ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName"}}' "${1}"
   mv "${1}.dat" "dat/${2}.dat"
}

gen_dat_psp() {
   _gen_dat_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_developer_psp() {
   echo "--- ${2} - DAT Developer"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "${1}"
   mv "${1}.dat" "metadat/developer/${2}.dat"
}

gen_developer_psp() {
   _gen_developer_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_publisher_psp() {
   echo "--- ${2} - DAT Publisher"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "${1}"
   mv "${1}.dat" "metadat/publisher/${2}.dat"
}

gen_publisher_psp() {
   _gen_publisher_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_releaseyear_psp() {
   echo "--- ${2} - DAT Releaseyear"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "${1}"
   mv "${1}.dat" "metadat/releaseyear/${2}.dat"
}

gen_releaseyear_psp() {
   _gen_releaseyear_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

_gen_releasemonth_psp() {
   echo "--- ${2} - DAT Releasemonth"
   ./generate-dat.py -s ${3} '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "${1}"
   mv "${1}.dat" "metadat/releasemonth/${2}.dat"
}

gen_releasemonth_psp() {
   _gen_releasemonth_psp "${ABBREV_SYSTEMNAME_PSP}" "${SYSTEMNAME_PSP}" ${SYSTEMID_PSP}
}

gen_psp() {
   #gen_dat_psp
   gen_developer_psp
   gen_publisher_psp
   gen_releaseyear_psp
   gen_releasemonth_psp
}
