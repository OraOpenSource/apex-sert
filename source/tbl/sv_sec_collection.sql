PROMPT == SV_SEC_COLLECTION

CREATE TABLE sv_sec_collection
 (
 collection_id              NUMBER,
 app_id                     NUMBER NOT NULL,
 app_user                   VARCHAR2(255) NOT NULL,
 app_session                VARCHAR2(255) NOT NULL,
 created_on                 DATE NOT NULL,
 CONSTRAINT sv_sec_collection_pk PRIMARY KEY (collection_id)
 )
/

CREATE SEQUENCE sv_sec_collection_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_collection
BEFORE INSERT ON sv_sec_collection
FOR EACH ROW
BEGIN
  SELECT sv_sec_collection_seq.NEXTVAL INTO :NEW.collection_id FROM dual;
  :NEW.created_on := SYSDATE;
END;
/
