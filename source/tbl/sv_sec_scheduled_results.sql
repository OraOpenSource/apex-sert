CREATE TABLE sv_sec_scheduled_results
 (
   "FILE_ID"   NUMBER NOT NULL ENABLE,
   app_eval_id NUMBER NOT NULL,
   workspace_id NUMBER NOT NULL,
   application_id NUMBER NOT NULL,
   attribute_set_id NUMBER NOT NULL,
   "FILE_NAME" VARCHAR2(255 BYTE),
   "MIME_TYPE" VARCHAR2(255 BYTE),
   "FILE_CONTENTS" BLOB,
   created_on DATE,
   created_BY VARCHAR2(255),
   CONSTRAINT sv_sec_scheduled_results_pk PRIMARY KEY ("FILE_ID") ENABLE
 )
/
 
CREATE SEQUENCE sv_sec_scheduled_results_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_scheduled_results 
  BEFORE INSERT ON sv_sec_scheduled_results
  FOR EACH row 
BEGIN 
IF :NEW.FILE_ID IS NULL THEN :new.file_id := sv_sec_scheduled_results_seq.nextval;
END IF;
IF :NEW.created_on IS NULL THEN
  :NEW.created_on := SYSDATE;
END IF;
IF :NEW.created_by IS NULL THEN
  :NEW.created_BY := v('APP_USER');
END IF;
END;
/

ALTER TABLE sv_sec_scheduled_results 
  ADD CONSTRAINT sv_sec_scheduled_results_fk
  FOREIGN KEY (app_eval_id) REFERENCES sv_sec_app_evals (app_eval_id)
  ON DELETE CASCADE
/