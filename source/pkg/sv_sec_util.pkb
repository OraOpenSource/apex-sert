create or replace
PACKAGE BODY sv_sec_util
AS 

--------------------------------------------------------------------------------
-- PROCEDURE: I N I T
--------------------------------------------------------------------------------
-- Cleans up collection data, etc.
--------------------------------------------------------------------------------
PROCEDURE init
  (
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION')
  )
IS
BEGIN

-- Clean up stale collection values
DELETE FROM sv_sec_collection WHERE 
  app_user = p_app_user
  AND app_session != p_app_session
  AND created_on > SYSDATE -1;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END init;

--------------------------------------------------------------------------------
-- PROCEDURE: S E T _ C T X
--------------------------------------------------------------------------------
-- Sets the Application Context for the Collection and Application
--------------------------------------------------------------------------------
PROCEDURE set_ctx
  (
  p_application_id           IN VARCHAR2,
  p_app_session              IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_collection_id            IN NUMBER,
  p_attribute_set_id         IN NUMBER
  )
IS
  l_collection_id            NUMBER := p_collection_id;
BEGIN

-- Get the Collection ID if coming from APEX
IF l_collection_id IS NULL THEN
  FOR x IN 
    (
    SELECT collection_id FROM sv_sec_collection
      WHERE app_session = p_app_session 
      AND app_user = p_app_user
      AND app_id = p_application_id
    )
  LOOP
    l_collection_id := x.collection_id;
  END LOOP;
END IF;

-- Set the Context for COLLECTION_ID
dbms_session.set_context
  (
  namespace => 'SV_SERT_CTX',
  attribute => 'COLLECTION_ID', 
  value     => l_collection_id,
  username  => p_app_user,
  client_id => p_app_session
  );

-- Set the Context for APPLICATION_ID
dbms_session.set_context
  (
  namespace => 'SV_SERT_CTX',
  attribute => 'APPLICATION_ID', 
  value     => p_application_id,
  username  => p_app_user,
  client_id => p_app_session
  );

-- Set the Context for APPLICATION_ID
dbms_session.set_context
  (
  namespace => 'SV_SERT_CTX',
  attribute => 'ATTRIBUTE_SET_ID', 
  value     => p_attribute_set_id,
  username  => p_app_user,
  client_id => p_app_session
  );

-- Set the Context for APPROVER
IF APEX_UTIL.CURRENT_USER_IN_GROUP('SV_SERT_APPROVER') = TRUE THEN
  dbms_session.set_context
    (
    namespace => 'SV_SERT_CTX',
    attribute => 'SV_SEC_APPROVER', 
    value     => 'Y',
    username  => p_app_user,
    client_id => p_app_session
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END set_ctx;


--------------------------------------------------------------------------------
-- PROCEDURE: U N S E T _ C T X
--------------------------------------------------------------------------------
-- Unsets the Application Context
--------------------------------------------------------------------------------
PROCEDURE unset_ctx
  (
  p_app_session              IN NUMBER DEFAULT nv('APP_SESSION')
  )
IS
BEGIN

  dbms_session.clear_context('SV_SERT_CTX', p_app_session);

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END unset_ctx;


--------------------------------------------------------------------------------
-- PROCEDURE: A B O U T
--------------------------------------------------------------------------------
-- Displays the About sumnevaSERT Message
--------------------------------------------------------------------------------
PROCEDURE about
  (
  p_application_id           IN NUMBER
  )
IS
  l_version                  VARCHAR2(255);
  l_owner                    VARCHAR2(255);  
BEGIN

SELECT get_version_disp(version), owner
  INTO l_version, l_owner
  FROM apex_applications
  WHERE application_id = p_application_id;

htp.prn('<p><b>Version</b>: ' || l_version || '<br />');
htp.prn('<b>Parse As Schema</b>: ' || l_owner || '</p>');

END about; 


--------------------------------------------------------------------------------
-- FUNCTION: S T A L E _ E V A L
--------------------------------------------------------------------------------
-- Determines the lag time between an update and evaluation for an application
--------------------------------------------------------------------------------
FUNCTION stale_eval
  (
  P_date_from                IN DATE,
  p_date_to                  IN DATE DEFAULT NULL      
  ) 
RETURN VARCHAR2 
IS
  l_date                     DATE;
  l_sysdate                  DATE;
BEGIN

l_date := P_DATE_from;

IF p_date_to IS NULL THEN
  l_sysdate := SYSDATE;
ELSE
  l_sysdate := p_date_to;
END IF;

IF p_date_from IS NULL THEN
  RETURN NULL;
ELSIF l_sysdate = l_date THEN
  RETURN 'Now';    
ELSIF l_sysdate - l_date BETWEEN 0 AND 1/720 THEN
  RETURN REPLACE('#time# Seconds', '#time#', ROUND(24*60*60*(L_SYSDATE-L_DATE)));
ELSIF l_sysdate - l_date BETWEEN 1/720 AND 1/12 THEN
  RETURN REPLACE('#time# Minutes', '#time#', ROUND(24*60*(L_SYSDATE-L_DATE )));
ELSIF l_sysdate - l_date BETWEEN 1/12 AND 2 THEN
  RETURN REPLACE('#time# Hours', '#time#', ROUND(24*(L_SYSDATE-L_DATE )));
ELSIF l_sysdate - l_date BETWEEN 2 AND 14 THEN
  RETURN REPLACE('#time# Days', '#time#', TRUNC(L_SYSDATE-L_DATE));
ELSIF l_sysdate - l_date BETWEEN 14 AND 60 THEN
  RETURN REPLACE('#time# Weeks', '#time#', TRUNC((L_SYSDATE-L_DATE )/7));
ELSIF l_sysdate - l_date BETWEEN 60 AND 365 THEN
  RETURN REPLACE('#time# Months', '#time#', ROUND(MONTHS_BETWEEN(L_SYSDATE,L_DATE )));
ELSIF l_date < l_sysdate THEN
  RETURN REPLACE('#time# Years', '#time#', ROUND(MONTHS_BETWEEN(L_SYSDATE,L_DATE )/12,1));
ELSE 
  RETURN NULL;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END stale_eval;


--------------------------------------------------------------------------------
-- PROCEDURE: P O P U L A T E _ R E S U L T
--------------------------------------------------------------------------------
-- Populates SV_SEC_RESULT_TEMP with the current score types
--------------------------------------------------------------------------------
PROCEDURE populate_result
  (
  p_result                   IN VARCHAR2,
  p_app_user                 IN VARCHAR2,
  p_app_session              IN VARCHAR2
  )
IS
BEGIN

-- Clear out the temporary table for a specific user session
DELETE FROM sv_sec_result_temp WHERE app_session = p_app_session AND app_user = p_app_user;

-- Determine which type of score to show and add that to the temporary table
IF p_result = 'Approved' THEN
  INSERT INTO sv_sec_result_temp (app_user, app_session, result) VALUES (p_app_user, p_app_session, 'PASS');
  INSERT INTO sv_sec_result_temp (app_user, app_session, result) VALUES (p_app_user, p_app_session, 'APPROVED');
ELSIF p_result = 'Pending' THEN
  INSERT INTO sv_sec_result_temp (app_user, app_session, result) VALUES (p_app_user, p_app_session, 'PASS');
  INSERT INTO sv_sec_result_temp (app_user, app_session, result) VALUES (p_app_user, p_app_session, 'APPROVED');
  INSERT INTO sv_sec_result_temp (app_user, app_session, result) VALUES (p_app_user, p_app_session, 'PENDING');
ELSE
  INSERT INTO sv_sec_result_temp (app_user, app_session, result) VALUES (p_app_user, p_app_session, 'PASS');
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END populate_result;


--------------------------------------------------------------------------------
-- PROCEDURE: G E T _ C O L L E C T I O N _ I D 
--------------------------------------------------------------------------------
-- Gets the current COLLECTION_ID
--------------------------------------------------------------------------------
FUNCTION get_collection_id
  (
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_app_session              IN VARCHAR2
  )
  RETURN NUMBER
IS
BEGIN

FOR x IN 
  (
  SELECT collection_id  
    FROM sv_sec_collection
    WHERE app_user = p_app_user
    AND app_id = p_application_id
    AND app_session = p_app_session
  )
LOOP
  RETURN x.collection_id;
END LOOP;

RETURN NULL;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_collection_id;


--------------------------------------------------------------------------------
-- PROCEDURE: G E T _ V E R S I O N _ D I S P
--------------------------------------------------------------------------------
-- Gets the current version of sumnevaSERT separated by periods
--------------------------------------------------------------------------------
FUNCTION get_version_disp
  (
  p_version                  IN VARCHAR2
  )
  RETURN VARCHAR2
IS
  l_version_disp             VARCHAR2(100);
BEGIN

SELECT 
     TO_NUMBER(SUBSTR(p_version, 1,2)) || '.'
  || TO_NUMBER(SUBSTR(p_version, 3,2)) || '.'
  || TO_NUMBER(SUBSTR(p_version, 5,2))
INTO
  l_version_disp
FROM 
  dual;

RETURN l_version_disp;

EXCEPTION
WHEN OTHERS THEN
  RETURN '***DEVELOPMENT***';

END get_version_disp;


--------------------------------------------------------------------------------
-- PROCEDURE: G E T _ V E R S I O N
--------------------------------------------------------------------------------
-- Gets the raw current version of sumnevaSERT
--------------------------------------------------------------------------------
FUNCTION get_version
  RETURN VARCHAR2
IS
  l_version                  sv_sec_version.version%TYPE;
BEGIN

SELECT version INTO l_version FROM sv_sec_version;

RETURN l_version;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_version;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ C O L O R
--------------------------------------------------------------------------------
-- Returns the color based on the percent score
--------------------------------------------------------------------------------
FUNCTION get_color
  (
  p_pct_score                IN NUMBER,
  p_possible_score           IN NUMBER,
  p_print                    IN BOOLEAN DEFAULT FALSE,
  p_app_session              IN NUMBER DEFAULT nv('APP_SESSION')
  )
RETURN VARCHAR2
IS
  l_color                    VARCHAR2(255);
  l_color_rgb                VARCHAR2(255);
  l_pref_failure_tolerance   NUMBER;
  l_pref_accept_tolerance    NUMBER;
BEGIN

-- Set preferences, if coming from APEX
IF p_app_session < 0 THEN
  l_pref_failure_tolerance := 60;
  l_pref_accept_tolerance  := 100;
ELSE
  l_pref_failure_tolerance := NVL(apex_util.get_preference(p_preference => 'FAILURE_TOLERANCE', p_user => v('APP_USER')),60);
  l_pref_accept_tolerance  := NVL(apex_util.get_preference(p_preference => 'ACCEPTABLE_TOLERANCE', p_user => v('APP_USER')),100);
END IF;

CASE 
  WHEN p_pct_score <= l_pref_failure_tolerance THEN 
    l_color := '#ff0000';
    l_color_rgb := '255:0:0';

  WHEN p_pct_score >= l_pref_accept_tolerance THEN 
    l_color := '#66cc33';
    l_color_rgb := '102:204:51';

  WHEN p_possible_score = 0 THEN 
    l_color := '#66cc33';
    l_color_rgb := '102:204:51';

  ELSE 
    l_color := '#FFCE00';
    l_color_rgb := '255:215:0';

END CASE;
 
If p_print = TRUE THEN
  RETURN l_color_rgb;
ELSE
  RETURN l_color;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_color;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ P A G E _ A T T R I B U T E _ I D
--------------------------------------------------------------------------------
-- Returns the ATTRIBUTE_ID associated to a given page
--------------------------------------------------------------------------------
FUNCTION get_page_attribute_id
  (
  p_page_id                  IN NUMBER
  )
RETURN VARCHAR2
IS
BEGIN

-- Locate and return the Attribute that matches the DISPLAY_PAGE_ID
FOR x IN (SELECT attribute_id FROM sv_sec_attributes WHERE display_page_id = p_page_id)
LOOP
  RETURN x.attribute_id;
END LOOP;

-- No matching attribute defined; return NULL
RETURN NULL;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_page_attribute_id;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ H E L P _ C L A S S
--------------------------------------------------------------------------------
-- Gets the proper class for IR Reports based on the users role
--------------------------------------------------------------------------------
FUNCTION get_help_class
  (
  p_page_id                  IN NUMBER
  )
RETURN VARCHAR2
IS
BEGIN

-- If the user is an approver, then add more space
IF APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name => 'SV_SERT_APPROVER') = TRUE THEN
  IF p_page_id IN (210,220,230,235,240,245,250,255,570,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785) THEN
    RETURN 'formRegionIRHelp1';
  ELSE
    RETURN 'formRegionIRHelp1';
  END IF;
