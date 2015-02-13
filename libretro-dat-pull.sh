#!/bin/sh

. ./scripts/create_dat_structure.sh

. "./scripts/MAME.sh"
. "./scripts/Sony - PlayStation.sh"
. "./scripts/Nintendo - Super Nintendo Entertainment System.sh"

if [ $1 ]; then
   $1
else
   gen_mame
   gen_ps1
   gen_snes
fi
