CREATE OR REPLACE PACKAGE BODY sv_sert_apex.sert_test
AS

FUNCTION set_g_xss RETURN VARCHAR2
IS
BEGIN
IF v('P1_SET_G_XSS') = 'Y' THEN
  IF v('P1_G_XSS') IS NULL THEN
    RETURN '<script>alert("Application Item XSS Vulnerability");</script>';
  ELSE
    RETURN v('P1_G_XSS');
  END IF;
ELSE
  RETURN NULL;
END IF;
END set_g_xss;

FUNCTION set_p_xss RETURN VARCHAR2
IS
BEGIN
IF v('P1_SET_P_XSS') = 'Y' THEN
  IF v('P1_P_XSS') IS NULL THEN
    RETURN '<script>alert("Page Item XSS Vulnerability");</script>';
  ELSE
    RETURN v('P1_P_XSS');
  END IF;
ELSE
  RETURN NULL;
END IF;
END set_p_xss;

END sert_test;
/
