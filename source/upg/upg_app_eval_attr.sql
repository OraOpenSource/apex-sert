PROMPT  =============================================================================
PROMPT  == MIGRATING APP EVALUATION ATTRIBUTES
PROMPT  =============================================================================

-- Migrate any application evaluations category results
DECLARE
  l_attribute_id             NUMBER;
  l_attribute_key            VARCHAR2(255);
BEGIN

-- Loop through all attribute values not associated with the DEFAULT set
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_app_eval_attr)
LOOP

  -- Get the ATTRIBUTE_KEY from the previous version
  FOR y IN (SELECT attribute_key FROM ^upgrade_from_user_s..sv_sec_attributes WHERE attribute_id = x.attribute_id)
  LOOP
    l_attribute_key := y.attribute_key;
  END LOOP;
  
  IF l_attribute_key IS NOT NULL THEN

    -- Get the ATTRIBUTE_ID from the new version
    FOR Y IN (SELECT * FROM ^upgrade_to_user_s..sv_sec_attributes WHERE attribute_key = l_attribute_key)
    LOOP
  
      INSERT INTO ^upgrade_to_user_s..sv_sec_app_eval_attr
        (
        app_eval_id,
        attribute_id,
        approved_score,
        pending_score,
        raw_score,
        possible_score
        )
      VALUES
        (
        x.app_eval_id,
        y.attribute_id,
        x.approved_score,
        x.pending_score,
        x.raw_score,
        x.possible_score
        );
       
    END LOOP;
  END IF;
  
  -- Reset the key and ID variables
  l_attribute_id := NULL;
  l_attribute_key := NULL;  

END LOOP;

END;
/
