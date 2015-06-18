CREATE OR REPLACE VIEW sv_sec_user_roles_v
AS
-- Get actual assigned roles
SELECT
  workspace_id,
  user_name,
  user_workspace_id,
  role_name,
  created_by,
  created_on
FROM
  sv_sec_user_roles
-- Add the users current workspace
UNION ALL
SELECT
  nv('G_WORKSPACE_ID') workspace_id,
  v('APP_USER') user_name,
  nv('G_WORKSPACE_ID') user_workspace_id,
  'SV_SERT_EVALUATOR' role_name,
  'INTERNAL' created_by,
  SYSDATE created_on
FROM
  dual
-- Add all workspaces if the user has SV_SERT_EVALUATOR_SCHEDULER_ALL privileges
UNION ALL
SELECT
  w.workspace_id,
  v('APP_USER') user_name,
  nv('G_WORKSPACE_ID') user_workspace_id,
  'SV_SERT_EVALUATOR_SCHEDULER_ALL' role_name,
  'INTERNAL' created_by,
  SYSDATE created_on
FROM
  apex_workspaces w
WHERE 1 = 
  CASE WHEN sv_sec_util.user_has_role_vc(0, nv('G_WORKSPACE_ID'), v('APP_USER'), 'SV_SERT_EVALUATOR_SCHEDULER_ALL') = 'TRUE' THEN 1 ELSE 2 END
/
