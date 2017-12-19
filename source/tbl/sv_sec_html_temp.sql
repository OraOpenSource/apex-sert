PROMPT == SV_SEC_HTML_TEMP

CREATE GLOBAL TEMPORARY TABLE sv_sec_html_temp
  (
  seq                        NUMBER,
  html                       VARCHAR2(4000),
  cat                        VARCHAR2(255)
  )
ON COMMIT DELETE ROWS
/