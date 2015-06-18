PROMPT  =============================================================================
PROMPT  == MIGRATING APP EVALUATION CATEGORIES
PROMPT  =============================================================================

-- Migrate any application evaluations category results
DECLARE
  l_category_id              NUMBER;
  l_category_key             VARCHAR2(255);
BEGIN

-- Loop through all attribute values not associated with the DEFAULT set
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_app_eval_cat)
LOOP

  -- Get the CATEGORY_KEY from the previous version
  SELECT category_key INTO l_category_key FROM ^upgrade_from_user_s..sv_sec_categories
    WHERE category_id = x.category_id;

  -- Get the CATEGORY_ID from the new version
  FOR y IN (SELECT * FROM ^upgrade_to_user_s..sv_sec_categories WHERE category_key = l_category_key)
  LOOP
  
    INSERT INTO ^upgrade_to_user_s..sv_sec_app_eval_cat
      (
      app_eval_id,
      category_id,
      approved_score,
      pending_score,
      raw_score,
      possible_score
      )
    VALUES
      (
      x.app_eval_id,
      y.category_id,
      x.approved_score,
      x.pending_score,
      x.raw_score,
      x.possible_score
      );

  END LOOP;

  -- Reset the key and ID variables
  l_category_id := NULL;
  l_category_key := NULL;  

END LOOP;

END;
/
