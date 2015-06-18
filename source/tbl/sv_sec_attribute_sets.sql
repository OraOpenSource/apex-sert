PROMPT == SV_SEC_ATTRIBUTE_SETS

CREATE TABLE sv_sec_attribute_sets
 (
 attribute_set_id            NUMBER         NOT NULL,
 attribute_set_name          VARCHAR2(255)  NOT NULL,
 attribute_set_key           VARCHAR2(255)  NOT NULL, 
 active_flag                 VARCHAR2(10)   NOT NULL,
 public_flag                 VARCHAR2(1)    NOT NULL,
 workspace_id                NUMBER         NOT NULL,
 description                 VARCHAR2(4000),
 CONSTRAINT sv_sec_attribute_set_pk PRIMARY KEY (attribute_set_id)
 )
/

ALTER TABLE SV_SEC_ATTRIBUTE_SETS ADD CONSTRAINT
  attribute_set_key_u unique(ATTRIBUTE_SET_KEY) 
/

CREATE SEQUENCE sv_sec_attribute_sets_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_attribute_sets
BEFORE INSERT ON sv_sec_attribute_sets
FOR EACH ROW
BEGIN
IF :NEW.attribute_set_id IS NULL THEN
  SELECT sv_sec_attribute_sets_seq.NEXTVAL INTO :NEW.attribute_set_id FROM dual;
END IF;
:NEW.workspace_id := APEX_CUSTOM_AUTH.GET_SECURITY_GROUP_ID;
:NEW.public_flag := 'Y';
END;
/

