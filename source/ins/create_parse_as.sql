--  Copyright (c) sumneva 2010. All Rights Reserved.
--
--    NAME
--      create_user.sql
--
--    DESCRIPTION
--
--    NOTES
--      Assumes the SYS user is connected.
--
--    Arguments:
--      1 - usrn   = Parse As Schema Name
--
--    MODIFIED   (MM/DD/YYYY)
--      dgault    1/7/09 7:19 PM - Created   

set termout on
set define '^'
set concat on
set concat .
set verify off
--
--
PROMPT
PROMPT ==================================================================================
PROMPT = CREATING ^PARSE_AS_USER USER 
PROMPT ==================================================================================
PROMPT
PROMPT Listing all available tablespaces...
PROMPT
select tablespace_name "Tablespace Name" from dba_tablespaces ORDER BY 1;
--
PROMPT
ACCEPT dflt CHAR DEFAULT 'USERS' PROMPT 'Please enter the default tablespace to be used for ^parse_as_user [USERS] : '
ACCEPT temp CHAR DEFAULT 'TEMP'  PROMPT 'Please enter the temporary tablespace to be used for ^parse_as_user [TEMP] : '
--
set feedback on
create user ^parse_as_user identified by "^schema_password" default tablespace "^dflt" quota unlimited on "^dflt" temporary tablespace "^temp";

-- This is required for scheduling jobs
grant SCHEDULER_ADMIN to ^parse_as_user;

set feedback off;
set termout off;