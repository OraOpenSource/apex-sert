create or replace PACKAGE sv_sec_exception
AS

FUNCTION get_exception_id
  (
  p_exception_pk             IN VARCHAR2,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER  
  )
RETURN NUMBER;

PROCEDURE save_exception
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_exception_pk             IN VARCHAR2,
  p_justification            IN VARCHAR2,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  );

PROCEDURE save_approval
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_exception_pk             IN VARCHAR2,
  p_val                      IN CLOB DEFAULT NULL,
  p_checksum                 IN VARCHAR2 DEFAULT NULL,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
 );

PROCEDURE save_rejection
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_exception_pk             IN VARCHAR2,
  p_rejection                IN VARCHAR2,
  p_val                      IN CLOB     DEFAULT NULL,
  p_checksum                 IN VARCHAR2 DEFAULT NULL,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  );
  
PROCEDURE save_notation
  (
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_notation_pk              IN VARCHAR2,
  p_notation_msg             IN VARCHAR2,
  p_workspace_id             IN VARCHAR2,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  );

PROCEDURE delete_notation
  (
  p_notation_id              IN NUMBER
  );

FUNCTION get_exception
  (
  p_exception_pk             IN VARCHAR2
  )
RETURN VARCHAR2;

FUNCTION get_approval
  (
  p_exception_pk             IN VARCHAR2
  )
RETURN VARCHAR2;

PROCEDURE delete_exception
  (
  p_exception_pk             IN VARCHAR2
  );
  
PROCEDURE apply_exceptions
  (
  p_collection_id            IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_attribute_id             IN NUMBER DEFAULT NULL,
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN VARCHAR2 DEFAULT v('APP_ID'),
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  );  
  
END sv_sec_exception;
/ 