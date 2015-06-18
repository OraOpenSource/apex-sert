CREATE OR REPLACE
PACKAGE BODY sv_sec_log_events
AS

--------------------------------------------------------------------------------
-- PROCEDURE: LOG_EXCEPTION_EVENT
--------------------------------------------------------------------------------
-- Log an EXCEPTION type event into SV_SEC_EVENTS
--------------------------------------------------------------------------------
PROCEDURE LOG_EXCEPTION_EVENT
  (
  p_event_key                IN VARCHAR2 DEFAULT NULL,
  p_number_affected          IN NUMBER   DEFAULT 1,
  p_application_id           IN NUMBER   DEFAULT NULL,
  p_attribute_id             IN NUMBER   DEFAULT NULL,
  p_page_id                  IN NUMBER   DEFAULT nv('G_APP_PAGE_ID'),
  p_component_id             IN VARCHAR2 DEFAULT NULL,
  p_column_id                IN NUMBER   DEFAULT NULL,
  p_message                  IN VARCHAR2 DEFAULT NULL,
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_attribute_set_id         IN NUMBER,
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID'),
  p_justification            IN VARCHAR2 DEFAULT NULL,
  p_exception_id             IN NUMBER   DEFAULT NULL
 )
IS
  l_event_type_id            sv_sec_events.event_type_id%type;
  l_event_message            sv_sec_events.event_message%type;
  l_event_message_txt        sv_sec_events.event_message_txt%TYPE;
  l_attribute_name           sv_sec_attributes.attribute_name%type;
  l_component_string         VARCHAR2(4000);
  l_page_title               VARCHAR2(4000);
  l_display_page             sv_sec_categories.display_page%TYPE;
  l_link_text                VARCHAR2(4000);
  l_workspace_id             NUMBER;
  l_admin_email              VARCHAR2(255) := 'noreply@noreply.com';
  l_msg                      VARCHAR2(32767);
  l_row                      VARCHAR2(1000);
  l_user_workspace           apex_workspaces.workspace%TYPE;
  l_user                     VARCHAR2(500);
  TYPE vc_t                  IS TABLE OF VARCHAR2(4000) INDEX BY binary_integer;
  l_email_arr                vc_t;
  l_role_name_arr            vc_t;
BEGIN

-- Get the workspace_id for the eSERT application
SELECT workspace_id INTO l_workspace_id FROM apex_applications WHERE alias = 'SERT';

-- Get the admin email address
FOR x IN (SELECT * FROM sv_sec_snippets WHERE snippet_key = 'EVAL_NOTIFICATION_FROM' AND snippet IS NOT NULL)
LOOP
  l_admin_email := x.snippet;
END LOOP;

-- Get the e-mail header and footer
SELECT snippet INTO l_email_arr(1) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_HEADER';
SELECT snippet INTO l_email_arr(2) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_TABLE_EXCEPTION_OPEN';
SELECT snippet INTO l_email_arr(3) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_TABLE_CLOSE';
SELECT snippet INTO l_email_arr(4) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_CSS';
SELECT snippet INTO l_email_arr(5) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_FOOTER';

-- Get the event data for the related event.
SELECT
  event_type_id,
  event_message
INTO
  l_event_type_id,
  l_event_message
FROM
  sv_sec_event_types
WHERE
  event_type_key = p_event_key;

-- Get any information we need about the ATTRIBUTE
IF p_attribute_id IS NOT NULL THEN
  
  SELECT
    attribute_name
  INTO
    l_attribute_name
  FROM
    sv_sec_attributes
  WHERE
    attribute_id = p_attribute_id;

END IF;

-- Get any information we need about the PAGE being recalced
IF p_page_id IS NOT NULL AND P_EVENT_KEY IN ('RECALC_PAGE','RECALC_APP') THEN
  
  SELECT
    page_title
  INTO
    l_page_title
  FROM
    apex_application_pages
  WHERE
    application_id = p_sert_app_id
    AND page_id    = p_page_id;

