PROMPT == SV_SEC_NOTATIONS

CREATE TABLE sv_sec_notations
 (
 notation_id                 NUMBER NOT NULL,
 attribute_set_id            NUMBER NOT NULL,
 application_id              NUMBER NOT NULL,
 attribute_id                NUMBER NOT NULL,
 page_id                     NUMBER,
 component_id                NUMBER,
 column_id                   NUMBER,
 notation                    VARCHAR2(4000) NOT NULL,
 created_by                  VARCHAR2(255)  NOT NULL,
 created_on                  DATE           NOT NULL,
 created_ws                  NUMBER         NOT NULL,
 CONSTRAINT sv_sec_notations_pk PRIMARY KEY (notation_id)
 )
/

CREATE SEQUENCE sv_sec_notations_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_notations
BEFORE INSERT ON sv_sec_notations
FOR EACH ROW
BEGIN
IF :NEW.notation_id IS NULL THEN
  SELECT sv_sec_notations_seq.NEXTVAL INTO :NEW.notation_id FROM dual;
END IF;
IF :NEW.created_by IS NULL THEN
  :NEW.created_by := v('APP_USER');
END IF;
IF :NEW.created_on IS NULL THEN
  :NEW.created_on := SYSDATE;
END IF;
END;
/

