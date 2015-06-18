PROMPT == SV_SEC_ATTR_RPT_INTER

CREATE TABLE sv_sec_attr_rpt_inter
 (
 attr_rpt_inter_id           NUMBER         NOT NULL,
 attribute_id                NUMBER         NOT NULL,
 report_key                  VARCHAR2(255)  NOT NULL,
 CONSTRAINT sv_sec_attr_rpt_inter_pk PRIMARY KEY (attr_rpt_inter_id)
 )
/

CREATE SEQUENCE sv_sec_attr_rpt_inter_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_attr_rpt_inter
BEFORE INSERT ON sv_sec_attr_rpt_inter
FOR EACH ROW
BEGIN
  SELECT sv_sec_attr_rpt_inter_seq.NEXTVAL INTO :NEW.attr_rpt_inter_id FROM dual;
END;
/

ALTER TABLE sv_sec_attr_rpt_inter
  ADD CONSTRAINT sv_sec_attr_rpt_inter_fk
  FOREIGN KEY (attribute_id) REFERENCES sv_sec_attributes (attribute_id)
  ON DELETE CASCADE
/
