PROMPT == SV_SEC_APEX_LINKS

CREATE TABLE sv_sec_apex_links
 (
 apex_link_id              NUMBER         NOT NULL,
 app_user                  VARCHAR2(255)  NOT NULL,
 clicked_on                DATE           NOT NULL,
 application_id            NUMBER         NOT NULL,
 page_id                   NUMBER         NOT NULL,
 link                      VARCHAR2(4000) NOT NULL,
 rp                        VARCHAR2(4000),
 component_name            VARCHAR2(255)  NOT NULL,
 category                  VARCHAR2(1000) NOT NULL,
 CONSTRAINT sv_sec_apex_link_pk PRIMARY KEY (apex_link_id)
 )
/

CREATE SEQUENCE sv_sec_apex_links_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_apex_links
BEFORE INSERT ON sv_sec_apex_links
FOR EACH ROW
BEGIN
IF :NEW.apex_link_id IS NULL THEN
  SELECT sv_sec_apex_links_seq.NEXTVAL INTO :NEW.apex_link_id FROM dual;
END IF;
END;
/