-- Else, just make room for the Submit All button
ELSE
  IF p_page_id IN (210,220,230,235,240,245,250,255,570,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785) THEN
    RETURN 'formRegionIRHelp2';
  ELSE
    RETURN 'formRegionIRHelp3';
  END IF;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_help_class;


--------------------------------------------------------------------------------
-- PROCEDURE: P R E P A R E _ U R L
--------------------------------------------------------------------------------
-- Prepares the URL - can be called via Application Process from JavaScript
--------------------------------------------------------------------------------
PROCEDURE prepare_url
  (
  p_url                      IN VARCHAR2
  )
IS
  l_url                      VARCHAR2(4000);
BEGIN

l_url := apex_util.prepare_url(p_url);

htp.prn(l_url);

END prepare_url;


--------------------------------------------------------------------------------
-- PROCEDURE: C H E C K _ G T _ L T _ A T T  R _ V A L
--------------------------------------------------------------------------------
-- Ensures that no more than one value is inserted for a GT or LT rule
--------------------------------------------------------------------------------
PROCEDURE check_gt_lt_attr_val
  (
  p_attribute_set_id           IN NUMBER, 
  p_attribute_id               IN NUMBER,
  p_value                      IN VARCHAR2,
  p_result                     IN VARCHAR2
  )
IS
  l_rule_type                  VARCHAR2(100);
  l_ok                         BOOLEAN := TRUE;
  l_count                      NUMBER;
  l_number                     NUMBER;
  l_msg                        VARCHAR2(100) := 'OK';
BEGIN

-- Get the rule type used
SELECT rule_type INTO l_rule_type FROM sv_sec_attributes WHERE attribute_id = p_attribute_id;

IF l_rule_type IN ('LESS_THAN','GREATER_THAN')
THEN

  -- Determine how many existing rules exist for this specific attribute
  SELECT COUNT(*) INTO l_count FROM sv_sec_attribute_values
    WHERE attribute_id = p_attribute_id AND attribute_Set_id = p_attribute_set_id;

  IF l_count > 0 THEN
    l_ok := FALSE;
    l_msg := 'FAIL';
  ELSE
  
    BEGIN
      l_number := TO_NUMBER(p_value);
    EXCEPTION
    WHEN OTHERS THEN 
      l_ok := FALSE;
      l_msg := 'NOT_NUMBER';
    END;

  END IF;
  
END IF;

IF l_ok = TRUE THEN

  INSERT INTO sv_sec_attribute_values
    (attribute_set_id, attribute_id, value, result, active_flag)
  VALUES
    (p_attribute_set_id, p_attribute_id, p_value, p_result, 'Y');

  htp.prn(l_msg);

ELSE

  htp.prn(l_msg);

END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END check_gt_lt_attr_val;


--------------------------------------------------------------------------------
-- FUNCTION: I N T E R N A L _ A T T R 
--------------------------------------------------------------------------------
-- Determines whether an Attribute is INTERNAL or not
--------------------------------------------------------------------------------
FUNCTION internal_attr
  (
  p_attribute_id             IN NUMBER DEFAULT NULL
  )
RETURN BOOLEAN
IS
  l_internal_flag            VARCHAR2(1);
BEGIN

-- User is creating a new attribute; return FALSE
IF p_attribute_id IS NULL THEN
  RETURN FALSE;
END IF;

-- Get the internal flag for the attribute
SELECT internal_flag INTO l_internal_flag FROM sv_sec_attributes
  WHERE attribute_id = p_attribute_id;

IF l_internal_flag = 'Y' THEN  
  IF APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name => 'SV_SERT_SU') THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;
ELSE
  RETURN FALSE;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END internal_attr;


--------------------------------------------------------------------------------
-- FUNCTION: I N T E R N A L _ A T T R _ S E T
--------------------------------------------------------------------------------
-- Determines whether an Attribute Set is INTERNAL or not
--------------------------------------------------------------------------------
FUNCTION internal_attr_set
  (
  p_attribute_set_id         IN NUMBER DEFAULT NULL
  )
RETURN BOOLEAN
IS
BEGIN

-- User is creating a new attribute; return FALSE
IF p_attribute_set_id IS NULL THEN
  RETURN FALSE;
END IF;

IF p_attribute_set_id < 0 THEN  
  IF APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name => 'SV_SERT_SU') THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;
ELSE
  RETURN FALSE;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END internal_attr_set;


--------------------------------------------------------------------------------
-- PROCEDURE: R E D I R E C T _ W H E N _ S T A L E
--------------------------------------------------------------------------------
-- Redirect to Page 1 if the SCORE collection does not exist
--------------------------------------------------------------------------------
PROCEDURE redirect_when_stale
IS
  l_count                    NUMBER;
BEGIN

SELECT count(*) INTO l_count FROM sv_sec_collection WHERE
  app_user = v('APP_USER')
  AND app_session = v('APP_SESSION')
  AND app_id = v('P200_APPLICATION_ID');

IF l_count = 0 THEN
  owa_util.redirect_url('f?p=' || v('APP_ID') || ':1:' || v('APP_SESSION'));
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END redirect_when_stale;

--------------------------------------------------------------------------------
-- PROCEDURE: L O G _ P A G E _ V I E W
--------------------------------------------------------------------------------
-- Logs the page view, if preference is enabled
--------------------------------------------------------------------------------
PROCEDURE log_page_view
IS
BEGIN

IF apex_util.get_preference(p_preference => 'LOG_PAGE_VIEWS', p_user => v('G_WORKSPACE_ID') || '.' || v('APP_USER')) = 'Y' THEN
  logger.log('Page ' || v('APP_PAGE_ID') || ' Viewed');
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END log_page_view;


--------------------------------------------------------------------------------
-- PROCEDURE: G E T _ P R O G R E S S 
--------------------------------------------------------------------------------
-- Provides updates to the status progress bar
--------------------------------------------------------------------------------
PROCEDURE get_progress
IS
BEGIN

htp.prn(v('G_PROGRESS'));

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_progress;


--------------------------------------------------------------------------------
-- PROCEDURE: D I S P L A Y _ S U M M A R Y
--------------------------------------------------------------------------------
-- Displays a specific category score summary
--------------------------------------------------------------------------------
PROCEDURE display_summary
  (
  p_banner                   IN BOOLEAN DEFAULT FALSE,
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_classification_key       IN VARCHAR2,
  p_print                    IN BOOLEAN DEFAULT FALSE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN VARCHAR2 DEFAULT v('APP_ID')
  )
IS
  l_attr_count               NUMBER; 
  l_count                    NUMBER;
  l_collection_id            NUMBER;
  l_pct_score                NUMBER;
  l_score                    NUMBER := 0;
  l_possible_score           NUMBER := 0;
  l_total_score              NUMBER := 0;
  l_total_possible_score     NUMBER := 0;
  l_color                    VARCHAR2(255);
  l_raw_style                VARCHAR2(255);
  l_pending_style            VARCHAR2(255);
  l_approved_style           VARCHAR2(255);
  l_result                   VARCHAR2(255);-- := v('P0_RESULT');
  l_pending_count            NUMBER := 0;
  l_component_found          VARCHAR2(1);
  l_classification_name      VARCHAR2(255);
  l_classification_id        NUMBER;
  l_color_rgb                APEX_APPLICATION_GLOBAL.VC_ARR2;
  l_pref_score_precision     NUMBER := 1;
  l_time_to_fix              VARCHAR2(100);
BEGIN

-- Get the Classification ID and Page Title
SELECT classification_id, classification_name || ' Summary' 
  INTO l_classification_id, l_classification_name 
  FROM sv_sec_classifications
  WHERE classification_key = p_classification_key;

-- Get the current collection ID
l_collection_id := sv_sec_util.get_collection_id(
  p_app_user       => p_app_user,
  p_app_session    => p_app_session,
  p_application_id => p_application_id);

-- Determine the result used
IF l_result IS NULL THEN
  l_result := 'Raw';
END IF;

-- Loop through all categories associated with a classification
FOR x IN
  (
  SELECT
    c.category_id, 
    c.category_name,
    c.category_short_name,
    c.category_key, 
    c.display_page
  FROM
    sv_sec_categories c
  WHERE
    c.classification_id = l_classification_id
  )
LOOP

  -- Determine if there are any attributes for a given category
  SELECT count(*) INTO l_attr_count FROM sv_sec_attribute_set_attrs asa, sv_sec_attributes a
    WHERE a.attribute_id = asa.attribute_id
    AND a.category_id = x.category_id
    AND a.active_flag = 'Y'
    AND asa.attribute_set_id = p_attribute_set_id;

  IF l_attr_count > 0 THEN

    -- Calculate the Score for a Category
    SELECT
      count(*) cnt
    INTO
      l_score
    FROM
      sv_sec_collection_data cd,
      sv_sec_result_temp r
    WHERE
      cd.result = r.result
      AND r.app_session = p_app_session
      AND r.app_user = p_app_user
      AND cd.category_key = x.category_key
      AND cd.collection_id = l_collection_id;

    -- Calculate the Possible Score for a Category
    SELECT
      COUNT(*) cnt
    INTO
      l_possible_score
    FROM
     sv_sec_collection_data cd
    WHERE
      cd.category_key = x.category_key
      AND cd.collection_id = l_collection_id;

    -- Calculate the percentage score
    IF l_possible_score != 0 THEN
      l_pct_score := ROUND(((l_score / l_possible_score)*100), l_pref_score_precision);
      l_component_found := 'Y';
    ELSE
      l_pct_score := 101;
      l_component_found := 'N';
    END IF;

    -- Get the corresponding color
    l_color := get_color(p_pct_score => l_pct_score, p_possible_score => l_possible_score, p_print => p_print);
        
    IF p_banner = FALSE THEN
      IF p_print = FALSE THEN
        -- Store the HTML in a temporary table so that it can be sorted and printed later based on score
        INSERT INTO sv_sec_html_temp (html, seq) VALUES (
             '<li class="t-Cards-item">'
          || '  <div class="t-Card">'
          || '  <a href="' || apex_util.prepare_url('f?p=' || p_sert_app_id || ':' || x.display_page || ':' || p_app_session || ':::RP') || '" class="t-Card-wrap">'
          || '    <div class="t-Card-icon"' || CASE WHEN l_possible_score = 0 THEN 'style="display:none;"' END || '><span class="t-Icon fa-laptop" style="width:48px; height:48px;background-color:' || l_color || ';">'
          || '      <span class="t-Card-initials" role="presentation" style="line-height:4.5rem;">' || CASE WHEN l_pct_score > 100 THEN 100 ELSE l_pct_score END || '%</span></span></div>'
          || '    <div class="t-Card-titleWrap"><h3 class="t-Card-title">' || SUBSTR(x.category_name, INSTR(x.category_name, ':' ,1)+1) || '</h3></div>'
          || '    <div class="t-Card-body">' 
          || '      <div class="t-Card-desc">' || CASE WHEN l_possible_score = 0 THEN 'No '|| SUBSTR(x.category_name, INSTR(x.category_name, ':' ,1)+1) || ' in this application' ELSE TO_CHAR(l_score, '999G999') || ' out of ' || TO_CHAR(l_possible_score, '999G999') || ' Possible Points' END || '</div>'
          || '    <div class="t-Card-info">'
          || '      <div class="a-Report-percentChart" style="background-color:#' || CASE WHEN l_possible_score = 0 THEN 'FCFCFC; border: none; box-shadow: none;' ELSE 'DBDBDB' END || ';">'
          || '        <div class="a-Report-percentChart-fill" style="width:' || l_pct_score || '%; background-color:#' || CASE WHEN l_possible_score = 0 THEN 'FFF' ELSE '999' END || ';"></div>'
          || '      </div>'
          || '    </div>'
          || '  </div>'
          || '  </a>'
          || '  </div>'
          || '</li>', l_pct_score);

      ELSE
        
        -- Store the PLPDF data in a temp table
        NULL;

      END IF;

    ELSE

      -- Otherwise, calculate the total for a group of categories
      l_total_score := l_total_score + l_score;
      l_total_possible_score := l_total_possible_score + l_possible_score;

    END IF;  
  END IF;
END LOOP;

