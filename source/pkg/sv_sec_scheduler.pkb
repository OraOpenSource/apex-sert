create or replace
PACKAGE BODY sv_sec_scheduler
AS 

--------------------------------------------------------------------------------
-- FUNCTION: C A L C _ S C O R E _ D I F F
--------------------------------------------------------------------------------
-- Calculates the score difference between the current and prev evaluation
--------------------------------------------------------------------------------
FUNCTION calc_score_diff
  (
  p_score_1                  IN NUMBER,
  p_score_2                  IN NUMBER
  )
RETURN VARCHAR2
IS
BEGIN

-- Score 2 is -1, meaning there was no previous review
IF p_score_2 = -1 THEN
  RETURN 'n/a';
-- Scores are the same
ELSIF p_score_1 = p_score_2 THEN
  RETURN 'No Change';
-- Score improved; return a green arrow and difference
ELSIF p_score_1 > p_score_2 THEN
  RETURN '<span style="color:green;font-weight:bold;">&#8593;' || (p_score_1 - p_score_2) || '%</span>';
-- Score got worse; return a red arrow and difference
ELSIF p_score_1 < p_score_2 THEN
  RETURN '<span style="color:red;font-weight:bold;">&#8595;'   || (p_score_2 - p_score_1) || '%</span>';
ELSE
  RETURN NULL;
END IF;

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END calc_score_diff;

--------------------------------------------------------------------------------
-- FUNCTION: G E T _ E V A L _ S C O R E S
--------------------------------------------------------------------------------
-- Produces the body of the e-mail for the evaluation
--------------------------------------------------------------------------------
PROCEDURE get_eval_scores
  (
  p_app_eval_id              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_rows                     IN OUT VARCHAR2
  )
IS
  TYPE vc_t                  IS TABLE OF VARCHAR2(4000) INDEX BY binary_integer;
  l_approved_score           vc_t;
  l_pending_score            vc_t;
  l_raw_score                vc_t;
  l_application_name         VARCHAR2(1000);
  l_prev_score_found         BOOLEAN := FALSE;
BEGIN

-- Get the scores for the eval
SELECT approved_score, pending_score, raw_score 
  INTO l_approved_score(1), l_pending_score(1), l_raw_score(1)
  FROM sv_sec_app_evals 
  WHERE app_eval_id = p_app_eval_id;

-- Get the scores for the previous eval, if one exists
FOR zz IN
  (
  SELECT * FROM
    (
    SELECT
      LEAD(approved_score,1) OVER (ORDER BY app_eval_id DESC) approved_score,
      LEAD(pending_score,1)  OVER (ORDER BY app_eval_id DESC) pending_score,
      LEAD(raw_score,1)      OVER (ORDER BY app_eval_id DESC) raw_score
    FROM 
      sv_sec_app_evals 
    WHERE 
      attribute_set_id =  p_attribute_set_id
      AND application_id = p_application_id
    ORDER BY 
      app_eval_id DESC
    )
  WHERE 
    rownum = 1
  )
LOOP
  l_approved_score(2) := zz.approved_score;
  l_pending_score(2)  := zz.pending_score;
  l_raw_score(2)      := zz.raw_score; 
END LOOP;
      
-- Get the Application Name
SELECT application_name INTO l_application_name FROM apex_applications WHERE application_id = p_application_id;

-- Calculate the differences
l_approved_score(3) := calc_score_diff(p_score_1 => l_approved_score(1), p_score_2 => NVL(l_approved_score(2),-1));
l_pending_score(3)  := calc_score_diff(p_score_1 => l_pending_score(1),  p_score_2 => NVL(l_pending_score(2), -1));
l_raw_score(3)      := calc_score_diff(p_score_1 => l_raw_score(1),      p_score_2 => NVL(l_raw_score(2),     -1));