END IF;

-- Get info we need about the component.
NULL;

-- Fill in the tokens in the event message
-- Replace #APP_ID# with the actual ID
l_event_message := REPLACE(l_event_message, '#APP_ID#', p_application_id);

-- Replace #PAGE_ID# with the actual ID
l_event_message := REPLACE(l_event_message, '#PAGE_ID#', l_page_title);

-- Replace #APP_USER# with the actual User
l_event_message := REPLACE(l_event_message, '#APP_USER#', p_app_user);

l_event_message_txt := l_event_message;


-- Replace #ATTRIBUTE# 
-- Now build the link text
l_link_text := l_attribute_name;
-- Do the replace
l_event_message := REPLACE(l_event_message, '#ATTRIBUTE#', l_link_text);
l_event_message_txt := REPLACE(l_event_message_txt, '#ATTRIBUTE#', l_attribute_name);

-- Replace #AFFECTED# with the actual ID
l_event_message := REPLACE(l_event_message, '#AFFECTED#', p_number_affected);
l_event_message_txt := REPLACE(l_event_message_txt, '#AFFECTED#', p_number_affected);


-- Insert the message into the events table.
INSERT INTO SV_SEC_EVENTS
  (
  EVENT_TYPE_ID,
  attribute_set_id,
  application_id,
  attribute_id,
  PAGE_ID,
  COMPONENT_ID,
  COLUMN_ID,
  EVENT_MESSAGE,
  event_message_txt,
  NOTATION,
  TARGET_PAGE_ID,
  CREATED_BY,
  CREATED_ON,
  created_ws
  )
  VALUES
  (
  l_event_type_id,
  p_attribute_set_id,
  p_application_id,
  p_attribute_id,
  p_page_id,
  p_component_id,
  p_column_id,
  l_event_message,
  l_event_message_txt,
  P_MESSAGE,
  p_page_id,
  p_app_user,
  sysdate,
  p_user_workspace_id
  );
    
