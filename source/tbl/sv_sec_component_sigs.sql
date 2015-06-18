PROMPT == SV_SEC_COMPONENT_SIGS

CREATE TABLE sv_sec_component_sigs
 (
 component_sig_id            NUMBER NOT NULL,
 component_sig_key           VARCHAR2(255)  NOT NULL,
 component_sig               VARCHAR2(4000) NOT NULL,
 CONSTRAINT sv_sec_component_sig_pk PRIMARY KEY (component_sig_id),
 CONSTRAINT sv_sec_component_sig_key UNIQUE (component_sig_key)
 )
/

CREATE SEQUENCE sv_sec_component_sigs_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_component_sigs
BEFORE INSERT ON sv_sec_component_sigs
FOR EACH ROW
BEGIN
IF :NEW.component_sig_id IS NULL THEN
  SELECT sv_sec_component_sigs_seq.NEXTVAL INTO :NEW.component_sig_id FROM dual;
END IF;
END;
/