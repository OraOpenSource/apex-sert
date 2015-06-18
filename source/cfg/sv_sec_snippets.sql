PROMPT == SV_SEC_SNIPPETS

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('PARSE_AS', '@SV_PARSE_AS@', 'N')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EMAIL_CSS','<style type="text/css">table.wideReport td.dataAlt{background:#fff;font-size:10px;empty-cells:show;padding:3px 9px}  
th.reportHeader {font-weight:700;color:#000;font-size:11px;letter-spacing:1px;text-transform:capitalize;text-decoration:none; padding;2px;}  
table.wideReport td.dataAlt{background:#fff;border-top:1px #ccc solid;font-size:10px;empty-cells:show;padding:3px 9px; text-align:center;empty-cells:show;border-collapse:collapse;color:#666;font-size:10px;} 
</style>','Y')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EMAIL_TABLE_SCORE_OPEN', '<table class="wideReport" border="0" cellpadding="0" cellspacing="0" width="100%"><thead><tr><th class="reportHeader">Application</th><th colspan="2" class="reportHeader">Approved Score</th><th colspan="2" class="reportHeader">Pending Score</th><th colspan="2" class="reportHeader">Raw Score</th></tr></thead><tbody>','N')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EMAIL_TABLE_EXCEPTION_OPEN', '<table class="wideReport" border="0" cellpadding="0" cellspacing="0" width="100%"><thead><tr><th class="reportHeader">User</th><th class="reportHeader">Date/Time</th><th class="reportHeader">Details</th><th class="reportHeader">Justification</th></tr></thead><tbody>','N')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EMAIL_TABLE_RESET_PW_OPEN', '<table class="wideReport" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody>','N')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EMAIL_TABLE_CLOSE', '</tbody></table>','N')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EMAIL_HEADER', '<!DOCTYPE html><head><title>eSERT Scheduled Evaluation Notification</title><meta http-equiv="Pragma" content="no-cache" /><meta http-equiv="Expires" content="-1" /><meta http-equiv="Cache-Control" content="no-cache" />
</head><body>','N')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EMAIL_FOOTER', '</body></html>','N')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  VALUES ('EXCEPTION_API', 'N','Y')
/

INSERT INTO sv_sec_snippets (snippet_key, snippet, editable)
  SELECT 'INSTANCE_ID', value, 'N' FROM apex_040200.wwv_flow_platform_prefs WHERE name = 'INSTANCE_ID'
/

COMMIT
/