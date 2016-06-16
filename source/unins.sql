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
PROMPT.   ___  ______ _______   __      _____ ___________ _____ 
PROMPT.  / _ \ | ___ \  ___\ \ / /     /  ___|  ___| ___ \_   _|
PROMPT. / /_\ \| |_/ / |__  \ V /______\ `--.| |__ | |_/ / | |  
PROMPT. |  _  ||  __/|  __| /   \______|`--. \  __||    /  | |  
PROMPT. | | | || |   | |___/ /^\ \     /\__/ / |___| |\ \  | |  
PROMPT. \_| |_/\_|   \____/\/   \/     \____/\____/\_| \_| \_/  
PROMPT                              
PROMPT  ===================== APEX-SERT =======================
PROMPT
PROMPT  ******************************************************************
PROMPT  ***                                                            ***
PROMPT  ***  WARNING:  Running this script will DROP the schema where  ***
PROMPT  ***    APEX-SERT is installed.  You will lose ALL DATA!!!      ***
PROMPT  ***                                                            ***
PROMPT  ******************************************************************
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

PROMPT ****   Dropping the APEX-SERT Workspace
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
PROMPT  ==================================================================
PROMPT  ======================= C O M P L E T E ==========================
PROMPT  ==================================================================
