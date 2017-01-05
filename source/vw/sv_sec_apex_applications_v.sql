CREATE OR REPLACE VIEW sv_sec_apex_applications_v
AS
SELECT DISTINCT
  a.application_name,
  a.workspace_display_name,
  a.application_id,
  a.workspace_id,
  a.workspace,
  a.version,
  a.owner,
  a.last_updated_on
FROM
  apex_applications a,
  sv_sec_user_roles_v ur
WHERE
  a.application_id NOT BETWEEN 3000 AND 8999
  AND a.workspace_id > 100
--  AND version != (SELECT sv_sec_util.get_version FROM dual)
  AND a.workspace_id = ur.workspace_id
  AND ur.user_name = (SELECT v('APP_USER') FROM dual)
  AND ur.user_workspace_id = (SELECT nv('G_WORKSPACE_ID') FROM dual)
/
