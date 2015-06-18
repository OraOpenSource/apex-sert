PROMPT == SV_SEC_EXCEPTIONS

CREATE TABLE sv_sec_exceptions
 (
 exception_id                NUMBER         NOT NULL,
 attribute_set_id            NUMBER         NOT NULL,
 application_id              NUMBER         NOT NULL,
 attribute_id                NUMBER         NOT NULL,
 page_id                     NUMBER,
 component_id                VARCHAR2(1000),
 column_id                   NUMBER,
 justification               VARCHAR2(4000),
 rejected_justification      VARCHAR2(4000),
 rejection                   VARCHAR2(4000),
 approved_flag               VARCHAR2(1)    NOT NULL,
 prev_approved_flag          VARCHAR2(1),
 created_by                  VARCHAR2(255)  NOT NULL,
 created_on                  DATE           NOT NULL,
 created_ws                  NUMBER         NOT NULL,
 approved_by                 VARCHAR2(255),
 approved_on                 DATE,
 approved_ws                 NUMBER,
 rejected_by                 VARCHAR2(255),
 rejected_on                 DATE,
 rejected_ws                 NUMBER,
 val                         CLOB,
 checksum                    RAW(16),
 CONSTRAINT sv_sec_exceptions_pk PRIMARY KEY (exception_id)
 )
/

CREATE SEQUENCE sv_sec_exceptions_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_exceptions
BEFORE INSERT ON sv_sec_exceptions
FOR EACH ROW
BEGIN
IF :NEW.exception_id IS NULL THEN
  SELECT sv_sec_exceptions_seq.NEXTVAL INTO :NEW.exception_id FROM dual;
END IF;
IF :NEW.approved_flag IS NULL THEN
  :NEW.approved_flag := 'P';
END IF;
IF :NEW.created_by IS NULL THEN
  :NEW.created_by := v('APP_USER');
END IF;
IF :NEW.created_on IS NULL THEN
  :NEW.created_on := SYSDATE;
END IF;
IF :NEW.created_ws IS NULL THEN
    :NEW.created_ws := v('G_WORKSPACE_ID');
END IF;
END;
/

CREATE INDEX E_APPLICATION_ID_I ON sv_sec_exceptions
  (
    APPLICATION_ID
  )
/

CREATE INDEX E_ATTRIBUTE_ID_I ON sv_sec_exceptions
  (
    ATTRIBUTE_ID
  )
/

CREATE INDEX E_CHECKSUM_I ON sv_sec_exceptions
  (
    CHECKSUM
  )
/

CREATE INDEX E_COMPONENT_ID_I ON sv_sec_exceptions
  (
    COMPONENT_ID
  )
/
CREATE INDEX E_COLUMN_ID_I ON sv_sec_exceptions
  (
    COLUMN_ID
  )
/
CREATE INDEX E_PAGE_ID_I ON sv_sec_exceptions
  (
    PAGE_ID
  )
/

CREATE INDEX e_created_by_i ON sv_sec_exceptions
  (
    created_by
  )
/