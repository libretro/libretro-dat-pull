#!/usr/bin/python2
from argparse import ArgumentParser
import sys,ast,re,time
import openvgdb

debug=0

def main():
    global game,args
    args = get_arguments()
    O=openvgdb.vgdb('openvgdb.sqlite')
    print('Dumping %s' % O.get_systems()[args.sysid])
    print('Getting the game list.')
    header="clrmamepro (\r\n\tname \"%s\"\r\n)\r\n\r\n" % O.get_systems()[args.sysid]
    games=O.get_console(args.sysid)
    print('Got the game list')
#I will check here for the service later
    count=0
    for d in args.dict[0]:
        count=count+1
        if len(args.dict[0])==1:
            fname=args.file[0]+'.dat'
        else:
            fname=args.file[0]+'_'+str(count)+'.dat'
        f=open(fname,"w")
        print('writing '+fname)
        f.write(header)
        for game in games:
            if args.stop:
#                print 'Checking for empty values'
                if check_entry(game,d):
                    f.write(parse(ast.literal_eval(d))+"\r\n")
            else:
                f.write(parse(ast.literal_eval(d))+"\r\n")
        f.close()

def check_entry(game,d):
    #checks if entry has an entry empty
    for foo in ast.literal_eval(d)['game']:
        field=ast.literal_eval(d)['game'][foo]
        if type(field) != type({}):
            if game[field]==None:
                if debug==1:
                    print("Empty field %s detected." % (field))
                return False
        else:
            for bar in field:
                if game[field[bar]]==None:
                    if debug==1:
                        print("Empty field %s detected." % (field))
                    return False
#    print('Non empty field detected')
    return True

def get_arguments():
#TODO:
#add an action command to dump/analyze/parse/...
    parser = ArgumentParser(description='Create dat file from databases')
    parser.add_argument('--keep-none', '-n', dest='none', action='store_const', const=True, help='If a field is empty it will still get parsed')
    parser.add_argument('--stop-on-none', '-s', dest='stop', action='store_const', const=True, help='If a field is empty this script will not write that game entry')
    parser.add_argument('--service', metavar='Service', nargs=1, help='Service to use (right now only vgdb)', default='vgdb')
    parser.add_argument('sysid', type=int , metavar='systemid', help='The id of the system')
    parser.add_argument('dict', action='append', metavar='structure', help='The dictionary after which the dat gets modeled', nargs="+")
    parser.add_argument('file', action='append', metavar='"dat file"', help='The filename prefix to dump the dicts to')
    return parser.parse_args()

def parse(a,level=0):
    (ret,last)=([],[])
    check=['crc','md5','sha1']
    for entry in a:
        if type(a[entry])==type({}):
            last.append("\t"*level+str(entry)+" (\r\n")
            last.append(parse(a[entry],level+1))
            last.append("\t"*level+")\r\n")
        else:
            value=game[a[entry]]
            if value!=None or (value==None and args.none):
                if type(value)==type(1) or entry in check:
                    ret.append("\t"*level+str(entry)+" "+str(value)+"\r\n")
                else:
                    try:
                        ret.append("\t"*level+str(entry)+' "'+str(value).encode('utf-8')+"\"\r\n")
                    except:
                        print("Couldn't parse")
                        print(value)
    return "".join(ret)+"".join(last)

if __name__ == '__main__':
    main()
