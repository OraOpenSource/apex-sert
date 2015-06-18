PROMPT == SV_SEC_HELP_INTER

CREATE TABLE sv_sec_help_inter
 (
 help_inter_id               NUMBER,
 help_text_id                NUMBER,
 page_id                     NUMBER,
 component_id                VARCHAR2(255) NOT NULL,
 component_type              VARCHAR2(255) NOT NULL,
 CONSTRAINT sv_sec_help_inter_pk PRIMARY KEY (help_inter_id)
 )
/

CREATE SEQUENCE sv_sec_help_inter_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_help_inter
BEFORE INSERT ON sv_sec_help_inter
FOR EACH ROW
BEGIN
  SELECT sv_sec_help_inter_seq.NEXTVAL INTO :NEW.help_inter_id FROM dual;
END;
/

ALTER TABLE sv_sec_help_inter 
  ADD CONSTRAINT sv_sec_help_inter_fk
  FOREIGN KEY (help_text_id) REFERENCES sv_sec_help_text (help_text_id)
  ON DELETE CASCADE
/