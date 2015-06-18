CREATE OR REPLACE VIEW sv_sec_col_sqli_val_v AS
SELECT
  edit,
  page_id,
  page_name,
  validation_name,
  validation_name_esc,
  validation_type,
  component_id,
  link_page,
  link_req,
  link_cc,
  link_desc,
  link,
  updated_by,
  updated_on,
  item_syntax,
  exec_immediate,
  dbms_sql
FROM
  (
  SELECT
    NULL edit,
    a.page_id,
    a.page_name,
    a.validation_name,
    a.validation_name_esc,
    a.validation_type,
    a.component_id,
    a.link_page,
    a.link_req,
    a.link_cc,
    a.link_desc,
    a.link,
    a.updated_by,
    a.updated_on,
    a.result item_syntax,
    b.result exec_immediate,
    c.result dbms_sql
  FROM
    sv_sec_col_sqli_val_item_v a,
    sv_sec_col_sqli_val_exec_v b,
    sv_sec_col_sqli_val_dbms_v c
  WHERE
    a.application_id = b.application_id
    AND a.page_id = b.page_id
    AND a.component_id = b.component_id
    AND a.application_id = c.application_id
    AND a.page_id = c.page_id
    AND a.component_id = c.component_id
  )
/