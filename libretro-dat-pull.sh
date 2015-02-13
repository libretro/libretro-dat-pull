#!/bin/sh

. ./scripts/create_dat_structure.sh

. ./scripts/mame.sh
. ./scripts/playstation1.sh

if [ $1 ]; then
   $1
else
   gen_mame
   gen_ps1
fi
