PROMPT  =============================================================================
PROMPT  == MIGRATING APP EVALUATIONS
PROMPT  =============================================================================

-- Migrate any application evaluations
BEGIN

INSERT INTO ^upgrade_to_user_s..sv_sec_app_evals (app_eval_id, attribute_set_id, application_id, app_user, evaluated_ws, eval_date, scheduled_eval, approved_score, pending_score, raw_score)
  SELECT app_eval_id, attribute_set_id, application_id, app_user, (SELECT workspace_id FROM apex_applications WHERE application_id = sae.application_id), eval_date, 'N', approved_score, pending_score, raw_score 
    FROM  ^upgrade_from_user_s..sv_sec_app_evals sae;

END;
/
