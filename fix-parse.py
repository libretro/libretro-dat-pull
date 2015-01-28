#!/usr/bin/python2
import re,sys

f=open(sys.argv[1],'r').read()
w=open(sys.argv[2],'w')
old=chr(int('0A',16))
new=chr(int('0D',16))+chr(int('0A',16))
w.write(re.sub('('+old+')',new,f))
w.close()
