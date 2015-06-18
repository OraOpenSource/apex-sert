PROMPT  =============================================================================
PROMPT  == MIGRATING ATTRIBUTE SET ATTRIBUTES
PROMPT  =============================================================================

-- Migrate any custom attribute sets
DECLARE
  l_attribute_key            VARCHAR2(255);
  l_attribute_id             NUMBER;
BEGIN

FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_attribute_set_attrs WHERE attribute_set_id > 0)
LOOP

  -- Get the attribute key from the previous version
  SELECT attribute_key INTO l_attribute_key FROM ^upgrade_from_user_s..sv_sec_attributes
    WHERE attribute_id = x.attribute_id;

  -- Attempt to get the attribute ID from the newer version
  FOR y IN (SELECT * FROM ^upgrade_to_user_s..sv_sec_attributes WHERE attribute_key = l_attribute_key)
  LOOP
    l_attribute_id := y.attribute_id;
  END LOOP;

  -- If a key was found, then insert the new record
  IF l_attribute_id IS NOT NULL THEN
    INSERT INTO ^upgrade_to_user_s..sv_sec_attribute_set_attrs
      (
      attribute_set_id, 
      attribute_id, 
      active_flag
      )
    VALUES 
      (
      x.attribute_set_id, 
      l_attribute_id, 
      x.active_flag
      );
  END IF;
  
  -- Reset the key and ID variables
  l_attribute_id := NULL;
  l_attribute_key := NULL;  

END LOOP;

END;
/
