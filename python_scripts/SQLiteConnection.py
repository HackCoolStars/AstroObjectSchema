# -*- coding: utf-8 -*-
"""
Created on Wed Jun 22 16:38:04 2016

@author: J.Campbell-White
from D.Muna's code
"""

#!/usr/bin/python

from __future__ import print_function

import os.path

import sqlite3
import sqlalchemy
from sqlalchemy.event import listens_for
from sqlalchemy.pool import Pool
from sqlalchemy.orm import sessionmaker, scoped_session

from scicoder.database.DatabaseConnection import DatabaseConnection

'''
Notes:
This file must be 'import'ed BEFORE "DatabaseConnection".

If the SQLite database you specify below doesn't exist, a new
database will be created for you. This means if you specify a different
path, the script won't fail with "database not found", but rather
you will get a "table not found" error since you've created a new database.

To protect against this, this script will fail if the database is not found
(since connecting to an empty database won't be too productive).
'''

# Fill in database connection information here.
sqlite_db = {
	'name'	: 'schema.sqlite' # this is the name of the file
}

# For more options of SQLite connection strings, see:
# http://www.sqlalchemy.org/docs/reference/dialects/sqlite.html#connect-strings

db_connection_string = "sqlite:///%s" % sqlite_db['name']

# ------------ Do not edit anything below this line! -------------------------

# Check that there is a database where we're expecting to find one.
if os.path.isfile(sqlite_db['name']) is False:
    raise Exception("Expected to find the database file {0}, but it was not found.".format(sqlite_db["name"]))

@listens_for(Pool, 'connect') #, once=True) # 'once' param needs SQLAlchemy 0.9.4
def _fk_pragma_on_connect(dbapi_con, connection_record):
	''' Code to execute every time the database connection is opened.
	
	Ref: http://docs.sqlalchemy.org/en/rel_0_9/core/event.html#sqlalchemy.event.listens_for
	'''
	# Support for foreign keys must be explicitly turned on
	# every time the database is opened.
	dbapi_con.execute('PRAGMA foreign_keys=ON')

	# Only uncomment these if you know what you are doing.
	# See the SQLite documentation for details.
	#dbapi_con.execute("PRAGMA journal_mode = MEMORY")
	#dbapi_con.execute("PRAGMA synchronous = OFF")
	#dbapi_con.execute("PRAGMA temp_store = MEMORY")
	#dbapi_con.execute("PRAGMA cache_size = 500000")
	
# This allows the file to be 'import'ed any number of times, but attempts to
# connect to the database only once.
try:
	db = DatabaseConnection() # fails if connection not yet made.
except:
	db = DatabaseConnection(database_connection_string=db_connection_string)

engine = db.engine
metadata = db.metadata
Session = scoped_session(sessionmaker(bind=engine, autocommit=False, autoflush=True))

