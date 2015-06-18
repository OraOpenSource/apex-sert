CREATE OR REPLACE VIEW sv_sec_col_sqli_fls_v AS
SELECT
  edit,
  page_id,
  page_name,
  region_name,
  region_name_esc,
  series_name,
  series_id,
  chart_type,
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
    a.region_name,
    a.region_name_esc,
    a.series_name,
    a.series_id,
    a.chart_type,
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
    sv_sec_col_sqli_fls_item_v a,
    sv_sec_col_sqli_fls_exec_v b,
    sv_sec_col_sqli_fls_dbms_v c
  WHERE
    a.application_id = b.application_id
    AND a.page_id = b.page_id
    AND a.component_id = b.component_id
    AND a.application_id = c.application_id
    AND a.page_id = c.page_id
    AND a.component_id = c.component_id
  )
/