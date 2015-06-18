CREATE OR REPLACE VIEW sv_sec_col_xss_ph_summary_v
AS
SELECT
  edit,
  page_id,
  page_name,
  application_id,
  link_page,
  link_req,
  link_cc,
  link_desc,
  link,
  updated_by,
  updated_on,
  js_onload,
  js_globals,
  html_head,
  html_body,
  page_header,
  page_footer
FROM
  (
  SELECT
    NULL edit,
    a.page_id,
    a.page_name,
    a.application_id,
    a.link_page,
    a.link_req,
    a.link_cc,
    a.link_desc,
    a.link,
    a.updated_by,
    a.updated_on,
    a.result js_onload,
    b.result js_globals,
    c.result html_head,
    d.result html_body,
    e.result page_header,
    f.result page_footer
  FROM
    sv_sec_col_xss_ph_js_onload_v a,
    sv_sec_col_xss_ph_js_globals_v b,
    sv_sec_col_xss_ph_html_head_v c,
    sv_sec_col_xss_ph_html_body_v d,
    sv_sec_col_xss_ph_header_v e,
    sv_sec_col_xss_ph_footer_v f
  WHERE
    a.application_id = b.application_id
    AND a.page_id = b.page_id
    AND a.application_id = c.application_id
    AND a.page_id = c.page_id
    AND a.application_id = d.application_id
    AND a.page_id = d.page_id
    AND a.application_id = e.application_id
    AND a.page_id = e.page_id
    AND a.application_id = f.application_id
    AND a.page_id = f.page_id
  )
/