-- Loop through the HTML and print each region, from most failures to least
IF p_banner = FALSE THEN

  IF p_print = FALSE THEN
    
    htp.prn('<ul class="t-Cards   t-Cards--compact t-Cards--displayInitials t-Cards--cols t-Cards--desc-2ln">');
  
    FOR x IN (SELECT * FROM sv_sec_html_temp ORDER BY seq)
    LOOP
      htp.prn(x.html);
    END LOOP;
  
    htp.prn('</ul>');

  ELSE
  
    -- PRINTING PLACEHOLDER
    NULL;

  END IF;

ELSE

  IF l_total_possible_score != 0 THEN
    l_pct_score := ROUND((l_total_score)/(l_total_possible_score)*100,l_pref_score_precision);
  ELSE
    l_pct_score := 0;
  END IF;

  -- Calculate the total time to fix
  SELECT
    NVL(ROUND((SUM(s.time_to_fix)/60),1),0)
  INTO
     l_time_to_fix
  FROM
    sv_sec_attribute_set_attrs s,
    sv_sec_collection_data c,
    sv_sec_attributes a,
    sv_sec_categories cat
  WHERE
    s.attribute_set_id = p_attribute_set_id
    AND s.attribute_id = c.attribute_id
    AND c.attribute_id = a.attribute_id
    AND a.category_id = cat.category_id
    AND cat.classification_id = l_classification_id
    AND c.collection_id = l_collection_id
    AND c.result NOT IN ('PASS','APPROVED','PENDING');

  IF p_print = FALSE THEN
  
    -- Print the summary percentage and score type toggle controls
    l_color := get_color(p_pct_score => l_pct_score, p_possible_score => l_total_possible_score);

    -- Set the style for the approved, pending and raw links
    l_raw_style := 'text-decoration:none;font-size:9px;font-weight:normal;';
    l_approved_style := l_raw_style;
    l_pending_style := l_raw_style;
    IF l_result = 'Raw' THEN
      l_raw_style := l_raw_style || REPLACE(l_raw_style, 'normal', 'bold') || ';color:#333;';
    ELSIF l_result = 'Pending' THEN
      l_pending_style := l_raw_style || REPLACE(l_raw_style, 'normal', 'bold') || ';color:#333;';
    ELSE
      l_approved_style := l_raw_style || REPLACE(l_raw_style, 'normal', 'bold') || ';color:#333;';
    END IF;
 
    -- Print the banner
    htp.prn(
             '<ul class="t-Cards t-Cards--compact t-Cards--displayInitials t-Cards--cols">'
          || '<li class="t-Cards-item" style="width:100%;">'
          || '  <div class="t-Card t-Card-wrap">'
          || '    <div class="t-Card-icon"><span class="t-Icon fa-laptop" style="width:48px; height:48px;background-color:' || l_color || ';">'
          || '      <span class="t-Card-initials" role="presentation" style="line-height:4.5rem;">' || CASE WHEN l_pct_score > 100 THEN 100 ELSE l_pct_score END || '%</span></span></div>'
          || '    <div class="t-Card-titleWrap"><h3 class="t-Card-title">' || TO_CHAR(l_total_score, '999G999') || ' out of ' || TO_CHAR(l_total_possible_score, '999G999') || ' points</h3></div>'
          || '    <div class="t-Card-body">' 
          || '      <div class="t-Card-desc">~' || l_time_to_fix || ' Hrs to Fix</div>'
          || '    <div class="t-Card-info">'
          || '    </div>'
          || '  </div>'
          || '  </div>'
          || '</li>'
          || '</ul>'
          );
    
  ELSE
    -- PRINTING PLACEHOLDER
    NULL;

  END IF;
  
END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN NULL;
  logger.log('NO DATA');
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END display_summary;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T _ N A M E
--------------------------------------------------------------------------------
-- Prints the name of an application
--------------------------------------------------------------------------------
FUNCTION print_name
  (
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_record_score             IN BOOLEAN  DEFAULT FALSE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_scheduled_eval           IN VARCHAR2 DEFAULT 'N',
  p_evaluated_ws             IN NUMBER   DEFAULT v('G_WORKSPACE_ID')
  )
RETURN VARCHAR2
IS
  l_color                    VARCHAR2(255);
  l_result                   VARCHAR2(255) := v('P0_RESULT');
  l_raw_style                VARCHAR2(255);
  l_raw_score                NUMBER;
  l_raw_score_style          VARCHAR2(255);
  l_pending_style            VARCHAR2(255);
  l_pending_score            NUMBER;
  l_pending_score_style      VARCHAR2(255);
  l_approved_style           VARCHAR2(255);
  l_approved_score           NUMBER;
  l_approved_score_style     VARCHAR2(255);
  TYPE l_score_t             IS TABLE OF NUMBER index by binary_integer;
  l_score_arr                l_score_t;
  l_total                    NUMBER := 0;
  l_total_pct                NUMBER := 0;
  l_collection_id            sv_sec_collection.collection_id%TYPE;
  l_pct_score                NUMBER;
  l_possible_score           NUMBER := 0;
  l_score                    NUMBER;
  l_html                     VARCHAR2(4000);
  l_time_to_fix              NUMBER;
BEGIN

-- Get the current collection ID
l_collection_id := sv_sec_util.get_collection_id(
  p_app_user => p_app_user,
  p_app_session => p_app_session,
  p_application_id => p_application_id);

-- Get the value of Result
l_result := NVL(v('P0_RESULT'),'Raw');

-- Calculate the score totals
SELECT count(*) INTO l_score_arr(1) FROM
  sv_sec_collection_data cd
WHERE
  cd.collection_id = l_collection_id 
  AND cd.result IN ('PASS', 'APPROVED');

-- PENDING Score
SELECT count(*) INTO l_score_arr(2) FROM
  sv_sec_collection_data cd
WHERE
  cd.collection_id = l_collection_id
  AND cd.result IN ('PASS', 'PENDING', 'APPROVED');

-- RAW Score
SELECT count(*) INTO l_score_arr(3) FROM
  sv_sec_collection_data cd
WHERE
  cd.collection_id = l_collection_id
  AND cd.result = 'PASS';

-- POSSIBLE Score
SELECT count(*) INTO l_possible_score FROM
  sv_sec_collection_data cd
WHERE
  cd.collection_id = l_collection_id;

-- Calculate the Totals
IF l_possible_score = 0 THEN
  l_total_pct := 0;
  l_total := 0;
ELSE
  l_raw_score := ROUND((l_score_arr(3)/(l_possible_score))*100,1);
  l_pending_score := ROUND((l_score_arr(2)/(l_possible_score))*100,1);
  l_approved_score := ROUND((l_score_arr(1)/(l_possible_score))*100,1);
END IF;


-- Set the score and style for the approved, pending and raw links
l_raw_style := 'color:white;';
l_approved_style := l_raw_style;
l_pending_style := l_raw_style;

IF l_result = 'Raw' THEN
  l_raw_style := REPLACE(l_raw_style, 'normal', 'bold') || ';color:#333;';
  l_raw_score_style := 'color:#fff;font-weight:bold;';
  l_score := l_score_arr(3);
ELSIF l_result = 'Pending' THEN
  l_pending_style := REPLACE(l_raw_style, 'normal', 'bold') || ';color:#333;';
  l_pending_score_style := 'color:#fff;font-weight:bold;';
  l_score := l_score_arr(2);
ELSE
  l_approved_style := REPLACE(l_raw_style, 'normal', 'bold') || ';color:#333;';
  l_approved_score_style := 'color:#fff;font-weight:bold;';
  l_score := l_score_arr(1);
END IF;


IF p_record_score = FALSE THEN
  -- Print the application title and scores
  FOR x IN (SELECT * FROM apex_applications WHERE application_id = p_application_id)
  LOOP
  
    -- Calculate the total time to fix
    SELECT
      NVL(ROUND((SUM(s.time_to_fix)/60),1),0)
    INTO
       l_time_to_fix
    FROM
      sv_sec_attribute_set_attrs s,
      sv_sec_collection_data c
    WHERE
      s.attribute_set_id = p_attribute_set_id
      AND s.attribute_id = c.attribute_id
      AND c.collection_id = l_collection_id
      AND c.result NOT IN ('PASS','APPROVED','PENDING');
  
    l_html := ''
      || TO_CHAR(l_score, '999G999') || ' of ' || TO_CHAR(l_possible_score, '999G999') || ' Points'
      || '    <ul class="t-BadgeList t-BadgeList--responsive t-BadgeList--small t-BadgeList--cols t-BadgeList--3cols">'
      || '      <li class="t-BadgeList-item">'
      || '        <span class="t-BadgeList-label sert-BadgeList-label"' || CASE WHEN v('P0_RESULT') = 'Approved' THEN ' style="font-weight: bold;"' ELSE NULL END || '>Approved</span>'
      || '        <span class="t-BadgeList-value"' || CASE WHEN v('P0_RESULT') = 'Approved' THEN ' style="font-weight: bold;"' ELSE NULL END || '><a href="' || apex_util.prepare_url('f?p=' || v('APP_ID') || ':' || v('APP_PAGE_ID') || ':' || v('APP_SESSION') || '::::P0_RESULT:Approved') || '"'
      || '          style="color:white;background:' || sv_sec_util.get_color(p_pct_score => (l_approved_score), p_possible_score => (l_possible_score)) || ';">' || l_approved_score || '%</a></span>'
      || '      </li>'
      || '      <li class="t-BadgeList-item">'
      || '        <span class="t-BadgeList-label sert-BadgeList-label"' || CASE WHEN v('P0_RESULT') = 'Pending' THEN ' style="font-weight: bold;"' ELSE NULL END || '>Pending</span>'
      || '        <span class="t-BadgeList-value"' || CASE WHEN v('P0_RESULT') = 'Pending' THEN ' style="font-weight: bold;"' ELSE NULL END || '><a href="' || apex_util.prepare_url('f?p=' || v('APP_ID') || ':' || v('APP_PAGE_ID') || ':' || v('APP_SESSION') || '::::P0_RESULT:Pending') || '"'
      || '          style="color:white;background:' || sv_sec_util.get_color(p_pct_score => (l_pending_score), p_possible_score => (l_possible_score)) || ';">' || l_pending_score || '%</a></span>'
      || '      </li>'
      || '      <li class="t-BadgeList-item">'
      || '        <span class="t-BadgeList-label sert-BadgeList-label"' || CASE WHEN v('P0_RESULT') = 'Raw' THEN ' style="font-weight: bold;"' ELSE NULL END || '>Raw</span>'
      || '        <span class="t-BadgeList-value"' || CASE WHEN v('P0_RESULT') = 'Raw' THEN ' style="font-weight: bold;"' ELSE NULL END || '><a href="' || apex_util.prepare_url('f?p=' || v('APP_ID') || ':' || v('APP_PAGE_ID') || ':' || v('APP_SESSION') || '::::P0_RESULT:Raw') || '"'
      || '          style="color:white;background:' || sv_sec_util.get_color(p_pct_score => (l_raw_score), p_possible_score => (l_possible_score)) || ';">' || l_raw_score || '%</a></span>'
      || '      </li>'
      || '    </ul>'
      ;

  END LOOP;

ELSE

  -- Record the Evaluation
  IF p_app_session < 0 OR v('REQUEST') IN ('SCORE','PAGE_SCORE') THEN
    sv_sec_util.record_eval
      (
      p_application_id   => p_application_id,
      p_app_user         => p_app_user,
      p_approved_score   => NVL(l_approved_score,0),
      p_pending_score    => NVL(l_pending_score,0),
      p_raw_score        => NVL(l_raw_score,0),
      p_attribute_set_id => p_attribute_set_id,
      p_app_session      => p_app_session,
      p_app_eval_id      => p_app_eval_id,
      p_scheduled_eval   => p_scheduled_eval,
      p_evaluated_ws     => p_evaluated_ws
      );
  END IF;

END IF;

-- Return the HTML to the calling report
RETURN l_html;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END print_name;


--------------------------------------------------------------------------------
-- FUNCTION: D I S P L A Y _ C O L U M N
--------------------------------------------------------------------------------
-- Determines whether to display a column based on Attribute
--------------------------------------------------------------------------------
FUNCTION display_column
  (
  p_attribute_key            IN VARCHAR2
  )
RETURN BOOLEAN
IS
BEGIN

FOR x IN 
  (
  SELECT 
    a.attribute_key 
  FROM
    sv_sec_attribute_set_attrs asa,
    sv_sec_attributes a,
    sv_sec_attribute_sets s
  WHERE
    asa.attribute_id = a.attribute_id
    AND a.attribute_key = p_attribute_key
    AND s.attribute_set_id = asa.attribute_set_id
    AND s.attribute_set_id = nv('P0_ATTRIBUTE_SET_ID')
  )
