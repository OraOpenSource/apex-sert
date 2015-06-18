PROMPT == SV_SEC_CATEGORIES

CREATE TABLE sv_sec_categories
 (
 category_id                 NUMBER NOT NULL,
 classification_id           NUMBER NOT NULL,
 category_name               VARCHAR2(255) NOT NULL,
 category_short_name         VARCHAR2(255) NOT NULL,
 category_key                VARCHAR2(255) NOT NULL,
 category_link               VARCHAR2(4000),
 display_page                VARCHAR2(255) NOT NULL,
 internal_flag               VARCHAR2(1),
 rpt_attribute_key           VARCHAR2(255),
 CONSTRAINT sv_sec_categories_pk PRIMARY KEY (category_id),
 CONSTRAINT sv_sec_categoeies_u UNIQUE (category_key)
 )
/

CREATE SEQUENCE sv_sec_categories_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_categories
BEFORE INSERT ON sv_sec_categories
FOR EACH ROW
BEGIN
IF :NEW.category_id IS NULL THEN
  SELECT sv_sec_categories_seq.NEXTVAL INTO :NEW.category_id FROM dual;
END IF;
IF :NEW.internal_flag IS NULL THEN
  :NEW.internal_flag := 'N';
END IF;
END;
/

ALTER TABLE sv_sec_categories 
  ADD CONSTRAINT sv_sec_cat_class_fk
  FOREIGN KEY (classification_id) REFERENCES sv_sec_classifications (classification_id)
  ON DELETE CASCADE
/

