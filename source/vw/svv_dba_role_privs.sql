CREATE OR REPLACE VIEW svv_dba_role_privs 
AS 
SELECT 
  *
FROM 
  sys.dba_role_privs
WHERE 
  grantee = (SELECT owner FROM apex_applications WHERE application_id = v('P200_APPLICATION_ID'))
/