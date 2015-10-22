PROMPT == SV_SEC_SCHED_GRP_APPS

CREATE TABLE sv_sec_sched_grp_apps
 (
 sched_grp_app_id            NUMBER        NOT NULL,
 sched_grp_id                NUMBER        NOT NULL,
 workspace_id                NUMBER        NOT NULL,
 application_id              NUMBER        NOT NULL,
 scoring_method              VARCHAR2(10),
 attribute_set_id            NUMBER        NOT NULL,
 save_pdf                    VARCHAR2(10),
 created_on                  DATE          NOT NULL,
 created_by                  VARCHAR2(255) NOT NULL,
 created_ws                  NUMBER        NOT NULL,
 CONSTRAINT sv_sec_sched_grp_apps_pk PRIMARY KEY (sched_grp_app_id)
 )
/

CREATE SEQUENCE sv_sec_sched_grp_apps_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_sched_grp_apps
BEFORE INSERT ON sv_sec_sched_grp_apps
FOR EACH ROW
BEGIN
  SELECT sv_sec_sched_grp_apps_seq.NEXTVAL INTO :NEW.sched_grp_app_id FROM dual;
  :NEW.created_on := SYSDATE;
  :NEW.created_by := v('APP_USER');
  :NEW.created_ws := v('G_WORKSPACE_ID');
END;
/

ALTER TABLE sv_sec_sched_grp_apps 
  ADD CONSTRAINT sv_sec_sched_grp_apps_fk
  FOREIGN KEY (sched_grp_id) REFERENCES sv_sec_sched_grp (sched_grp_id)
  ON DELETE CASCADE
/