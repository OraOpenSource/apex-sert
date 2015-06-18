PROMPT == SV_SEC_RULE_TYPE

CREATE TABLE sv_sec_rule_type
 (
 rule_type_id              NUMBER NOT NULL,
 rule_type_key             VARCHAR2(255) NOT NULL,
 rule_type_name            VARCHAR2(255) NOT NULL,
 seq                       NUMBER,
 CONSTRAINT sv_sec_rule_type_pk PRIMARY KEY (rule_type_id)
 )
/

CREATE SEQUENCE sv_sec_rule_type_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_rule_type
BEFORE INSERT ON sv_sec_rule_type
FOR EACH ROW
BEGIN
IF :NEW.rule_type_id IS NULL THEN
  SELECT sv_sec_rule_type_seq.NEXTVAL INTO :NEW.rule_type_id FROM dual;
END IF;
END;
/