-- Add the specific result to the e-mail
p_rows := p_rows 
  || '<tr>'
  || '<td class="dataAlt" style="text-align:left;">' || p_application_id || ' ' || l_application_name     || '</td>'
  || '<td class="dataAlt">' || l_approved_score(1) || '%</td><td class="dataAlt">' || l_approved_score(3) || '</td>'
  || '<td class="dataAlt">' || l_pending_score(1)  || '%</td><td class="dataAlt">' || l_pending_score(3)  || '</td>'
  || '<td class="dataAlt">' || l_raw_score(1)      || '%</td><td class="dataAlt">' || l_raw_score(3)      || '</td>'
  || '</tr>';

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  
END get_eval_scores;


--------------------------------------------------------------------------------
-- PROCEDURE: R U N _ S C H E D _ E V A L S
--------------------------------------------------------------------------------
-- Runs all scheduled evaluations
--------------------------------------------------------------------------------
PROCEDURE run_sched_evals
IS
  l_dummy                    VARCHAR2(4000);
  l_app_session              NUMBER;
  l_app_eval_id              NUMBER;
  l_sert_app_id              NUMBER;
  l_time_of_day              VARCHAR2(10);
  l_msg                      VARCHAR2(32767);
  l_rows                     VARCHAR2(10000);
  l_workspace_id             NUMBER;
  TYPE vc_t                  IS TABLE OF VARCHAR2(4000) INDEX BY binary_integer;
  l_file_id                  NUMBER;
  l_file_id_arr              vc_t;
  l_email_arr                vc_t;
  l_file_count               NUMBER := 1;
  l_email_id                 NUMBER;
  l_email                    VARCHAR2(1000);
  l_sched_grp_name           VARCHAR2(255);
  l_cgi_var_name             owa.vc_arr;
  l_cgi_var_val              owa.vc_arr;  
BEGIN

logger.log('START: SCHEDULED EVALS');

-- Snapshot the Time of Day in case of long running processes
l_time_of_day := TO_CHAR(SYSDATE,'HH24');

-- Get the APEX-SERT App ID
SELECT application_id, workspace_id INTO l_sert_app_id, l_workspace_id 
  FROM apex_applications WHERE alias = 'SERT';

-- Get the e-mail header and footer
SELECT snippet INTO l_email_arr(1) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_HEADER';
SELECT snippet INTO l_email_arr(2) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_TABLE_SCORE_OPEN';
SELECT snippet INTO l_email_arr(3) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_TABLE_CLOSE';
SELECT snippet INTO l_email_arr(4) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_CSS';
SELECT snippet INTO l_email_arr(5) FROM sv_sec_snippets WHERE snippet_key = 'EMAIL_FOOTER';

-- Get the e-mail FROM address
l_email_arr(6) := 'noreply@noreply.com';
FOR x IN (SELECT * FROM sv_sec_snippets WHERE snippet_key = 'EVAL_NOTIFICATION_FROM' AND snippet IS NOT NULL)
LOOP
  l_email_arr(6) := x.snippet;
END LOOP;

-- Define the App Session
l_app_session := -(APEX_CUSTOM_AUTH.GET_NEXT_SESSION_ID);

-- Initialize the buffer for an APEX session
htp.init;
l_cgi_var_name(1) := 'REQUEST_PROTOCOL';
l_cgi_var_val(1) := 'HTTP';

owa.init_cgi_env
  (
  num_params => 1,
  param_name => l_cgi_var_name,
  param_val  => l_cgi_var_val 
  );

-- Set the APEX Security Group
wwv_flow_api.set_security_group_id(l_workspace_id);

-- Set the APEX Session ID, App ID and Page ID
apex_application.g_instance := l_app_session;
apex_application.g_flow_id := l_sert_app_id;
apex_application.g_flow_step_id := 1;

-- Create the APEX session
apex_custom_auth.post_login
  (
  p_uname => 'ADMIN',
  p_session_id => l_app_session,
  p_app_page => apex_application.g_flow_id||':'||1
  );

-- Set the APEX item G_WORKSPACE_ID so that the views that reference it will work
apex_util.set_session_state('G_WORKSPACE_ID',l_workspace_id);

