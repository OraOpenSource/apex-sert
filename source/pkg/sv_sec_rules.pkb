create or replace 
PACKAGE BODY sv_sec_rules
AS 

--------------------------------------------------------------------------------
-- FUNCTION: C H E C K _ X S S
--------------------------------------------------------------------------------
-- Checks for occurence of XSS
--------------------------------------------------------------------------------
FUNCTION check_xss
  (
  p_source                   IN CLOB
  )
  RETURN VARCHAR2
IS
  l_application_id           NUMBER       := SYS_CONTEXT('SV_SERT_CTX', 'APPLICATION_ID');
  l_result                   VARCHAR2(10) := 'PASS';
  l_source                   CLOB         := UPPER(p_source);
  l_exact_substitutions      apex_applications.exact_substitutions%TYPE;
  x                          NUMBER;
  V_START                    NUMBER :=1;
  V_END                      NUMBER;
  l_item                     VARCHAR2(255);
BEGIN

-- Determine whether or not the application uses exact substituions
SELECT exact_substitutions INTO l_exact_substitutions FROM apex_applications
  WHERE application_id = l_application_id;

-- Remove all APEX built-in items
l_source := REPLACE(l_source, '&APP_ID.', NULL);
l_source := REPLACE(l_source, '&FLOW_ID.', NULL);
l_source := REPLACE(l_source, '&FLOW_PAGE_ID.', NULL);
l_source := REPLACE(l_source, '&APP_ALIAS.', NULL);
l_source := REPLACE(l_source, '&APP_PAGE_ID.', NULL);
l_source := REPLACE(l_source, '&APP_USER.', NULL);
l_source := REPLACE(l_source, '&SESSION.', NULL);
l_source := REPLACE(l_source, '&APP_SESSION.', NULL);
l_source := REPLACE(l_source, '&DEBUG.', NULL);
l_source := REPLACE(l_source, '&APP_SECURITY_GROUP_ID.', NULL);

-- Remove them again, if exact substitutions are disabled
IF l_exact_substitutions = 'No' THEN
  l_source := REPLACE(l_source, '&APP_ID', NULL);
  l_source := REPLACE(l_source, '&FLOW_ID', NULL);
  l_source := REPLACE(l_source, '&FLOW_PAGE_ID', NULL);
  l_source := REPLACE(l_source, '&APP_ALIAS', NULL);
  l_source := REPLACE(l_source, '&APP_PAGE_ID', NULL);
  l_source := REPLACE(l_source, '&APP_USER', NULL);
  l_source := REPLACE(l_source, '&SESSION', NULL);
  l_source := REPLACE(l_source, '&APP_SESSION', NULL);
  l_source := REPLACE(l_source, '&DEBUG', NULL);
  l_source := REPLACE(l_source, '&APP_SECURITY_GROUP_ID', NULL);
END IF;

-- Remove any &ITEM. syntax strings from l_source that is a page item
x := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,0,'i');
WHILE (x != 0)
LOOP

  -- Grab the page item name
  l_item :=  REGEXP_SUBSTR(l_source, '(&([0-9a-zA-Z_$]+)(\.))', v_start, 1,'i'); 

  -- Remove the & and .
  l_item := SUBSTR(l_item, 2, (LENGTH(l_item)-2));

  -- PREP FOR THE NEXT ITTERATION OF THE LOOP
  v_start := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,1,'i') - LENGTH(l_item)+2;

  -- Loop through and see if the string is a page item
  FOR y IN (SELECT item_name FROM apex_application_page_items WHERE application_id = l_application_id AND item_name = l_item)
  LOOP
    -- Remove reference to page item
    l_source := REPLACE(l_source, '&' || y.item_name || '.', NULL);
  END LOOP;

  -- Determine if there is another &ITEM. string
  x := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,0,'i');

END LOOP;

IF l_exact_substitutions = 'No' THEN
  IF REGEXP_INSTR(l_source, '(&([0-9a-zA-Z_$]+))',1,1,1,'i') > 0 THEN
    RETURN 'FAIL';
  END IF;
END IF;

-- Always check for &ITEM. syntax 
IF REGEXP_INSTR(l_source, '(&([0-9a-zA-Z_$]+)(\.))',1,1,1,'i') > 0 THEN
  RETURN 'FAIL';
