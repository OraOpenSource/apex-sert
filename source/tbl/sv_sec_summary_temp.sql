PROMPT == SV_SEC_SUMMARY_TEMP

CREATE GLOBAL TEMPORARY TABLE sv_sec_summary_temp
  (
  category_name              VARCHAR2(4000),
  display_page               VARCHAR2(255),
  color                      VARCHAR2(255),
  score                      NUMBER,
  possible_score             NUMBER,
  pct_score                  NUMBER
  )
ON COMMIT DELETE ROWS
/