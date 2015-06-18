PROMPT == SV_SEC_SCORE_COLLECTTIONS

CREATE TABLE sv_sec_score_collections
 (
 score_collection_id         NUMBER         NOT NULL,
 collection_name             VARCHAR2(255)  NOT NULL,
 collection_key              VARCHAR2(255)  NOT NULL,
 category_id                 NUMBER,
 internal_flag               VARCHAR2(1)    NOT NULL,
 collection_sql              VARCHAR2(4000) NOT NULL,
 apex_version                VARCHAR2(255)  NOT NULL, 
 CONSTRAINT sv_sec_score_collection_pk PRIMARY KEY (score_collection_id)
 )
/

CREATE SEQUENCE sv_sec_score_collections_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_score_collections
BEFORE INSERT ON sv_sec_score_collections
FOR EACH ROW
BEGIN
IF :NEW.internal_flag IS NULL THEN
  :NEW.internal_flag := 'N';
END IF;
IF :NEW.score_collection_id IS NULL THEN
  SELECT sv_sec_score_collections_seq.NEXTVAL INTO :NEW.score_collection_id FROM dual;
END IF;
END;
/

