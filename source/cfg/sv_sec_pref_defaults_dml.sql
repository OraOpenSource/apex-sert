PROMPT == SV_SEC_HTP_PROCS

INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('RPT_HEADER_BKG_COLOR','#4996bd','VARCHAR');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('RPT_HEADER_FONT_COLOR','#ffffff','VARCHAR');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('RPT_HEADER_FONT','Arial','VARCHAR');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('RPT_HEADER_FONT_SIZE','9','NUMBER');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('RPT_BODY_FONT_COLOR','#000000','VARCHAR');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('RPT_BODY_FONT','Courier','VARCHAR');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('RPT_BODY_FONT_SIZE','9','NUMBER');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('LOG_PAGE_VIEWS','N','VARCHAR');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('SCORE_PRECISION','2','NUMBER');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('ACCEPTABLE_TOLERANCE','100','NUMBER');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('FAILURE_TOLERANCE','60','NUMBER');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('SCORE_TYPE','Approved','VARCHAR');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('LOGO_X_POSITION','100','NUMBER');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('LOGO_Y_POSITION','240','NUMBER');
INSERT INTO sv_sec_pref_defaults (pref_key, pref_default, data_type) VALUES ('HELP_URL','http://docs.oracle.com/cd/E37097_01/doc/doc.42/e35125/','VARCHAR');

COMMIT
/