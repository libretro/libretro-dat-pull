#!/usr/bin/python2
from argparse import ArgumentParser
import sys,ast,re

def main():
    args = get_arguments()
    print args

def get_arguments():
    parser = ArgumentParser(description='Create dat file from sqlite database')
    parser.add_argument('--omitnone', dest='cont', action='store_const', const=True, help='If a field is empty don\'t parse it')
    parser.add_argument('dict', action='append', metavar='structure', help='The dictionary after which the dat gets modeled', nargs="+")
    parser.add_argument('filename', action='append', metavar='dat file', help='The filename prefix to dump the dicts to')
    return parser.parse_args()

if __name__ == '__main__':
    main()
