set define '^'
set concat off

PROMPT == SV_SEC_ERROR
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_error to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_error FOR sv_sert_@SV_VERSION@.sv_sec_error
/

PROMPT == SV_SEC
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec FOR sv_sert_@SV_VERSION@.sv_sec
/

PROMPT == SV_SEC_UTIL
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_util to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_util FOR sv_sert_@SV_VERSION@.sv_sec_util
/

PROMPT == SV_SEC_PREF
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_pref to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_pref FOR sv_sert_@SV_VERSION@.sv_sec_pref
/

PROMPT == SV_SEC_HELP
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_help to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_help FOR sv_sert_@SV_VERSION@.sv_sec_help
/

PROMPT == SV_SEC_RULES
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_rules to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_rules FOR sv_sert_@SV_VERSION@.sv_sec_rules
/

PROMPT == SV_SEC_EXPORT
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_export to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_export FOR sv_sert_@SV_VERSION@.sv_sec_export
/

PROMPT == SV_SEC_IMPORT
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_import to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_import FOR sv_sert_@SV_VERSION@.sv_sec_import
/

PROMPT == SV_SEC_LOG_EVENTS
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_log_events to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_log_events FOR sv_sert_@SV_VERSION@.sv_sec_log_events
/

PROMPT == SV_SEC_COLLECTIONS
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_collections to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_collections FOR sv_sert_@SV_VERSION@.sv_sec_collections
/

PROMPT == LOGGER
GRANT EXECUTE on sv_sert_@SV_VERSION@.logger to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.logger FOR sv_sert_@SV_VERSION@.logger
/

PROMPT == SV_SEC_FILE_MGR
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_file_mgr to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_file_mgr FOR sv_sert_@SV_VERSION@.sv_sec_file_mgr
/

PROMPT == SV_SEC_SCHEDULER
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_scheduler to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_scheduler FOR sv_sert_@SV_VERSION@.sv_sec_scheduler
/

PROMPT == SV_SEC_EXCEPTION
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_exception to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_exception FOR sv_sert_@SV_VERSION@.sv_sec_exception
/

PROMPT == SV_SEC_ADMIN
GRANT EXECUTE on sv_sert_@SV_VERSION@.sv_sec_admin to ^parse_as_user
/
CREATE OR REPLACE SYNONYM ^parse_as_user.sv_sec_admin FOR sv_sert_@SV_VERSION@.sv_sec_admin
/

set concat on