PROMPT  =============================================================================
PROMPT  == MIGRATING NOTATIONS
PROMPT  =============================================================================

DECLARE
  l_attribute_key            VARCHAR2(255);
  l_attribute_id             NUMBER;
  l_attribute_set_key        VARCHAR2(255);
  l_attribute_set_id         NUMBER;
BEGIN

-- Loop through all notations
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_notations)
LOOP

  -- ATTRIBUTE_SET_KEY
  -- Get the ATTRIBUTE_SET_KEY from the previous version
  SELECT attribute_set_key INTO l_attribute_set_key FROM ^upgrade_from_user_s..sv_sec_attribute_sets
    WHERE attribute_set_id = x.attribute_set_id;
  -- Get the ATTRIBUTE_SET_ID from the new version
  SELECT attribute_set_id INTO l_attribute_set_id FROM ^upgrade_to_user_s..sv_sec_attribute_sets
    WHERE attribute_set_key = l_attribute_set_key;
  
  -- ATTRIBUTE_KEY
  IF x.attribute_id IS NOT NULL THEN
    -- Get the ATTRIBUTE_KEY from the previous version
    FOR y IN  
      (
      SELECT attribute_key FROM ^upgrade_from_user_s..sv_sec_attributes
        WHERE attribute_id = x.attribute_id
      )
    LOOP
      l_attribute_key := y.attribute_key;
    END LOOP;
    
    IF l_attribute_key IS NOT NULL THEN
      -- Get the ATTRIBUTE_ID from the new version
      FOR y IN (SELECT attribute_id FROM ^upgrade_to_user_s..sv_sec_attributes WHERE attribute_key = l_attribute_key)
      LOOP
        l_attribute_id := y.attribute_id;
      END LOOP;
    END IF;

    IF l_attribute_id IS NOT NULL THEN

      -- Insert the new attribute, using the lookup values where needed
      INSERT INTO ^upgrade_to_user_s..sv_sec_notations
        (
        attribute_set_id,
        application_id,
        attribute_id,
        page_id,
        component_id,
        column_id,
        notation,
        created_by,
        created_on,
        created_ws
        )
      VALUES
        (
        l_attribute_set_id,
        x.application_id,
        l_attribute_id,
        x.page_id,
        x.component_id,
        x.column_id,
        x.notation,
        x.created_by,
        x.created_on,
        (SELECT workspace_id FROM apex_applications WHERE application_id = x.application_id)
        );
      
    END IF;
  END IF;

  -- Reset the all key and ID variables
  l_attribute_key            := NULL;
  l_attribute_id             := NULL;
  l_attribute_set_key        := NULL;
  l_attribute_set_id         := NULL;

END LOOP;

END;
/
