create or replace
PACKAGE sv_sec_pref
AS 

PROCEDURE init_preferences
  (
  p_app_user                 IN VARCHAR2,
  p_app_session              IN NUMBER
  );

FUNCTION get_default_preference
  (
  p_pref_key                 IN VARCHAR2  
  )
RETURN VARCHAR2;

PROCEDURE save_preferences;

PROCEDURE reset_preferences;

END sv_sec_pref;