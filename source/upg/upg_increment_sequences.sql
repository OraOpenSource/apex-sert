PROMPT  =============================================================================
PROMPT  == MIGRATING SEQUENCES
PROMPT  =============================================================================

-- SV_SEC_APP_EVAL_SEQ
DECLARE
  l_max NUMBER;
BEGIN
-- Get the MAX ID
SELECT MAX(app_eval_id) + 1 INTO l_max FROM SV_SERT_@SV_VERSION@.sv_sec_app_evals;

-- Drop and Recreate the Sequence
EXECUTE IMMEDIATE 'DROP SEQUENCE SV_SERT_@SV_VERSION@.sv_sec_app_eval_seq';
EXECUTE IMMEDIATE 'CREATE SEQUENCE SV_SERT_@SV_VERSION@.sv_sec_app_eval_seq START WITH ' || l_max;

END;
/
