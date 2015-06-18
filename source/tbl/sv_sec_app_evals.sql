PROMPT == SV_SEC_APP_EVALS

CREATE TABLE sv_sec_app_evals
 (
 app_eval_id                 NUMBER         NOT NULL,
 attribute_set_id            NUMBER         NOT NULL,
 application_id              NUMBER         NOT NULL,
 app_user                    VARCHAR2(4000) NOT NULL,
 evaluated_ws                NUMBER         NOT NULL,
 eval_date                   DATE           NOT NULL,
 scheduled_eval              VARCHAR2(1)    NOT NULL,
 approved_score              NUMBER         NOT NULL,
 pending_score               NUMBER         NOT NULL,
 raw_score                   NUMBER         NOT NULL,
 CONSTRAINT sv_sec_app_evals_pk PRIMARY KEY (app_eval_id)
 )
/

CREATE SEQUENCE sv_sec_app_eval_seq START WITH 1
/

CREATE INDEX sv_sec_app_evals_as_i ON sv_sec_app_evals
  (
    attribute_set_id
  )
/

CREATE INDEX sv_sec_app_evals_app_i ON sv_sec_app_evals
  (
    application_id
  )
/
