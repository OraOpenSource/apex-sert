PROMPT == SV_SEC_PDF_TEMP

CREATE GLOBAL TEMPORARY TABLE sv_sec_pdf_temp
  (
  seq                        NUMBER,
  category_name              VARCHAR2(1000),
  point_summary              VARCHAR2(255),
  color                      VARCHAR2(100)
  )
ON COMMIT DELETE ROWS
/