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

GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_snippets TO sv_sert_launcher
/
CREATE OR REPLACE SYNONYM sv_sert_launcher.sv_sec_snippets FOR sv_sert_@SV_VERSION@.sv_sec_snippets
/
grant insert on sv_sert_@SV_VERSION@.sv_sec_cookie_sessions TO sv_sert_launcher
/
CREATE OR REPLACE SYNONYM sv_sert_launcher.sv_sec_cookie_sessions FOR sv_sert_@SV_VERSION@.sv_sec_cookie_sessions
/
GRANT EXECUTE ON sv_sert_@SV_VERSION@.sv_sec_util TO sv_sert_launcher
/
CREATE OR REPLACE SYNONYM sv_sert_launcher.sv_sec_util FOR sv_sert_@SV_VERSION@.sv_sec_util
/

set feedback off;
set termout off;