-- Run All Individual App Evals
FOR x IN
  (
  SELECT 
    * 
  FROM 
    sv_sec_sched_evals
  WHERE
    (eval_interval = 'DAILY' AND TO_CHAR(time_of_day) = l_time_of_day)
    OR (eval_interval = 'WEEKLY' AND TO_CHAR(time_of_day) = l_time_of_day AND day_of_week = TO_CHAR(SYSDATE,'DY'))
  )
LOOP

  logger.log('START: APP ' || x.application_id);

  -- Clear out the previous e-mail and body
  l_email := NULL;
  l_rows := NULL;

  -- Define the APP_EVAL_ID
  SELECT sv_sec_app_eval_seq.NEXTVAL INTO l_app_eval_id FROM dual;

  -- Populates the result table based on the score type passed in
  sv_sec_util.populate_result
    (
    p_result                   => x.scoring_method,
    p_app_user                 => x.scheduled_by,
    p_app_session              => l_app_session  
    );

  FOR y IN (SELECT * FROM apex_applications WHERE application_id = x.application_id)
  LOOP

    -- Calculates the score
    l_dummy := sv_sec.calc_score
      (
      p_attribute_set_id         => x.attribute_set_id,
      p_application_id           => x.application_id,
      p_request                  => 'SCORE',
      p_app_user                 => x.scheduled_by,
      p_workspace_id             => y.workspace_id,
      p_sert_app_id              => l_sert_app_id,
      p_app_session              => l_app_session,
      p_owner                    => y.owner,
      p_app_eval_id              => l_app_eval_id,
      p_user_workspace_id        => x.scheduled_ws,
      p_scheduled_eval           => 'Y'
      );

    get_eval_scores
      (
      p_app_eval_id       => l_app_eval_id,
      p_attribute_set_id  => x.attribute_set_id,
      p_application_id    => x.application_id,
      p_rows              => l_rows
      );

  END LOOP;

  -- Get the e-mail address  
  FOR y IN (SELECT * FROM apex_workspace_apex_users WHERE user_name = x.scheduled_by AND workspace_id = x.scheduled_ws)
  LOOP
    l_email := y.email;
  END LOOP;

  IF l_email IS NOT NULL THEN
    -- Assemble the e-mail
    l_msg := l_email_arr(1) || l_email_arr(2) || l_rows || l_email_arr(3) || l_email_arr(4) || l_email_arr(5);

    -- Create the body of the email
    l_email_id := apex_mail.send
      (
      p_to            => l_email,
      p_from          => l_email_arr(6),
      p_subj          => 'APEX-SERT Scheduled Evaluation Results - Application ' || x.application_id,
      p_body          => 'Please use an HTML-capable e-mail client to view this message.',
      p_body_html     => l_msg
      );
        
  END IF;
  
  -- Clean up the colleciton
  DELETE FROM sv_sec_collection WHERE app_user = x.scheduled_by AND app_id = x.application_id AND app_session = l_app_session;

  logger.log('END: APP ' || x.application_id);

END LOOP;

-- Reset l_rows before starting Group Evaluations
l_rows := NULL;

-- Run all Group Evals
FOR x IN
  (
  SELECT 
    * 
  FROM 
    sv_sec_sched_grp_evals
  WHERE 1=1
    --(eval_interval = 'DAILY' AND TO_CHAR(time_of_day) = l_time_of_day)
    --OR (eval_interval = 'WEEKLY' AND TO_CHAR(time_of_day) = l_time_of_day AND day_of_week = TO_CHAR(SYSDATE,'DY'))
  )
