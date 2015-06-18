create or replace
PACKAGE BODY sv_sec_pref
AS 

--------------------------------------------------------------------------------
-- PROCEDURE: I N I T _ P R E F E R E N C E S
--------------------------------------------------------------------------------
-- Initializes Preferences for a User
--------------------------------------------------------------------------------
PROCEDURE init_preferences
  (
  p_app_user                 IN VARCHAR2,
  p_app_session              IN NUMBER
  )
IS
BEGIN
-- Loop through all preference defaults and set those to defaults that are not set
IF p_app_user IS NOT NULL THEN
  FOR x IN
    (SELECT * FROM sv_sec_pref_defaults)
  LOOP

    IF apex_util.get_preference(p_preference => x.pref_key, p_user => p_app_user) IS NULL THEN
      apex_util.set_preference(p_preference => x.pref_key, p_value => x.pref_default, p_user => p_app_user);
    END IF;

    -- Set the default Score Type
    IF x.pref_key = 'SCORE_TYPE' THEN

      sv_sec_util.populate_result
        (
        p_result       => apex_util.get_preference(p_preference => 'SCORE_TYPE', p_user => p_app_user),
        p_app_user     => p_app_user,
        p_app_session  => p_app_session
        );
  
      apex_util.set_session_state('P0_RESULT', apex_util.get_preference(p_preference => x.pref_key, p_user => p_app_user));
  
    END IF;

  END LOOP;

  apex_util.set_session_state(p_name => 'G_PREF_SET', p_value => 'YES');

  -- Clean up SV_SEC_RESULT_TEMP
  DELETE FROM sv_sec_result_temp WHERE app_user = p_app_user AND created_on < (SYSDATE - 2);

END IF;

END init_preferences;

--------------------------------------------------------------------------------
-- FUNCTION: G E T _ D E F A U L T _ P R E F E R E N C E
--------------------------------------------------------------------------------
-- Gets the default value of a preference if a user has not specified one
--------------------------------------------------------------------------------
FUNCTION get_default_preference
  (
  p_pref_key                 IN VARCHAR2  
  )
RETURN VARCHAR2
IS
  l_pref_default             sv_sec_pref_defaults.pref_default%TYPE;
BEGIN

FOR x IN
  (SELECT pref_default FROM sv_sec_pref_defaults WHERE pref_key = p_pref_key)
LOOP
  l_pref_default := x.pref_default;
END LOOP;

RETURN l_pref_default;

END get_default_preference;


--------------------------------------------------------------------------------
-- PROCEDURE: S A V E _ P R E F E R E N C E S
--------------------------------------------------------------------------------
-- Saves a users preferences
--------------------------------------------------------------------------------
PROCEDURE save_preferences
IS
  l_app_user                 VARCHAR2(255) := v('G_WORKSPACE_ID') || '.' || v('APP_USER');
BEGIN

-- Loop through all page items and save them as their corresponding preference
FOR x IN 
  (
  SELECT
    item_name
  FROM 
    apex_application_page_items 
  WHERE 
    application_id = nv('APP_ID') 
    AND page_id = 2000
  )
LOOP

  apex_util.set_preference(
    p_preference => SUBSTR(x.item_name, 7), 
    p_user       => l_app_user,
    p_value      => v(x.item_name));

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END save_preferences;


--------------------------------------------------------------------------------
-- PROCEDURE: R E S E T _ P R E F E R E N C E S
--------------------------------------------------------------------------------
-- Resets a users preferences
--------------------------------------------------------------------------------
PROCEDURE reset_preferences
IS
  l_app_user                 VARCHAR2(255) := v('G_WORKSPACE_ID') || '.' || v('APP_USER');
BEGIN

-- Loop through all page items and save them as their corresponding preference
FOR x IN 
  (
  SELECT
    item_name
  FROM 
    apex_application_page_items 
  WHERE 
    application_id = nv('APP_ID') 
    AND page_id = 2000
  )
LOOP

  apex_util.remove_preference(
    p_preference => SUBSTR(x.item_name, 7), 
    p_user => l_app_user
    );
    
END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END reset_preferences;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_pref;