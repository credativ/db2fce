EXTENSION = db2fce
DATA = db2fce--0.0.11.sql 		\
	db2fce--0.0.4--0.0.5.sql	\
	db2fce--0.0.5--0.0.6.sql	\
	db2fce--0.0.6--0.0.7.sql	\
	db2fce--0.0.7--0.0.8.sql	\
	db2fce--0.0.8--0.0.9.sql	\
	db2fce--0.0.9--0.0.10.sql

DOCS = COPYRIGHT.db2fce

REGRESS = init date_time misc numeric operator string_text

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
