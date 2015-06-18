PROMPT == SV_SEC_SCHED_LIST_MEMBERS

CREATE TABLE sv_sec_sched_list_members
 (
 sched_list_member_id        NUMBER        NOT NULL,
 sched_list_id               NUMBER        NOT NULL,
 first_name                  VARCHAR2(255),
 last_name                   VARCHAR2(255),
 email                       VARCHAR2(255) NOT NULL,
 include_pdfs                VARCHAR2(10)  NOT NULL,
 created_on                  DATE          NOT NULL,
 created_by                  VARCHAR2(255) NOT NULL,
 created_ws                  NUMBER        NOT NULL,
 CONSTRAINT sched_list_members_pk PRIMARY KEY (sched_list_member_id)
 )
/

CREATE SEQUENCE sv_sec_sched_list_members_seq START WITH 1
/

CREATE OR REPLACE TRIGGER bi_sv_sec_sched_list_members
BEFORE INSERT ON sv_sec_sched_list_members
FOR EACH ROW
BEGIN
  SELECT sv_sec_sched_list_members_seq.NEXTVAL INTO :NEW.sched_list_member_id FROM dual;
  :NEW.created_on := SYSDATE;
  :NEW.created_by := v('APP_USER');
  :NEW.created_ws := v('G_WORKSPACE_ID');
END;
/

ALTER TABLE sv_sec_sched_list_members 
  ADD CONSTRAINT sv_sec_sched_list_members_fk
  FOREIGN KEY (sched_list_id) REFERENCES sv_sec_sched_lists (sched_list_id)
  ON DELETE CASCADE
/