PROMPT == SV_SEC_APP_EVAL_CLS

CREATE TABLE sv_sec_app_eval_cls
 (
 app_eval_id                 NUMBER         NOT NULL,
 classification_id           NUMBER         NOT NULL,
 approved_score              NUMBER         NOT NULL,
 pending_score               NUMBER         NOT NULL,
 raw_score                   NUMBER         NOT NULL,
 possible_score              NUMBER         NOT NULL
 )
/

ALTER TABLE sv_sec_app_eval_cls 
  ADD CONSTRAINT sv_sec_app_eval_cls_fk
  FOREIGN KEY (app_eval_id) REFERENCES sv_sec_app_evals (app_eval_id)
  ON DELETE CASCADE
/

CREATE INDEX sv_sec_app_eval_cls_i ON sv_sec_app_eval_cls
  (
    classification_id
  )
/
