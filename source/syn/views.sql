set define '^'
set concat off

PROMPT == SV_SEC_APEX_APPLICATIONS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_apex_applications_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_apex_applications_v FOR SV_SERT_@SV_VERSION@.sv_sec_apex_applications_v
/

PROMPT == SV_SEC_EXCEPTIONS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_exceptions_v TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_exceptions_v AS SELECT * FROM SV_SERT_@SV_VERSION@.sv_sec_exceptions_v
/

PROMPT == SV_SEC_USER_ROLES_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_user_roles_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_user_roles_v FOR SV_SERT_@SV_VERSION@.sv_sec_user_roles_v
/

-- Collection Views
PROMPT == SV_SEC_COL_PS_FORM_AUTOCOMP_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_form_autocomp_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_form_autocomp_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_form_autocomp_v
/

PROMPT == SV_SEC_COL_PS_DUP_SUBMISSION_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_dup_submission_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_dup_submission_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_dup_submission_v
/

PROMPT == SV_SEC_COL_PS_AUTHENTICATION_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_authentication_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_authentication_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_authentication_v
/

PROMPT == SV_SEC_COL_PS_AUTHORIZATION_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_authorization_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_authorization_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_authorization_v
/

PROMPT == SV_SEC_COL_PS_RPT_EXP_DATA_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_rpt_exp_data_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_rpt_exp_data_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_rpt_exp_data_v
/

PROMPT == SV_SEC_COL_PS_RPT_MAX_ROWS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_rpt_max_rows_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_rpt_max_rows_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_rpt_max_rows_v
/

PROMPT == SV_SEC_COL_PS_BROWSER_CACHE_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_browser_cache_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_browser_cache_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_browser_cache_v
/

PROMPT == SV_SEC_COL_PS_DEEP_LINK_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_deep_link_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_deep_link_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_deep_link_v
/

PROMPT == SV_SEC_COL_PS_REJOIN_SESS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_rejoin_sess_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_rejoin_sess_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_rejoin_sess_v
/

PROMPT == SV_SEC_COL_PS_RPT_RESTFUL_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_ps_rpt_restful_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_ps_rpt_restful_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_ps_rpt_restful_v
/

-- SQL Injection Views
-- Processes
PROMPT == SV_SEC_COL_SQLI_PRC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_prc_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_v
/
PROMPT == SV_SEC_COL_SQLI_PRC_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_prc_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_item_v
/
PROMPT == SV_SEC_COL_SQLI_PRC_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_prc_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_exec_v
/
PROMPT == SV_SEC_COL_SQLI_PRC_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_prc_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_prc_dbms_v
/

-- Computations
PROMPT == SV_SEC_COL_SQLI_COMP_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_comp_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_v
/
PROMPT == SV_SEC_COL_SQLI_COMP_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_comp_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_item_v
/
PROMPT == SV_SEC_COL_SQLI_COMP_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_comp_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_exec_v
/
PROMPT == SV_SEC_COL_SQLI_COMP_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_comp_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_comp_dbms_v
/

-- Reports
PROMPT == SV_SEC_COL_SQLI_RPT_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_rpt_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_v
/
PROMPT == SV_SEC_COL_SQLI_RPT_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_rpt_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_item_v
/
PROMPT == SV_SEC_COL_SQLI_RPT_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_rpt_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_exec_v
/
PROMPT == SV_SEC_COL_SQLI_RPT_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_rpt_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_rpt_dbms_v
/


-- Tabular Forms
PROMPT == SV_SEC_COL_SQLI_TFM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tfm_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_v
/
PROMPT == SV_SEC_COL_SQLI_TFM_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tfm_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_item_v
/
PROMPT == SV_SEC_COL_SQLI_TFM_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tfm_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_exec_v
/
PROMPT == SV_SEC_COL_SQLI_TFM_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tfm_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tfm_dbms_v
/


-- Validations
PROMPT == SV_SEC_COL_SQLI_VAL_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_val_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_v
/
PROMPT == SV_SEC_COL_SQLI_VAL_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_val_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_item_v
/
PROMPT == SV_SEC_COL_SQLI_VAL_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_val_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_exec_v
/
PROMPT == SV_SEC_COL_SQLI_VAL_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_val_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_val_dbms_v
/


-- Branches
PROMPT == SV_SEC_COL_SQLI_BRN_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_brn_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_v
/
PROMPT == SV_SEC_COL_SQLI_BRN_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_brn_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_item_v
/
PROMPT == SV_SEC_COL_SQLI_BRN_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_brn_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_exec_v
/
PROMPT == SV_SEC_COL_SQLI_BRN_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_brn_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_brn_dbms_v
/


