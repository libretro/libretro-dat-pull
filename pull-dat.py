#!/usr/bin/python2
# -*- coding: utf-8 -*-

import sqlite3 as lite
import sys,re

con = None
months={'January':1,'February':2,'March':3,'April':4,'May':5,'June':6,'July':7,'August':8,'September':9,'October':10,'November':11,'December':12}
mon={'Jan':1,'Feb':2,'Mar':3,'Apr':4,'May':5,'Jun':6,'Jul':7,'Aug':8,'Sep':9,'Oct':10,'Nov':11,'Dec':12}

def parse_date(taaag):
    #returns month, year or just year
    if not(taaag):
        return False
    if re.match('\D\D\D \d\d?, \d\d\d\d',taaag):
        tag=re.findall('(\D\D\D) \d\d?, (\d\d\d\d)',taaag)[0]
        return mon[tag[0]],tag[1]
    elif re.match('\D\D\D\d\d?, \d\d\d\d',taaag):
        tag=re.findall('(\D\D\D)\d\d?, (\d\d\d\d)',taaag)[0]
        return mon[tag[0]],tag[1]
    elif re.match('\d\d\d\d',taaag):
        return int(taaag)
    else:
        return False

def parse_game(arr):
    rom=cur.execute('SELECT * FROM ROMs where romID='+str(arr[1])).fetchone()
    try:
        gs="game(\n\
        \tname \"%s\"\n\
        \treleasemonth %s\n\
        \treleaseyear %s\n\
        \tpublisher \"%s\"\n" % (rom[8], months[arr[15][:-5]], arr[15][-4:], arr[12])
    except:
        datum=parse_date(arr[15])
        if not(datum):
            gs="game(\n\
            \tname \"%s\"\n\
            \tpublisher \"%s\"\n" % (rom[8], arr[12])
        elif type(datum)==type(1):
            gs="game(\n\
            \tname \"%s\"\n\
            \treleaseyear %s\n\
            \tpublisher \"%s\"\n" % (rom[8], str(datum), arr[12])
        elif len(datum)==2:
            gs="game(\n\
            \tname \"%s\"\n\
            \treleasemonth %s\n\
            \treleaseyear %s\n\
            \tpublisher \"%s\"\n" % (rom[8], datum[0], datum[1], arr[12])
        else:
            print type(datum)
            gs="game(\n\
            \tname \"%s\"\n\
            \tpublisher \"%s\"\n" % (rom[8], arr[12])
    rs=parse_rom(rom)
    return gs+rs+")\n\n"

def parse_rom(arr):
    return "\t\trom (\n\
        \t\tcrc %s\n\
        \t\tmd5 %s\n\
        \t\tsha1 %s\n\
    \t\t)\n" % (arr[3],arr[4],arr[5])

def get_systems():
    print 'Which system do you want to dump?'
    cur.execute('SELECT * FROM SYSTEMS')
    systems = cur.fetchall()
    for system in systems:
        print "%i : %s" % (system[0], system[1])

def get_system(sid):
    cur.execute('SELECT * FROM SYSTEMS where systemID='+str(sid))
    gsys = cur.fetchone()
    return gsys[1]


try:
    if len(sys.argv)==2:
        con = lite.connect(sys.argv[1])
        cur = con.cursor()
        get_systems()
    elif len(sys.argv)==4:
        con = lite.connect(sys.argv[1])
        cur = con.cursor()
        cur.execute('SELECT * FROM ROMS where systemID='+sys.argv[2])
        data=cur.fetchall()
        gsys=get_system(sys.argv[2])
        try:
            f=open(sys.argv[3],'w')
        except:
            print "Couldn't open %s for writing" % sys.argv[3]
            quit()
        f.write("clrmamepro (\n\tname \"%s\"\n\tdescription \"%s\"\n\n)" % (gsys,gsys))
        for game in data:
            gamerow=cur.execute('SELECT * FROM RELEASES where romID='+str(game[0])).fetchone()
            try:
                f.write(parse_game(gamerow))
                f.flush()
            except:
                print 'Failed with '+str(game[0])
#                print gamerow
#                print gamerow[15]
        f.close()
    else:
        print "Usage : \n System List:\n  convert.py database.sqlite\n System Dump:\n  convert.py database.sqlite systemid dumpfile"
        quit()
    quit()
#REGIONS   RELEASES  ROMs      SYSTEMS
#    cur.execute('SELECT * FROM ROMS')
#    for foo in cur.fetchall():
#        print foo
#    quit()

    for foo in data:
#        print foo
        if foo[0]==62057:
            print parse_game(foo)
#            print foo
#            print "game ("
#            print "\tname \""+foo[8]+"\""
#            print "\treleasemonth \""+foo[8]+"\""
except lite.Error, e:
    print "Error %s:" % e.args[0]
    sys.exit(1)
