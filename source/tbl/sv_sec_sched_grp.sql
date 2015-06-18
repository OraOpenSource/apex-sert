PROMPT == SV_SEC_SCHED_GRP

CREATE TABLE sv_sec_sched_grp
 (
 sched_grp_id                NUMBER        NOT NULL,
 sched_grp_name              VARCHAR2(255) NOT NULL,
 sched_list_id               NUMBER        NOT NULL,
 created_on                  DATE          NOT NULL,
 created_by                  VARCHAR2(255) NOT NULL,
 created_ws                  NUMBER        NOT NULL,
 CONSTRAINT sv_sec_sched_grp_pk PRIMARY KEY (sched_grp_id)
 )
/

CREATE SEQUENCE sv_sec_sched_grp_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_sched_grp
BEFORE INSERT ON sv_sec_sched_grp
FOR EACH ROW
BEGIN
  SELECT sv_sec_sched_grp_seq.NEXTVAL INTO :NEW.sched_grp_id FROM dual;
  :NEW.created_on := SYSDATE;
  :NEW.created_by := v('APP_USER');
  :NEW.created_ws := v('G_WORKSPACE_ID');
END;
/

