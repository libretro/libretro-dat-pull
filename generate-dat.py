#!/usr/bin/python2
from argparse import ArgumentParser
import sys,ast,re,time
import openvgdb

debug=0

def main():
    global game,args
    args = get_arguments()
    O=openvgdb.vgdb('openvgdb.sqlite')
    print 'Dumping %s' % O.get_systems()[args.sysid]
    print 'Getting the game list.'
    header="clrmamepro (\r\n\tname \"%s\"\r\n)\r\n" % O.get_systems()[args.sysid]
    games=O.get_console(sys.argv[1])
    print 'Got the game list'
#I will check here for the service later
    count=0
    for d in args.dict[0]:
        count=count+1
        fname=args.file[0]+'_'+str(count)+'.dat'
        f=open(fname,"w")
        print 'writing '+fname
        f.write(header)
        for game in games:
            f.write(parse(ast.literal_eval(d)))
        f.close()

def test():
    print foo

def get_arguments():
#TODO:
#add an action command to dump/analyze/parse/...
    parser = ArgumentParser(description='Create dat file from databases')
    parser.add_argument('--omitnone', '-n', dest='none', action='store_const', const=True, help='If a field is empty don\'t parse it')
    parser.add_argument('--service', metavar='Service', nargs=1, help='Service to use (right now only vgdb)', default='vgdb')
    parser.add_argument('sysid', type=int , metavar='systemid', help='The id of the system')
    parser.add_argument('dict', action='append', metavar='structure', help='The dictionary after which the dat gets modeled', nargs="+")
    parser.add_argument('file', action='append', metavar='"dat file"', help='The filename prefix to dump the dicts to')
    return parser.parse_args()

def parse(a,level=0):

    (ret,last)=([],[])
    check=['crc','md5','sha1','serial']
    for entry in a:
        if type(a[entry])==type({}):
            last.append("\t"*level+str(entry)+" (\r\n")
            last.append(parse(a[entry],level+1))
            last.append("\t"*level+")\r\n\r\n")
        else:
            value=game[a[entry]]
            if value!=None or (value==None and not(args.none)):
                if type(value)==type(1) or entry in check:
                    ret.append("\t"*level+str(entry)+" "+str(value)+"\r\n")
                else:
                    try:
                        ret.append("\t"*level+str(entry)+' "'+str(value).encode('utf-8')+"\"\r\n")
                    except:
                        print 'Couldn\'t parse'
                        print value
    return "".join(ret)+"".join(last)


if __name__ == '__main__':
    main()
