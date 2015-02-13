#!/bin/sh

. ./scripts/create_dat_structure.sh

#./generate-dat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName"}}' "Sony - PlayStation"
#./generate-dat.py 2 '{"game":{"rom":{"name":"romFileName","size":"romSize","md5":"romHashMD5","crc":"romHashCRC","sha1":"romHashSHA1"},"name":"releaseTitleName"}}' "Arcade"

. ./scripts/playstation1.sh

if [ $1 ]; then
   $1
else
   gen_developer_ps1
   gen_releasemonth_ps1
   gen_releaseyear_ps1
fi
