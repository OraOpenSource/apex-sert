PROMPT == SV_SEC_COLLECTION_DATA

CREATE TABLE sv_sec_collection_data
 (
  collection_data_id         NUMBER,
  collection_id              NUMBER,
  application_id             NUMBER,
  attribute_id               NUMBER,
  page_id                    NUMBER,
  component_id               VARCHAR2(1000),
  column_id                  NUMBER,
  exception_id               NUMBER,
  result                     VARCHAR2(255),
  exception                  VARCHAR2(4000),
  exception_url              VARCHAR2(4000),
  notation                   VARCHAR2(4000),
  notation_url               VARCHAR2(4000),
  collection_name            VARCHAR2(255),
  category_key               VARCHAR2(255),
  component_signature        VARCHAR2(4000),
  seq_id                     NUMBER,
  score                      NUMBER,
  possible_score             NUMBER,
  last_updated_by            VARCHAR2(255),
  last_updated_on            DATE,
  edit                       VARCHAR2(4000),
  link_page                  VARCHAR2(255),
  link_req                   VARCHAR2(1000),
  link_cc                    VARCHAR2(1000),
  link_desc                  VARCHAR2(1000),
  link                       VARCHAR2(4000),
  c001                       VARCHAR2(4000),
  c002                       VARCHAR2(4000),
  c003                       VARCHAR2(4000),
  c004                       VARCHAR2(4000),
  c005                       VARCHAR2(4000),
  c006                       VARCHAR2(4000),
  c007                       VARCHAR2(4000),
  c008                       VARCHAR2(4000),
  c009                       VARCHAR2(4000),
  c010                       VARCHAR2(4000),
  c011                       VARCHAR2(4000),
  c012                       VARCHAR2(4000),
  c013                       VARCHAR2(4000),
  c014                       VARCHAR2(4000),
  c015                       VARCHAR2(4000),
  c016                       VARCHAR2(4000),
  c017                       VARCHAR2(4000),
  c018                       VARCHAR2(4000),
  c019                       VARCHAR2(4000),
  c020                       VARCHAR2(4000),
  n001                       NUMBER,
  n002                       NUMBER,
  n003                       NUMBER,
  n004                       NUMBER,
  n005                       NUMBER,
  n006                       NUMBER,
  n007                       NUMBER,
  n008                       NUMBER,
  n009                       NUMBER,
  n010                       NUMBER,
  d001                       DATE,
  d002                       DATE,
  d003                       DATE,
  val                        CLOB,
  checksum                   RAW(16),
  component_name             VARCHAR2(1000),
  column_name                VARCHAR2(1000)
 )
/

CREATE SEQUENCE sv_sec_collection_data_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_collection_data
BEFORE INSERT ON sv_sec_collection_data
FOR EACH ROW
BEGIN
  SELECT sv_sec_collection_data_seq.NEXTVAL INTO :NEW.collection_data_id FROM dual;
END;
/

ALTER TABLE sv_sec_collection_data 
  ADD CONSTRAINT sv_sec_collection_data_fk
  FOREIGN KEY (collection_id) REFERENCES sv_sec_collection (collection_id)
  ON DELETE CASCADE
/

CREATE INDEX CD_COLLECTION_ID_I ON SV_SEC_COLLECTION_DATA
  (
    COLLECTION_ID
  )
/

CREATE INDEX CD_APPLICATION_ID_I ON SV_SEC_COLLECTION_DATA
  (
    APPLICATION_ID
  )
/

CREATE INDEX CD_ATTRIBUTE_ID_I ON SV_SEC_COLLECTION_DATA
  (
    ATTRIBUTE_ID
  )
/

CREATE INDEX CD_PAGE_ID_I ON SV_SEC_COLLECTION_DATA
  (
    PAGE_ID
  )
/

CREATE INDEX CD_COMPONENT_ID_I ON SV_SEC_COLLECTION_DATA
  (
    COMPONENT_ID
  )
/

CREATE INDEX CD_COLUMN_ID_I ON SV_SEC_COLLECTION_DATA
  (
    COLUMN_ID
  )
/

CREATE INDEX CD_CHECKSUM_I ON SV_SEC_COLLECTION_DATA
  (
    CHECKSUM
  )
/
