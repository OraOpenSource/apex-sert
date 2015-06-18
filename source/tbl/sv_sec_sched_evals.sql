PROMPT == SV_SEC_SCHED_EVALS

CREATE TABLE sv_sec_sched_evals
 (
 sched_eval_id               NUMBER        NOT NULL,
 application_id              NUMBER        NOT NULL,
 scheduled_on                DATE          NOT NULL,
 scheduled_by                VARCHAR2(255) NOT NULL,   
 scheduled_ws                NUMBER        NOT NULL,
 save_pdf                    VARCHAR2(10)  NOT NULL,
 scoring_method              VARCHAR2(255) NOT NULL,
 attribute_set_id            NUMBER        NOT NULL,
 eval_interval               VARCHAR2(255) NOT NULL,
 time_of_day                 VARCHAR2(100) NOT NULL,
 day_of_week                 VARCHAR2(100),
 CONSTRAINT sv_sec_sched_evals_pk PRIMARY KEY (sched_eval_id)
 )
/

CREATE SEQUENCE sv_sec_sched_evals_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_sched_evals
BEFORE INSERT ON sv_sec_sched_evals
FOR EACH ROW
BEGIN
  SELECT sv_sec_sched_evals_seq.NEXTVAL INTO :NEW.sched_eval_id FROM dual;
  :NEW.scheduled_on := SYSDATE;
  :NEW.scheduled_by := v('APP_USER');
  :NEW.scheduled_ws := v('G_WORKSPACE_ID');
END;
/
