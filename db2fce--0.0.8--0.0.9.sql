CREATE OR REPLACE FUNCTION db2.microsecond(value timestamp)
RETURNS integer
AS $$ SELECT date_part('microsecond', $1)::integer - 1000000 * floor(date_part('second', $1))::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.microsecond(timestamp) IS 'returns microsecond part of specified timestamp';

CREATE OR REPLACE FUNCTION db2.second(value timestamp)
RETURNS integer
AS $$ SELECT floor(date_part('second', $1))::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.second(timestamp) IS 'returns second part of specified timestamp';