LOOP
  RETURN TRUE;
END LOOP;

RETURN FALSE;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END display_column;


--------------------------------------------------------------------------------
-- PROCEDURE S A V E _ A P E X _ L I N K
--------------------------------------------------------------------------------
-- Records any edit of an APEX component
--------------------------------------------------------------------------------
PROCEDURE save_apex_link
  (
  p_page_id                  IN NUMBER,
  p_link                     IN VARCHAR2,
  p_rp                       IN VARCHAR2,
  p_component_name           IN VARCHAR2,
  p_category                 IN VARCHAR2
  )
IS
BEGIN

INSERT INTO sv_sec_apex_links
  (
  app_user,
  application_id,
  clicked_on,
  page_id,
  link,
  rp,
  component_name,
  category
  )
VALUES
  (
  v('APP_USER'),
  v('P200_APPLICATION_ID'),
  SYSDATE,
  p_page_id,
  p_link,
  p_rp,
  p_component_name,
  p_category
  );

htp.prn('OK');  

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END save_apex_link;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ A P E X _ S E S S I O N
--------------------------------------------------------------------------------
-- Returns the APEX session ID from the builder, if the user is evaluating
-- an application from the same workspace in which they are logged into
--------------------------------------------------------------------------------
FUNCTION get_apex_session
RETURN VARCHAR2
IS
  c                          sys.owa_cookie.cookie;
  l_count                    NUMBER;
BEGIN

-- Get the Workspace ID for the application being evaluated
FOR x IN (SELECT workspace_id FROM apex_applications WHERE application_id = v('P200_APPLICATION_ID'))
LOOP
  -- If that Workspace ID matches the builder Workspace ID, then return the Builder Session ID
  IF x.workspace_id = nv('G_WORKSPACE_ID') THEN
    RETURN v('G_APEX_BUILDER_SESSION_ID');
  ELSE
    RETURN NULL;
  END IF;
END LOOP;

-- No current evaluation, so return a NULL
RETURN NULL;

EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;

END get_apex_session;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T _ A P E X _ S E S S I O N
--------------------------------------------------------------------------------
-- Prints the APEX session ID
--------------------------------------------------------------------------------
PROCEDURE print_apex_session
IS
BEGIN

htp.prn('
<script type="text/javascript">
var gApexSession = "' ||  v('G_APEX_SESSION_ID') || '";
</script>');

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END print_apex_session;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ A T T R _ S E T S 
--------------------------------------------------------------------------------
-- Gets the source of the Attribute Set multi-select list
--------------------------------------------------------------------------------
FUNCTION get_attr_sets
  (
  p_attribute_id             IN NUMBER
  )
  RETURN VARCHAR2
IS
  l_attr_sets                VARCHAR2(4000);
BEGIN

FOR x IN (SELECT attribute_set_id FROM sv_sec_attribute_set_attrs WHERE attribute_id = p_attribute_id)
LOOP
  l_attr_sets := l_attr_sets || x.attribute_set_id || ':';
END LOOP;

RETURN l_attr_sets;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_attr_sets;


--------------------------------------------------------------------------------
-- FUNCTION: I S _ D I S A B L E D
--------------------------------------------------------------------------------
-- Determines whether or not to disable items or buttons
--------------------------------------------------------------------------------
FUNCTION is_disabled
  (
  p_attribute_set_id         IN NUMBER,
  p_workspace_id             IN NUMBER DEFAULT NULL
  )
  RETURN VARCHAR2
IS
BEGIN
-- Check to see if the user is a member of the SV_SERT_SU group and if so, return NULL
IF APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name => 'SV_SERT_SU') THEN
  RETURN NULL;
ELSE

  -- Check to see if this is for Shared Attribute Sets
  IF p_workspace_id IS NOT NULL THEN 
    IF p_workspace_id = nv('WORKSPACE_ID') THEN
      RETURN NULL;
    ELSE
      RETURN 'DISABLED';
    END IF;
  ELSE
    IF p_attribute_set_id < 0 THEN
      RETURN 'DISABLED';
    ELSE
      RETURN NULL;
    END IF;
  END IF;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END is_disabled;


--------------------------------------------------------------------------------
-- FUNCTION: L O G O
--------------------------------------------------------------------------------
-- Prints the logo
--------------------------------------------------------------------------------
FUNCTION logo
RETURN VARCHAR2
IS
BEGIN

RETURN NULL; 

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END logo;


--------------------------------------------------------------------------------
-- PROCEDURE: C O M P A T I B I L I T Y _ C H E C K
--------------------------------------------------------------------------------
-- Checks to ensure that the application and data schema are the same version
--------------------------------------------------------------------------------
PROCEDURE compatibility_check
  (
  p_version                  IN VARCHAR
  )
IS
BEGIN

FOR x IN (SELECT * FROM apex_applications WHERE application_id = v('APP_ID'))
LOOP
  IF x.version != p_version THEN
    raise_application_error(-20000, 'The version of the application (' 
      || x.version || ') is not compatible with the version of the schema (' 
      || p_version || ').  Please contact support.');
  END IF;
END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END compatibility_check;


--------------------------------------------------------------------------------
-- FUNCTION: C O P Y R I G H T
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
FUNCTION copyright
RETURN VARCHAR2
IS
  l_copyright                VARCHAR2(255);
BEGIN

SELECT 'SERT - Licensed via <a target="_blank" href="http://opensource.org/licenses/lgpl-3.0.html">LGPL3</a> '
  || '| <a target="_blank" href="https://github.com/OraOpenSource/apexsert">Download</a> | Version ' || v('G_VERSION_DISP') 
INTO
  l_copyright
FROM 
  apex_applications 
WHERE 
  application_id = nv('APP_ID');

RETURN l_copyright;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END copyright;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ C O M P O N E N T 
--------------------------------------------------------------------------------
-- Returns the corresponding component name for a given exception
--------------------------------------------------------------------------------

FUNCTION get_component
  (
  p_component_id             IN NUMBER DEFAULT NULL,
  p_attribute_id             IN NUMBER DEFAULT NULL
  )
  RETURN VARCHAR2
IS
  l_sql                      VARCHAR2(1000);
  l_display                  VARCHAR2(1000);
BEGIN

IF p_component_id IS NOT NULL AND p_attribute_id IS NOT NULL THEN

  FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_id = p_attribute_id)
  LOOP

    l_sql := 'SELECT ' || x.component_column_display || ' FROM ' || x.component_table
      || ' WHERE ' || x.component_column_id || ' = ' || p_component_id;

    IF x.component_column_display IS NOT NULL 
      AND x.component_table IS NOT NULL
      AND x.component_column_id IS NOT NULL 
    THEN
    
      EXECUTE IMMEDIATE l_sql INTO l_display;
  
    END IF;
  
  END LOOP;

END IF;

RETURN l_display;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_component;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ C O L U M N
--------------------------------------------------------------------------------
-- Returns the corresponding component name for a given exception
--------------------------------------------------------------------------------

FUNCTION get_column
  (
  p_column_id                IN NUMBER   DEFAULT NULL,
  p_attribute_id             IN NUMBER   DEFAULT NULL
  )
  RETURN VARCHAR2
IS
  l_sql                      VARCHAR2(1000);
  l_display                  VARCHAR2(1000);
BEGIN

IF p_column_id IS NOT NULL AND p_attribute_id IS NOT NULL THEN

  FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_id = p_attribute_id)
  LOOP

    l_sql := 'SELECT ' || x.column_column_display || ' FROM ' || x.column_table
      || ' WHERE ' || x.column_column_id || ' = ' || p_column_id;

    IF x.column_column_display IS NOT NULL 
      AND x.column_table IS NOT NULL
      AND x.column_column_id IS NOT NULL 
    THEN
    
      EXECUTE IMMEDIATE l_sql INTO l_display;
  
    END IF;
  
  END LOOP;

END IF;

RETURN l_display;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_column;


--------------------------------------------------------------------------------
-- PROCEDURE: A D D _ A T T R I B U T E S
--------------------------------------------------------------------------------
-- Adds an attribute(s) to a specific Attribute Set
--------------------------------------------------------------------------------
PROCEDURE add_attributes
  (
  p_attribute_set_id         IN NUMBER
  )
IS
BEGIN

-- Loop through all selected attributes and add them to the selected attribute set
FOR x IN 1..apex_application.g_f01.count
LOOP
  FOR y IN (SELECT * FROM sv_sec_attributes WHERE attribute_id = apex_application.g_f01(x))
  LOOP
    INSERT INTO sv_sec_attribute_set_attrs 
      (
      attribute_set_id, 
      attribute_id, 
      active_flag,
      time_to_fix,
      severity_level
      )
    VALUES
      (
      p_attribute_set_id, 
      apex_application.g_f01(x), 
      'Y',
      y.time_to_fix,
      y.severity_level
      );
  END LOOP;

  -- Add attribute values from the DEFAULT attribute set
  IF p_attribute_set_id > 0 THEN
  FOR y IN (SELECT * FROM sv_sec_attribute_values WHERE attribute_id = apex_application.g_f01(x) 
    AND attribute_set_id = -1)
  LOOP
  
    INSERT INTO sv_sec_attribute_values 
      (attribute_id, active_flag, value, result, attribute_set_id)
    VALUES 
      (apex_application.g_f01(x), y.active_flag, y.value, y.result, p_attribute_set_id
      );

  END LOOP;
  END IF;
END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END add_attributes;


--------------------------------------------------------------------------------
-- PROCEDURE: R E M O V E _ A T T R I B U T E
--------------------------------------------------------------------------------
-- Removes an attribute from a specific Attribute Set
--------------------------------------------------------------------------------
PROCEDURE remove_attribute
  (
  p_attribute_set_attrs_id   IN NUMBER
  )
IS
  l_attribute_id             sv_sec_attribute_set_attrs.attribute_id%TYPE;
  l_attribute_set_id         sv_sec_attribute_set_attrs.attribute_set_id%TYPE;
BEGIN

-- Get the ATTRIBUTE_ID and ATTRIBUTE_SET_ID
SELECT attribute_id, attribute_set_id
  INTO l_attribute_id, l_attribute_set_id
  FROM sv_sec_attribute_set_attrs 
  WHERE attribute_set_attrs_id = p_attribute_set_attrs_id; --apex_application.g_x01;

-- Remove the attribute
DELETE FROM sv_sec_attribute_set_attrs 
  WHERE attribute_set_attrs_id = p_attribute_set_attrs_id; --apex_application.g_x01;

-- Remove the corresponding Attribute Values
DELETE FROM sv_sec_attribute_values 
  WHERE attribute_id = l_attribute_id AND attribute_set_id = l_attribute_set_id;

-- Return OK
--htp.prn('OK');

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END remove_attribute;


--------------------------------------------------------------------------------
-- PROCEDURE: S A V E _ R U L E _ T Y P E
--------------------------------------------------------------------------------
-- Asynchronously Sets Attribute Values to Enabled or Disabled
--------------------------------------------------------------------------------
PROCEDURE toggle_attr_vals
  (
  p_attribute_id             IN NUMBER,
  p_value                    IN VARCHAR2
  )
IS
BEGIN

UPDATE sv_sec_attribute_values SET active_flag = p_value
  WHERE attribute_id = p_attribute_id;

htp.prn('OK');

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END toggle_attr_vals;


--------------------------------------------------------------------------------
-- FUNCTION: I N T _ A T T R
--------------------------------------------------------------------------------
-- Determines whether or not an attribute is internal
--------------------------------------------------------------------------------
FUNCTION int_attr
  (
  p_attribute_id             IN NUMBER
  )
RETURN VARCHAR2
IS
  l_internal_flag            sv_sec_attributes.internal_flag%TYPE;
BEGIN

-- If creating an attribute or the user is a superuser, then return NULL
IF p_attribute_id IS NULL OR APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name => 'SV_SERT_SU') THEN
  RETURN NULL;
ELSE

  -- Otherwise, determine if the attribute is internal, and return the corresponding value
  SELECT internal_flag INTO l_internal_flag FROM sv_sec_attributes
    WHERE attribute_id = p_attribute_id;
  
  IF l_internal_flag = 'Y' THEN
    RETURN 'disabled';
  ELSE
    RETURN NULL;
  END IF;

END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END int_attr;


