CREATE OR REPLACE VIEW sv_sec_col_set_ui_settings_v
AS
SELECT
  seq_id             id,
  cd.application_id  application_id,
  cd.attribute_id    attribute_id,
  cd.page_id         page_id,
  cd.component_id    component_id,
  result             result,
  cd.edit            edit,
  cd.link_page       link_page,
  cd.link_req        link_req,
  cd.link_cc         link_cc,
  cd.link_desc       link_desc,
  cd.link            link,  
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
  c001               setting_name,
  c002               setting_value,
  c003               recommended_value,
  c004               fix,
  c005               info,
  exception          exception,
  notation           notation
FROM
  sv_sec_collection_data cd,
  sv_sec_collection c,
  sv_sec_exceptions e,
  sv_sec_attributes a
WHERE
  cd.attribute_id = a.attribute_id
  AND a.category_id = (SELECT category_id FROM sv_sec_categories WHERE category_key = 'SV_SET_USER_INTERFACE')
  AND c.collection_id = cd.collection_id
  AND c.collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
  AND e.attribute_set_id(+) = SYS_CONTEXT('SV_SERT_CTX', 'ATTRIBUTE_SET_ID')
  AND cd.attribute_id = e.attribute_id(+)
  AND cd.application_id = e.application_id(+)
/