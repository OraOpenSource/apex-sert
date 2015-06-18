create or replace procedure ^parse_as_user..launch_sert
  (
  p_session_id in number
  )
AS
  l_instance_id              VARCHAR2(100);
  l_cookie_value             VARCHAR2(1000);
  l_builder_cookie           OWA_COOKIE.cookie;
BEGIN

-- Get the INSTANCE_ID
SELECT snippet INTO l_instance_id FROM sv_sec_snippets WHERE snippet_key = 'INSTANCE_ID';

-- Get the Builder Cookie value
l_builder_cookie := OWA_COOKIE.get ('ORA_WWV_USER_' || l_instance_id);

-- Redirect if no Builder Cookie Found
IF l_builder_cookie.num_vals = 0 THEN
  owa_util.redirect_url('f?p=' || v('APP_ID') || ':103:0');
END IF;

-- Store the cookie and session ID values
sv_sec_util.record_cookie
  (
  p_session_id => p_session_id,
  p_cookie_val => l_builder_cookie.vals(1)
  );

-- Redirect to eSERT
owa_util.redirect_url('f?p=SERT:101:0::::P101_SESSION_ID:' || p_session_id);

END launch_sert;
/

GRANT EXECUTE ON ^parse_as_user..launch_sert TO APEX_PUBLIC_USER
/
