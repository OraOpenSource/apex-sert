--
--    NAME
--      unins.sql
--
--    DESCRIPTION
--
--    NOTES
--      Assumes the SYS user is connected.
--
--
--    Arguments:
--
--    Example:
--
--    1)Local
--      sqlplus "sys/syspass as sysdba" @unins 
--
--    2)With connect string
--      sqlplus "sys/syspass@10g as sysdba" @unins 
--
--    MODIFIED   
--      dgault    1/7/09 7:19 PM - Created   
--
set define '^'
set concat on
set concat .
set verify off
set termout off
set termout on
CLEAR SCREEN
PROMPT 
PROMPT   _____ ______ _____ _______ 
PROMPT  / ____|  ____|  __ \__   __|
PROMPT | (___ | |__  | |__) | | |   
PROMPT  \___ \|  __| |  _  /  | |   
PROMPT  ____) | |____| | \ \  | |   
PROMPT |_____/|______|_|  \_\ |_|   
PROMPT                              
PROMPT  ========================== SERT ============================
PROMPT
PROMPT  ******************************************************************************
PROMPT  ***                                                                        ***
PROMPT  ***      WARNING:  Running this script will DROP the schema where          ***
PROMPT  ***            SERT is installed.  You will lose ALL DATA!!!               ***
PROMPT  ***                                                                        ***
PROMPT  ******************************************************************************
PROMPT
PAUSE   Press Enter to continue uninstallation or CTRL-C to EXIT
--

whenever sqlerror continue

PROMPT ****   Dropping the @SV_PARSE_AS@ USER
drop user @SV_PARSE_AS@ cascade
/

PROMPT ****   Dropping the SV_SERT_@SV_VERSION@ USER
drop user SV_SERT_@SV_VERSION@ cascade
/

PROMPT ****   Dropping the SERT Workspace
BEGIN
APEX_INSTANCE_ADMIN.REMOVE_WORKSPACE
  (
  p_workspace => 'SERT'
  );
COMMIT;
END;
/

PROMPT
PROMPT
PROMPT  =============================================================================
PROMPT  ============================= C O M P L E T E ===============================
PROMPT  =============================================================================
