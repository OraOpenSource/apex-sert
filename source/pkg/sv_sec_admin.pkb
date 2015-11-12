CREATE OR REPLACE PACKAGE BODY sv_sec_admin
AS 
--------------------------------------------------------------------------------
-- PROCEDURE: R E S E T _ C U R R E N T _ U S E R _ P A S S W O R D
--------------------------------------------------------------------------------
-- Resets a password
--------------------------------------------------------------------------------
PROCEDURE reset_current_user_password
  (
  p_password                 IN VARCHAR2
  )
IS
  l_result                   BOOLEAN;
BEGIN

-- Change the password
APEX_UTIL.CHANGE_CURRENT_USER_PW
  (
  p_new_password => p_password
  );
  
EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;
   
END reset_current_user_password;


--------------------------------------------------------------------------------
-- PROCEDURE: G E T _ U S E R 
--------------------------------------------------------------------------------
-- Fetches a User
--------------------------------------------------------------------------------
PROCEDURE get_user
  (
  p_user_name                IN VARCHAR2
  )
IS
BEGIN

-- Loop through the specific user record and set APEX item values
FOR x IN (SELECT * FROM apex_workspace_apex_users WHERE user_name = p_user_name AND workspace_id = nv('WORKSPACE_ID'))
LOOP

  apex_util.set_session_state('P310_USER_NAME',      x.user_name);
  apex_util.set_session_state('P310_EMAIL',          x.email);
  apex_util.set_session_state('P310_USER_ID',        apex_util.get_user_id(x.user_name));
  apex_util.set_session_state('P310_ACCOUNT_LOCKED', sv_sec_util.is_account_locked(p_user_name => x.user_name));
  
END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_user;


--------------------------------------------------------------------------------
-- PROCEDURE: D E L E T E _ U S E R 
--------------------------------------------------------------------------------
-- Deletes a User
--------------------------------------------------------------------------------
PROCEDURE delete_user
  (
  p_user_name                IN VARCHAR2
  )
IS
BEGIN

-- Remove the user
apex_util.remove_user(p_user_name => p_user_name);

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END delete_user;


--------------------------------------------------------------------------------
-- PROCEDURE: C R E A T E _ U S E R 
--------------------------------------------------------------------------------
-- Creates a User
--------------------------------------------------------------------------------
PROCEDURE create_user
  (
  p_user_name                IN VARCHAR2,
  p_password                 IN VARCHAR2,
  p_email                    IN VARCHAR2,
  p_account_locked           IN VARCHAR2
  )
IS
  l_parse_as                 VARCHAR2(100);
BEGIN

-- Get the Parse As schema
SELECT snippet INTO l_parse_as FROM sv_sec_snippets WHERE snippet_key = 'PARSE_AS';

-- Create the user
APEX_UTIL.CREATE_USER(
  p_user_name                     => p_user_name,
  p_web_password                  => p_password,
  p_email_address                 => p_email,
  p_developer_privs               => NULL,
  p_default_schema                => l_parse_as,
  p_allow_access_to_schemas       => l_parse_as,
  p_change_password_on_first_use  => 'Y',
  p_account_locked                => p_account_locked
  );
  
EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END create_user;


--------------------------------------------------------------------------------
-- PROCEDURE: U P D A T E _ U S E R 
--------------------------------------------------------------------------------
-- Updates a User
--------------------------------------------------------------------------------
PROCEDURE update_user
  (
  p_user_name                IN VARCHAR2,
  p_password                 IN VARCHAR2,
  p_email                    IN VARCHAR2,
  p_account_locked           IN VARCHAR2,
  p_reset_password           IN VARCHAR2
  )
IS
  l_msg                      VARCHAR2(4000);
  l_row                      VARCHAR2(1000);
  l_admin_email              VARCHAR2(255);
  TYPE vc_t                  IS TABLE OF VARCHAR2(4000) INDEX BY binary_integer;
  l_email_arr                vc_t;
BEGIN

