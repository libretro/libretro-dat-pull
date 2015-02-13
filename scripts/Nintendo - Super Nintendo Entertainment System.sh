#!/bin/sh

gen_developer_snes() {
   echo "--- Super Nintendo Entertainment System - DAT Developer"
   ./generate-dat.py 26 '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "SNES"
   mv "SNES_1.dat" "metadat/developer/Nintendo - Super Nintendo Entertainment System.dat"
}

gen_publisher_snes() {
   echo "--- Super Nintendo Entertainment System - DAT Publisher"
   ./generate-dat.py 26 '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "SNES"
   mv "SNES_1.dat" "metadat/publisher/Nintendo - Super Nintendo Entertainment System.dat"
}

gen_releaseyear_snes() {
   echo "--- Super Nintendo Entertainment System - DAT Releaseyear"
   ./generate-dat.py 26 '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "SNES"
   mv "SNES_1.dat" "metadat/releaseyear/Nintendo - Super Nintendo Entertainment System.dat"
}

gen_releasemonth_snes() {
   echo "--- Super Nintendo Entertainment System - DAT Releasemonth"
   ./generate-dat.py 26 '{"game":{"rom":{"crc":"romHashCRC"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "SNES"
   mv "SNES_1.dat" "metadat/releasemonth/Nintendo - Super Nintendo Entertainment System.dat"
}

gen_snes() {
   #gen_dat_snes
   gen_developer_snes
   gen_publisher_snes
   gen_releaseyear_snes
   gen_releasemonth_snes
}
