#!/bin/sh

#./generate-dat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName"}}' "Sony - PlayStation"
./generate-dat.py 2 '{"game":{"rom":{"name":"romFileName","size":"romSize","md5":"romHashMD5","crc":"romHashCRC","sha1":"romHashSHA1"},"name":"releaseTitleName"}}' "Arcade"
