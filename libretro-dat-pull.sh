#!/bin/sh

if [ "$(which pypy 2> /dev/null)" ];then
    PYTHON=$(which pypy)
elif [ "$(which python2 2> /dev/null)" ];then
    PYTHON=$(which python2)
else
    echo "python is missing"
fi

. ./scripts/create_dat_structure.sh

. "./scripts/MAME.sh"
. "./scripts/Sony - PlayStation.sh"
. "./scripts/Sony - PlayStation Portable.sh"
. "./scripts/Nintendo 64.sh"
. "./scripts/Nintendo - Super Nintendo Entertainment System.sh"

if [ $1 ]; then
   $1
else
   gen_mame
   gen_n64
   gen_ps1
   gen_psp
   gen_snes
fi
