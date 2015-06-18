CREATE OR REPLACE VIEW svv_dba_sys_privs 
AS 
SELECT 
  privilege 
FROM 
  sys.dba_sys_privs
WHERE 
  grantee = (SELECT owner FROM apex_applications WHERE application_id = v('P200_APPLICATION_ID'))
/