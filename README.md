db2fce, a DB2 compatibility environment for PostgreSQL
======================================================

This extension provides a variety of DB2 functions, types and operators for
PostgreSQL.

The extension is relocatable, i.e. all functions, types and operators are
created in the selected schema, e.g. ```db2```. Adding
this to the ```search_path``` allows for unmodified use of (some) DB2 SQL
statements.  

Note that some of the provided functions like ```INT()``` or ```TRANSLATE()```
always need to be schema-qualified as they overload functions in
```pg_catalog```.

SYSIBM.SYSDUMMY1
----------------

DB2 SELECT statements require a FROM clause with a table or view, even if no
table/view columns are returned (as in PostgreSQL's "SELECT 1;").  In this
case, the ```SYSIBM.SYSDUMMY1``` view is customarily used by DB2.  The SYSIBM
schema and this view are provided by db2fce.

Installation
------------

Running ```make install``` installs the extension. 

If ```pg_config``` is not found, you might have to pass its location via the
```PG_CONFIG``` environment variable.

Test Suite
----------

An incomplete test suite is available.  It can be exercised via ```make
installcheck```.  The user running the testsuite probably needs elevated
privileges in the ```contrib_regress``` database.

License
-------

db2fce is licensed under the PostgreSQL license.