LOOP

  -- Run through all matching groups
  FOR y IN (SELECT * FROM sv_sec_sched_grp_apps WHERE sched_grp_id = x.sched_grp_id ORDER BY application_id)
  LOOP

    -- Define the APP_EVAL_ID
    SELECT sv_sec_app_eval_seq.NEXTVAL INTO l_app_eval_id FROM dual;

    -- Populates the result table based on the score type passed in
    sv_sec_util.populate_result
      (
      p_result                   => y.scoring_method,
      p_app_user                 => y.created_by,
      p_app_session              => l_app_session 
      );

    FOR z IN (SELECT * FROM apex_applications WHERE application_id = y.application_id)
    LOOP

      -- Calculates the score
      l_dummy := sv_sec.calc_score
        (
        p_attribute_set_id         => y.attribute_set_id,
        p_application_id           => y.application_id,
        p_request                  => 'SCORE',
        p_app_user                 => y.created_by,
        p_workspace_id             => z.workspace_id,
        p_sert_app_id              => l_sert_app_id,
        p_app_session              => l_app_session,
        p_owner                    => z.owner,
        p_app_eval_id              => l_app_eval_id,
        p_user_workspace_id        => y.created_ws,
        p_scheduled_eval           => 'Y'
        );

      -- Genrate the e-mail body
      get_eval_scores
        (
        p_app_eval_id       => l_app_eval_id,
        p_attribute_set_id  => y.attribute_set_id,
        p_application_id    => y.application_id,
        p_rows              => l_rows
        );

    END LOOP;

    -- Clean up the colleciton
    DELETE FROM sv_sec_collection WHERE app_user = y.created_by AND app_id = y.application_id AND app_session = l_app_session;

  END LOOP;

  -- Assemble the e-mail
  l_msg := l_email_arr(1) || l_email_arr(2) || l_rows || l_email_arr(3) || l_email_arr(4) || l_email_arr(5);

  -- Get the Name of the Group
  SELECT sched_grp_name INTO l_sched_grp_name FROM sv_sec_sched_grp WHERE sched_grp_id = x.sched_grp_id;

  -- Send the e-mails
  FOR y IN
    (
    SELECT 
      lm.first_name, 
      lm.last_name, 
      lm.email, 
      lm.include_pdfs 
    FROM 
      sv_sec_sched_grp g, 
      sv_sec_sched_lists l, 
      sv_sec_sched_list_members lm 
    WHERE 
      g.sched_grp_id = x.sched_grp_id 
      AND g.sched_list_id = l.sched_list_id 
      AND l.sched_list_id = lm.sched_list_id
    )
  LOOP
        
    -- Create the body of the email
    l_email_id := apex_mail.send
      (
      p_to            => y.email,
      p_from          => l_email_arr(6),
      p_subj          => 'APEX-SERT Scheduled Group Evaluation Results - ' || l_sched_grp_name,
      p_body          => 'Please use an HTML-capable e-mail client to view this message.',
      p_body_html     => l_msg
      );
            
  END LOOP;
END LOOP;

logger.log('END: SCHEDULED EVALS');

-- Flush the mail queue to send out the emails
apex_mail.push_queue;

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END run_sched_evals;


--------------------------------------------------------------------------------
-- PROCEDURE: R U N _ E V A L
--------------------------------------------------------------------------------
-- Runs an evaluation asynchronously
--------------------------------------------------------------------------------
PROCEDURE run_eval
  (
  p_app_user                 IN VARCHAR2,
  p_app_session              IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_workspace_id             IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_save_pdf                 IN VARCHAR2,
  p_scoring_method           IN VARCHAR2 DEFAULT 'Raw',
  p_owner                    IN VARCHAR2,
  p_user_workspace_id        IN NUMBER
  )
IS
  l_dummy                    VARCHAR2(4000);
  l_app_session              NUMBER;
  l_app_eval_id              NUMBER;
BEGIN

-- Define the APP_SESSION if a scheduled eval
IF p_app_session IS NULL THEN
  l_app_session := -(APEX_CUSTOM_AUTH.GET_NEXT_SESSION_ID);
ELSE
  l_app_session := p_app_session;
END IF;

-- Define the APP_EVAL_ID
SELECT sv_sec_app_eval_seq.NEXTVAL INTO l_app_eval_id FROM dual;

-- Populates the result table based on the score type passed in
sv_sec_util.populate_result
  (
  p_result                   => p_scoring_method,
  p_app_user                 => p_app_user,
  p_app_session              => l_app_session  
  );

