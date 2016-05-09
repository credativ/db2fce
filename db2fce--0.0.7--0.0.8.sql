CREATE FUNCTION db2.strip(value text)
RETURNS text
AS $$ SELECT trim($1); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.strip(text) IS 'Removes blanks from the beginning and end of a string. Alias for trim().';

-- DIGITS() function
-- https://www.ibm.com/support/knowledgecenter/SSEPEK_10.0.0/com.ibm.db2z10.doc.sqlref/src/tpc/db2z_bif_digits.dita

-- Smallint input: return length = 5
CREATE FUNCTION db2.digits(value smallint) RETURNS varchar(5) AS
$func$
    SELECT regexp_replace(to_char($1, repeat('0', 5)), '^[ +-]', '');
$func$
LANGUAGE SQL IMMUTABLE STRICT;

-- Integer input: return length = 10
CREATE FUNCTION db2.digits(value integer) RETURNS varchar(10) AS
$func$
    SELECT regexp_replace(to_char($1, repeat('0', 10)), '^[ +-]', '');
$func$
LANGUAGE SQL IMMUTABLE STRICT;

-- Bigint input: return length = 19
CREATE FUNCTION db2.digits(value bigint) RETURNS varchar(19) AS
$func$
    SELECT regexp_replace(to_char($1, repeat('0', 19)), '^[ +-]', '');
$func$
LANGUAGE SQL IMMUTABLE STRICT;

-- Generic numeric implementation.
-- On numeric(precision,scale) input, the length should depend on the precision of the argument.
-- I haven't found a way to determine that. So the formatted number will be returned without leading zeroes.
-- The result won't be compatible with DB2 if the value has less digits than its type.
CREATE FUNCTION db2.digits(value numeric) RETURNS text as 
$func$
    SELECT regexp_replace($1::text, '[^0-9]', '', 'g');
$func$
LANGUAGE SQL IMMUTABLE STRICT;
