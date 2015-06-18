PROMPT == SV_SEC_SCHED_LISTS

CREATE TABLE sv_sec_sched_lists
 (
 sched_list_id               NUMBER        NOT NULL,
 sched_list_name             VARCHAR2(255) NOT NULL,
 created_on                  DATE          NOT NULL,
 created_by                  VARCHAR2(255) NOT NULL,
 created_ws                  NUMBER        NOT NULL,
 CONSTRAINT sched_lists_pk PRIMARY KEY (sched_list_id)
 )
/

CREATE SEQUENCE sched_lists_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_sched_lists
BEFORE INSERT ON sv_sec_sched_lists
FOR EACH ROW
BEGIN
  SELECT sched_lists_seq.NEXTVAL INTO :NEW.sched_list_id FROM dual;
  :NEW.created_on := SYSDATE;
  :NEW.created_by := v('APP_USER');
  :NEW.created_ws := v('G_WORKSPACE_ID');
END;
/
