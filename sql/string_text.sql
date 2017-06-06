SET search_path = db2,pg_catalog,public;

-- LOCATE()
SELECT LOCATE('N', 'DINING') FROM SYSIBM.SYSDUMMY1;

-- TRANSLATE()
SELECT TRANSLATE('12345', 'ax', '143') FROM SYSIBM.SYSDUMMY1;
SELECT TRANSLATE('Hanauma Bay') FROM SYSIBM.SYSDUMMY1;
SELECT TRANSLATE('Hanauma Bay', 'j', 'B'	) FROM SYSIBM.SYSDUMMY1;
SELECT TRANSLATE('Hanauma Bay', 'ei', 'aa') FROM SYSIBM.SYSDUMMY1;
SELECT TRANSLATE('Hanauma Bay', 'r', 'Bu') FROM SYSIBM.SYSDUMMY1;

-- HEX()
SELECT HEX('000020') FROM SYSIBM.SYSDUMMY1;
SELECT HEX(000020) FROM SYSIBM.SYSDUMMY1; -- WRONG

-- UPPER(text, text)
SELECT UPPER('Müller', 'de_DE') FROM SYSIBM.SYSDUMMY1;

-- LOWER(text, text)
SELECT LOWER('MÜLLER', 'de_DE') FROM SYSIBM.SYSDUMMY1;