IF p_password IS NULL THEN
  -- Update the user, but not the password
  APEX_UTIL.EDIT_USER(
    p_user_id                       => apex_util.get_user_id(p_user_name),
    p_user_name                     => p_user_name,
    p_email_address                 => p_email,
    p_account_locked                => p_account_locked,
    p_change_password_on_first_use  => p_reset_password
    );
ELSE
  -- Update the user and the password
  APEX_UTIL.EDIT_USER(
    p_user_id                       => apex_util.get_user_id(p_user_name),
    p_user_name                     => p_user_name,
    p_email_address                 => p_email,
    p_account_locked                => p_account_locked,
    p_web_password                  => p_password,
    p_new_password                  => p_password,
    p_change_password_on_first_use  => p_reset_password
    );


  -- Get the e-mail header and footer
  SELECT snippet INTO l_email_arr(1) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_HEADER';
  SELECT snippet INTO l_email_arr(2) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_TABLE_RESET_PW_OPEN';
  SELECT snippet INTO l_email_arr(3) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_TABLE_CLOSE';
  SELECT snippet INTO l_email_arr(4) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_CSS';
  SELECT snippet INTO l_email_arr(5) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_FOOTER';

  -- Get the e-mail address from the ADMIN and impacted user
  FOR x IN (SELECT * FROM apex_workspace_apex_users WHERE (user_name = 'ADMIN' OR user_name = p_user_name) AND workspace_id = nv('WORKSPACE_ID'))
  LOOP
    l_admin_email := x.email;
  END LOOP;

  -- Send an e-mail with the new password
  l_row := l_row || '<tr>'
    || '<td class="dataAlt" style="text-align:left;border:none;">NOTICE: The password for your SERT Admin account was recently changed. '
    || 'If you did not initiate this change or have any questions, please send an e-mail to ' || l_admin_email || ' immediately</td>'
    || '</tr>';

  -- Assemble the message
  l_msg := l_email_arr(1) || l_email_arr(2) || l_row || l_email_arr(3) || l_email_arr(4) || l_email_arr(5);

  -- Send the e-mail
  apex_mail.send
    (
    p_to        => p_email,
    p_from      => l_admin_email,
    p_subj      => 'SERT Admin User Password Updated',
    p_body      => 'Please use an HTML-capable mail reader to view this message.',
    p_body_html => l_msg
    );

  -- Push the mail queue manually
  apex_mail.push_queue;

END IF;
  
EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END update_user;


--------------------------------------------------------------------------------
-- FUNCTION: P A S S W O R D _ S T R E N G T H 
--------------------------------------------------------------------------------
-- Determines if a password meets the site strength criteria
--------------------------------------------------------------------------------
FUNCTION password_strength
  (
  p_user_name                IN VARCHAR2,
  p_password                 IN VARCHAR2
  )
  RETURN BOOLEAN
IS
  l_result                   VARCHAR2(4000);
BEGIN

-- Check the strength of the password
l_result := APEX_UTIL.STRONG_PASSWORD_VALIDATION
  (
  p_username       => p_user_name,
  p_password       => p_password,
  p_old_password   => NULL,
  p_workspace_name => 'DOES_NOT_APPLY'
  );

-- If there is a value, then fail and set G_RESULT
IF l_result IS NOT NULL THEN
  apex_util.set_session_state('G_RESULT', l_result);
  RETURN FALSE;
ELSE
  RETURN TRUE;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END password_strength;


--------------------------------------------------------------------------------
-- FUNCTION: R U N _ P A S S W O R D _ V A L I D A T I O N
--------------------------------------------------------------------------------
-- Determines whether or not to run a password validation from Page 310
--------------------------------------------------------------------------------
FUNCTION run_password_validation
  (
  p_password                 IN VARCHAR2,
  p_password_verify          IN VARCHAR2,
  p_request                  IN VARCHAR2
  )
  RETURN BOOLEAN
IS
BEGIN

-- Always run when creating
IF p_request = 'CREATE' THEN
  RETURN TRUE;
-- Only run when updating and a value is present in both password fields
ELSIF p_request = 'SAVE' AND p_password IS NULL AND p_password_verify IS NULL THEN
  RETURN FALSE;
ELSE
  RETURN TRUE;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END run_password_validation;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_admin;
/
