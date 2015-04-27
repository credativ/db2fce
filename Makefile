EXTENSION = db2fce
DATA = db2fce--0.0.2.sql
DOCS = COPYRIGHT.db2fce

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
