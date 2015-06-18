PROMPT  =============================================================================
PROMPT  == MIGRATING EVENTS
PROMPT  =============================================================================

DECLARE
  l_event_type_key           VARCHAR2(255);
  l_event_type_id            NUMBER;
  l_attribute_key            VARCHAR2(255);
  l_attribute_id             NUMBER;
  l_attribute_set_key        VARCHAR2(255);
  l_attribute_set_id         NUMBER;
BEGIN

-- Loop through all events
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_events)
LOOP

  -- EVENT_TYPE_KEY
  -- Get the EVENT_TYPE_KEY from the previous version
  SELECT event_type_key INTO l_event_type_key FROM ^upgrade_from_user_s..sv_sec_event_types
    WHERE event_type_id = x.event_type_id;
  -- Get the EVENT_T	YPE_ID from the new version
  SELECT event_type_id INTO l_event_type_id FROM ^upgrade_to_user_s..sv_sec_event_types 
    WHERE event_type_key = l_event_type_key;

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
  END IF;
  
  -- Insert the new attribute, using the lookup values where needed
  INSERT INTO ^upgrade_to_user_s..sv_sec_events
    (
    event_type_id,
    attribute_set_id,
    application_id,
    attribute_id,
    page_id,
    component_id,
    column_id,
    event_message,
    event_message_txt,
    created_by,
    created_on,
    target_page_id,
    notation
    )
  VALUES
    (
    l_event_type_id,
    l_attribute_set_id,
    x.application_id,    
    l_attribute_id,
    x.page_id,
    x.component_id,
    x.column_id,
    x.event_message,
    x.event_message_txt,
    x.created_by,
    x.created_on,
    x.target_page_id,
    x.notation    
    );

  -- Reset the all key and ID variables
  l_event_type_key           := NULL;
  l_event_type_id            := NULL;
  l_attribute_key            := NULL;
  l_attribute_id             := NULL;
  l_attribute_set_key        := NULL;
  l_attribute_set_id         := NULL;

END LOOP;

END;
/
