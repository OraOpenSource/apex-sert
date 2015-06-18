PROMPT == SV_SEC_CLASSIFICATIONS

CREATE TABLE sv_sec_classifications
 (
 classification_id           NUMBER         NOT NULL,
 classification_name         VARCHAR2(255)  NOT NULL,
 classification_key          VARCHAR2(255)  NOT NULL,
 summary_page_id             NUMBER         NOT NULL,
 seq                         NUMBER         NOT NULL,
 CONSTRAINT sv_sec_classifications_pk PRIMARY KEY (classification_id)
 )
/

CREATE SEQUENCE sv_sec_classifications_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_classifications
BEFORE INSERT ON sv_sec_classifications
FOR EACH ROW
BEGIN
  SELECT sv_sec_classifications_seq.NEXTVAL INTO :NEW.classification_id FROM dual;
END;
/