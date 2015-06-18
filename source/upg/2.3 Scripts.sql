alter table sv_sec_notations add (created_ws number)
/
CREATE OR REPLACE VIEW sv_sert_apex.sv_sec_notations AS SELECT * FROM sv_sert_000000.sv_sec_notations
/


alter table sv_sec_events add (created_ws number)
/
CREATE OR REPLACE VIEW sv_sert_apex.sv_sec_events AS SELECT * FROM sv_sert_000000.sv_sec_events
/



alter table sv_sec_exceptions add (created_ws number, approved_ws number, rejected_ws number)
/
CREATE OR REPLACE VIEW sv_sert_apex.sv_sec_exceptions AS SELECT * FROM sv_sert_000000.sv_sec_exceptions
/

CREATE OR REPLACE TRIGGER bi_sv_sec_exceptions
BEFORE INSERT ON sv_sec_exceptions
FOR EACH ROW
BEGIN
IF :NEW.exception_id IS NULL THEN
  SELECT sv_sec_exceptions_seq.NEXTVAL INTO :NEW.exception_id FROM dual;
END IF;
IF :NEW.approved_flag IS NULL THEN
  :NEW.approved_flag := 'P';
END IF;
IF :NEW.created_by IS NULL THEN
  :NEW.created_by := v('APP_USER');
END IF;
IF :NEW.created_on IS NULL THEN
  :NEW.created_on := SYSDATE;
END IF;
IF :NEW.created_ws IS NULL THEN
    :NEW.created_ws := v('G_WORKSPACE_ID');
END IF;
END;
/
