/* contrib/db2fce--0.0.4.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION db2fce" to load this file. \quit

-- SYSIBM.SYSDUMMY1 emulation

CREATE SCHEMA sysibm;
GRANT USAGE ON SCHEMA sysibm TO PUBLIC;
CREATE VIEW sysibm.sysdummy1 AS SELECT 'X'::char(1) AS ibmreqd;
REVOKE ALL ON sysibm.sysdummy1 FROM PUBLIC;
GRANT SELECT, REFERENCES ON sysibm.sysdummy1 TO PUBLIC;

-- DB2 schema

CREATE SCHEMA db2;
GRANT USAGE ON SCHEMA db2 TO PUBLIC;

-- DAY()/MONTH()/YEAR() functions

CREATE FUNCTION db2.day(value date)
RETURNS integer
AS $$ SELECT date_part('day', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.day(date) IS 'returns day part of specified date';

CREATE FUNCTION db2.day(value timestamptz)
RETURNS integer
AS $$ SELECT date_part('day', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.day(timestamptz) IS 'returns day part of specified date';

CREATE FUNCTION db2.day(value timestamp)
RETURNS integer
AS $$ SELECT date_part('day', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.day(timestamp) IS 'returns day part of specified date';

CREATE FUNCTION db2.month(value date)
RETURNS integer
AS $$ SELECT date_part('month', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.month(date) IS 'returns month part of specified date';

CREATE FUNCTION db2.month(value timestamptz)
RETURNS integer
AS $$ SELECT date_part('month', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.month(timestamptz) IS 'returns month part of specified date';

CREATE FUNCTION db2.month(value timestamp)
RETURNS integer
AS $$ SELECT date_part('month', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.month(timestamp) IS 'returns month part of specified date';

CREATE FUNCTION db2.year(value date)
RETURNS integer
AS $$ SELECT date_part('year', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.year(date) IS 'returns year part of specified date';

CREATE FUNCTION db2.year(value timestamptz)
RETURNS integer
AS $$ SELECT date_part('year', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.year(timestamptz) IS 'returns year part of specified date';

CREATE FUNCTION db2.year(value timestamp)
RETURNS integer
AS $$ SELECT date_part('year', $1)::integer; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.year(timestamp) IS 'returns year part of specified date';

-- DAYS() function

CREATE FUNCTION db2.days(value text)
RETURNS integer
AS $$ SELECT to_date($1, 'YYYY-MM-DD') - to_date('0001-01-01', 'YYYY-MM-DD') + 1; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.days(text) IS 'returns days since 0000-01-01';

CREATE FUNCTION db2.days(value date)
RETURNS integer
AS $$ SELECT to_date($1::text, 'YYYY-MM-DD') - to_date('0001-01-01', 'YYYY-MM-DD') + 1; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.days(date) IS 'returns days since 0000-01-01';

CREATE FUNCTION db2.days(value timestamptz)
RETURNS integer
AS $$ SELECT to_date($1::text, 'YYYY-MM-DD') - to_date('0001-01-01', 'YYYY-MM-DD') + 1; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.days(timestamptz) IS 'returns days since 0000-01-01';

CREATE FUNCTION db2.days(value timestamp)
RETURNS integer
AS $$ SELECT to_date($1::text, 'YYYY-MM-DD') - to_date('0001-01-01', 'YYYY-MM-DD') + 1; $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.days(timestamp) IS 'returns days since 0000-01-01';

-- LOCATE() function

CREATE FUNCTION db2.locate(text, text)
RETURNS integer
AS $$ SELECT position($1 IN $2); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.locate(text, text) IS 'position of substring';
-- TODO: locate(text, text, int)

-- TRANSLATE() function

CREATE FUNCTION db2.translate(text, text, text)
RETURNS text
AS $$ SELECT pg_catalog.translate($1, $3, $2); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.translate(text, text, text) IS 'map a set of characters appearing in string';
-- TODO: translate(text, text, text, pad)

CREATE FUNCTION db2.translate(text)
RETURNS text
AS $$ SELECT upper($1); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.translate(text) IS 'uppercase';

-- CHAR()/INTEGER()/INT()/DECIMAL()/DEC() functions (CASTs)

CREATE FUNCTION db2.char(value text)
RETURNS char
AS $$ SELECT cast($1 AS CHAR); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.char(text) IS 'cast to char';

CREATE FUNCTION db2.char(value anyelement)
RETURNS char
AS $$ SELECT cast($1 AS CHAR); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.char(anyelement) IS 'cast to char';

CREATE FUNCTION db2.integer(value text)
RETURNS integer
AS $$ SELECT cast(floor($1::float) AS INTEGER); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.integer(text) IS 'cast to integer';

CREATE FUNCTION db2.integer(value anyelement)
RETURNS integer
AS $$ SELECT cast(floor($1::float) AS INTEGER); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.integer(anyelement) IS 'cast to integer';

CREATE FUNCTION db2.int(value text)
RETURNS integer
AS $$ SELECT cast(floor($1::float) AS INTEGER); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.int(text) IS 'cast to integer';

CREATE FUNCTION db2.int(value anyelement)
RETURNS integer
AS $$ SELECT cast(floor($1::float) AS INTEGER); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.int(anyelement) IS 'cast to integer';

CREATE FUNCTION db2.decimal(value text)
RETURNS decimal
AS $$ SELECT cast($1 AS DECIMAL); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.decimal(text) IS 'cast to decimal';

CREATE FUNCTION db2.decimal(value anyelement)
RETURNS decimal
AS $$ SELECT cast($1 AS DECIMAL); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.decimal(anyelement) IS 'cast to decimal';

CREATE FUNCTION db2.dec(value text)
RETURNS decimal
AS $$ SELECT cast($1 AS DECIMAL); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.dec(text) IS 'cast to decimal';

CREATE FUNCTION db2.dec(value anyelement)
RETURNS decimal
AS $$ SELECT cast($1 AS DECIMAL); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.dec(anyelement) IS 'cast to decimal';

-- DECIMAL()/DEC() function with precision and optional scale

CREATE FUNCTION db2.decimal(value text, prec integer, scale integer)
 RETURNS numeric
AS $$
DECLARE
  format text;
  i int;
BEGIN
  format := '';
  FOR i IN 1..$2 LOOP
    format := format || '9';
  END LOOP;
  format := format || '.';
  IF $3 > 0 THEN
    FOR i IN 1..$3 LOOP
      format := format || '9';
    END LOOP;
  END IF;
  RETURN to_number($1::text, format);
END
$$
LANGUAGE PLPGSQL;
COMMENT ON FUNCTION db2.decimal(text, integer, integer) IS 'cast to decimal';

CREATE FUNCTION db2.decimal(value text, prec integer)
RETURNS decimal
AS $$ SELECT db2."decimal"($1, $2, 0); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.decimal(text, integer) IS 'cast to decimal';

CREATE FUNCTION db2.decimal(value anyelement, prec integer, scale integer)
RETURNS decimal
AS $$ SELECT db2."decimal"($1::text, $2, $3); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.decimal(anyelement, integer, integer) IS 'cast to decimal';

CREATE FUNCTION db2.decimal(value anyelement, prec integer)
RETURNS decimal
AS $$ SELECT db2."decimal"($1::text, $2, 0); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.decimal(anyelement, integer) IS 'cast to decimal';

CREATE FUNCTION db2.dec(value text, prec integer, scale integer)
RETURNS decimal
AS $$ SELECT db2."decimal"($1, $2, $3); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.dec(text, integer, integer) IS 'cast to decimal';

CREATE FUNCTION db2.dec(value text, prec integer)
RETURNS decimal
AS $$ SELECT db2."decimal"($1, $2, 0); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.dec(text, integer) IS 'cast to decimal';

CREATE FUNCTION db2.dec(value anyelement, prec integer, scale integer)
RETURNS decimal
AS $$ SELECT cast($1 AS DECIMAL($2, $3)); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.dec(anyelement, integer, integer) IS 'cast to decimal';

CREATE FUNCTION db2.dec(value anyelement, prec integer)
RETURNS decimal
AS $$ SELECT db2."decimal"($1::text, $2, 0); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.dec(anyelement, integer) IS 'cast to decimal';

-- HEX() function

CREATE FUNCTION db2.hex(value text)
RETURNS text
AS $$ SELECT pg_catalog.encode($1::bytea, 'hex'); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.hex(text) IS 'convert value into hexadecimal string';

-- ROUND() function, additional overloaded signature

CREATE FUNCTION db2.round(value double precision, scale integer)
RETURNS numeric
AS $$ SELECT pg_catalog.round($1::numeric, $2); $$
LANGUAGE SQL IMMUTABLE STRICT;
COMMENT ON FUNCTION db2.round(double precision, integer) IS 'value rounded to ''scale''';

-- VALUE() function (alias for COALESCE())

CREATE FUNCTION db2.value(variadic anyarray) 
RETURNS anyelement 
AS $$ SELECT $1[i] 
  FROM generate_subscripts($1, 1) g(i) 
WHERE $1[i] IS NOT NULL LIMIT 1; $$ 
LANGUAGE SQL STRICT;
COMMENT ON FUNCTION db2.value(variadic anyarray) IS 'alias for coalesce';

CREATE FUNCTION db2.value(variadic text[])
RETURNS text
AS $$ SELECT $1[i]
  FROM generate_subscripts($1, 1) g(i)
WHERE $1[i] IS NOT NULL LIMIT 1; $$
LANGUAGE SQL STRICT;
COMMENT ON FUNCTION db2.value(variadic text[]) IS 'alias for coalesce';

-- DOUBLE type (alias for DOUBLE PRECISION)

CREATE DOMAIN db2.double AS double precision;
COMMENT ON DOMAIN db2.double IS 'double-precision floating point number, 8-byte storage';

-- ^= operator (alias for <> and !=)

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int48ne,
    LEFTARG = integer,
    RIGHTARG = bigint,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (integer, bigint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.boolne,
    LEFTARG = boolean,
    RIGHTARG = boolean,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (boolean, boolean) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.tidne,
    LEFTARG = tid,
    RIGHTARG = tid,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (tid, tid) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int8ne,
    LEFTARG = bigint,
    RIGHTARG = bigint,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bigint, bigint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int84ne,
    LEFTARG = bigint,
    RIGHTARG = integer,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bigint, integer) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int4ne,
    LEFTARG = integer,
    RIGHTARG = integer,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (integer, integer) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int2ne,
    LEFTARG = smallint,
    RIGHTARG = smallint,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (smallint, smallint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.textne,
    LEFTARG = text,
    RIGHTARG = text,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (text, text) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int24ne,
    LEFTARG = smallint,
    RIGHTARG = integer,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (smallint, integer) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int42ne,
    LEFTARG = integer,
    RIGHTARG = smallint,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (integer, smallint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.abstimene,
    LEFTARG = abstime,
    RIGHTARG = abstime,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (abstime, abstime) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.reltimene,
    LEFTARG = reltime,
    RIGHTARG = reltime,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (reltime, reltime) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.oidne,
    LEFTARG = oid,
    RIGHTARG = oid,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (oid, oid) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float4ne,
    LEFTARG = real,
    RIGHTARG = real,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (real, real) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.charne,
    LEFTARG = "char",
    RIGHTARG = "char",
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= ("char", "char") IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.namene,
    LEFTARG = name,
    RIGHTARG = name,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (name, name) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.oidvectorne,
    LEFTARG = oidvector,
    RIGHTARG = oidvector,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (oidvector, oidvector) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float8ne,
    LEFTARG = double precision,
    RIGHTARG = double precision,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (double precision, double precision) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.point_ne,
    LEFTARG = point,
    RIGHTARG = point,
    COMMUTATOR = ^=,
    NEGATOR = ~=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (point, point) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.tintervalne,
    LEFTARG = tinterval,
    RIGHTARG = tinterval,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (tinterval, tinterval) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.cash_ne,
    LEFTARG = money,
    RIGHTARG = money,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (money, money) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.bpcharne,
    LEFTARG = character,
    RIGHTARG = character,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (character, character) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.array_ne,
    LEFTARG = anyarray,
    RIGHTARG = anyarray,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (anyarray, anyarray) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.date_ne,
    LEFTARG = date,
    RIGHTARG = date,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (date, date) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.time_ne,
    LEFTARG = time without time zone,
    RIGHTARG = time without time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (time without time zone, time without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float48ne,
    LEFTARG = real,
    RIGHTARG = double precision,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (real, double precision) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float84ne,
    LEFTARG = double precision,
    RIGHTARG = real,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (double precision, real) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.network_ne,
    LEFTARG = inet,
    RIGHTARG = inet,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (inet, inet) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.macaddr_ne,
    LEFTARG = macaddr,
    RIGHTARG = macaddr,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (macaddr, macaddr) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamptz_ne,
    LEFTARG = timestamp with time zone,
    RIGHTARG = timestamp with time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp with time zone, timestamp with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.interval_ne,
    LEFTARG = interval,
    RIGHTARG = interval,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (interval, interval) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.circle_ne,
    LEFTARG = circle,
    RIGHTARG = circle,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (circle, circle) IS 'not equal by area';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timetz_ne,
    LEFTARG = time with time zone,
    RIGHTARG = time with time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (time with time zone, time with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.lseg_ne,
    LEFTARG = lseg,
    RIGHTARG = lseg,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (lseg, lseg) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.numeric_ne,
    LEFTARG = numeric,
    RIGHTARG = numeric,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (numeric, numeric) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.bitne,
    LEFTARG = bit,
    RIGHTARG = bit,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bit, bit) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.varbitne,
    LEFTARG = bit varying,
    RIGHTARG = bit varying,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bit varying, bit varying) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int28ne,
    LEFTARG = smallint,
    RIGHTARG = bigint,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (smallint, bigint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int82ne,
    LEFTARG = bigint,
    RIGHTARG = smallint,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bigint, smallint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.byteane,
    LEFTARG = bytea,
    RIGHTARG = bytea,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bytea, bytea) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamp_ne,
    LEFTARG = timestamp without time zone,
    RIGHTARG = timestamp without time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp without time zone, timestamp without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.date_ne_timestamp,
    LEFTARG = date,
    RIGHTARG = timestamp without time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (date, timestamp without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.date_ne_timestamptz,
    LEFTARG = date,
    RIGHTARG = timestamp with time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (date, timestamp with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamp_ne_date,
    LEFTARG = timestamp without time zone,
    RIGHTARG = date,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp without time zone, date) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamptz_ne_date,
    LEFTARG = timestamp with time zone,
    RIGHTARG = date,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp with time zone, date) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamp_ne_timestamptz,
    LEFTARG = timestamp without time zone,
    RIGHTARG = timestamp with time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp without time zone, timestamp with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamptz_ne_timestamp,
    LEFTARG = timestamp with time zone,
    RIGHTARG = timestamp without time zone,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp with time zone, timestamp without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.uuid_ne,
    LEFTARG = uuid,
    RIGHTARG = uuid,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (uuid, uuid) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.record_ne,
    LEFTARG = record,
    RIGHTARG = record,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (record, record) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.enum_ne,
    LEFTARG = anyenum,
    RIGHTARG = anyenum,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (anyenum, anyenum) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.tsvector_ne,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (tsvector, tsvector) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.tsquery_ne,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (tsquery, tsquery) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.range_ne,
    LEFTARG = anyrange,
    RIGHTARG = anyrange,
    COMMUTATOR = ^=,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (anyrange, anyrange) IS 'not equal';

-- !! operator (alias for ||)

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.array_append,
    LEFTARG = anyarray,
    RIGHTARG = anyelement
);
COMMENT ON OPERATOR db2.!! (anyarray, anyelement) IS 'append element onto end of array';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.array_prepend,
    LEFTARG = anyelement,
    RIGHTARG = anyarray
);
COMMENT ON OPERATOR db2.!! (anyelement, anyarray) IS 'prepend element onto front of array';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.array_cat,
    LEFTARG = anyarray,
    RIGHTARG = anyarray
);
COMMENT ON OPERATOR db2.!! (anyarray, anyarray) IS 'concatenate';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.textcat,
    LEFTARG = text,
    RIGHTARG = text
);
COMMENT ON OPERATOR db2.!! (text, text) IS 'concatenate';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.bitcat,
    LEFTARG = bit varying,
    RIGHTARG = bit varying
);
COMMENT ON OPERATOR db2.!! (bit varying, bit varying) IS 'concatenate';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.byteacat,
    LEFTARG = bytea,
    RIGHTARG = bytea
);
COMMENT ON OPERATOR db2.!! (bytea, bytea) IS 'concatenate';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.textanycat,
    LEFTARG = text,
    RIGHTARG = anynonarray
);
COMMENT ON OPERATOR db2.!! (text, anynonarray) IS 'concatenate';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.anytextcat,
    LEFTARG = anynonarray,
    RIGHTARG = text
);
COMMENT ON OPERATOR db2.!! (anynonarray, text) IS 'concatenate';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.tsvector_concat,
    LEFTARG = tsvector,
    RIGHTARG = tsvector
);
COMMENT ON OPERATOR db2.!! (tsvector, tsvector) IS 'concatenate';

CREATE OPERATOR db2.!! (
    PROCEDURE = pg_catalog.tsquery_or,
    LEFTARG = tsquery,
    RIGHTARG = tsquery
);
COMMENT ON OPERATOR db2.!! (tsquery, tsquery) IS 'OR-concatenate';
