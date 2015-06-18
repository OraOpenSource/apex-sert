PROMPT == SV_SEC_ATTRIBUTE_VALUES

CREATE TABLE sv_sec_attribute_values
 (
 attribute_value_id          NUMBER NOT NULL,
 attribute_set_id            NUMBER NOT NULL,
 attribute_id                NUMBER NOT NULL,
 value                       VARCHAR2(4000),
 result                      VARCHAR2(100),
 active_flag                 VARCHAR2(1),
 CONSTRAINT sv_sec_attribute_values_pk PRIMARY KEY (attribute_value_id)
 )
/

CREATE SEQUENCE sv_sec_attribute_values_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_attribute_values
BEFORE INSERT ON sv_sec_attribute_values
FOR EACH ROW
BEGIN
IF :NEW.attribute_value_id IS NULL THEN
  SELECT sv_sec_attribute_values_seq.NEXTVAL INTO :NEW.attribute_value_id FROM dual;
END IF;
END;
/

ALTER TABLE sv_sec_attribute_values 
  ADD CONSTRAINT sv_sec_attr_val_fk
  FOREIGN KEY (attribute_id) REFERENCES sv_sec_attributes (attribute_id)
  ON DELETE CASCADE
/

ALTER TABLE sv_sec_attribute_values 
  ADD CONSTRAINT sv_sec_attr_set_val_fk
  FOREIGN KEY (attribute_set_id) REFERENCES sv_sec_attribute_sets (attribute_set_id)
  ON DELETE CASCADE
/

ALTER TABLE sv_sec_attribute_values
  ADD CONSTRAINT sv_sec_attr_val_u UNIQUE
  (attribute_set_id, attribute_id, value)
/

