PROMPT == SV_SEC_RESULT_TEMP

CREATE TABLE sv_sec_result_temp
  (
  app_session                VARCHAR2(255),
  app_user                   VARCHAR2(255),
  result                     VARCHAR2(255),
  created_on                 DATE
  )
/

CREATE TRIGGER bi_sv_sec_result_temp
BEFORE INSERT ON sv_sec_result_temp
FOR EACH ROW
BEGIN
:NEW.created_on := SYSDATE;
END;
/