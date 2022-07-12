-- The array_append(), array_prepend() and array_cat() functions
-- that were used for the array-based concetanation operator alias
-- had their arguments changed in PostgreSQL v14
DROP OPERATOR db2.!! (anyarray, anyelement);
DROP OPERATOR db2.!! (anyelement, anyarray);
DROP OPERATOR db2.!! (anyarray, anyarray);

