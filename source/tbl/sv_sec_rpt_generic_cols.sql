CREATE TABLE sv_sec_rpt_generic_cols
  (
  rpt_generic_col_id         NUMBER NOT NULL,
  page_id                    NUMBER NOT NULL,
  static_id                  VARCHAR2(255) NOT NULL,
  column_alias               VARCHAR2(255) NOT NULL,
  heading_label              VARCHAR2(100),
  heading_alignment          VARCHAR2(1),
  column_alignment           VARCHAR2(1),
  column_width               NUMBER,
  display_order              NUMBER,
  active_flag                VARCHAR2(1),
  CONSTRAINT sv_sec_rpt_generic_cols_pk PRIMARY KEY (rpt_generic_col_id)
  )
/

CREATE SEQUENCE sv_sec_rpt_generic_cols_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_rpt_generic_cols
BEFORE INSERT ON sv_sec_rpt_generic_cols
FOR EACH ROW
BEGIN
  SELECT sv_sec_rpt_generic_cols_seq.NEXTVAL INTO :NEW.rpt_generic_col_id FROM dual;
END;
/