-- PL/SQL
PROMPT == SV_SEC_COL_SQLI_PLS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_pls_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_v
/
PROMPT == SV_SEC_COL_SQLI_PLS_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_pls_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_item_v
/
PROMPT == SV_SEC_COL_SQLI_PLS_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_pls_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_exec_v
/
PROMPT == SV_SEC_COL_SQLI_PLS_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_pls_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_pls_dbms_v
/


-- Calendars
PROMPT == SV_SEC_COL_SQLI_CAL_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_cal_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_v
/
PROMPT == SV_SEC_COL_SQLI_CAL_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_cal_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_item_v
/
PROMPT == SV_SEC_COL_SQLI_CAL_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_cal_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_exec_v
/
PROMPT == SV_SEC_COL_SQLI_CAL_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_cal_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_cal_dbms_v
/


-- Trees
PROMPT == SV_SEC_COL_SQLI_TRE_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tre_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_v
/
PROMPT == SV_SEC_COL_SQLI_TRE_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tre_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_item_v
/
PROMPT == SV_SEC_COL_SQLI_TRE_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tre_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_exec_v
/
PROMPT == SV_SEC_COL_SQLI_TRE_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_tre_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_tre_dbms_v
/


-- Charts and Maps
PROMPT == SV_SEC_COL_SQLI_FLS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_fls_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_v
/
PROMPT == SV_SEC_COL_SQLI_FLS_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_fls_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_item_v
/
PROMPT == SV_SEC_COL_SQLI_FLS_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_fls_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_exec_v
/
PROMPT == SV_SEC_COL_SQLI_FLS_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_fls_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_fls_dbms_v
/


-- Dynamic Actions
PROMPT == SV_SEC_COL_SQLI_DYN_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_dyn_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_v
/
PROMPT == SV_SEC_COL_SQLI_DYN_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_dyn_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_item_v
/
PROMPT == SV_SEC_COL_SQLI_DYN_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_dyn_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_exec_v
/
PROMPT == SV_SEC_COL_SQLI_DYN_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_dyn_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_dyn_dbms_v
/


-- Authorization Schemes
PROMPT == SV_SEC_COL_SQLI_ATH_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_ath_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_v
/
PROMPT == SV_SEC_COL_SQLI_ATH_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_ath_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_item_v
/
PROMPT == SV_SEC_COL_SQLI_ATH_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_ath_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_exec_v
/
PROMPT == SV_SEC_COL_SQLI_ATH_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_ath_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_ath_dbms_v
/


-- Lists
PROMPT == SV_SEC_COL_SQLI_LIST_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_v
/
PROMPT == SV_SEC_COL_SQLI_LIST_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_item_v
/
PROMPT == SV_SEC_COL_SQLI_LIST_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_exec_v
/
PROMPT == SV_SEC_COL_SQLI_LIST_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_dbms_v
/


-- Lists of Values
PROMPT == SV_SEC_COL_SQLI_LOV_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_lov_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_v
/
PROMPT == SV_SEC_COL_SQLI_LOV_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_lov_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_item_v
/
PROMPT == SV_SEC_COL_SQLI_LOV_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_lov_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_exec_v
/
PROMPT == SV_SEC_COL_SQLI_LOV_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_lov_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_lov_dbms_v
/


-- Item Source
PROMPT == SV_SEC_COL_SQLI_ITMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_v
/
PROMPT == SV_SEC_COL_SQLI_ITMS_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itms_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_item_v
/
PROMPT == SV_SEC_COL_SQLI_ITMS_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itms_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_exec_v
/
PROMPT == SV_SEC_COL_SQLI_ITMS_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itms_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itms_dbms_v
/


-- Item Default
PROMPT == SV_SEC_COL_SQLI_ITMD_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itmd_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_v
/
PROMPT == SV_SEC_COL_SQLI_ITMD_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itmd_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_item_v
/
PROMPT == SV_SEC_COL_SQLI_ITMD_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itmd_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_exec_v
/
PROMPT == SV_SEC_COL_SQLI_ITMD_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_itmd_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_itmd_dbms_v
/


-- Lists
PROMPT == SV_SEC_COL_SQLI_LIST_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_v
/
PROMPT == SV_SEC_COL_SQLI_LIST_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_item_v
/
PROMPT == SV_SEC_COL_SQLI_LIST_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_exec_v
/
PROMPT == SV_SEC_COL_SQLI_LIST_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_list_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_list_dbms_v
/


