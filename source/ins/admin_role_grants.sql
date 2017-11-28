set termout on
set define '^'
set concat on
set concat .
set verify off

-- APEX_ADMINISTRATOR_READ_ROLE GRANTS
GRANT APEX_ADMINISTRATOR_READ_ROLE TO ^parse_as_user
/

GRANT APEX_ADMINISTRATOR_READ_ROLE TO SV_SERT_@SV_VERSION@
/