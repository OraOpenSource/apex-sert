CREATE OR REPLACE PACKAGE sv_sert_apex.sert_test
AS

FUNCTION set_g_xss RETURN VARCHAR2;

FUNCTION set_p_xss RETURN VARCHAR2;

END sert_test;
/