--------------------------------------------------------------------------------
-- FUNCTION: I N T _ C A T E G O R Y
--------------------------------------------------------------------------------
-- Determines whether or not a category is internal
--------------------------------------------------------------------------------
FUNCTION int_category
  (
  p_category_id              IN NUMBER
  )
RETURN VARCHAR2
IS
  l_internal_flag            sv_sec_categories.internal_flag%TYPE;
BEGIN

-- If creating an attribute or the user is a superuser, then return NULL
IF p_category_id IS NULL OR APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name => 'SV_SERT_SU') THEN
  RETURN NULL;
ELSE

  -- Otherwise, determine if the attribute is internal, and return the corresponding value
  SELECT internal_flag INTO l_internal_flag FROM sv_sec_categories
    WHERE category_id = p_category_id;
  
  IF l_internal_flag = 'Y' THEN
    RETURN 'disabled';
  ELSE
    RETURN NULL;
  END IF;

END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END int_category;


--------------------------------------------------------------------------------
-- FUNCTION: GT_LT_VALUE
--------------------------------------------------------------------------------
-- Validates number of values for GT or LT Attribute
--------------------------------------------------------------------------------
FUNCTION gt_lt_value
  (
  p_attribute_id             IN NUMBER,
  p_attribute_set_id         IN NUMBER
  )
RETURN BOOLEAN
IS
  l_count                    INTEGER;
BEGIN

FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_id = p_attribute_id)
LOOP
  IF x.rule_type NOT IN ('LESS_THAN', 'GREATER_THAN') THEN
    RETURN TRUE;
  ELSE
    SELECT count(*) INTO l_count FROM sv_sec_attribute_values
      WHERE attribute_id = p_attribute_id
      AND attribute_set_id = p_attribute_set_id;
    IF l_count > 1 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  END IF;
END LOOP;

RETURN FALSE;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END gt_lt_value;


--------------------------------------------------------------------------------
-- PROCEDURE: C O P Y _ I N L I N E  _ A T T R S
--------------------------------------------------------------------------------
-- Copies the Inline Attributes to a new Attribute Set
--------------------------------------------------------------------------------
PROCEDURE copy_inline_attrs
  (
  p_copy_to                  IN NUMBER
  )
IS
BEGIN
-- Copy the attributes
FOR x IN 
  (
  SELECT sa.attribute_id 
    FROM sv_sec_attribute_set_attrs sa, sv_sec_attributes a 
    WHERE sa.attribute_set_id = -1
    AND sa.attribute_id = a.attribute_id
    AND a.category_id = -1
  )
LOOP
  INSERT INTO sv_sec_attribute_set_attrs 
    (attribute_id, attribute_set_id, active_flag) 
  VALUES 
    (x.attribute_id, p_copy_to, 'Y');

  -- Copy the attribute values
  FOR y IN (SELECT * FROM sv_sec_attribute_values WHERE attribute_set_id = -1 and attribute_id = x.attribute_id)
  LOOP
    INSERT INTO sv_sec_attribute_values 
      (attribute_id, active_flag, value, result, attribute_set_id)
    VALUES 
      (x.attribute_id, y.active_flag, y.value, y.result, p_copy_to);
  END LOOP;

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END copy_inline_attrs;


--------------------------------------------------------------------------------
-- PROCEDURE: C O P Y _ A T T R _ S E T 
--------------------------------------------------------------------------------
-- Copies an existing Attribute Set to a new one
--------------------------------------------------------------------------------
PROCEDURE copy_attr_set
  (
  p_copy_from                IN NUMBER,
  p_copy_to                  IN NUMBER
  )
IS
BEGIN

-- Copy the attributes
FOR x IN 
  (
  SELECT sa.attribute_id, sa.time_to_fix, sa.severity_level
    FROM sv_sec_attribute_set_attrs sa, sv_sec_attributes a 
    WHERE sa.attribute_set_id = p_copy_from
    AND sa.attribute_id = a.attribute_id
    AND a.category_id > 0
  )
LOOP
  INSERT INTO sv_sec_attribute_set_attrs 
    (attribute_id, attribute_set_id, active_flag, time_to_fix, severity_level) 
  VALUES 
    (x.attribute_id, p_copy_to, 'Y', x.time_to_fix, x.severity_level);

  -- Copy the attribute values
  FOR y IN (SELECT * FROM sv_sec_attribute_values WHERE attribute_set_id = p_copy_from and attribute_id = x.attribute_id)
  LOOP
    INSERT INTO sv_sec_attribute_values 
      (attribute_id, active_flag, value, result, attribute_set_id)
    VALUES 
      (x.attribute_id, y.active_flag, y.value, y.result, p_copy_to);
  END LOOP;

END LOOP;

-- Copy the Inline Attributes from the Default Set
copy_inline_attrs(p_copy_to => p_copy_to);

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END copy_attr_set;


--------------------------------------------------------------------------------
-- PROCEDURE: C O P Y _ A T T R I B U T E
--------------------------------------------------------------------------------
PROCEDURE copy_attribute
  (
  p_attribute_id             IN NUMBER,
  p_attribute_set_id         IN NUMBER   DEFAULT NULL,
  p_attribute_sets           IN VARCHAR2 DEFAULT NULL,
  p_attribute_name           IN VARCHAR2,
  p_attribute_key            IN VARCHAR2
  )
IS
  l_attr                     sv_sec_attributes%ROWTYPE;
  l_attr_set_attr            sv_sec_attribute_set_attrs%ROWTYPE;
  l_attribute_id             NUMBER;
  l_attr_set_arr             APEX_APPLICATION_GLOBAL.VC_ARR2;
BEGIN

-- Get the PK
SELECT sv_sec_attributes_seq.NEXTVAL INTO l_attribute_id FROM dual;

-- Get the row to be copied
SELECT * INTO l_attr FROM sv_sec_attributes WHERE attribute_id = p_attribute_id;

-- Convert the To Attribute Set ID to an Array
l_attr_set_arr := apex_util.string_to_table(p_attribute_sets);

-- Copy the attribute
INSERT INTO sv_sec_attributes
  (
  attribute_id,
  category_id,
  attribute_name,
  attribute_key,
  active_flag,
  rule_source,
  table_name,
  column_name,
  view_name,
  score_collection_id,
  rule_plsql,
  rule_type,
  info,
  info_pdf,
  fix,
  fix_pdf,
  when_not_found,
  seq,
  internal_flag,
  help_page,
  impact,
  col_template_id,
  display_page_id,
  summary_page_id,
  component_table,
  component_column_id,
  component_column_display,
  column_table,
  column_column_id,
  column_column_display,
  component_sig_id,
  time_to_fix,
  severity_level
  )
VALUES
  (
  l_attribute_id,
  l_attr.category_id,
  p_attribute_name,
  p_attribute_key,
  l_attr.active_flag,
  l_attr.rule_source,
  l_attr.table_name,
  l_attr.column_name,
  l_attr.view_name,
  l_attr.score_collection_id,
  l_attr.rule_plsql,
  l_attr.rule_type,
  l_attr.info,
  l_attr.info_pdf,
  l_attr.fix,
  l_attr.fix_pdf,
  l_attr.when_not_found,
  l_attr.seq,
  'N',
  l_attr.help_page,
  l_attr.impact,
  l_attr.col_template_id,
  l_attr.display_page_id,
  l_attr.summary_page_id,
  l_attr.component_table,
  l_attr.component_column_id,
  l_attr.component_column_display,
  l_attr.column_table,
  l_attr.column_column_id,
  l_attr.column_column_display,
  l_attr.component_sig_id,
  l_attr.time_to_fix,
  l_attr.severity_level
  );

FOR z IN 1..l_attr_set_arr.COUNT
LOOP

  -- Add new Attribute to the Attribute Set
  INSERT INTO sv_sec_attribute_set_attrs 
    (
    attribute_set_id,
    attribute_id,
    active_flag,
    time_to_fix,
    severity_level
    )
  VALUES
    (
    l_attr_set_arr(z),
    l_attribute_id,
    'Y',
    l_attr.time_to_fix,
    l_attr.severity_level
    );

  -- Loop through each Target Attribute Set
  IF p_attribute_set_id IS NOT NULL THEN
    FOR x IN (SELECT * FROM sv_sec_attribute_values WHERE attribute_id = p_attribute_id 
      AND attribute_set_id = p_attribute_set_id)
    LOOP
 
      -- Create the new Attribute Values
      INSERT INTO sv_sec_attribute_values
        (
        attribute_id,
        value,
        result,
        attribute_set_id,
        active_flag
        )
      VALUES
        (
        l_attribute_id,
        x.value,
        x.result,
        l_attr_set_arr(z), 
        'Y'
        );

    END LOOP;
  END IF;  
END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END copy_attribute;


--------------------------------------------------------------------------------
-- PROCEDURE: M A N A G E _ A T T R _ S E T _ M A P P I N G
--------------------------------------------------------------------------------
-- Manage Mapping of Attributes to Attribute Sets
--------------------------------------------------------------------------------

PROCEDURE manage_attr_set_mapping
  (
  p_attribute_id             IN NUMBER,
  p_rule_type                IN VARCHAR2,
  p_attr_sets                IN VARCHAR2,
  p_val                      IN NUMBER DEFAULT NULL
  )
IS
  l_attr_sets                APEX_APPLICATION_GLOBAL.VC_ARR2;
BEGIN

-- Process Attribute Set Mappings
DELETE FROM sv_sec_attribute_set_attrs WHERE attribute_id = p_attribute_id;

l_attr_sets := APEX_UTIL.STRING_TO_TABLE(p_attr_sets);
FOR x IN 1..l_attr_sets.COUNT
LOOP
  INSERT INTO sv_sec_attribute_set_attrs 
    (attribute_id, attribute_set_id, active_flag)
  VALUES
    (p_attribute_id, l_attr_sets(x), 'Y');    

  -- If a value was provided for a GT or LT rule, add that value here
  IF p_rule_type IN ('LESS_THAN', 'GREATER_THAN') AND p_val IS NOT NULL THEN
  
    INSERT INTO sv_sec_attribute_values (attribute_set_id, attribute_id, value, result)
      VALUES (l_attr_sets(x), p_attribute_id, p_val, 'PASS');
  
  END IF;
END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END manage_attr_set_mapping;


--------------------------------------------------------------------------------
-- PROCEDURE: S H O W _ I N F O
--------------------------------------------------------------------------------
-- Source for the Info popup window
--------------------------------------------------------------------------------
PROCEDURE show_info
  (
  p_attribute_id             IN NUMBER
  )
IS
  l_info                     VARCHAR2(4000);
  l_label                    VARCHAR2(4000);
  l_info_link                VARCHAR2(4000);
  l_url                      VARCHAR2(4000);
BEGIN

-- Get the Help URL
SELECT snippet INTO l_url FROM sv_sec_snippets WHERE snippet_key = 'HELP_URL';

-- Search for any info associated with attribute
FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_id = p_attribute_id)
LOOP
  l_info := x.info;
  l_label := x.attribute_name;
  IF x.help_page IS NOT NULL THEN
    l_info_link := '<div style="text-align:right;padding-top:5px;border-top:1px solid #aaa;">'
      || '<a href="' || l_url || x.help_page || '" target="_blank">View Related Oracle Help</a></div>';
  END IF;
END LOOP;

IF l_info IS NOT NULL THEN
  -- Print the info
  htp.prn(l_label || '^' || l_info || l_info_link);
ELSE
  -- No info found; print corresponding icon and message
  htp.prn('Not Found' || '^' || 'There is no information defined for this attribute');
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END show_info;


--------------------------------------------------------------------------------
-- PROCEDURE: S H O W _ F I X
--------------------------------------------------------------------------------
-- Source for the Fix popup window
--------------------------------------------------------------------------------
PROCEDURE show_fix
  (
  p_attribute_id             IN NUMBER DEFAULT NULL,
  p_attribute_value_id       IN NUMBER DEFAULT NULL
  )
IS
  l_fix                      CLOB;
  l_label                    VARCHAR2(1000);
  l_rule_type                sv_sec_attributes.rule_type%TYPE;
BEGIN

-- Needed to make bold text the same size as non-bold text
--htp.prn('<style type="text/css">strong {font-size:12px;} li strong{font-size: 11px;}</style>');

-- First, check if the rule is NOT NULL, GREATER or LESS THAN
FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_id = p_attribute_id)
LOOP
   l_rule_type := x.rule_type;
   l_label := x.attribute_name;
END LOOP;

--IF l_rule_type IN ('NOT_NULL', 'LESS_THAN', 'GREATER_THAN') THEN

  -- Use the fix at the attribute level
  SELECT fix INTO l_fix FROM sv_sec_attributes
    WHERE attribute_id = p_attribute_id;

