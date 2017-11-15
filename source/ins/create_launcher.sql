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
PROMPT = CREATING SV_SERT_LAUNCHER USER 
PROMPT ==================================================================================
PROMPT
PROMPT Listing all available tablespaces...
PROMPT
select tablespace_name "Tablespace Name" from dba_tablespaces ORDER BY 1;
--
PROMPT
ACCEPT dflt CHAR DEFAULT 'USERS' PROMPT 'Please enter the default tablespace to be used for SV_SERT_LAUNCHER [USERS] : '
ACCEPT temp CHAR DEFAULT 'TEMP'  PROMPT 'Please enter the temporary tablespace to be used for SV_SERT_LAUNCHER [TEMP] : '
--
set feedback on
create user SV_SERT_LAUNCHER identified by "^schema_password" default tablespace "^dflt" quota unlimited on "^dflt" temporary tablespace "^temp";

-- This is required for scheduling jobs
grant CREATE SESSION to SV_SERT_LAUNCHER;

set feedback off;
set termout off;
