#!/usr/bin/python2
import openvgdb
import sys

vgdb=openvgdb.vgdb(sys.argv[1])
systems=vgdb.get_systems()
for system in systems:
    print str(system) +" "+ systems[system]

print "Fields you get:"
game=vgdb.get_console_fg(sys.argv[2])
for field in game:
    print field+" -> "+str(game[field])