--ELSE

   -- Loop through all possible resolutions for each attribute value
--  FOR x IN
--    (SELECT * FROM sv_sec_attribute_values
--      WHERE attribute_value_id = NVL(p_attribute_value_id, -1)
--      AND attribute_set_id = v('P0_ATTRIBUTE_SET_ID'))
--  LOOP
--    -- Check to see if there is a linked resolution
--    IF x.link_to_default = 'Y' THEN
--      -- Get the linked resolution
--      SELECT long_fix INTO l_fix FROM sv_sec_attribute_values 
--        WHERE attribute_value_id = x.link_attribute_value_id;
--    ELSE
--      -- Use the current resolution
--      l_fix := x.long_fix;
--    END IF;
--  END LOOP;
--END IF;

-- Revert to the fix embedded in the attribute, if no fix is found
IF l_fix IS NULL THEN
  -- For attributes
  IF p_attribute_id IS NOT NULL THEN
    FOR x IN (SELECT fix, attribute_name FROM sv_sec_attributes a WHERE a.attribute_id = p_attribute_id)
    LOOP
      l_fix := x.fix;  
      l_label := x.attribute_name;
    END LOOP;
  -- For attribute values
  ELSE
    FOR x IN (SELECT fix, attribute_name FROM sv_sec_attributes a
      WHERE a.attribute_id = (select attribute_id from sv_sec_attribute_values where attribute_value_id = p_attribute_value_id))
    LOOP
      l_fix := x.fix;  
      l_label := x.attribute_name;
    END LOOP;
  END IF;
END IF;

IF l_fix IS NULL THEN
  l_label := 'Not Found';
  l_fix := 'There is no fix defined for this attribute';
END IF;
  -- Print the fix
  htp.prn(l_label || '^' || l_fix);


EXCEPTION
WHEN NO_DATA_FOUND THEN
  -- No fix found; print corresponding icon and message
  htp.prn('Not Found' || '^' || 'There is no information defined for this attribute');

WHEN OTHERS THEN 
  sv_sec_error.raise_unanticipated;

END show_fix;

--------------------------------------------------------------------------------
-- PROCEDURE: V I E W _ S O U R C E
--------------------------------------------------------------------------------
-- Source source in a popup window
--------------------------------------------------------------------------------
PROCEDURE view_source
  (
  p_id                       IN NUMBER DEFAULT NULL,
  p_component_type           IN VARCHAR2 DEFAULT NULL
  )
IS
  l_title                    VARCHAR2(4000);
  l_source                   CLOB;
  l_legend                   VARCHAR2(32767);
  l_count                    NUMBER;

  --TEXT    VARCHAR2(32767) := '#ITEM #APP_ID. #ITEM2. #DOUG. #SESSION.';
  x       NUMBER;
  V_START NUMBER :=1;
  V_END   NUMBER;

BEGIN

l_legend := '
  <div>
   <table>
    <tr><td colspan="3" style="padding-bottom:10px;"><b>Legend</b></td></tr>
    <tr>
     <td style="color:red;padding-right:20px;font-weight:bold;">&ITEM. Syntax</td>
     <td style="color:blue;padding-right:20px;font-weight:bold;">EXECUTE IMMEDIATE</td>
     <td style="color:green;padding-right:20px;font-weight:bold;">Dynamic SQL</td></tr>
   </table>
  </div>';

CASE
  -- Report and Interactive Report, PLSQL Regions, Calendars, Regions
  WHEN p_component_type IN ('REPORT','PLSQL','CALENDAR','REGION','REGION_XSS') THEN
    SELECT 'Page ' || page_id || ' : ' || region_name, region_source 
      INTO l_title, l_source 
      FROM apex_application_page_regions 
      WHERE region_id = p_id;

  -- Page Process
  WHEN p_component_type IN ('PAGE_PROCESS','PAGE_PROCESS_XSS') THEN
    SELECT 'Page ' || page_id || ' : ' || process_name, process_source 
      INTO l_title, l_source 
      FROM apex_application_page_proc 
      WHERE process_id = p_id;

  -- Application Process
  WHEN p_component_type = 'APP_PROCESS' THEN
    SELECT 'Application Process: ' || process_name, process 
      INTO l_title, l_source 
      FROM apex_application_processes 
      WHERE application_process_id = p_id;

  -- Page Computations
  WHEN p_component_type = 'PAGE_COMPUTATION' THEN
    SELECT 'Page ' || page_id || ' : ' || item_name, computation 
      INTO l_title, l_source 
      FROM apex_application_page_comp 
      WHERE computation_id = p_id;
  
  -- Application Computations
  WHEN p_component_type = 'APP_COMPUTATION' THEN
    SELECT 'Application Computation: ' || computation_item, computation 
      INTO l_title, l_source 
      FROM apex_application_computations 
      WHERE application_computation_id = p_id;

  -- Validations
  WHEN p_component_type = 'VALIDATION' THEN
    SELECT 'Page ' || page_id || ' : ' || validation_name, validation_expression1 
      INTO l_title, l_source 
      FROM apex_application_page_val 
      WHERE validation_id = p_id;

  -- Branches
  WHEN p_component_type = 'BRANCH' THEN
    SELECT 'Page ' || page_id || ' : ' || branch_type, branch_action 
      INTO l_title, l_source 
      FROM apex_application_page_branches 
      WHERE branch_id = p_id;

  -- Charts and Maps
  WHEN p_component_type = 'FLASH' THEN
    SELECT 'Page ' || page_id || ' : ' || region_name || ' : ' || series_name, q 
    INTO l_title, l_source
    FROM
      (
      SELECT series_query q, region_id, series_id, page_id, region_name, series_name
        FROM apex_application_page_flash5_s
  --    UNION ALL
  --    SELECT series_query q, region_id, series_id, page_id, region_name, series_name
  --      FROM apex_application_page_flash_s
      )
    WHERE series_id = p_id;

  -- Trees
  WHEN p_component_type = 'TREE' THEN
    SELECT 'Page ' || page_id || ' : ' || region_name, tree_query 
      INTO l_title, l_source 
      FROM apex_application_page_trees 
      WHERE region_id = p_id;

  -- Dynamic Actions
  WHEN p_component_type = 'DYNAMIC_ACTION' THEN
    SELECT 'Page ' || page_id || ' : ' || dynamic_action_name, attribute_01 
      INTO l_title, l_source 
      FROM apex_application_page_da_acts 
      WHERE action_id = p_id;

  -- Plugins
  WHEN p_component_type = 'PLUGIN' THEN
    SELECT display_name, plsql_code
      INTO l_title, l_source 
      FROM apex_appl_plugins 
      WHERE plugin_id = p_id;

  -- Authorization Scheme
  WHEN p_component_type = 'AUTHORIZATION_SCHEME' THEN
    SELECT authorization_scheme_name, attribute_01
      INTO l_title, l_source 
      FROM apex_application_authorization 
      WHERE authorization_scheme_id = p_id;

  -- Item LOVs
  WHEN p_component_type = 'ITEM_LOV' THEN
    SELECT 'Page ' || page_id || ' : ' || item_name, lov_definition 
      INTO l_title, l_source 
      FROM apex_application_page_items 
      WHERE item_id = p_id;

  WHEN p_component_type = 'ITEM_SOURCE' THEN
    SELECT 'Page ' || page_id || ' : ' || item_name, item_source 
      INTO l_title, l_source 
      FROM apex_application_page_items 
      WHERE item_id = p_id;

  WHEN p_component_type = 'ITEM_DEFAULT' THEN
    SELECT 'Page ' || page_id || ' : ' || item_name, item_default 
      INTO l_title, l_source 
      FROM apex_application_page_items 
      WHERE item_id = p_id;

  WHEN p_component_type = 'LIST' THEN
    SELECT list_name, list_query
      INTO l_title, l_source 
      FROM apex_application_lists
      WHERE list_id = p_id;

  -- Shared LOVs
  WHEN p_component_type = 'SHARED_LOV' THEN
    SELECT list_of_values_name, list_of_values_query 
      INTO l_title, l_source 
      FROM apex_application_lovs 
      WHERE lov_id = p_id;

  -- Page Headers: JS Onload
  WHEN p_component_type LIKE 'PAGE_HEADER_JS_ONLOAD' THEN
    SELECT 'Page ' || page_id || ' : ' || page_name || ' : onLoad', javascript_code_onload
      INTO l_title, l_source 
      FROM apex_application_pages
      WHERE page_id = p_id
      AND application_id = nv('P200_APPLICATION_ID');
    
  -- Page Headers: JS and Globals
  WHEN p_component_type LIKE 'PAGE_HEADER_PAGE_HTML_HEAD' THEN
    SELECT 'Page ' || page_id || ' : ' || page_name || ' : Page HTML Header', page_html_header
      INTO l_title, l_source 
      FROM apex_application_pages
      WHERE page_id = p_id
      AND application_id = nv('P200_APPLICATION_ID');
    
  -- Page Headers: JS and Globals
  WHEN p_component_type LIKE 'PAGE_HEADER_JS_GLOBALS' THEN
    SELECT 'Page ' || page_id || ' : ' || page_name || ' : JS & Globals', javascript_code
      INTO l_title, l_source 
      FROM apex_application_pages
      WHERE page_id = p_id
      AND application_id = nv('P200_APPLICATION_ID');

  -- Page Headers: HTML Body
  WHEN p_component_type LIKE 'PAGE_HEADER_HTML_BODY' THEN
    SELECT 'Page ' || page_id || ' : ' || page_name || ' : HTML Body', page_html_onload
      INTO l_title, l_source 
      FROM apex_application_pages
      WHERE page_id = p_id
      AND application_id = nv('P200_APPLICATION_ID');

  -- Page Headers: Header Text
  WHEN p_component_type LIKE 'PAGE_HEADER_HEADER_TEXT' THEN
    SELECT 'Page ' || page_id || ' : ' || page_name || ' : Header Text', header_text
      INTO l_title, l_source 
      FROM apex_application_pages
      WHERE page_id = p_id
      AND application_id = nv('P200_APPLICATION_ID');

  -- Page Headers: Footer Text
  WHEN p_component_type LIKE 'PAGE_HEADER_FOOTER_TEXT' THEN
    SELECT 'Page ' || page_id || ' : ' || page_name || ' : Footer Text', footer_text
      INTO l_title, l_source 
      FROM apex_application_pages
      WHERE page_id = p_id
      AND application_id = nv('P200_APPLICATION_ID');

END CASE;

-- SQLi Checks
IF p_component_type NOT IN ('REGION','REGION_XSS','PAGE_PROCESS_XSS') AND p_component_type NOT LIKE 'PAGE_HEADER%' THEN
  -- EXECUTE IMMEDIATE
  l_source := REGEXP_REPLACE(
    l_source,
    '(execute+[ ]+immediate)',
    '~OPEN_EXEC~\1~CLOSE~',1,0,'i'
    );

  -- DBMS_SQL
  l_source := REGEXP_REPLACE(
    l_source,
    '(DBMS_SQL)',
    '~OPEN_DBMS~\1~CLOSE~',1,0,'i'
    );

  -- ITEM Syntax
  x := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,0,'i');
  WHILE (x != 0)
  LOOP
    IF (REGEXP_SUBSTR(l_source, '(&([0-9a-zA-Z_$]+)(\.))', v_start, 1,'i') not in 
      ('&APP_ID.','&FLOW_ID.','&APP_PAGE_ID.','&APP_USER.','&DEBUG.','&APP_SECURITY_GROUP_ID.','&SESSION.','&APP_SESSION.','&APP_ALIAS.','&FLOW_PAGE_ID.')) 
    THEN
      l_source := REGEXP_REPLACE(l_source, '(&([0-9a-zA-Z_$]+)(\.))', '~OPEN~\1~CLOSE~', v_start, 1, 'i');
    END IF;

    -- PREP FOR THE NEXT ITTERATION OF THE LOOP
    v_start := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,1,'i') +1;
    x := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,0,'i');

  END LOOP;
  
ELSE

