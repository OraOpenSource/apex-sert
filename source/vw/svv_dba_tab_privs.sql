CREATE OR REPLACE VIEW svv_dba_tab_privs 
AS 
SELECT 
  *
FROM 
  sys.dba_tab_privs
WHERE 
  grantee = (SELECT owner FROM apex_applications WHERE application_id = v('P200_APPLICATION_ID'))
/