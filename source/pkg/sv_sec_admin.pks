CREATE OR REPLACE PACKAGE sv_sec_admin
AS 

PROCEDURE reset_current_user_password
  (
  p_password                 IN VARCHAR2
  );

PROCEDURE get_user
  (
  p_user_name                IN VARCHAR2
  );

PROCEDURE delete_user
  (
  p_user_name                IN VARCHAR2
  );

PROCEDURE create_user
  (
  p_user_name                IN VARCHAR2,
  p_password                 IN VARCHAR2,
  p_email                    IN VARCHAR2,
  p_account_locked           IN VARCHAR2
  );

PROCEDURE update_user
  (
  p_user_name                IN VARCHAR2,
  p_password                 IN VARCHAR2,
  p_email                    IN VARCHAR2,
  p_account_locked           IN VARCHAR2,
  p_reset_password           IN VARCHAR2
  );

FUNCTION password_strength
  (
  p_user_name                IN VARCHAR2,
  p_password                 IN VARCHAR2
  )
  RETURN BOOLEAN;
  
FUNCTION run_password_validation
  (
  p_password                 IN VARCHAR2,
  p_password_verify          IN VARCHAR2,
  p_request                  IN VARCHAR2
  )
  RETURN BOOLEAN;
  


END sv_sec_admin;
/
