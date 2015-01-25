#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys,ast
import openvgdb

string='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","description":"romExtensionlessFileName"}}'
par=ast.literal_eval(string)
games=[]
game=[]
val='game'

def parse(a,level):
    ret=[]
    last=[]
    check=['crc','md5','sha1','serial']
    for entry in a:
        if type(a[entry])==type({}) and entry=="game":
            last.append("\t"*level+str(entry)+" ( ")
            last.append(parse(a[entry],level+1))
            last.append("\t"*level+")\n")
        elif type(a[entry])==type({}) and entry=="rom":
            last.append("\t"*level+str(entry)+" ( ")
            last.append(parse(a[entry],level)[:-1])
#            print parse(a[entry],level+1)[:-1]
            last.append("\t"*level+")\n")
        else:
            value=game[a[entry]]
            if type(value)==type(42) or entry in check:
                ret.append("\t"*level+str(entry)+" "+str(value)+" ")
            else:
                try:
                    ret.append("\t"*level+str(entry)+' "'+str(value).encode('utf-8')+"\" ")
                except:
                    print 'Couldn\'t parse'
                    print value
        ret.append("\n")
    return "".join(ret)+"".join(last)

if len(sys.argv)%2!=0:
    print 'Something is wrong.Check your parameters again (the count is off)'
    quit()

O=openvgdb.vgdb('openvgdb.sqlite')
print 'Getting the game list.This can take a while...'
header="clrmamepro ( \n\
name \""+O.get_systems()[int(sys.argv[1])]+"\"\n\
)\n"
games=O.get_console(sys.argv[1])
print 'Done.Starting to convert'
#print game
#print parse(par,0)
#f.write(parse(par,0))
#quit()


for i in range(0,(len(sys.argv)-2)/2):
    string=sys.argv[2+i*2]
    par=ast.literal_eval(string)
    f=open(sys.argv[3+i*2],"w")
    print 'writing '+sys.argv[3+i*2]
    f.write(header)
    for game in games:
        f.write(parse(par,0))
    f.close()
print 'Done everything went according to plan'
