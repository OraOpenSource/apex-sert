PROMPT  =============================================================================
PROMPT  == MIGRATING TRANSACTIONAL DATA
PROMPT  =============================================================================

INSERT INTO ^upgrade_to_user_s..sv_lic_keys
  SELECT * FROM ^upgrade_from_user_s..sv_lic_keys
/

INSERT INTO ^upgrade_to_user_s..sv_sec_applications
  SELECT * FROM ^upgrade_from_user_s..sv_sec_applications
/

INSERT INTO ^upgrade_to_user_s..sv_sec_cover_page
  SELECT * FROM ^upgrade_from_user_s..sv_sec_cover_page
/
