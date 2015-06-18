PROMPT == SV_SEC_EXCEPTIONS_FAIL

CREATE TABLE sv_sec_exceptions_fail
 (
 exception_fail_id           NUMBER         NOT NULL,
 exception_created_on        DATE,
 exception_created_by        VARCHAR2(255), 
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
 created_by                  VARCHAR2(255)  NOT NULL,
 created_on                  DATE           NOT NULL,
 approved_by                 VARCHAR2(255),
 approved_on                 DATE,
 rejected_by                 VARCHAR2(255),
 rejected_on                 DATE,
 val                         CLOB,
 checksum                    RAW(16),
 component_signature         VARCHAR2(4000),
 sql                         VARCHAR2(4000),
 CONSTRAINT sv_sec_exceptions_fail_pk PRIMARY KEY (exception_fail_id)
 )
/

CREATE SEQUENCE sv_sec_exceptions_fail_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_exceptions_fail
BEFORE INSERT ON sv_sec_exceptions_fail
FOR EACH ROW
BEGIN
IF :NEW.exception_fail_id IS NULL THEN
  SELECT sv_sec_exceptions_fail_seq.NEXTVAL INTO :NEW.exception_fail_id FROM dual;
END IF;
:NEW.exception_created_on := SYSDATE;
:NEW.exception_created_by := v('APP_USER');
END;
/

CREATE INDEX EF_APPLICATION_ID_I ON sv_sec_exceptions_fail
  (
    APPLICATION_ID
  )
/

CREATE INDEX EF_ATTRIBUTE_ID_I ON sv_sec_exceptions_fail
  (
    ATTRIBUTE_ID
  )
/

CREATE INDEX EF_CHECKSUM_I ON sv_sec_exceptions_fail
  (
    CHECKSUM
  )
/