-- XSS Checks
  -- Remove all page items from item_source
  FOR z IN (SELECT item_name FROM apex_application_page_items WHERE application_id = nv('P200_APPLICATION_ID'))
  LOOP
    l_source := REPLACE(l_source, '&' || z.item_name || '.', '<<<!' || z.item_name || '!>>>');
  END LOOP;

  -- Check each instance &ITEM. in the source
  x := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,0,'i');
  WHILE (x != 0)
  LOOP
    IF (REGEXP_SUBSTR(l_source, '(&([0-9a-zA-Z_$]+)(\.))', v_start, 1,'i') NOT IN
      ('&APP_ID.','&FLOW_ID.','&APP_PAGE_ID.','&APP_USER.','&DEBUG.','&APP_SECURITY_GROUP_ID.','&SESSION.','&APP_SESSION.','&APP_ALIAS.','&FLOW_PAGE_ID.')) 
    THEN
      -- Add the tags that will highlight failures
      l_source := REGEXP_REPLACE(l_source, '(&([0-9a-zA-Z_$]+)(\.))', '~OPEN~\1~CLOSE~', v_start, 1, 'i');
    END IF;

    -- PREP FOR THE NEXT ITTERATION OF THE LOOP
    v_start := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,1,'i') +1;
    x := REGEXP_INSTR(l_source,'(&([0-9a-zA-Z_$]+)(\.))', v_start,1,0,'i');

  END LOOP;
END IF;

-- htp.p Checks
IF p_component_type IN ('REGION','REGION_XSS','PAGE_PROCESS','PAGE_PROCESS_XSS') THEN
  -- Loop through all potentially dangerous HTP calls
  FOR x IN (SELECT * FROM sv_sec_htp_procs WHERE active_flag = 'Y' ORDER BY htp_proc_id)
  LOOP
    l_source := REGEXP_REPLACE(
      l_source,
      '(' || x.htp_proc || ')',
      '~OPEN_HTP~\1~CLOSE~',1,0,'i'
      );
  END LOOP;
END IF;

-- Print the results
htp.prn(l_title || '~');

IF LENGTH(l_source) > 0 THEN
  -- Put back the & and .
  l_source := REPLACE(l_source, '<<<!','&');
  l_source := REPLACE(l_source, '!>>>','.');

  -- Escape the contents of the source
  l_source := htf.escape_sc(l_source);
  
  -- Add highlighting based on the condition found
  l_source := REPLACE(l_source, '~OPEN~', '<span style="background-color:yellow;font-family:Courier;">');
  l_source := REPLACE(l_source, '~OPEN_EXEC~', '<span style="background-color:pink;font-family:Courier;">');
  l_source := REPLACE(l_source, '~OPEN_DBMS~', '<span style="background-color:cyan;font-family:Courier;">');
  l_source := REPLACE(l_source, '~OPEN_HTP~', '<span style="background-color:orange;font-family:Courier;">');
  l_source := REPLACE(l_source, '~CLOSE~', '</span>');
 
  -- Display the source
  htp.prn('<b>Source</b><pre style="font-family:Courier;">' || l_source || '</pre>');
ELSE
  htp.prn('This region contains no contents');
END IF;

EXCEPTION

WHEN NO_DATA_FOUND THEN
  htp.p('Error~' || p_id);
WHEN OTHERS THEN 
  sv_sec_error.raise_unanticipated;

END view_source;


--------------------------------------------------------------------------------
-- PROCEDURE: R E C O R D _ E V A L
--------------------------------------------------------------------------------
-- Records an evaluation run
--------------------------------------------------------------------------------
PROCEDURE record_eval
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN VARCHAR,
  p_app_user                 IN VARCHAR,
  p_approved_score           IN NUMBER,
  p_pending_score            IN NUMBER,
  p_raw_score                IN NUMBER,
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_scheduled_eval           IN VARCHAR2 DEFAULT 'N',
  p_evaluated_ws             IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  )
IS
  l_app_eval_id              NUMBER;
  l_cls_raw_score            NUMBER := 0;
  l_cls_pending_score        NUMBER := 0;
  l_cls_approved_score       NUMBER := 0;
  l_cls_possible_score       NUMBER := 0;
  l_cat_raw_score            NUMBER := 0;
  l_cat_pending_score        NUMBER := 0;
  l_cat_approved_score       NUMBER := 0;
  l_cat_possible_score       NUMBER := 0;
  l_collection_id            NUMBER;
  l_attr_possible_score      NUMBER := 0;
  TYPE l_score_t             IS TABLE OF NUMBER index by binary_integer;
  l_score_arr                l_score_t;
BEGIN

-- Get the Collection ID
l_collection_id := get_collection_id(
  p_application_id           => p_application_id,
  p_app_user                 => p_app_user,
  p_app_session              => p_app_session
);

-- Get the sequence ID
IF p_app_eval_id IS NULL THEN
  SELECT sv_sec_app_eval_seq.NEXTVAL INTO l_app_eval_id FROM dual;
ELSE
  l_app_eval_id := p_app_eval_id;
END IF;

-- Update the eval table
INSERT INTO sv_sec_app_evals(app_eval_id, attribute_set_id, application_id, app_user, eval_date, approved_score, pending_score, raw_score, scheduled_eval, evaluated_ws)
VALUES (l_app_eval_id, p_attribute_set_id, p_application_id, p_app_user, SYSDATE, p_approved_score, p_pending_score, p_raw_score, p_scheduled_eval, p_evaluated_ws);

FOR x IN (SELECT * FROM sv_sec_classifications ORDER BY seq)
LOOP

  FOR y IN (SELECT DISTINCT c.category_id, c.category_key 
    FROM sv_sec_categories c, sv_sec_attribute_set_attrs asa, sv_sec_attributes a
      WHERE c.classification_id = x.classification_id 
      AND c.category_id = a.category_id 
      AND a.attribute_id = asa.attribute_id 
      AND asa.attribute_set_id = p_attribute_set_id)

  LOOP

    FOR z IN (SELECT a.attribute_id, a.attribute_key FROM sv_sec_attributes a, sv_sec_attribute_set_attrs asa 
      WHERE a.category_id = y.category_id 
        AND asa.attribute_set_id = p_attribute_set_id 
        AND asa.attribute_id = a.attribute_id)

    LOOP

      SELECT count(*) INTO l_score_arr(1) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = z.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result IN ('PASS', 'APPROVED');
      
      SELECT count(*) INTO l_score_arr(2) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = z.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result IN ('PASS', 'PENDING', 'APPROVED');

      SELECT count(*) INTO l_score_arr(3) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = z.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result = 'PASS';
      
      SELECT count(*) INTO l_attr_possible_score FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = z.attribute_id
        AND cd.collection_id = l_collection_id;

      -- Save the classificaiton tally
      l_cls_possible_score := l_cls_possible_score + l_attr_possible_score;
      l_cls_approved_score := l_cls_approved_score + l_score_arr(1);
      l_cls_pending_score  := l_cls_pending_score  + l_score_arr(2);
      l_cls_raw_score      := l_cls_raw_score      + l_score_arr(3);

      -- Save the Category tally
      l_cat_possible_score := l_cat_possible_score + l_attr_possible_score;
      l_cat_approved_score := l_cat_approved_score + l_score_arr(1);
      l_cat_pending_score  := l_cat_pending_score  + l_score_arr(2);
      l_cat_raw_score      := l_cat_raw_score      + l_score_arr(3);

      -- Save the Attribute Score
      INSERT INTO sv_sec_app_eval_attr 
        (app_eval_id, attribute_id, approved_score, pending_score, raw_score, possible_score)
      VALUES 
        (l_app_eval_id, z.attribute_id, l_score_arr(1), l_score_arr(2), l_score_arr(3), l_attr_possible_score);
 
      -- Reset the array
      l_score_arr.delete;

    END LOOP;
    
    -- Save the Category Score
    INSERT INTO sv_sec_app_eval_cat
      (app_eval_id, category_id, approved_score, pending_score, raw_score, possible_score)
    VALUES 
      (l_app_eval_id, y.category_id, l_cat_approved_score, l_cat_pending_score, l_cat_raw_score, l_cat_possible_score);
    
    l_cat_approved_score := 0;
    l_cat_pending_score := 0;
    l_cat_raw_score := 0;
    l_cat_possible_score := 0;
    
  END LOOP;

  -- Save the Classification Score
  INSERT INTO sv_sec_app_eval_cls
    (app_eval_id, classification_id, approved_score, pending_score, raw_score, possible_score)
  VALUES 
    (l_app_eval_id, x.classification_id, l_cls_approved_score, l_cls_pending_score, l_cls_raw_score, l_cls_possible_score);

  l_cls_approved_score := 0;
  l_cls_pending_score := 0;
  l_cls_raw_score := 0;
  l_cls_possible_score :=0;

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END record_eval;


--------------------------------------------------------------------------------
-- PROCEDURE: A P P L Y _ N O T A T I O N S
--------------------------------------------------------------------------------
-- Applies all the notations
--------------------------------------------------------------------------------
PROCEDURE apply_notations
  (
  p_collection_id            IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN VARCHAR2 DEFAULT v('APP_ID')
  )
IS
BEGIN

-- Update all attributes with a Add Notation link
UPDATE sv_sec_collection_data 
  SET notation = '<i class="fa fa-lg fa-comment" style="color:#999;"></i>',
      notation_url = 'f?p=' || p_sert_app_id || ':20:' || p_app_session || ':::20:P20_NOTATION_PK:' || attribute_id || '|' || CASE WHEN page_id = -1 THEN NULL ELSE page_id END || '|' || component_id || '|' || column_id
  WHERE notation IS NULL AND collection_id = p_collection_id;
        
-- Add an Edit Notation link for any existing notations
FOR x IN (SELECT DISTINCT attribute_id, page_id, component_id, column_id, COUNT(*) c 
  FROM sv_sec_notations 
  WHERE application_id = p_application_id AND attribute_set_id = p_attribute_set_id
  GROUP BY attribute_id, page_id, component_id, column_id)
LOOP

  UPDATE sv_sec_collection_data 
    SET notation = 
        '<i class="fa fa-lg fa-comments" style="color:#999;padding-left:3px;" title="' || x.c || ' Comments"></i>',
        notation_url = 'f?p=' || p_sert_app_id || ':20:' || p_app_session || ':::20:P20_NOTATION_PK:' || attribute_id || '|' || CASE WHEN page_id = -1 THEN NULL ELSE page_id END || '|' || component_id || '|' || column_id-- Note Edit
    WHERE collection_id = p_collection_id
    AND
      CASE 
        WHEN attribute_id IS NOT NULL AND (page_id IS NULL OR page_id = -1) AND component_id IS NULL AND column_id IS NULL AND attribute_id = x.attribute_id THEN 1
        WHEN attribute_id IS NOT NULL AND page_id IS NOT NULL AND component_id IS NULL AND column_id IS NULL AND attribute_id = x.attribute_id AND (page_id = x.page_id OR page_id = -1) THEN 1
        WHEN attribute_id IS NOT NULL AND page_id IS NOT NULL AND component_id IS NOT NULL AND column_id IS NULL AND attribute_id = x.attribute_id AND page_id = x.page_id AND component_id = x.component_id THEN 1
        WHEN attribute_id IS NOT NULL AND page_id IS NOT NULL AND component_id IS NOT NULL AND column_id IS NOT NULL AND attribute_id = x.attribute_id AND page_id = x.page_id AND component_id = x.component_id AND column_id = x.column_id THEN 1
        ELSE 0
      END = 1;

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END apply_notations;


--------------------------------------------------------------------------------
-- FUNCTION: N O T A T I O N _ H I S T O R Y _ S Q L
--------------------------------------------------------------------------------
-- Returns the SQL for the Notation History Report
--------------------------------------------------------------------------------
FUNCTION notation_history_sql
  (
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_notation_pk              IN VARCHAR2
  )
RETURN VARCHAR2
IS
  l_sql                      VARCHAR2(32767);
  l_pk                       apex_application_global.vc_arr2;    
  l_attribute_id             NUMBER;
  l_page_id                  NUMBER;
  l_component_id             VARCHAR2(1000);
  l_column_id                NUMBER;
BEGIN

-- Parse through the p_exception_pk and decompose into individual items
l_pk := apex_util.string_to_table(p_notation_pk,'|');

-- Loop through the table and assign each component
-- String should conform to this: ATTRIBUTE_ID:PAGE_ID:COMPONENT_ID:COLUMN_ID
FOR x IN 1..l_pk.COUNT
LOOP
  CASE 
    WHEN x = 1 THEN l_attribute_id := l_pk(x);    
    WHEN x = 2 THEN l_page_id      := l_pk(x);
    WHEN x = 3 THEN l_component_id := l_pk(x);
    WHEN x = 4 THEN l_column_id    := l_pk(x);
  END CASE;
END LOOP;

IF p_notation_pk IS NULL THEN

