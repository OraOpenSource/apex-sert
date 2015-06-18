CREATE OR REPLACE PACKAGE sv_sec_export
AS 

PROCEDURE create_script 
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_attribute_set_id         IN VARCHAR2 DEFAULT -1,
  p_apex_version             IN VARCHAR2 DEFAULT NULL
  );

PROCEDURE create_attr_set_script 
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_attribute_set_id         IN VARCHAR2,
  p_export_all               IN BOOLEAN DEFAULT FALSE,
  p_apex_version             IN VARCHAR2
  );

PROCEDURE create_all_attr_set_script 
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_apex_version             IN VARCHAR2
  );

PROCEDURE exceptions_script
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER
  );

PROCEDURE notations_script
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER
  );

END sv_sec_export;
/