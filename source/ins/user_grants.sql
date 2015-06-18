--  Copyright (c) sumneva 2010. All Rights Reserved.
--
--    NAME
--      user_grants.sql
--
--    DESCRIPTION
--
--    NOTES
--      Assumes the SYS user is connected.
--
--    Arguments:
--      1 - usrn   = sumnevaASR Schema Name
--
--    MODIFIED   (MM/DD/YYYY)
--      dgault    1/7/09 7:19 PM - Created   

set termout on
set define '^'
set concat on
set concat .
set verify off
--

GRANT CREATE VIEW TO sv_sert_@SV_VERSION@;

GRANT CREATE PROCEDURE TO sv_sert_@SV_VERSION@;

GRANT CREATE PUBLIC SYNONYM TO sv_sert_@SV_VERSION@;

-- For PL/PDF

GRANT SELECT on sys.v_$database to sv_sert_@SV_VERSION@;

GRANT EXECUTE on sys.dbms_crypto to sv_sert_@SV_VERSION@;

DECLARE
 l_sql VARCHAR2(255);
BEGIN

FOR x IN (SELECT MAX(username) username FROM all_users WHERE username LIKE 'APEX_0%')
LOOP

  l_sql := 'GRANT SELECT ON ' || x.username || '.wwv_flow_sessions$ TO sv_sert_@SV_VERSION@';

END LOOP;

EXECUTE IMMEDIATE l_sql;

END;
/

set feedback off;
set termout off;