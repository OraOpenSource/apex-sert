PROMPT == SV_SEC_SNIPPETS

CREATE TABLE sv_sec_snippets
 (
 snippet_id                  NUMBER NOT NULL,
 snippet_key                 VARCHAR2(255) NOT NULL,
 snippet                     VARCHAR2(4000),
 snippet_clob                CLOB,
 editable                    VARCHAR2(1),
 CONSTRAINT sv_sec_snippets_pk PRIMARY KEY (snippet_id),
 CONSTRAINT sv_sec_snippet_key_u UNIQUE (snippet_key)
 )
/

CREATE SEQUENCE sv_sec_snippets_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_snippets
BEFORE INSERT ON sv_sec_snippets
FOR EACH ROW
BEGIN
IF :NEW.snippet_id IS NULL THEN
  SELECT sv_sec_snippets_seq.NEXTVAL INTO :NEW.snippet_id FROM dual;
END IF;
END;
/

