CREATE OR REPLACE FUNCTION db2.date(value timestamp)
RETURNS date
AS $$ SELECT cast(date_trunc('day', $1) as date); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.date(timestamp) IS 'Returns the date part of a timestamp';

CREATE OR REPLACE FUNCTION db2.date(value timestamp with time zone)
RETURNS date
AS $$ SELECT cast(date_trunc('day', $1) as date); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.date(timestamp with time zone) IS 'Returns the date part of a timestamp';

CREATE OR REPLACE FUNCTION db2.date(value text)
RETURNS date
AS $$ SELECT cast(date_trunc('day', $1::timestamp) as date); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.date(text) IS 'Returns the date part of a timestamp';

CREATE OR REPLACE FUNCTION db2.time(value timestamp)
RETURNS time
AS $$ SELECT cast($1 as time); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.time(timestamp) IS 'Returns the time part of a timestamp';

CREATE OR REPLACE FUNCTION db2.time(value timestamp with time zone)
RETURNS time
AS $$ SELECT cast($1 as time); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.time(timestamp with time zone) IS 'Returns the time part of a timestamp';

CREATE OR REPLACE FUNCTION db2.time(value text)
RETURNS time
AS $$ SELECT cast($1::timestamp as time); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.time(text) IS 'Returns the time part of a timestamp';
