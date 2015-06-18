CREATE OR REPLACE VIEW sv_sec_exceptions_v
AS
SELECT
  e.exception_id,
  e.attribute_set_id,
  e.application_id,
  e.attribute_id,
  e.page_id,
  e.component_id,
  e.column_id,
  e.justification,
  e.rejected_justification,
  e.rejection,
  e.approved_flag,
  e.prev_approved_flag,
  e.created_by,
  e.created_on,
  e.approved_by,
  e.approved_on,
  e.rejected_by,
  e.rejected_on,
  e.val,
  e.checksum,
  e.created_ws,
  e.approved_ws,
  e.rejected_ws,
  cw.workspace created_ws_name,
  aw.workspace approved_ws_name,
  rw.workspace rejected_ws_name
FROM
  sv_sec_exceptions e,
  apex_workspaces cw,
  apex_workspaces aw,
  apex_workspaces rw
WHERE
  e.created_ws = cw.workspace_id(+)
  AND e.approved_ws = aw.workspace_id(+)
  AND e.rejected_ws = rw.workspace_id(+)
/