EXTENSION = db2fce
EXT_VERSION = 0.0.13
DATA = db2fce--${EXT_VERSION}.sql	\
	db2fce--0.0.4--0.0.5.sql	\
	db2fce--0.0.5--0.0.6.sql	\
	db2fce--0.0.6--0.0.7.sql	\
	db2fce--0.0.7--0.0.8.sql	\
	db2fce--0.0.8--0.0.9.sql	\
	db2fce--0.0.9--0.0.10.sql	\
	db2fce--0.0.10--0.0.11.sql	\
	db2fce--0.0.11--0.0.12.sql	\
	db2fce--0.0.12--0.0.13.sql

noinst_DATA = db2fce.sql

DOCS = COPYRIGHT.db2fce

REGRESS = init date_time misc numeric operator string_text

PG_CONFIG ?= pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

db2fce--${EXT_VERSION}.sql:
	cp db2fce.sql db2fce--${EXT_VERSION}.sql

all: db2fce--${EXT_VERSION}.sql

distclean:
	rm -f db2fce--${EXT_VERSION}.sql
