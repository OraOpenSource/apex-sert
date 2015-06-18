PROMPT == SV_SEC_PAGE_HELP

CREATE TABLE sv_sec_page_help
 (page_help_id               NUMBER,
  application_id             NUMBER,
  application_key            VARCHAR2(255),
  page_id                    NUMBER                NOT NULL,
  about_page                 VARCHAR2(4000),
  help_text                  CLOB,
  custom_help_text           CLOB,
  CONSTRAINT sv_sec_page_help_pk PRIMARY KEY (page_help_id)
 )
/

CREATE SEQUENCE sv_sec_page_help_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_page_help
BEFORE INSERT ON sv_sec_page_help
FOR EACH ROW
BEGIN
  SELECT sv_sec_page_help_seq.NEXTVAL INTO :NEW.page_help_id FROM dual;
END;
/

ALTER TABLE sv_sec_page_help
  ADD CONSTRAINT sv_sec_page_help_u UNIQUE(application_id, page_id)
/
