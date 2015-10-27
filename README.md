db2fce, a DB2 compatibility environment for PostgreSQL
======================================================

This extension provides a variety of DB2 functions, types and operators for
PostgreSQL.

All functions, types and operators are created in the ```db2``` schema. Adding
this to the ```search_path``` allows for unmodifed use of (some) DB2 SQL
statements.  

Note that some of the provied functions like ```INT()``` still need to be
schema-qualified.

SYSIBM.SYSDUMMY1
----------------

DB2 SELECT statesments require a FROM clause with a table or view, even if no
table/view columns are returned (as in PostgreSQL's "SELECT 1;").  In this
case, the ```SYSIBM.SYSDUMMY1``` view is customary used by DB2.  The SYSIBM
schema and this view is provided by db2fce.

Installation
------------

Running ```make install``` installs the extension. 

If ```pg_config``` is not found, you might have to pass its location via the
```PG_CONFIG``` environment variable.

Test Suite
----------

An incomplete test suite is available. 

License
-------

db2fce is licensed under the PostgreSQL license.
