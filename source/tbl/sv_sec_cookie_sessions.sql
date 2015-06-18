PROMPT == SV_SEC_COOKIE_SESSIONS

CREATE TABLE sv_sec_cookie_sessions
 (
 session_id                  VARCHAR2(255) NOT NULL,
 cookie_val                  VARCHAR2(255) NOT NULL,
 created_on                  VARCHAR2(255) NOT NULL
 )
/

CREATE OR REPLACE TRIGGER bi_sv_sec_cookie_sessions
BEFORE INSERT ON sv_sec_cookie_sessions
FOR EACH ROW
BEGIN
:NEW.created_on := SYSDATE;
END;
/
