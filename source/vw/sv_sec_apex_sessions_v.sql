DECLARE
  l_sql VARCHAR2(500);
BEGIN

FOR x IN (SELECT MAX(username) username FROM all_users WHERE username LIKE 'APEX_0%')
LOOP

l_sql := 'CREATE OR REPLACE VIEW sv_sec_apex_sessions_v 
AS
SELECT
  username,
  cookie_value,
  security_group_id,
  id
FROM
  ' || x.username || '.wwv_flow_sessions$';
END LOOP;

EXECUTE IMMEDIATE l_sql;

END;
/
