#!/bin/bash
pypy generate-dat.py -s 39 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' psp
mv psp_1.dat "metadat/developer/test.dat"
mv psp_2.dat "metadat/publisher/test.dat"
mv psp_3.dat "metadat/releaseyear/test.dat"
mv psp_4.dat "metadat/releasemonth/test.dat"

