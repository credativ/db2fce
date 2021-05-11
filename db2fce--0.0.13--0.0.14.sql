-- The abstime, reltime and tinterval data types were long deprecated and have
-- been removed in PostgreSQL v12
DROP OPERATOR db2.^= (abstime, abstime);
DROP OPERATOR db2.^= (reltime, reltime);
DROP OPERATOR db2.^= (tinterval, tinterval);
