set define '^'
set concat off

PROMPT == SV_SEC_CATEGORIES
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_categories TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_categories AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_categories
/

PROMPT == SV_SEC_ATTRIBUTES
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_attributes TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_attributes AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_attributes
/

PROMPT == SV_SEC_ATTRIBUTE_SETS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_attribute_sets TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_attribute_sets AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_attribute_sets
/

PROMPT == SV_SEC_ATTRIBUTE_SET_ATTRS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_attribute_set_attrs TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_attribute_set_attrs AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_attribute_set_attrs
/

PROMPT == SV_SEC_ATTRIBUTE_VALUES
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_attribute_values TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_attribute_values AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_attribute_values
/

PROMPT == SV_SEC_VERSION
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_version TO ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_version FOR sv_sert_@SV_VERSION@.sv_sec_version
/

PROMPT == SV_SEC_HELP_TEXT
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_help_text TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_help_text AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_help_text
/

PROMPT == SV_SEC_HELP_INTER
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_help_inter TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_help_inter AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_help_inter
/

PROMPT == SV_SEC_RULE_TYPE
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_rule_type TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_rule_type AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_rule_type
/

PROMPT == SV_SEC_RULE_SOURCE
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_rule_source TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_rule_source AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_rule_source
/

PROMPT == SV_SEC_IMPACT
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_impact TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_impact AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_impact
/

PROMPT == SV_SEC_APEX_LINKS
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_apex_links TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_apex_links AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_apex_links
/

PROMPT == SV_SEC_APP_EVALS
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_app_evals TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_app_evals AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_app_evals
/

PROMPT == SV_SEC_APP_EVAL_CLS
GRANT SELECT, INSERT ON sv_sert_@SV_VERSION@.sv_sec_app_eval_cls TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_app_eval_cls AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_app_eval_cls
/

PROMPT == SV_SEC_APP_EVAL_CAT
GRANT SELECT, INSERT ON sv_sert_@SV_VERSION@.sv_sec_app_eval_cat TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_app_eval_cat AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_app_eval_cat
/

PROMPT == SV_SEC_APP_EVAL_ATTR
GRANT SELECT, INSERT ON sv_sert_@SV_VERSION@.sv_sec_app_eval_attr TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_app_eval_attr AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_app_eval_attr
/

PROMPT == SV_SEC_EXCEPTIONS
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_exceptions TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_exceptions AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_exceptions
/

PROMPT == SV_SEC_EXCEPTIONS_FAIL
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_exceptions_fail TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_exceptions_fail AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_exceptions_fail
/

PROMPT == SV_SEC_NOTATIONS
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_notations TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_notations AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_notations
/

PROMPT == SV_SEC_NOTATIONS_FAIL
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_notations_fail TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_notations_fail AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_notations_fail
/

PROMPT == SV_SEC_EVENT_TYPES
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_event_types TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_event_types AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_event_types
/

PROMPT == SV_SEC_EVENTS
GRANT SELECT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_events TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_events AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_events
/

PROMPT == SV_SEC_SNIPPETS
GRANT SELECT, UPDATE ON sv_sert_@SV_VERSION@.sv_sec_snippets TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_snippets AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_snippets
/

PROMPT == SV_SEC_RESULT_TEMP
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_result_temp TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_result_temp AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_result_temp
/

PROMPT == SV_SEC_CLASSIFICATIONS
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_classifications TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_classifications AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_classifications
/

PROMPT == SV_SEC_PREF_DEFAULTS
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_pref_defaults TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_pref_defaults AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_pref_defaults
/

PROMPT == SV_SEC_ATTR_RPT_INTER
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_attr_rpt_inter TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_attr_rpt_inter AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_attr_rpt_inter
/

PROMPT == SV_SEC_ATTR_RPT_COLS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_attr_rpt_cols TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_attr_rpt_cols AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_attr_rpt_cols
/

PROMPT == SV_SEC_SCRIPT_FILES
GRANT SELECT, INSERT, UPDATE ON sv_sert_@SV_VERSION@.sv_sec_script_files TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_script_files AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_script_files
/

PROMPT == SV_SEC_PDF_TEMP
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_pdf_temp TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_pdf_temp AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_pdf_temp
/

PROMPT == SV_SEC_COOKIE_SESSIONS
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_cookie_sessions TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_cookie_sessions AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_cookie_sessions
/


-- COLLECTION tables
PROMPT == SV_SEC_SCORE_COLLECTIONS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_score_collections TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_score_collections AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_score_collections
/

PROMPT == SV_SEC_COLLECTION_DATA
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_collection_data TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_collection_data AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_collection_data
/

PROMPT == SV_SEC_COLLECTION
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_collection TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_collection AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_collection
/

PROMPT == SV_SEC_COL_TEMPLATES
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_col_templates TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_col_templates AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_col_templates
/

PROMPT == SV_SEC_COVER_PAGE
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_cover_page TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_cover_page AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_cover_page
/

PROMPT == SV_SEC_COMPONENT_SIGS
GRANT SELECT ON sv_sert_@SV_VERSION@.sv_sec_component_sigs TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_component_sigs AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_component_sigs
/

PROMPT == SV_SEC_SCHEDULED_RESULTS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_scheduled_results TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_scheduled_results AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_scheduled_results
/

PROMPT == SV_SEC_SCHED_GRP
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_sched_grp TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_sched_grp AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_sched_grp
/

PROMPT == SV_SEC_SCHED_GRP_APPS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_sched_grp_apps TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_sched_grp_apps AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_sched_grp_apps
/

PROMPT == SV_SEC_SCHED_LISTS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_sched_lists TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_sched_lists AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_sched_lists
/

PROMPT == SV_SEC_SCHED_LIST_MEMBERS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_sched_list_members TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_sched_list_members AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_sched_list_members
/

PROMPT == SV_SEC_SCHED_EVALS
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_sched_evals TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_sched_evals AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_sched_evals
/

PROMPT == SV_SEC_SCHED_GRP_EVALS
GRANT SELECT, INSERT, DELETE ON sv_sert_@SV_VERSION@.sv_sec_sched_grp_evals TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_sched_grp_evals AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_sched_grp_evals
/

PROMPT == SV_SEC_USER_ROLES
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_user_roles TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_user_roles AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_user_roles
/

PROMPT == SV_SEC_USER_ROLES
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.sv_sec_user_notif_prefs TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.sv_sec_user_notif_prefs AS SELECT * FROM sv_sert_@SV_VERSION@.sv_sec_user_notif_prefs
/

-- LOGGER tables

PROMPT == LOGGER_PREFS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.logger_prefs TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.logger_prefs AS SELECT * FROM sv_sert_@SV_VERSION@.logger_prefs
/

PROMPT == LOGGER_LOGS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.logger_logs TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.logger_logs AS SELECT * FROM sv_sert_@SV_VERSION@.logger_logs
/

PROMPT == LOGGER_LOGS_APEX_ITEMS
GRANT SELECT, INSERT, UPDATE, DELETE ON sv_sert_@SV_VERSION@.logger_logs_apex_items TO ^parse_as_user
/
CREATE OR REPLACE VIEW ^parse_as_user.logger_logs_apex_items AS SELECT * FROM sv_sert_@SV_VERSION@.logger_logs_apex_items
/


set concat on