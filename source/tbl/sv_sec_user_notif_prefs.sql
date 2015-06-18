PROMPT == SV_SEC_USER_NOTIF_PREFS

CREATE TABLE sv_sec_user_notif_prefs
  (
  user_notif_pref_id         NUMBER        NOT NULL,
  workspace_id               NUMBER        NOT NULL,
  role_name                  VARCHAR2(100) NOT NULL,
  user_name                  VARCHAR2(255) NOT NULL,
  user_workspace_id          NUMBER        NOT NULL, 
  new_exception_notify       VARCHAR2(100),
  time_of_day                VARCHAR2(10),
  CONSTRAINT sv_sec_user_notif_prefs_pk PRIMARY KEY (user_notif_pref_id) ENABLE
  )	
/

CREATE SEQUENCE sv_sec_user_notif_prefs_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_user_notif_prefs
  BEFORE INSERT ON sv_sec_user_notif_prefs
  FOR EACH ROW
BEGIN
  IF :NEW.user_notif_pref_id IS NULL THEN
    SELECT sv_sec_user_notif_prefs_seq.NEXTVAL INTO :NEW.user_notif_pref_id FROM dual;
  END IF;
  IF :NEW.new_exception_notify IS NULL THEN
    :NEW.new_exception_notify := 'NEVER';
  END IF;
  IF :NEW.new_exception_notify != 'DAILY' THEN
    :NEW.time_of_day := NULL;
  END IF;
  IF :NEW.user_name IS NULL THEN
    :NEW.user_name := v('APP_USER');
  END IF;
  IF :NEW.user_workspace_id IS NULL THEN
    :NEW.user_workspace_id := v('G_WORKSPACE_ID');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER bu_sv_sec_user_notif_prefs
  BEFORE UPDATE ON sv_sec_user_notif_prefs
  FOR EACH ROW
BEGIN
  IF :NEW.new_exception_notify != 'DAILY' THEN
    :NEW.time_of_day := NULL;
  END IF;
  :NEW.user_name := v('APP_USER');
  :NEW.user_workspace_id := v('G_WORKSPACE_ID');
END;
/
