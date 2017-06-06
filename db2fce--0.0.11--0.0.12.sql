-- UPPER(text, text): DB2 allows the user to specify a language for the UPPER function.
-- This is not really needed with PostgreSQL, as upper() uses Unicode, independent of the language.
-- On DB2, upper('Müller', 'en_US') also returns MÜLLER, just as with de_DE.
CREATE FUNCTION db2.upper(TEXT, TEXT) RETURNS TEXT AS 
$FUNC$
    SELECT UPPER($1);
$FUNC$
LANGUAGE SQL IMMUTABLE STRICT;

COMMENT ON FUNCTION db2.upper(TEXT, TEXT) IS 
    'Upper function with two parameters (text, language). The language parameter is not used in PostgreSQL.';

-- LOWER(text, text): DB2 allows the user to specify a language for the LOWER function.
-- This is not really needed with PostgreSQL, as lower() uses Unicode, independent of the language.
CREATE FUNCTION db2.lower(TEXT, TEXT) RETURNS TEXT AS 
$FUNC$
    SELECT LOWER($1);
$FUNC$
LANGUAGE SQL IMMUTABLE STRICT;

COMMENT ON FUNCTION db2.lower(TEXT, TEXT) IS 
    'Lower function with two parameters (text, language). The language parameter is not used in PostgreSQL.';
