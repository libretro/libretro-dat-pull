#!/bin/sh

gen_dat_mame() {
   echo "--- MAME - DAT"
   ./generate-dat.py 2 '{"game":{"rom":{"name":"romFileName","size":"romSize","md5":"romHashMD5","crc":"romHashCRC","sha1":"romHashSHA1"},"name":"releaseTitleName"}}' "Arcade"
   mv "Arcade_1.dat" "dat/MAME.dat"
}

gen_mame() {
   gen_dat_mame
}
