PROMPT  =============================================================================
PROMPT  == MIGRATING ATTRIBUTE SETS
PROMPT  =============================================================================

-- Migrate any custom attribute sets
BEGIN

INSERT INTO ^upgrade_to_user_s..sv_sec_attribute_sets 
  SELECT * FROM  ^upgrade_from_user_s..sv_sec_attribute_sets WHERE attribute_set_id > 0;

END;
/
