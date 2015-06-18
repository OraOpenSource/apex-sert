PROMPT == SV_SEC_USER_WORKSPACES

CREATE TABLE sv_sec_user_workspaces
  (
  user_workspace_id          NUMBER        NOT NULL,
  workspace_id               NUMBER        NOT NULL,
  user_name                  VARCHAR2(255) NOT NULL,
  role_name                  VARCHAR2(255) NOT NULL,
  session_id                 NUMBER        NOT NULL,
  CONSTRAINT sv_sec_user_workspaces_pk PRIMARY KEY (user_workspace_id) ENABLE
  )	
/

CREATE SEQUENCE sv_sec_user_workspaces_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_user_workspaces
  BEFORE INSERT ON sv_sec_user_workspaces
  FOR EACH ROW
BEGIN
  IF :NEW.user_role_id IS NULL THEN
    SELECT sv_sec_user_workspaces_seq.NEXTVAL INTO :NEW.user_workspace_id FROM dual;
  END IF;
END;
/