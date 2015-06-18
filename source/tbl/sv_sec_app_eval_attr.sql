PROMPT == SV_SEC_APP_EVAL_ATTR

CREATE TABLE sv_sec_app_eval_attr
 (
 app_eval_id                 NUMBER         NOT NULL,
 attribute_id                NUMBER         NOT NULL,
 approved_score              NUMBER         NOT NULL,
 pending_score               NUMBER         NOT NULL,
 raw_score                   NUMBER         NOT NULL,
 possible_score              NUMBER         NOT NULL
 )
/

ALTER TABLE sv_sec_app_eval_attr
  ADD CONSTRAINT sv_sec_app_eval_attr_fk
  FOREIGN KEY (app_eval_id) REFERENCES sv_sec_app_evals (app_eval_id)
  ON DELETE CASCADE
/

CREATE INDEX sv_sec_app_eval_attr_i ON sv_sec_app_eval_attr
  (
    attribute_id
  )
/
