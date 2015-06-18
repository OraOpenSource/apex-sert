CREATE OR REPLACE PACKAGE sv_sec_rules
AS 

FUNCTION check_xss
  (
  p_source                   IN CLOB
  )
  RETURN VARCHAR2;

FUNCTION check_item_syntax
  (
  p_source                   IN CLOB
  )
  RETURN VARCHAR2;

FUNCTION check_dyn_sql
  (
  p_source                   IN CLOB
  )
  RETURN VARCHAR2;
  
FUNCTION check_exe_imm
  (
  p_source                   IN CLOB
  )
  RETURN VARCHAR2;

FUNCTION check_unescaped_htp   
  (
  p_source                   IN CLOB
  )
  RETURN VARCHAR2;


END sv_sec_rules;
/