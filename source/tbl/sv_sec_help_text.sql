PROMPT == SV_SEC_HELP_TEXT

CREATE TABLE sv_sec_help_text
 (
 help_text_id                NUMBER,
 help_text_key               VARCHAR2(255),
 display_title               VARCHAR2(255),
 help_summary                VARCHAR2(4000),
 help_text                   CLOB,
 custom_help_text            CLOB,
 CONSTRAINT sv_sec_help_pk   PRIMARY KEY (help_text_id)
 )
/

CREATE SEQUENCE sv_sec_help_text_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_help_text
BEFORE INSERT ON sv_sec_help_text
FOR EACH ROW
BEGIN
  SELECT sv_sec_help_text_seq.NEXTVAL INTO :NEW.help_text_id FROM dual;
  IF :NEW.help_text = '<br />' THEN
    :NEW.help_text := NULL;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER bu_sv_sec_help_text
BEFORE UPDATE ON sv_sec_help_text
FOR EACH ROW
BEGIN
  IF :NEW.help_text = '<br />' THEN
    :NEW.help_text := NULL;
  END IF;
END;
/
