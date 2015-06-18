create or replace PACKAGE sv_sec_help
AS

PROCEDURE display_help
  (
  p_component_id             IN VARCHAR2,
  p_component_type           IN VARCHAR2,
  p_page_id                  IN NUMBER DEFAULT NULL
  );
  
END sv_sec_help;
/