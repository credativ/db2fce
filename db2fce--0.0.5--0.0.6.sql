CREATE FUNCTION db2.lcase(value text)
RETURNS text
AS $$ SELECT lower($1); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.lcase(text) IS 'lowercase';
