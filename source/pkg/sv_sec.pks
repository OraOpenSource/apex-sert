CREATE OR REPLACE PACKAGE sv_sec
AS 

  c_guid CONSTANT varchar2(1000) := '9985453653DB61D2E04098427CBF1C00';

FUNCTION get_guid
 return varchar2;

FUNCTION get_result
  (
  p_attribute_key            IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_value                    IN VARCHAR2,
  p_recommended_value        IN VARCHAR2 DEFAULT NULL,
  p_show_value               IN VARCHAR2 DEFAULT 'N',
  p_image                    IN VARCHAR2 DEFAULT 'Y',
  p_exception_key            IN VARCHAR2 DEFAULT NULL,
  p_inline                   IN VARCHAR2 DEFAULT 'N'
  )
RETURN VARCHAR2;


FUNCTION get_recommended_value
  (
  p_attribute_set_id         IN NUMBER,
  p_attribute_key            IN VARCHAR2
  )
RETURN VARCHAR2;

PROCEDURE summary_dashboard
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID')
  );

FUNCTION dashboard
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER   DEFAULT nv('APP_PAGE_ID'),
  p_format                   IN VARCHAR2 DEFAULT 'HTML',
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID')
  )
RETURN VARCHAR2;

FUNCTION calc_score
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER  DEFAULT NULL,
  p_request                  IN VARCHAR2 DEFAULT v('REQUEST'),
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_workspace_id             IN NUMBER   DEFAULT nv('G_WORKSPACE_ID'),
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_owner                    IN VARCHAR2,
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID'),
  p_scheduled_eval           IN VARCHAR2 DEFAULT 'N'
  )
RETURN VARCHAR2;

END sv_sec;
/
