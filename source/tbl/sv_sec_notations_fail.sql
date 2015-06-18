PROMPT == SV_SEC_NOTATIONS_FAIL

CREATE TABLE sv_sec_notations_fail
 (
 notation_fail_id            NUMBER NOT NULL,
 notation_created_on         DATE,
 notation_created_by         VARCHAR2(255), 
 attribute_set_id            NUMBER NOT NULL,
 application_id              NUMBER NOT NULL,
 attribute_id                NUMBER NOT NULL,
 page_id                     NUMBER,
 component_id                NUMBER,
 column_id                   NUMBER,
 notation                    VARCHAR2(4000) NOT NULL,
 created_by                  VARCHAR2(255)  NOT NULL,
 created_on                  DATE           NOT NULL,
 component_signature         VARCHAR2(4000),
 sql                         VARCHAR2(4000), 
 CONSTRAINT sv_sec_notations_fail_pk PRIMARY KEY (notation_fail_id)
 )
/

CREATE SEQUENCE sv_sec_notations_fail_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_notations_fail
BEFORE INSERT ON sv_sec_notations_fail
FOR EACH ROW
BEGIN
IF :NEW.notation_fail_id IS NULL THEN
  SELECT sv_sec_notations_fail_seq.NEXTVAL INTO :NEW.notation_fail_id FROM dual;
END IF;
:NEW.notation_created_by := v('APP_USER');
:NEW.notation_created_on := SYSDATE;
END;
/
