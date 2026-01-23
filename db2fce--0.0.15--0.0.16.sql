-- ^= operator (alias for <> and !=)

-- We need to drop the old versions of the operator with the NEGATOR. Duplicate negators aren't supported anymore in Postgres.
-- Recreating the operators without negator means that the optimizer can't generate NOT() expressions for this operator anymore, 
-- which can lead to suboptimal performance.

DROP OPERATOR IF EXISTS db2.^= (anyarray, anyarray);
DROP OPERATOR IF EXISTS db2.^= (anyenum, anyenum);
DROP OPERATOR IF EXISTS db2.^= (anyrange, anyrange);
DROP OPERATOR IF EXISTS db2.^= (bit, bit);
DROP OPERATOR IF EXISTS db2.^= (bool, bool);
DROP OPERATOR IF EXISTS db2.^= (bpchar, bpchar);
DROP OPERATOR IF EXISTS db2.^= (bytea, bytea);
DROP OPERATOR IF EXISTS db2.^= (char, char);
DROP OPERATOR IF EXISTS db2.^= (circle, circle);
DROP OPERATOR IF EXISTS db2.^= (date, date);
DROP OPERATOR IF EXISTS db2.^= (date, timestamp);
DROP OPERATOR IF EXISTS db2.^= (date, timestamptz);
DROP OPERATOR IF EXISTS db2.^= (float4, float4);
DROP OPERATOR IF EXISTS db2.^= (float4, float8);
DROP OPERATOR IF EXISTS db2.^= (float8, float4);
DROP OPERATOR IF EXISTS db2.^= (float8, float8);
DROP OPERATOR IF EXISTS db2.^= (inet, inet);
DROP OPERATOR IF EXISTS db2.^= (int2, int2);
DROP OPERATOR IF EXISTS db2.^= (int2, int4);
DROP OPERATOR IF EXISTS db2.^= (int2, int8);
DROP OPERATOR IF EXISTS db2.^= (int4, int2);
DROP OPERATOR IF EXISTS db2.^= (int4, int4);
DROP OPERATOR IF EXISTS db2.^= (int4, int8);
DROP OPERATOR IF EXISTS db2.^= (int8, int2);
DROP OPERATOR IF EXISTS db2.^= (int8, int4);
DROP OPERATOR IF EXISTS db2.^= (int8, int8);
DROP OPERATOR IF EXISTS db2.^= (interval, interval);
DROP OPERATOR IF EXISTS db2.^= (lseg, lseg);
DROP OPERATOR IF EXISTS db2.^= (macaddr, macaddr);
DROP OPERATOR IF EXISTS db2.^= (money, money);
DROP OPERATOR IF EXISTS db2.^= (name, name);
DROP OPERATOR IF EXISTS db2.^= (numeric, numeric);
DROP OPERATOR IF EXISTS db2.^= (oid, oid);
DROP OPERATOR IF EXISTS db2.^= (oidvector, oidvector);
DROP OPERATOR IF EXISTS db2.^= (point, point);
DROP OPERATOR IF EXISTS db2.^= (record, record);
DROP OPERATOR IF EXISTS db2.^= (text, text);
DROP OPERATOR IF EXISTS db2.^= (tid, tid);
DROP OPERATOR IF EXISTS db2.^= (time, time);
DROP OPERATOR IF EXISTS db2.^= (timestamp, date);
DROP OPERATOR IF EXISTS db2.^= (timestamp, timestamp);
DROP OPERATOR IF EXISTS db2.^= (timestamp, timestamptz);
DROP OPERATOR IF EXISTS db2.^= (timestamptz, date);
DROP OPERATOR IF EXISTS db2.^= (timestamptz, timestamp);
DROP OPERATOR IF EXISTS db2.^= (timestamptz, timestamptz);
DROP OPERATOR IF EXISTS db2.^= (timetz, timetz);
DROP OPERATOR IF EXISTS db2.^= (tsquery, tsquery);
DROP OPERATOR IF EXISTS db2.^= (tsvector, tsvector);
DROP OPERATOR IF EXISTS db2.^= (uuid, uuid);
DROP OPERATOR IF EXISTS db2.^= (varbit, varbit);

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int48ne,
    LEFTARG = integer,
    RIGHTARG = bigint,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (integer, bigint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.boolne,
    LEFTARG = boolean,
    RIGHTARG = boolean,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (boolean, boolean) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.tidne,
    LEFTARG = tid,
    RIGHTARG = tid,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (tid, tid) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int8ne,
    LEFTARG = bigint,
    RIGHTARG = bigint,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bigint, bigint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int84ne,
    LEFTARG = bigint,
    RIGHTARG = integer,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bigint, integer) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int4ne,
    LEFTARG = integer,
    RIGHTARG = integer,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (integer, integer) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int2ne,
    LEFTARG = smallint,
    RIGHTARG = smallint,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (smallint, smallint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.textne,
    LEFTARG = text,
    RIGHTARG = text,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (text, text) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int24ne,
    LEFTARG = smallint,
    RIGHTARG = integer,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (smallint, integer) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int42ne,
    LEFTARG = integer,
    RIGHTARG = smallint,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (integer, smallint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.oidne,
    LEFTARG = oid,
    RIGHTARG = oid,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (oid, oid) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float4ne,
    LEFTARG = real,
    RIGHTARG = real,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (real, real) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.namene,
    LEFTARG = name,
    RIGHTARG = name,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (name, name) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.oidvectorne,
    LEFTARG = oidvector,
    RIGHTARG = oidvector,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (oidvector, oidvector) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float8ne,
    LEFTARG = double precision,
    RIGHTARG = double precision,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (double precision, double precision) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.point_ne,
    LEFTARG = point,
    RIGHTARG = point,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (point, point) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.cash_ne,
    LEFTARG = money,
    RIGHTARG = money,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (money, money) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.bpcharne,
    LEFTARG = character,
    RIGHTARG = character,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (character, character) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.array_ne,
    LEFTARG = anyarray,
    RIGHTARG = anyarray,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (anyarray, anyarray) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.date_ne,
    LEFTARG = date,
    RIGHTARG = date,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (date, date) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.time_ne,
    LEFTARG = time without time zone,
    RIGHTARG = time without time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (time without time zone, time without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float48ne,
    LEFTARG = real,
    RIGHTARG = double precision,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (real, double precision) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.float84ne,
    LEFTARG = double precision,
    RIGHTARG = real,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (double precision, real) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.network_ne,
    LEFTARG = inet,
    RIGHTARG = inet,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (inet, inet) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.macaddr_ne,
    LEFTARG = macaddr,
    RIGHTARG = macaddr,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (macaddr, macaddr) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamptz_ne,
    LEFTARG = timestamp with time zone,
    RIGHTARG = timestamp with time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp with time zone, timestamp with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.interval_ne,
    LEFTARG = interval,
    RIGHTARG = interval,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (interval, interval) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.circle_ne,
    LEFTARG = circle,
    RIGHTARG = circle,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (circle, circle) IS 'not equal by area';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timetz_ne,
    LEFTARG = time with time zone,
    RIGHTARG = time with time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (time with time zone, time with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.lseg_ne,
    LEFTARG = lseg,
    RIGHTARG = lseg,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (lseg, lseg) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.numeric_ne,
    LEFTARG = numeric,
    RIGHTARG = numeric,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (numeric, numeric) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.bitne,
    LEFTARG = bit,
    RIGHTARG = bit,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bit, bit) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.varbitne,
    LEFTARG = bit varying,
    RIGHTARG = bit varying,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bit varying, bit varying) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int28ne,
    LEFTARG = smallint,
    RIGHTARG = bigint,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (smallint, bigint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.int82ne,
    LEFTARG = bigint,
    RIGHTARG = smallint,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bigint, smallint) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.byteane,
    LEFTARG = bytea,
    RIGHTARG = bytea,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (bytea, bytea) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamp_ne,
    LEFTARG = timestamp without time zone,
    RIGHTARG = timestamp without time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp without time zone, timestamp without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.date_ne_timestamp,
    LEFTARG = date,
    RIGHTARG = timestamp without time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (date, timestamp without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.date_ne_timestamptz,
    LEFTARG = date,
    RIGHTARG = timestamp with time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (date, timestamp with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamp_ne_date,
    LEFTARG = timestamp without time zone,
    RIGHTARG = date,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp without time zone, date) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamptz_ne_date,
    LEFTARG = timestamp with time zone,
    RIGHTARG = date,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp with time zone, date) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamp_ne_timestamptz,
    LEFTARG = timestamp without time zone,
    RIGHTARG = timestamp with time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp without time zone, timestamp with time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.timestamptz_ne_timestamp,
    LEFTARG = timestamp with time zone,
    RIGHTARG = timestamp without time zone,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (timestamp with time zone, timestamp without time zone) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.uuid_ne,
    LEFTARG = uuid,
    RIGHTARG = uuid,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (uuid, uuid) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.record_ne,
    LEFTARG = record,
    RIGHTARG = record,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (record, record) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.enum_ne,
    LEFTARG = anyenum,
    RIGHTARG = anyenum,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (anyenum, anyenum) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.tsvector_ne,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (tsvector, tsvector) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.tsquery_ne,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (tsquery, tsquery) IS 'not equal';

CREATE OPERATOR db2.^= (
    PROCEDURE = pg_catalog.range_ne,
    LEFTARG = anyrange,
    RIGHTARG = anyrange,
    COMMUTATOR = ^=,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);
COMMENT ON OPERATOR db2.^= (anyrange, anyrange) IS 'not equal';
