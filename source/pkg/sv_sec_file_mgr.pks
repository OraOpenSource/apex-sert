CREATE OR REPLACE PACKAGE sv_sec_file_mgr
AS

PROCEDURE run_script
   (
  p_file_id                  IN NUMBER,
  p_attribute_set_key        IN VARCHAR2 DEFAULT NULL,
  p_application_id           IN NUMBER DEFAULT NULL,
  p_attribute_set_id         IN NUMBER DEFAULT NULL
   );

END sv_sec_file_mgr;
/
