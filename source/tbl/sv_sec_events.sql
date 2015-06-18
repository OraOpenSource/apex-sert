PROMPT == SV_SEC_EVENTS

CREATE TABLE sv_sec_events
 (
 EVENT_ID					NUMBER			NOT NULL,
 EVENT_TYPE_ID				NUMBER    	    NOT NULL,
 attribute_set_id           NUMBER,
 APPLICATION_ID		        NUMBER,
 ATTRIBUTE_ID               NUMBER,
 PAGE_ID					NUMBER,
 COMPONENT_ID				varchar2(4000),
 COLUMN_ID					NUMBER,
 EVENT_MESSAGE				varchar2(4000),
 EVENT_MESSAGE_TXT      	varchar2(4000),
 CREATED_BY					varchar2(4000),
 CREATED_ON					DATE,
 created_ws                 NUMBER,
 target_page_id             NUMBER,
 notation                   VARCHAR2(4000),
 CONSTRAINT sv_sec_events_pk PRIMARY KEY (event_id),
 CONSTRAINT sv_sec_event_types_fk FOREIGN KEY (event_type_id) REFERENCES sv_sec_event_types (event_type_id)
 )
/

CREATE SEQUENCE sv_sec_events_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_events
BEFORE INSERT ON sv_sec_events
FOR EACH ROW
BEGIN
IF :NEW.EVENT_ID IS NULL THEN
  SELECT sv_sec_events_seq.NEXTVAL INTO :NEW.EVENT_ID FROM dual;
END IF;
END;
/

