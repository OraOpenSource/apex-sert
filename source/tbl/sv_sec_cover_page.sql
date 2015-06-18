PROMPT == SV_SEC_COVER_PAGE

CREATE TABLE sv_sec_cover_page
 (
 cover_page_id               NUMBER,
 file_name                   VARCHAR2(255),
 mime_type                   VARCHAR2(255),
 cover_page                  BLOB,
 CONSTRAINT sv_sec_cover_page_pk PRIMARY KEY (cover_page_id)
 )
/

CREATE OR REPLACE TRIGGER bi_sv_sec_cover_page
BEFORE INSERT ON sv_sec_cover_page
FOR EACH ROW
BEGIN
:NEW.cover_page_id := 1;
:NEW.file_name := 'title.pdf';
:NEW.mime_type := 'application/pdf';
END;
/