-- Plugins
PROMPT == SV_SEC_COL_SQLI_PLG_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_plg_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_v
/
PROMPT == SV_SEC_COL_SQLI_PLG_ITEM_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_item_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_plg_item_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_item_v
/
PROMPT == SV_SEC_COL_SQLI_PLG_EXEC_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_exec_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_plg_exec_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_exec_v
/
PROMPT == SV_SEC_COL_SQLI_PLG_DBMS_V
/
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_dbms_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_sqli_plg_dbms_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_sqli_plg_dbms_v
/

PROMPT == SV_SEC_COL_URL_PAGE_PROTECT_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_page_protect_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_page_protect_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_page_protect_v
/

PROMPT == SV_SEC_COL_URL_ITEM_ENCRYPT_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_item_encrypt_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_item_encrypt_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_item_encrypt_v
/

PROMPT == SV_SEC_COL_URL_ITEM_PROTECT_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_item_protect_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_item_protect_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_item_protect_v
/

PROMPT == SV_SEC_COL_URL_DISP_AS_ITEMS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_disp_as_items_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_disp_as_items_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_disp_as_items_v
/

PROMPT == SV_SEC_COL_URL_MIS_PROC_BUTT_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_proc_butt_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_proc_butt_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_proc_butt_v
/

PROMPT == SV_SEC_COL_URL_MIS_OD_PROC_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_od_proc_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_od_proc_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_od_proc_v
/

PROMPT == SV_SEC_COL_URL_MIS_AJAX_CB_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_ajax_cb_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_ajax_cb_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_ajax_cb_v
/

PROMPT == SV_SEC_COL_URL_MIS_BC_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_bc_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_bc_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_bc_v
/

PROMPT == SV_SEC_COL_URL_MIS_NB_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_nb_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_nb_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_nb_v
/

PROMPT == SV_SEC_COL_URL_MIS_LE_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_le_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_le_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_le_v
/

PROMPT == SV_SEC_COL_URL_MIS_STD_TAB_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_std_tab_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_std_tab_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_std_tab_v
/

PROMPT == SV_SEC_COL_URL_MIS_PAR_TAB_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_par_tab_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_par_tab_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_par_tab_v
/

PROMPT == SV_SEC_COL_URL_MIS_IR_LINK_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_ir_link_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_ir_link_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_ir_link_v
/

PROMPT == SV_SEC_COL_URL_MIS_IR_COL_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_ir_col_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_ir_col_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_ir_col_v
/

PROMPT == SV_SEC_COL_URL_MIS_STD_COL_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_std_col_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_url_mis_std_col_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_url_mis_std_col_v
/

PROMPT == SV_SEC_COL_APP_ITEMS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_app_items_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_app_items_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_app_items_v
/

PROMPT == SV_SEC_COL_SET_APP_SETTINGS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_set_app_settings_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_set_app_settings_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_set_app_settings_v
/

PROMPT == SV_SEC_COL_SET_SEC_SETTINGS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_set_sec_settings_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_set_sec_settings_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_set_sec_settings_v
/

PROMPT == SV_SEC_COL_SET_SES_SETTINGS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_set_ses_settings_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_set_ses_settings_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_set_ses_settings_v
/

PROMPT == SV_SEC_COL_SET_UI_DT_SET_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_set_ui_dt_set_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_set_ui_dt_set_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_set_ui_dt_set_v
/

PROMPT == SV_SEC_COL_SET_UI_MOB_SET_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_set_ui_mob_set_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_set_ui_mob_set_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_set_ui_mob_set_v
/

PROMPT == SV_SEC_COL_SET_AUTH_SETTINGS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_set_auth_settings_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_set_auth_settings_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_set_auth_settings_v
/

PROMPT == SV_SEC_COL_XSS_BC_ENTRIES_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_bc_entries_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_bc_entries_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_bc_entries_v
/

PROMPT == SV_SEC_COL_XSS_HIDDEN_ITEMS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_hidden_items_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_hidden_items_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_hidden_items_v
/

PROMPT == SV_SEC_COL_XSS_ITEM_LABELS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_item_labels_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_item_labels_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_item_labels_v
/

PROMPT == SV_SEC_COL_XSS_LIST_ENTRIES_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_list_entries_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_list_entries_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_list_entries_v
/

PROMPT == SV_SEC_COL_XSS_STATIC_REGION_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_static_region_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_static_region_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_static_region_v
/

PROMPT == SV_SEC_COL_XSS_REGION_TITLES_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_region_titles_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_region_titles_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_region_titles_v
/

PROMPT == SV_SEC_COL_XSS_STD_RPT_COLS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_std_rpt_cols_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_std_rpt_cols_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_std_rpt_cols_v
/

PROMPT == SV_SEC_COL_XSS_IR_RPT_COLS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ir_rpt_cols_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ir_rpt_cols_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ir_rpt_cols_v
/

