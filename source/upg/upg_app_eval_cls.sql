PROMPT  =============================================================================
PROMPT  == MIGRATING APP EVALUATION CLASSIFICATIONS
PROMPT  =============================================================================

-- Migrate any application evaluations classification results
DECLARE
  l_classification_id        NUMBER;
  l_classification_key       VARCHAR2(255);
BEGIN

-- Loop through all attribute values not associated with the DEFAULT set
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_app_eval_cls)
LOOP

  -- Get the CLASSIFICATION_KEY from the previous version
  SELECT classification_key INTO l_classification_key FROM ^upgrade_from_user_s..sv_sec_classifications
    WHERE classification_id = x.classification_id;

  -- Get the CLASSIFICATION_ID from the new version
  SELECT classification_id INTO l_classification_id FROM ^upgrade_to_user_s..sv_sec_classifications 
    WHERE classification_key = l_classification_key;

  INSERT INTO ^upgrade_to_user_s..sv_sec_app_eval_cls
    (
    app_eval_id,
    classification_id,
    approved_score,
    pending_score,
    raw_score,
    possible_score
    )
  VALUES
    (
    x.app_eval_id,
    l_classification_id,
    x.approved_score,
    x.pending_score,
    x.raw_score,
    x.possible_score
    );

  -- Reset the key and ID variables
  l_classification_id := NULL;
  l_classification_key := NULL;  

END LOOP;

END;
/
