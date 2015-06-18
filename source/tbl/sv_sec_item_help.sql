PROMPT == SV_SEC_ITEM_HELP

CREATE TABLE sv_sec_item_help
 (item_help_id               NUMBER,
  application_id             NUMBER,
  application_key            VARCHAR2(255),
  page_id                    NUMBER                NOT NULL,
  item_name                  VARCHAR2(255)         NOT NULL,
  help_text                  CLOB,
  custom_help_text           CLOB,
  CONSTRAINT sv_sec_item_help_pk PRIMARY KEY (item_help_id)
 )
/

CREATE SEQUENCE sv_sec_item_help_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_item_help
BEFORE INSERT ON sv_sec_item_help
FOR EACH ROW
BEGIN
  SELECT sv_sec_item_help_seq.NEXTVAL INTO :NEW.item_help_id FROM dual;
END;
/