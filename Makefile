EXTENSION = db2fce
DATA = db2fce--0.0.6.sql
DOCS = COPYRIGHT.db2fce

REGRESS = init date_time misc numeric operator string_text

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
