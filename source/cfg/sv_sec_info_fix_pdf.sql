PROMPT == SV_SEC_INFO_FIX_PDF

UPDATE sv_sec_attributes SET fix_pdf = sv_sec_rpt_util.convert_html(fix), info_pdf = sv_sec_rpt_util.convert_html(info)
/
COMMIT
/
