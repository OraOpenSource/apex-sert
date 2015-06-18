PROMPT == SV_SEC_COL_TEMPLATES

CREATE TABLE sv_sec_col_templates
 (
 col_template_id             NUMBER         NOT NULL,
 table_name                  VARCHAR2(255)  NOT NULL,
 col_template_name           VARCHAR2(255)  NOT NULL,
 col_template_key            VARCHAR2(255)  NOT NULL,
 col_template                VARCHAR2(4000) NOT NULL,
 internal_flag               VARCHAR2(1)    NOT NULL,
 apex_version                VARCHAR2(255)  NOT NULL,
 CONSTRAINT sv_sec_col_template_pk PRIMARY KEY (col_template_id)
 )
/

CREATE SEQUENCE sv_sec_col_templates_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_col_templates
BEFORE INSERT ON sv_sec_col_templates
FOR EACH ROW
BEGIN
IF :NEW.internal_flag IS NULL THEN
  :NEW.internal_flag := 'N';
END IF;
IF :NEW.col_template_id IS NULL THEN
  SELECT sv_sec_col_templates_seq.NEXTVAL INTO :NEW.col_template_id FROM dual;
END IF;
END;
/

