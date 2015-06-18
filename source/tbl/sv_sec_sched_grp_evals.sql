PROMPT == SV_SEC_SCHED_GRP_EVALS

CREATE TABLE sv_sec_sched_grp_evals
 (
 sched_grp_eval_id           NUMBER        NOT NULL,
 sched_grp_id                NUMBER        NOT NULL,
 eval_interval               VARCHAR2(255) NOT NULL,
 time_of_day                 VARCHAR2(100) NOT NULL,
 day_of_week                 VARCHAR2(100),
 scheduled_on                DATE          NOT NULL,
 scheduled_by                VARCHAR2(255) NOT NULL,   
 scheduled_ws                NUMBER        NOT NULL,
 CONSTRAINT sv_sec_sched_grp_evals_pk PRIMARY KEY (sched_grp_eval_id)
 )
/

CREATE SEQUENCE sv_sec_sched_grp_evals_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_sched_grp_evals
BEFORE INSERT ON sv_sec_sched_grp_evals
FOR EACH ROW
BEGIN
  SELECT sv_sec_sched_grp_evals_seq.NEXTVAL INTO :NEW.sched_grp_eval_id FROM dual;
  :NEW.scheduled_on := SYSDATE;
  :NEW.scheduled_by := v('APP_USER');
  :NEW.scheduled_ws := v('G_WORKSPACE_ID');
END;
/

CREATE OR REPLACE TRIGGER ad_sv_sec_sched_grp
AFTER DELETE ON sv_sec_sched_grp
FOR EACH ROW
BEGIN
  DELETE FROM sv_sec_sched_grp_evals WHERE sched_grp_id = :OLD.sched_grp_id;
END;
/
