PROMPT == WWV_FLOW_SESSIONS$
CREATE OR REPLACE VIEW  ^parse_as_user.sv_sec_apex_sessions_v AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_apex_sessions_v
/
