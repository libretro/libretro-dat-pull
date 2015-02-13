#!/bin/sh

gen_dat_ps1() {
   echo "--- PlayStation1 - DAT"
   ./generate-dat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName"}}' "Sony - PlayStation"
   mv "Sony - PlayStation_1.dat" "dat/Sony - PlayStation.dat"
}

gen_developer_ps1() {
   echo "--- PlayStation1 - DAT Developer"
   ./generate-dat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","developer":"releaseDeveloper"}}' "Sony - PlayStation"
   mv "Sony - PlayStation_1.dat" "metadat/developer/Sony - PlayStation.dat"
}

gen_publisher_ps1() {
   echo "--- PlayStation1 - DAT Publisher"
   ./generate-dat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","publisher":"releasePublisher"}}' "Sony - PlayStation"
   mv "Sony - PlayStation_1.dat" "metadat/publisher/Sony - PlayStation.dat"
}

gen_releaseyear_ps1() {
   echo "--- PlayStation1 - DAT Releaseyear"
   ./generate-dat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releaseyear":"Year"}}' "Sony - PlayStation"
   mv "Sony - PlayStation_1.dat" "metadat/releaseyear/Sony - PlayStation.dat"
}

gen_releasemonth_ps1() {
   echo "--- PlayStation1 - DAT Releasemonth"
   ./generate-dat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","releasemonth":"Month"}}' "Sony - PlayStation"
   mv "Sony - PlayStation_1.dat" "metadat/releasemonth/Sony - PlayStation.dat"
}

gen_ps1() {
   gen_dat_ps1
   gen_developer_ps1
   gen_publisher_ps1
   gen_releaseyear_ps1
   gen_releasemonth_ps1
}
