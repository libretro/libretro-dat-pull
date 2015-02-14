#!/bin/sh

SYSTEMID_MAME=2
ABBREV_SYSTEMNAME_MAME="Arcade"
SYSTEMNAME_MAME="MAME"

GEN_DAT_MAME='{"game":{"rom":{"name":"romFileName","size":"romSize","md5":"romHashMD5","crc":"romHashCRC","sha1":"romHashSHA1"},"name":"releaseTitleName"}}'

_gen_dat_mame() {
   echo "--- ${2} - DAT"
   $PYTHON ./generate-dat.py ${3} ${GEN_DAT_MAME} "${1}"
   mv "${1}.dat" "dat/${2}.dat"
}

gen_dat_mame() {
   _gen_dat_mame "${ABBREV_SYSTEMNAME_MAME}" "${SYSTEMNAME_MAME}" ${SYSTEMID_MAME}
}

gen_mame() {
   gen_dat_mame
}
