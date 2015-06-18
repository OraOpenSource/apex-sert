PROMPT == SV_SEC_PREF_DEFAULTS

CREATE TABLE sv_sec_pref_defaults
 (
 pref_default_id             NUMBER         NOT NULL,
 pref_key                    VARCHAR2(255)  NOT NULL,
 pref_default                VARCHAR2(4000) NOT NULL,
 data_type                   VARCHAR2(100)  NOT NULL,
 CONSTRAINT sv_sec_pref_defaults_pk PRIMARY KEY (pref_default_id)
 )
/

CREATE SEQUENCE sv_sec_pref_default_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_pref_defaults
BEFORE INSERT ON sv_sec_pref_defaults
FOR EACH ROW
BEGIN
IF :NEW.pref_default_id IS NULL THEN
  SELECT sv_sec_pref_default_seq.NEXTVAL INTO :NEW.pref_default_id FROM dual;
END IF;
END;
/
