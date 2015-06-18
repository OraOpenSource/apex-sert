CREATE OR REPLACE PACKAGE BODY sv_sec_error
AS

--------------------------------------------------------------------------------
-- PROCECDURE: R A I S E _ U N A N T I C I P A T E D 
--------------------------------------------------------------------------------
PROCEDURE raise_unanticipated
  (
  p_error_code               IN NUMBER   DEFAULT -20000,
  p_error_msg                IN VARCHAR2 DEFAULT NULL,
  p_log_apex_items           IN BOOLEAN  DEFAULT FALSE
  )
IS
BEGIN

-- Log the error
logger.log_error(p_error_msg);

-- Log the APEX Items, if requested
IF p_log_apex_items = TRUE THEN
  logger.log_apex_items;
END IF;

-- Raise the error
raise_application_error(p_error_code, p_error_msg || ' - ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE, TRUE);

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20001, p_error_msg || ' - ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE, TRUE);

END raise_unanticipated;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_error;
/