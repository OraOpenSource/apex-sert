PROMPT  =============================================================================
PROMPT  == MIGRATING SCHEDULED RESULTS
PROMPT  =============================================================================

DECLARE
  l_attribute_set_key        VARCHAR2(255);
  l_attribute_set_id         NUMBER;
BEGIN

-- Loop through all events
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_scheduled_results)
LOOP

  -- ATTRIBUTE_SET_KEY
  -- Get the ATTRIBUTE_SET_KEY from the previous version
  SELECT attribute_set_key INTO l_attribute_set_key FROM ^upgrade_from_user_s..sv_sec_attribute_sets
    WHERE attribute_set_id = x.attribute_set_id;
  -- Get the ATTRIBUTE_SET_ID from the new version
  SELECT attribute_set_id INTO l_attribute_set_id FROM ^upgrade_to_user_s..sv_sec_attribute_sets
    WHERE attribute_set_key = l_attribute_set_key;
  

  -- Insert the new result, using the lookup values where needed
  INSERT INTO ^upgrade_to_user_s..sv_sec_scheduled_results
    (
    app_eval_id,
    workspace_id,
    application_id,
    attribute_set_id,
    file_name,
    mime_type,
    file_contents,
    created_on,
    created_by
    )
  VALUES
    (
    x.app_eval_id,
    x.workspace_id,
    x.application_id,
    l_attribute_set_id,
    x.file_name,
    x.mime_type,
    x.file_contents,
    x.created_on,
    x.created_by
    );

  -- Reset the all key and ID variables
  l_attribute_set_key        := NULL;
  l_attribute_set_id         := NULL;

END LOOP;

END;
/
