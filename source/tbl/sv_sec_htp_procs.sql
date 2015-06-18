PROMPT == SV_SEC_HTP_PROCS

CREATE TABLE sv_sec_htp_procs
 (
 htp_proc_id               NUMBER,
 htp_proc                  VARCHAR2(255)  NOT NULL,
 active_flag               VARCHAR2(1)    NOT NULL,
 CONSTRAINT sv_sec_htp_procs_pk PRIMARY KEY (htp_proc_id)
 )
/

CREATE SEQUENCE sv_sec_htp_proc_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_htp_procs
BEFORE INSERT ON sv_sec_htp_procs
FOR EACH ROW
BEGIN
IF :NEW.htp_proc_id IS NULL THEN
  SELECT sv_sec_htp_proc_seq.NEXTVAL INTO :NEW.htp_proc_id FROM dual;
END IF;
:NEW.active_flag := 'Y';
END;
/




