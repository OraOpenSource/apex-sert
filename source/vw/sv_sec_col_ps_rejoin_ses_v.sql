CREATE OR REPLACE VIEW sv_sec_col_ps_rejoin_sess_v
AS
SELECT
  seq_id          id,
  cd.application_id,
  cd.attribute_id,
  cd.page_id,
  result,
  e.created_by,
  e.justification,
  e.rejected_justification,
  e.rejection,
  e.approved_flag,
  e.created_on,
  e.approved_by,
  e.approved_on,
  e.rejected_by,
  e.rejected_on,
  cd.exception_id exception_id,
  c001               edit,
  c002               page_name,
  c003               last_updated_by,
  d001               last_updated_on,
  c004               rejoin_session,
  exception          exception,
  notation           notation,
  exception_url,
  notation_url
FROM
  sv_sec_collection_data cd,
  sv_sec_collection c,
  sv_sec_exceptions e
WHERE
  collection_name = 'SV_PS_REJOIN_SESSION'
  AND c.collection_id = cd.collection_id
  AND c.collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
  AND e.attribute_set_id(+) = SYS_CONTEXT('SV_SERT_CTX', 'ATTRIBUTE_SET_ID')
  AND cd.attribute_id = e.attribute_id(+)
  AND cd.page_id = e.page_id(+)
  AND cd.component_id = e.component_id(+)
  AND cd.application_id = e.application_id(+)
/