-- Calculates the score
l_dummy := sv_sec.calc_score
  (
  p_attribute_set_id         => p_attribute_set_id,
  p_application_id           => p_application_id,
  p_request                  => 'SCORE',
  p_app_user                 => p_app_user,
  p_workspace_id             => p_workspace_id,
  p_sert_app_id              => p_sert_app_id,
  p_app_session              => l_app_session,
  p_owner                    => p_owner,
  p_app_eval_id              => l_app_eval_id,
  p_user_workspace_id        => p_user_workspace_id,
  p_scheduled_eval           => 'Y'
  );

IF p_save_pdf = 'Y' THEN
  
  -- PRINTING PLACEHOLDER
  NULL;

  /**
  sv_sec_rpt_moar.print
    (
    p_classifications     => 'SETTINGS:PAGE_ACCESS:SQL_INJECTION:CROSS_SITE_SCRIPTING:URL_TAMPERING',
    p_statuses            => 'PASS:FAIL:APPROVED:PENDING:REJECTED:STALE',
    p_application_id      => p_application_id,
    p_sert_app_id         => p_sert_app_id,
    p_attribute_set_id    => p_attribute_set_id,
    p_app_session         => l_app_session,
    p_print               => FALSE,
    p_app_user            => p_app_user,
    p_workspace_id        => p_workspace_id,
    p_scoring_method      => p_scoring_method,
    p_app_eval_id         => l_app_eval_id
    );

  **/
  
END IF;

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END run_eval;


--------------------------------------------------------------------------------
-- PROCEDURE: S C H E D U L E _ E V A L
--------------------------------------------------------------------------------
-- Schedules an evaluation asynchronously via DBMS_SCHEDULER
--------------------------------------------------------------------------------
PROCEDURE schedule_eval
  (
  p_application_id           IN NUMBER,
  p_scheduled_by             IN VARCHAR2,
  p_scheduled_ws             IN NUMBER,
  p_save_pdf                 IN VARCHAR2,
  p_scoring_method           IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_eval_interval            IN VARCHAR2,
  p_time_of_day              IN VARCHAR2,
  p_day_of_week              IN VARCHAR2
  )
IS
BEGIN

-- Insert into the SV_SEC_SCHED_EVALS table
INSERT INTO sv_sec_sched_evals
  (
  application_id,
  scheduled_on,
  scheduled_by,
  scheduled_ws,
  save_pdf,
  scoring_method,
  attribute_set_id,
  eval_interval,
  time_of_day,
  day_of_week
  )
VALUES
  (
  p_application_id,
  SYSDATE,
  p_scheduled_by,
  p_scheduled_ws,
  p_save_pdf,
  p_scoring_method,
  p_attribute_set_id,
  p_eval_interval,
  p_time_of_day,
  CASE WHEN p_eval_interval = 'DAILY' THEN NULL ELSE p_day_of_week END
  );

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END schedule_eval;


--------------------------------------------------------------------------------
-- PROCEDURE: S C H E D U L E _ G R O U P _ E V A L
--------------------------------------------------------------------------------
-- Schedules an group evaluation
--------------------------------------------------------------------------------
PROCEDURE schedule_group_eval
  (
  p_sched_grp_id             IN NUMBER,
  p_scheduled_by             IN VARCHAR2,
  p_scheduled_ws             IN NUMBER,
  p_eval_interval            IN VARCHAR2,
  p_time_of_day              IN VARCHAR2,
  p_day_of_week              IN VARCHAR2
  )
IS
BEGIN

INSERT INTO sv_sec_sched_grp_evals
  (
  sched_grp_id,
  eval_interval,
  time_of_day,
  day_of_week,
  scheduled_on,
  scheduled_by,
  scheduled_ws
  )
VALUES
  (
  p_sched_grp_id,
  p_eval_interval,
  p_time_of_day,
  CASE WHEN p_eval_interval = 'DAILY' THEN NULL ELSE p_day_of_week END,
  SYSDATE,
  p_scheduled_by,
  p_scheduled_ws
  );

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END schedule_group_eval;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_scheduler;