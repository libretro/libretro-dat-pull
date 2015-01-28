#!/usr/bin/python2
import openvgdb
import sys

if len(sys.argv)>1:
    vgdb=openvgdb.vgdb(sys.argv[1])

if len(sys.argv)==2:
    systems=vgdb.get_systems()
    for system in systems:
        print str(system) +" "+ systems[system]
elif len(sys.argv)==3:

    print "Fields you get:"
    game=vgdb.get_console_fg(sys.argv[2])
    for field in game:
        print field+" -> "+str(game[field])