-- Next, send out a notification to those who subscribed for rejections, approvals and submissions
IF p_event_key IN ('REJECTED','APPROVED','SUBMITTED') THEN

  -- Determine the role and user based on the action
  CASE
    WHEN p_event_key = 'SUBMITTED' THEN
      l_role_name_arr(1) := 'SV_SERT_APPROVER';
      l_role_name_arr(2) := 'SV_SERT_APPROVER_ALL';
        
      -- Concatenate the User Name and Workspace ID
      l_user := p_app_user||p_user_workspace_id;
        
    WHEN p_event_key IN ('APPROVED','REJECTED') THEN
      l_role_name_arr(1) := 'SV_SERT_EVALUATOR';
      l_role_name_arr(2) := 'SV_SERT_EVALUATOR_SCHEDULER_ALL';

      -- Get the original owner of the exception for the user
      FOR x IN (SELECT created_by||created_ws user_name FROM sv_sec_exceptions WHERE exception_id = p_exception_id)
      LOOP
        l_user := x.user_name;
      END LOOP;

  END CASE;        

  -- Create an APEX session
  wwv_flow_api.set_security_group_id(l_workspace_id);
  
  -- Get the Workspace Name
  SELECT workspace INTO l_user_workspace FROM apex_workspaces WHERE workspace_id = p_user_workspace_id;

  -- Assemble the body of the message      
  l_row := l_row || '<tr>'
    || '<td class="dataAlt">' || p_app_user || ' (' || l_user_workspace || ')</td>'
    || '<td class="dataAlt">' || TO_CHAR(SYSDATE,'DD-MON-YYYY HH:MIPM') || '</td>'
    || '<td class="dataAlt" style="text-align:left;">' || l_event_message_txt || '</td>'
    || '<td class="dataAlt" style="text-align:left;">' || p_justification || '</td>'
    || '</tr>';

  -- Assemble the message
  l_msg := l_email_arr(1) || l_email_arr(2) || l_row || l_email_arr(3) || l_email_arr(4) || l_email_arr(5);

  -- Loop through all users who wish to immediately be notified
  FOR x IN 
    (
    SELECT DISTINCT email FROM
      (
      -- Users in both ROLE and NOTIF
      SELECT
        au.email
      FROM
        sv_sec_user_roles ur,
        (SELECT * FROM sv_sec_user_notif_prefs WHERE new_exception_notify = 'IMMEDIATELY') unp,
        apex_workspace_apex_users au,
        apex_applications a
      WHERE
        ur.user_name||ur.user_workspace_id||ur.role_name||ur.workspace_id = unp.user_name||unp.user_workspace_id||unp.role_name||unp.workspace_id
        AND ur.user_name||ur.user_workspace_id = au.user_name||au.workspace_id
        AND ur.workspace_id = a.workspace_id
        AND a.application_id = p_application_id
        AND ur.role_name = l_role_name_arr(1)
        AND au.email IS NOT NULL 
        AND 1 = CASE 
          WHEN p_event_key  = 'SUBMITTED' AND ur.user_name||ur.user_workspace_id != l_user THEN 1
          WHEN p_event_key != 'SUBMITTED' AND ur.user_name||ur.user_workspace_id  = l_user THEN 1
          ELSE 0 
        END
      UNION
      -- Users only in NOTIF (no roles, but evaluators in their own workspaces)
      SELECT
        au.email
      FROM
        (SELECT * FROM sv_sec_user_notif_prefs WHERE new_exception_notify = 'IMMEDIATELY') unp,
        apex_workspace_apex_users au,
        apex_applications a
      WHERE
        unp.user_name||unp.user_workspace_id = au.user_name||au.workspace_id
        AND unp.workspace_id = a.workspace_id
        AND a.application_id = p_application_id
        AND unp.role_name = l_role_name_arr(1)
        AND au.email IS NOT NULL 
        AND 1 = CASE 
          WHEN p_event_key  = 'SUBMITTED' AND unp.user_name||unp.user_workspace_id != l_user THEN 1
          WHEN p_event_key != 'SUBMITTED' AND unp.user_name||unp.user_workspace_id  = l_user THEN 1
          ELSE 0 
        END
      -- Users with _ALL roles
      UNION
      SELECT
        au.email
      FROM
        sv_sec_user_roles ur,
        (SELECT * FROM sv_sec_user_notif_prefs WHERE new_exception_notify = 'IMMEDIATELY') unp,
        apex_workspace_apex_users au
      WHERE
        ur.user_name||ur.user_workspace_id||ur.role_name||ur.workspace_id = unp.user_name||unp.user_workspace_id||unp.role_name||unp.workspace_id
        AND ur.user_name||ur.user_workspace_id = au.user_name||au.workspace_id
        AND ur.role_name = l_role_name_arr(2)
        AND au.email IS NOT NULL 
        AND 1 = CASE 
          WHEN p_event_key  = 'SUBMITTED' AND ur.user_name||ur.user_workspace_id != l_user THEN 1
          WHEN p_event_key != 'SUBMITTED' AND ur.user_name||ur.user_workspace_id  = l_user THEN 1
          ELSE 0 
        END
      )
    )
  LOOP
      
    -- Send the message
    apex_mail.send
      (
      p_to        => x.email,
      p_from      => l_admin_email,
      p_subj      => 'eSERT: Exception ' || INITCAP(p_event_key) || ' in Application ' || p_application_id,
      p_body      => 'Please use an HTML-capable e-mail client to view this message.',
      p_body_html => l_msg
      );
        
  END LOOP;

  -- Push the APEX Mail Queue
  apex_mail.push_queue;
  
END IF;
    
EXCEPTION
WHEN OTHERS THEN
  sv_sec_error.raise_unanticipated;

END LOG_EXCEPTION_EVENT;


END SV_SEC_LOG_EVENTS;