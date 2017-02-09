-- TIMESTAMP_FORMAT(): Converts a text to a timestamp using the supplied time format.
-- Most format strings are compatible between DB2 and PostgreSQL. 
CREATE OR REPLACE FUNCTION db2.timestamp_format(text, text)
RETURNS TIMESTAMP WITHOUT TIME ZONE
AS
$FUNC$
    select (
        -- FFn (n = Number of fractional second digits) with n > 6 is not supported.
        -- Digits after the 6th are added to the seconds which is not desirable.
        -- So we change the FF format string to US (microseconds) and truncate the digits to 6.
        case when $2 ~ '\.FF\d*$' then
            to_timestamp(regexp_replace($1, '\.(\d{1,6})\d*$', '.\1'), 
                         regexp_replace($2, '\.FF\d*$', '.US'))
        -- Try the original format. Most format strings seem to be identical between PostgreSQL and DB2.
        else
            to_timestamp($1, $2)
        end
    )::timestamp without time zone;
$FUNC$
LANGUAGE SQL IMMUTABLE STRICT
COST 50;

COMMENT ON FUNCTION db2.timestamp_format(text, text) IS 'Converts a timestamp given as text in the specified format to an actual timestamp';
