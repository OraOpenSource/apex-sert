CREATE OR REPLACE PROCEDURE sv_sec_log_exception_api
  (
  p_app_user                 IN VARCHAR2,
  p_justification            IN VARCHAR2,
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER,
  p_attribute_name           IN VARCHAR2,
  p_component_name           IN VARCHAR2,
  p_column_name              IN VARCHAR2,
  p_exception_id             IN NUMBER
  )
AS
BEGIN

NULL;

END sv_sec_log_exception_api;