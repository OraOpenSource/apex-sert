set termout on
set define '^'
set concat on
set concat .
set verify off

-- SYS Grants
GRANT SELECT ON sys.dba_sys_privs TO ^parse_as_user;

GRANT SELECT ON sys.dba_role_privs TO ^parse_as_user;

GRANT SELECT ON sys.dba_tab_privs TO ^parse_as_user;

