CREATE OR REPLACE VIEW sv_sec_col_sqli_tre_item_v
AS
SELECT
  seq_id             id,
  cd.application_id  application_id,
  cd.attribute_id    attribute_id,
  cd.page_id         page_id,
  cd.component_id    component_id,
  result             result,
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
  sv_sec_util.get_component(e.component_id, e.attribute_id) component,
  cd.last_updated_by updated_by,
  cd.last_updated_on updated_on,
  cd.edit            edit,
  cd.link_page       link_page,
  cd.link_req        link_req,
  cd.link_cc         link_cc,
  cd.link_desc       link_desc,
  cd.link            link,  
  c001               page_name,
  c003               region_name,
  c002               region_name_esc,
  exception          exception,
  notation           notation,
  exception_url,
  notation_url
FROM
  sv_sec_collection_data cd,
  sv_sec_collection c,
  sv_sec_exceptions e
WHERE
  collection_name = 'SV_SQLI_TRE_ITEM'
  AND c.collection_id = cd.collection_id
  AND c.collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
  AND e.attribute_set_id(+) = SYS_CONTEXT('SV_SERT_CTX', 'ATTRIBUTE_SET_ID')
  AND cd.attribute_id = e.attribute_id(+)
  AND cd.page_id = e.page_id(+)
  AND cd.component_id = e.component_id(+)
  AND cd.application_id = e.application_id(+)
/