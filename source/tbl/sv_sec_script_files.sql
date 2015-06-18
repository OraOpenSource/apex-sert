CREATE TABLE sv_sec_script_files
 (
   "FILE_ID"   NUMBER NOT NULL ENABLE,
   "FILE_NAME" VARCHAR2(255 BYTE),
   "MIME_TYPE" VARCHAR2(255 BYTE),
   "FILE_CONTENTS" BLOB,
   script_type VARCHAR2(255),
   UPLOADED_ON DATE,
   UPLOADED_BY VARCHAR2(255),
   CONSTRAINT "SV_SCRIPT_FILES_PK" PRIMARY KEY ("FILE_ID") ENABLE
 )
/
 
CREATE SEQUENCE sv_script_files_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_script_files 
  BEFORE INSERT ON sv_sec_script_files 
  FOR EACH row 
BEGIN 

IF :NEW.FILE_ID IS NULL THEN :new.file_id := sv_script_files_seq.nextval;
END IF;
:NEW.uploaded_on := SYSDATE;
:NEW.uploaded_by := v('APP_USER');

END;
/