l_sql := 'SELECT
  NOTATION comment_text, 
  CREATED_BY user_name, 
  CREATED_ON comment_date,
  NULL actions,
  NULL attribute_1,
  NULL attribute_2,
  NULL attribute_3,
  NULL attribute_4
FROM
sv_sec_notations WHERE 1 = 2 ';


ELSE

-- Assemble the SQL to be used
l_sql := ' 
SELECT
  n.NOTATION comment_text, 
  n.CREATED_BY || '' ('' || au.workspace_name || '')'' user_name, 
  n.CREATED_ON comment_date,
  CASE 
    WHEN n.created_by = v(''APP_USER'') AND au.workspace_name = (SELECT workspace_name FROM apex_workspaces WHERE workspace_id = nv(''G_WORKSPACE_ID'')) THEN
      ''<a href="#" id="'' || n.notation_id || ''" class="removeNotation"><i class="fa fa-lg fa-trash"></i></a>''
    ELSE NULL 
  END actions,
  NULL attribute_1,
  NULL attribute_2,
  NULL attribute_3,
  NULL attribute_4
FROM
  sv_sec_notations n,
  apex_workspace_apex_users au
WHERE
  n.application_id = ' || p_application_id || '
  AND n.attribute_set_id = ' || p_attribute_set_id || '
  AND n.attribute_id = ' || l_attribute_id || '
  AND n.created_ws = au.workspace_id
  AND n.created_by = au.user_name';

-- Include Page, if one exists
IF l_page_id IS NOT NULL THEN
  l_sql := l_sql || ' AND page_id = ' || l_page_id;
END IF;

-- Include Component, if one exists
IF l_component_id IS NOT NULL THEN
  l_sql := l_sql || ' AND component_id = ' || l_component_id;
END IF;

-- Include Column, if one exists
IF l_column_id IS NOT NULL THEN
  l_sql := l_sql || ' AND column_id = ' || l_column_id;
END IF;

END IF;

RETURN l_sql;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END notation_history_sql;

--------------------------------------------------------------------------------
-- FUNCTION: G E T _ C H E C K S U M
--------------------------------------------------------------------------------
-- Returns an MD5 checksum for a value
--------------------------------------------------------------------------------
FUNCTION get_checksum
  (
  p_value                    IN CLOB DEFAULT NULL
  )
  RETURN RAW
IS
  l_checksum LONG RAW(2048);
  l_value    CLOB;
BEGIN

IF p_value IS NULL THEN
  l_value := 'NULL';
ELSE
  l_value := REPLACE(REPLACE(p_value,CHR(10),NULL),CHR(13),NULL);
END IF;

l_checksum := dbms_crypto.hash(l_value, 1);

RETURN l_checksum;
      
EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_checksum;


--------------------------------------------------------------------------------
-- PROCEDURE: R E C O R D _ C O O K I E
--------------------------------------------------------------------------------
-- Records Session ID and Cookie for Builder Authentication
--------------------------------------------------------------------------------
PROCEDURE record_cookie
  (
  p_session_id               IN NUMBER,
  p_cookie_val               IN VARCHAR2
  )
IS
BEGIN

-- Store the Session ID and Cookie Value
INSERT INTO sv_sec_cookie_sessions (session_id, cookie_val) 
  VALUES (TO_CHAR(p_session_id), TO_CHAR(p_cookie_val));

END record_cookie;


--------------------------------------------------------------------------------
-- PROCEDURE: B U I L D E R _ A U T H
--------------------------------------------------------------------------------
-- Authenticates users to SERT by inspecting the APEX Builder cookie
--------------------------------------------------------------------------------
PROCEDURE builder_auth
  (
  p_session_id               IN NUMBER
  )
IS
  l_username                 VARCHAR2(1000);
  l_sgid                     NUMBER;
BEGIN

-- Fetch the row from the temporary table based on Session ID
FOR x IN (SELECT * FROM sv_sec_cookie_sessions WHERE session_id = p_session_id)
LOOP
  -- Validate that a row in WWV_FLOW_SESSIONS$ exists that contains the session ID and cookie value
  SELECT username, security_group_id INTO l_username, l_sgid 
    FROM sv_sec_apex_sessions_v WHERE id = p_session_id and cookie_value = x.cookie_val; 
END LOOP;

-- Delete the corresponding row from the temp table
DELETE FROM sv_sec_cookie_sessions where session_id = p_session_id;

-- Set the session state for the workspace ID and builder session ID in SERT
apex_util.set_session_state('G_WORKSPACE_ID', l_sgid);
apex_util.set_session_state('G_APEX_BUILDER_SESSION_ID', p_session_id);

-- If l_username has a value, then login
IF l_username IS NOT NULL THEN
  apex_authentication.login( 
    p_username => l_username,
    p_password => 'sert');
ELSE
  -- Username was NULL; redirect to error page
  owa_util.redirect_url('f?p=' || v('APP_ID') || ':102:0:ERROR');
END IF;

EXCEPTION
WHEN no_data_found THEN
  DELETE FROM sv_sec_cookie_sessions WHERE session_id = p_session_id;
  owa_util.redirect_url('f?p=' || v('APP_ID') || ':102:0:ERROR');

END builder_auth;


--------------------------------------------------------------------------------
-- FUNCTION: B U I L D E R _ A U T H _ F C N
--------------------------------------------------------------------------------
-- Placeholder Authentication Scheme called by BUILDER_AUTH
--------------------------------------------------------------------------------
FUNCTION builder_auth_fcn
  (
  p_username                 IN VARCHAR2,
  p_password                 IN VARCHAR2
  )
  RETURN BOOLEAN
IS
BEGIN
RETURN TRUE;
END builder_auth_fcn;


--------------------------------------------------------------------------------
-- FUNCTION: U S E R _ H A S _ R O L E
--------------------------------------------------------------------------------
-- Determines whether or not a user has a role
--------------------------------------------------------------------------------
FUNCTION user_has_role
  (
  p_application_id           IN VARCHAR2 DEFAULT NULL,
  p_workspace_id             IN VARCHAR2,
  p_user_name                IN VARCHAR2,
  p_role_name                IN VARCHAR2
  )
  RETURN BOOLEAN
IS
  l_application_id           NUMBER := p_application_id;
  l_workspace_id             NUMBER;
  l_roles_arr                APEX_APPLICATION_GLOBAL.VC_ARR2;
BEGIN

l_roles_arr := APEX_UTIL.STRING_TO_TABLE(p_role_name);

-- Get the workspace ID of the current application, if one was passed in
IF l_application_id IS NOT NULL AND l_application_id != 0 THEN
  SELECT workspace_id INTO l_workspace_id FROM apex_applications WHERE application_id = l_application_id;
END IF;

-- Determine if the role exists
FOR z IN 1..l_roles_arr.COUNT 
LOOP
  IF l_roles_arr(z) = 'SV_SERT_APPROVER_ALL' THEN
    l_application_id := 0;
  END IF;
  FOR x IN
  (
    SELECT 
      * 
    FROM 
      sv_sec_user_roles 
    WHERE 
      user_name = p_user_name
      AND user_workspace_id = p_workspace_id
      AND role_name = l_roles_arr(z) 
      AND 1 = 
      CASE
        WHEN l_application_id = 0 AND workspace_id = 0 THEN 1
        WHEN l_application_id IS NULL THEN 1
        WHEN l_application_id IS NOT NULL AND workspace_id = l_workspace_id THEN 1
        ELSE 0
      END
    )
  LOOP
    RETURN TRUE;
  END LOOP;
END LOOP;

RETURN FALSE;

END user_has_role;


--------------------------------------------------------------------------------
-- FUNCTION: U S E R _ H A S _ R O L E _ V C
--------------------------------------------------------------------------------
-- Determines whether or not a user has a role and returns a VARCHAR
--------------------------------------------------------------------------------
FUNCTION user_has_role_vc
  (
  p_application_id           IN VARCHAR2 DEFAULT NULL,
  p_workspace_id             IN VARCHAR2,
  p_user_name                IN VARCHAR2,
  p_role_name                IN VARCHAR2
  )
  RETURN VARCHAR2
IS
  l_result                   BOOLEAN;
BEGIN

l_result := user_has_role
  (
  p_application_id           => p_application_id,
  p_workspace_id             => p_workspace_id,
  p_user_name                => p_user_name,
  p_role_name                => p_role_name  
  );
  
IF l_result = TRUE THEN
  RETURN 'TRUE';
ELSE
  RETURN 'FALSE';
END IF;

END user_has_role_vc;


--------------------------------------------------------------------------------
-- FUNCTION: I S _ A C C O U N T _ L O C K E D
--------------------------------------------------------------------------------
-- Wrapper with VARCHAR for apex_util.get_account_locked_status
--------------------------------------------------------------------------------
FUNCTION is_account_locked
  (
  p_user_name                IN VARCHAR2
  )
RETURN VARCHAR2
IS
BEGIN

IF APEX_UTIL.GET_ACCOUNT_LOCKED_STATUS (p_user_name => p_user_name) = TRUE THEN  
  RETURN 'Y';
ELSE 
  RETURN 'N';
END IF;

END is_account_locked;


--------------------------------------------------------------------------------
-- PROCEDURE: P U R G E _ E V A L S
--------------------------------------------------------------------------------
-- Purges either all or selected evaluations
--------------------------------------------------------------------------------
PROCEDURE purge_evals
  (
  p_eval_type                IN VARCHAR2
  )
IS
BEGIN

-- Purge all evaluations
IF p_eval_type = 'PURGE_ALL' THEN
  DELETE FROM sv_sec_app_evals;

-- Purge just the selected evaluations
ELSIF p_eval_type = 'PURGE_SELECTED' THEN
  FOR x IN 1..apex_application.g_f01.COUNT
  LOOP
    DELETE FROM sv_sec_app_evals WHERE app_eval_id = apex_application.g_f01(x);
  END LOOP;

-- Purge all scheduled results
ELSIF p_eval_type = 'PURGE_ALL_SCHEDULED' THEN
  DELETE FROM sv_sec_app_evals WHERE scheduled_eval = 'Y';
END IF;

END purge_evals;


--------------------------------------------------------------------------------
-- PROCEDURE: P U R G E _ E V E N T S
--------------------------------------------------------------------------------
-- Purges either all or selected events
--------------------------------------------------------------------------------
PROCEDURE purge_events
  (
  p_event_type               IN VARCHAR2
  )
IS
BEGIN

-- Purge all evaluations
IF p_event_type = 'PURGE_ALL' THEN
  DELETE FROM sv_sec_events;

-- Purge just the selected evaluations
ELSIF p_event_type = 'PURGE_SELECTED' THEN
  FOR x IN 1..apex_application.g_f01.COUNT
  LOOP
    DELETE FROM sv_sec_events WHERE event_id = apex_application.g_f01(x);
  END LOOP;

END IF;

END purge_events;


--------------------------------------------------------------------------------
-- FUNCTION: B C _ B U T T O N S
--------------------------------------------------------------------------------
-- Determines which buttons to render in the breadcrumb region
--------------------------------------------------------------------------------
FUNCTION bc_buttons
  (
  p_button_key               IN VARCHAR2
  )
RETURN BOOLEAN
IS
  l_app_page_id              NUMBER := nv('APP_PAGE_ID');
  l_count                    NUMBER;
BEGIN

-- Reject by Page Range First
IF l_app_page_id < 400 OR l_app_page_id > 799 THEN
  RETURN FALSE;
END IF;

-- Determine SEV
IF p_button_key LIKE 'SEV%' THEN
  SELECT COUNT(*) INTO l_count FROM sv_sec_attribute_set_attrs WHERE attribute_id = nv('G_ATTRIBUTE_ID') AND attribute_set_id = nv('P0_ATTRIBUTE_SET_ID') AND severity_level = SUBSTR(p_button_key,4);
  IF l_count = 1 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;

ELSIF p_button_key LIKE '%MULT' THEN
  IF l_app_page_id IN (300,400,500,600,700,450,570,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785) THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

ELSIF p_button_key = 'HELP' THEN

  IF l_app_page_id IN (0,400,500,600,700) THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

ELSIF p_button_key = 'FIX' THEN
  IF l_app_page_id IN (300,400,500,600,700,450,570,705,710,715,720,725,730,735,740,745,750,755,760,765,770,775,780,785) THEN
    RETURN FALSE;
  ELSE
    RETURN TRUE;
  END IF;

END IF;

-- Catch All Return False
RETURN FALSE;


END bc_buttons;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_util;