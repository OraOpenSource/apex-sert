PROMPT == SV_SEC_ATTRIBUTES

CREATE TABLE sv_sec_attributes
 (
 attribute_id                NUMBER         NOT NULL,
 category_id                 NUMBER         NOT NULL,
 attribute_name              VARCHAR2(4000) NOT NULL,
 attribute_key               VARCHAR2(4000) NOT NULL,
 active_flag                 VARCHAR2(10)   NOT NULL,
 rule_source                 VARCHAR2(255)  NOT NULL,
 table_name                  VARCHAR2(255),
 column_name                 VARCHAR2(4000),
 view_name                   VARCHAR2(255),
 score_collection_id         NUMBER,
 rule_plsql                  VARCHAR2(4000),
 rule_type                   VARCHAR2(255)  NOT NULL,
 info                        CLOB,
 fix                         CLOB,
 when_not_found              VARCHAR2(100),
 seq                         NUMBER,
 internal_flag               VARCHAR2(1),
 help_page                   VARCHAR2(255),
 impact                      VARCHAR2(100),
 col_template_id             NUMBER,
 display_page_id             NUMBER,
 summary_page_id             NUMBER,
 component_table             VARCHAR2(255),
 component_column_id         VARCHAR2(255),
 component_column_display    VARCHAR2(255),
 column_table                VARCHAR2(255),
 column_column_id            VARCHAR2(255),
 column_column_display       VARCHAR2(255),
 component_sig_id            NUMBER,
 time_to_fix                 NUMBER,
 severity_level              NUMBER,
 CONSTRAINT sv_sec_attributes_key_u UNIQUE (attribute_key),
 CONSTRAINT sv_sec_attributes_pk PRIMARY KEY (attribute_id)
 )
/

CREATE SEQUENCE sv_sec_attributes_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_attributes
BEFORE INSERT ON sv_sec_attributes
FOR EACH ROW
BEGIN
IF :NEW.attribute_id IS NULL THEN
  SELECT sv_sec_attributes_seq.NEXTVAL INTO :NEW.attribute_id FROM dual;
END IF;
IF :NEW.internal_flag IS NULL THEN
  :NEW.internal_flag := 'N';
END IF;
END;
/

ALTER TABLE sv_sec_attributes 
  ADD CONSTRAINT sv_sec_attr_cat_fk
  FOREIGN KEY (category_id) REFERENCES sv_sec_categories (category_id)
  ON DELETE CASCADE
/