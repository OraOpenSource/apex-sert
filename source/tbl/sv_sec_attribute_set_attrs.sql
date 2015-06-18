PROMPT == SV_SEC_ATTRIBUTE_SET_ATTRS

CREATE TABLE sv_sec_attribute_set_attrs
 (
 attribute_set_attrs_id      NUMBER        NOT NULL,
 attribute_set_id            NUMBER        NOT NULL,
 attribute_id                NUMBER        NOT NULL,
 active_flag                 VARCHAR2(10)  NOT NULL,
 time_to_fix                 NUMBER,
 severity_level              NUMBER,
 CONSTRAINT sv_sec_attribute_sets_attrs_pk PRIMARY KEY (attribute_set_attrs_id)
 )
/

CREATE SEQUENCE sv_sec_attr_set_attrs_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_attribute_set_attrs
BEFORE INSERT ON sv_sec_attribute_set_attrs
FOR EACH ROW
BEGIN
IF :NEW.attribute_set_attrs_id IS NULL THEN
  SELECT sv_sec_attr_set_attrs_seq.NEXTVAL INTO :NEW.attribute_set_attrs_id FROM dual;
END IF;
END;
/

ALTER TABLE sv_sec_attribute_set_attrs 
  ADD CONSTRAINT sv_sec_asa_attr_fk
  FOREIGN KEY (attribute_id) REFERENCES sv_sec_attributes (attribute_id)
  ON DELETE CASCADE
/

ALTER TABLE sv_sec_attribute_set_attrs 
  ADD CONSTRAINT sv_sec_asa_attr_set_fk
  FOREIGN KEY (attribute_set_id) REFERENCES sv_sec_attribute_sets (attribute_set_id)
  ON DELETE CASCADE
/
