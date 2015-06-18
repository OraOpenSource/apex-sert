PROMPT == SV_SEC_IMPACT

CREATE TABLE sv_sec_impact
 (
 impact_id                   NUMBER NOT NULL,
 impact                      VARCHAR2(255) NOT NULL,
 seq                       NUMBER,
 CONSTRAINT sv_sec_impact_pk PRIMARY KEY (impact_id)
 )
/

CREATE SEQUENCE sv_sec_impact_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_impact
BEFORE INSERT ON sv_sec_impact
FOR EACH ROW
BEGIN
IF :NEW.impact_id IS NULL THEN
  SELECT sv_sec_impact_seq.NEXTVAL INTO :NEW.impact_id FROM dual;
END IF;
END;
/
