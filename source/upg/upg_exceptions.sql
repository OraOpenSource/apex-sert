PROMPT  =============================================================================
PROMPT  == MIGRATING EXCEPTIONS
PROMPT  =============================================================================

DECLARE
  l_attribute_key            VARCHAR2(255);
  l_attribute_id             NUMBER;
  l_attribute_set_key        VARCHAR2(255);
  l_attribute_set_id         NUMBER;
  l_created_ws               NUMBER;
  l_approved_ws              NUMBER;
  l_rejected_ws              NUMBER;
BEGIN

-- Loop through all exceptions
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_exceptions)
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
    SELECT attribute_key INTO l_attribute_key FROM ^upgrade_from_user_s..sv_sec_attributes
      WHERE attribute_id = x.attribute_id;
    -- Get the ATTRIBUTE_ID from the new version
    FOR y IN (SELECT attribute_id FROM ^upgrade_to_user_s..sv_sec_attributes WHERE attribute_key = l_attribute_key)
    LOOP
      l_attribute_id := y.attribute_id;
    END LOOP;
  END IF;

  -- CREATED_WS
  IF x.created_by IS NOT NULL THEN
    SELECT workspace_id INTO l_created_ws FROM apex_applications WHERE application_id = x.application_id;
  END IF;

  -- APPROVED_BY
  IF x.approved_by IS NOT NULL THEN
    SELECT workspace_id INTO l_approved_ws FROM apex_applications WHERE application_id = x.application_id;
  END IF;

  -- REJECTED_WS
  IF x.rejected_by IS NOT NULL THEN
    SELECT workspace_id INTO l_rejected_ws FROM apex_applications WHERE application_id = x.application_id;
  END IF;

  
  -- Insert the new attribute, using the lookup values where needed
  INSERT INTO ^upgrade_to_user_s..sv_sec_exceptions
    (
    attribute_set_id,
    application_id,
    attribute_id,
    page_id,
    component_id,
    column_id,
    justification,
    rejected_justification,
    rejection,
    approved_flag,
    prev_approved_flag,
    created_by,
    created_on,
    created_ws,
    approved_by,
    approved_on,
    approved_ws,
    rejected_by,
    rejected_on,
    rejected_ws,
    val,
    checksum
    )
  VALUES
    (
    l_attribute_set_id,
    x.application_id,
    l_attribute_id,
    x.page_id,
    x.component_id,
    x.column_id,
    x.justification,
    x.rejected_justification,
    x.rejection,
    x.approved_flag,
    x.prev_approved_flag,
    x.created_by,
    x.created_on,
    l_created_ws,
    x.approved_by,
    x.approved_on,
    l_approved_ws,
    x.rejected_by,
    x.rejected_on,
    l_rejected_ws,
    x.val,
    x.checksum
    );

  -- Reset the all key and ID variables
  l_attribute_key            := NULL;
  l_attribute_id             := NULL;
  l_attribute_set_key        := NULL;
  l_attribute_set_id         := NULL;
  l_created_ws               := NULL;
  l_approved_ws              := NULL;
  l_rejected_ws              := NULL;

END LOOP;

END;
/
