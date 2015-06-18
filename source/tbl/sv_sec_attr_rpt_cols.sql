PROMPT == SV_SEC_ATTR_RPT_COLS

CREATE TABLE sv_sec_attr_rpt_cols
 (
 attr_rpt_col_id             NUMBER         NOT NULL,
 attr_rpt_inter_id           NUMBER         NOT NULL,
 column_name                 VARCHAR2(255)  NOT NULL,
 label                       VARCHAR2(255)  NOT NULL,
 seq                         NUMBER         NOT NULL,
 format_mask                 VARCHAR2(255),
 width                       NUMBER,
 alignment                   VARCHAR2(100),
 CONSTRAINT sv_sec_rpt_defns_pk PRIMARY KEY (attr_rpt_col_id)
 )
/

CREATE SEQUENCE sv_sec_attr_rpt_cols_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_attr_rpt_cols
BEFORE INSERT ON sv_sec_attr_rpt_cols
FOR EACH ROW
BEGIN
  SELECT sv_sec_attr_rpt_cols_seq.NEXTVAL INTO :NEW.attr_rpt_col_id FROM dual;
END;
/

ALTER TABLE sv_sec_attr_rpt_cols
  ADD CONSTRAINT sv_sec_attr_rpt_cols_fk
  FOREIGN KEY (attr_rpt_inter_id) REFERENCES sv_sec_attr_rpt_inter (attr_rpt_inter_id)
  ON DELETE CASCADE
/
