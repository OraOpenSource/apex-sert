PROMPT == SV_SEC_EVENT_TYPES

CREATE TABLE sv_sec_event_types
(
 EVENT_TYPE_ID				NUMBER			 NOT NULL,
 EVENT_TYPE_KEY				varchar2(4000)   NOT NULL,
 EVENT_NAME			        varchar2(100)    NOT NULL,
 EVENT_MESSAGE              varchar2(4000)   NOT NULL,
 EVENT_DESCRIPTION			varchar2(4000),
 CONSTRAINT sv_sec_event_types_pk PRIMARY KEY (event_type_id)
 )
/

CREATE SEQUENCE sv_sec_event_types_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_event_types
BEFORE INSERT ON sv_sec_event_types
FOR EACH ROW
BEGIN
IF :NEW.event_type_id IS NULL THEN
  SELECT sv_sec_event_types_seq.NEXTVAL INTO :NEW.event_type_id FROM dual;
END IF;
END;
/