PROMPT == SV_SEC_COL_XSS_IR_LINK_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ir_link_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ir_link_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ir_link_v
/

PROMPT == SV_SEC_COL_XSS_PTAB_LABELS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ptab_labels_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ptab_labels_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ptab_labels_v
/

PROMPT == SV_SEC_COL_XSS_STAB_LABELS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_stab_labels_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_stab_labels_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_stab_labels_v
/

PROMPT == SV_SEC_COL_XSS_UNESC_HTP_REG_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_htp_reg_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_unesc_htp_reg_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_htp_reg_v
/

PROMPT == SV_SEC_COL_XSS_UNESC_HTP_PRC_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_htp_prc_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_unesc_htp_prc_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_htp_prc_v
/

PROMPT == SV_SEC_COL_XSS_UNESC_ITEMS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_items_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_unesc_items_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_items_v
/

PROMPT == SV_SEC_COL_XSS_PH_JS_GLOBALS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_js_globals_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ph_js_globals_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_js_globals_v
/

PROMPT == SV_SEC_COL_XSS_PH_JS_ONLOAD_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_js_onload_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ph_js_onload_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_js_onload_v
/

PROMPT == SV_SEC_COL_XSS_PH_HTML_HEAD_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_html_head_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ph_html_head_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_html_head_v
/

PROMPT == SV_SEC_COL_XSS_PH_HTML_BODY_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_html_body_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ph_html_body_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_html_body_v
/

PROMPT == SV_SEC_COL_XSS_PH_HEADER_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_header_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ph_header_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_header_v
/

PROMPT == SV_SEC_COL_XSS_PH_FOOTER_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_footer_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ph_footer_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_footer_v
/

PROMPT == SV_SEC_COL_XSS_PH_SUMMARY_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_summary_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_ph_summary_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_ph_summary_v
/

PROMPT == SV_SEC_COL_XSS_COL_HTML_EXPR_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_col_html_expr_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_col_html_expr_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_col_html_expr_v
/

PROMPT == SV_SEC_COL_XSS_COL_LINK_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_col_link_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_col_link_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_col_link_v
/

PROMPT == SV_SEC_COL_XSS_UNESC_ITEMS_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_items_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_unesc_items_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_unesc_items_v
/

PROMPT == SV_SEC_COL_XSS_PLSQL_OUTPUT_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_plsql_output_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_plsql_output_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_plsql_output_v
/

PROMPT == SV_SEC_COL_XSS_LINK_ICON_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_link_icon_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_link_icon_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_link_icon_v
/

PROMPT == SV_SEC_COL_XSS_SHOW_NULL_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_show_null_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_show_null_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_show_null_v
/

PROMPT == SV_SEC_COL_XSS_NO_DATA_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_no_data_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_no_data_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_no_data_v
/

PROMPT == SV_SEC_COL_XSS_MORE_DATA_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_more_data_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_more_data_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_more_data_v
/

PROMPT == SV_SEC_COL_XSS_REG_HEAD_FOOT_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_reg_head_foot_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_reg_head_foot_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_reg_head_foot_v
/

PROMPT == SV_SEC_COL_XSS_LIST_URL_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_list_url_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_list_url_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_list_url_v
/

PROMPT == SV_SEC_COL_XSS_LIST_ATTR_V
GRANT SELECT ON SV_SERT_@SV_VERSION@.sv_sec_col_xss_list_attr_v TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_col_xss_list_attr_v FOR SV_SERT_@SV_VERSION@.sv_sec_col_xss_list_attr_v
/

PROMPT == SVV_DBA_SYS_PRIVS
--GRANT SELECT ON SV_SERT_@SV_VERSION@.svv_dba_sys_privs TO ^parse_as_user
--/
--CREATE OR REPLACE SYNONYM ^parse_as_user.svv_dba_sys_privs FOR SV_SERT_@SV_VERSION@.svv_dba_sys_privs
--/

PROMPT == SVV_DBA_TAB_PRIVS
--GRANT SELECT ON SV_SERT_@SV_VERSION@.svv_dba_tab_privs TO ^parse_as_user
--/
--CREATE OR REPLACE SYNONYM ^parse_as_user.svv_dba_tab_privs FOR SV_SERT_@SV_VERSION@.svv_dba_tab_privs
--/

PROMPT == SVV_DBA_ROLE_PRIVS
--GRANT SELECT ON SV_SERT_@SV_VERSION@.svv_dba_role_privs TO ^parse_as_user
--/
--CREATE OR REPLACE SYNONYM ^parse_as_user.svv_dba_role_privs FOR SV_SERT_@SV_VERSION@.svv_dba_role_privs
--/

set concat on