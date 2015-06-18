create or replace PACKAGE sv_sec_error
AS

PROCEDURE raise_unanticipated
  (
  p_error_code               IN NUMBER   DEFAULT -20000,
  p_error_msg                IN VARCHAR2 DEFAULT NULL,
  p_log_apex_items           IN BOOLEAN  DEFAULT FALSE
  );
  
END sv_sec_error;
/ 