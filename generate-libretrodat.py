#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys,ast
import openvgdb


string="{'game':{'name':'iru','desc':'iru','rom':{'name':'iru','serial':'iru'}}}"
string='{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","description":"romExtensionlessFileName"}}'
par=ast.literal_eval(string)
#par=ast.literal_eval(sys.argv[1])
#I have to integrate $year and $month as static stuff and check for it
games=[]
game=[]
val='game'

def test(foo):
    return foo[::-1]




def parse(a,level):
    ret=[]
    for entry in a:
        if type(a[entry])==type({}):
            ret.append("\t"*level+str(entry)+" (")
            ret.append(parse(a[entry],level+1))
            ret.append("\t"*level+")\n")
        else:
            value=game[a[entry]]
            if type(value)==type(42):
                ret.append("\t"*level+str(entry)+" "+str(value)+"\n")
            else:
                ret.append("\t"*level+str(entry)+' "'+str(value)+'"\n')
    return "".join(ret)

#for i in range(2,len)
if len(sys.argv)%2!=0:
    print 'Something is wrong.Check your parameters again (the count is off)'
    quit()

O=openvgdb.vgdb('openvgdb.sqlite')
print 'Getting the game list.This can take a while...'
header="clrmamepro ( \
name \""+O.get_systems()[int(sys.argv[1])]+"\"\n\
)"
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
