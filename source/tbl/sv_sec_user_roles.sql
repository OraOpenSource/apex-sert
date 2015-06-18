PROMPT == SV_SEC_USER_ROLES

CREATE TABLE sv_sec_user_roles
  (
  user_role_id               NUMBER        NOT NULL,
  workspace_id               NUMBER        NOT NULL,
  user_name                  VARCHAR2(255) NOT NULL,
  user_workspace_id          NUMBER        NOT NULL,
  role_name                  VARCHAR2(255) NOT NULL,
  created_by                 VARCHAR2(255),
  created_on                 DATE,
  CONSTRAINT sv_sec_user_roles_pk PRIMARY KEY (user_role_id) ENABLE
  )	
/

CREATE SEQUENCE sv_sec_user_roles_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_user_roles
  BEFORE INSERT ON sv_sec_user_roles
  FOR EACH ROW
BEGIN
  IF :NEW.user_role_id IS NULL THEN
    SELECT sv_sec_user_roles_seq.NEXTVAL INTO :NEW.user_role_id FROM dual;
  END IF;
  :NEW.created_on := SYSDATE;
  :NEW.created_by := v('APP_USER');
END;
/
