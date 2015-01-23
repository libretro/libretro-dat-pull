#!/usr/bin/python2

import sqlite3 as lite
import sys,re


class vgdb:
    def __init__(self,db):
        con = lite.connect(db)
        self.cur = con.cursor()

    def get_columns(self,table):
        columns=self.cur.execute("PRAGMA table_info("+table+");")
        return columns.fetchone()

    def get_tables(self):
        tables=self.cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
        return tables.fetchall()