END IF;

RETURN l_result;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END check_xss;

--------------------------------------------------------------------------------
-- FUNCTION: C H E C K _ I T E M _ S Y N T A X
--------------------------------------------------------------------------------
-- Checks for user of &ITEM_NAME. Syntax
--------------------------------------------------------------------------------
FUNCTION check_item_syntax
  (
  p_source                   IN CLOB
  )
RETURN VARCHAR2
IS
  l_application_id           NUMBER       := SYS_CONTEXT('SV_SERT_CTX', 'APPLICATION_ID');
  l_result                   VARCHAR2(10) := 'PASS';
  l_source                   CLOB         := UPPER(p_source);
BEGIN

-- First, remove all APEX built-in items
l_source := REPLACE(l_source, '&APP_ID.', NULL);
l_source := REPLACE(l_source, '&FLOW_ID.', NULL);
l_source := REPLACE(l_source, '&FLOW_PAGE_ID.', NULL);
l_source := REPLACE(l_source, '&APP_ALIAS.', NULL);
l_source := REPLACE(l_source, '&APP_PAGE_ID.', NULL);
l_source := REPLACE(l_source, '&APP_USER.', NULL);
l_source := REPLACE(l_source, '&SESSION.', NULL);
l_source := REPLACE(l_source, '&APP_SESSION.', NULL);
l_source := REPLACE(l_source, '&DEBUG.', NULL);
l_source := REPLACE(l_source, '&APP_SECURITY_GROUP_ID.', NULL);


-- Finally, Check for &ITEM. Syntax in the remaning region source
IF REGEXP_INSTR(l_source, '(&([0-9a-zA-Z_$]+)(\.))',1,1,1,'i') > 0 THEN
  l_result := 'FAIL';
END IF;

RETURN l_result;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END check_item_syntax;


--------------------------------------------------------------------------------
-- FUNCTION: C H E C K _ D Y N _ S Q L
--------------------------------------------------------------------------------
-- Checks for user of Dynamic SQL Syntax
--------------------------------------------------------------------------------
FUNCTION check_dyn_sql
  (
  p_source                   IN CLOB
  )
RETURN VARCHAR2
IS
  l_result                   VARCHAR2(10) := 'PASS';
  l_source                   CLOB := UPPER(p_source);
BEGIN

-- Check for DBMS_SQL
IF REGEXP_INSTR(LOWER(l_source), 'dbms_sql',1,1,1,'i') > 0 THEN
  l_result := 'FAIL';
END IF;

RETURN l_result;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END check_dyn_sql;


--------------------------------------------------------------------------------
-- FUNCTION: C H E C K _ E X E _ I M M
--------------------------------------------------------------------------------
-- Checks for user of EXECUTE IMMEDIATE Syntax
--------------------------------------------------------------------------------
FUNCTION check_exe_imm
  (
  p_source                   IN CLOB
  )
RETURN VARCHAR2
IS
  l_result                   VARCHAR2(10) := 'PASS';
  l_source                   CLOB := UPPER(p_source);
BEGIN

-- Check for EXECUTE IMMEDIATE
IF REGEXP_INSTR(UPPER(l_source), 'EXECUTE+[ ]+IMMEDIATE') > 0 THEN
  l_result := 'FAIL';
END IF;

RETURN l_result;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END check_exe_imm;


--------------------------------------------------------------------------------
-- FUNCTION: C H E C K _ U N E S C A P E D _ H T P
--------------------------------------------------------------------------------
-- Checks for user of htp.p or htp.prn Syntax
--------------------------------------------------------------------------------
FUNCTION check_unescaped_htp
  (
  p_source                   IN CLOB
  )
RETURN VARCHAR2
IS
  l_result                   VARCHAR2(10) := 'PASS';
  l_source                   CLOB := UPPER(p_source);
BEGIN

-- Loop through all potentially dangerous HTP calls
FOR x IN (SELECT * FROM sv_sec_htp_procs WHERE active_flag = 'Y')
LOOP
  IF REGEXP_INSTR(UPPER(l_source), x.htp_proc) > 0 THEN
    l_result := 'FAIL';
  END IF;
END LOOP;

RETURN l_result;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END check_unescaped_htp;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_rules;