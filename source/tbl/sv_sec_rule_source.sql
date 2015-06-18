PROMPT == SV_SEC_RULE_SOURCE

CREATE TABLE sv_sec_rule_source
 (
 rule_source_id              NUMBER NOT NULL,
 rule_source_key             VARCHAR2(255) NOT NULL,
 rule_source_name            VARCHAR2(255) NOT NULL,
 seq                       NUMBER,
 CONSTRAINT sv_sec_rule_source_pk PRIMARY KEY (rule_source_id)
 )
/

CREATE SEQUENCE sv_sec_rule_source_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_rule_source
BEFORE INSERT ON sv_sec_rule_source
FOR EACH ROW
BEGIN
IF :NEW.rule_source_id IS NULL THEN
  SELECT sv_sec_rule_source_seq.NEXTVAL INTO :NEW.rule_source_id FROM dual;
END IF;
END;
/
