CREATE OR REPLACE PACKAGE BODY sv_sec
AS 

--------------------------------------------------------------------------------
-- FUNCTION: G E T _ G U I D
--------------------------------------------------------------------------------
-- Returns the product GUID
--------------------------------------------------------------------------------
FUNCTION get_guid
RETURN VARCHAR2
IS
BEGIN

RETURN c_guid;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_guid;


--------------------------------------------------------------------------------
-- PROCEDURE: C R E A T E _ C O L L E C T I O N
--------------------------------------------------------------------------------
-- Returns the result for a specific attribute
--------------------------------------------------------------------------------
PROCEDURE create_collection
  (
  p_collection_id            IN NUMBER,
  p_collection_name          IN VARCHAR2,
  p_app_id                   IN VARCHAR2,
  p_app_session              IN VARCHAR2,
  p_query                    IN VARCHAR2
)
IS
  l_query                    VARCHAR2(4000) := p_query;
BEGIN

-- Replace all tokens
l_query := REPLACE(l_query, '#COLLECTION_ID#', p_collection_id);
l_query := REPLACE(l_query, '#COLLECTION_NAME#', p_collection_name);
l_query := REPLACE(l_query, '#APPLICATION_ID#', p_app_id);
l_query := REPLACE(l_query, '#APP_SESSION#', p_app_session);
l_query := REPLACE(l_query, 'INSERT', 'INSERT /*+ append */');

-- Execute the Query to Populate the Collection Data
EXECUTE IMMEDIATE l_query;

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    logger.log(l_query);
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END create_collection;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ R E S U L T
--------------------------------------------------------------------------------
-- Returns the result for a specific attribute
--------------------------------------------------------------------------------
FUNCTION get_result
  (
  p_attribute_key            IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_value                    IN VARCHAR2,
  p_recommended_value        IN VARCHAR2 DEFAULT NULL,
  p_show_value               IN VARCHAR2 DEFAULT 'N',
  p_image                    IN VARCHAR2 DEFAULT 'Y',
  p_exception_key            IN VARCHAR2 DEFAULT NULL,
  p_inline                   IN VARCHAR2 DEFAULT 'N'
  )
RETURN VARCHAR2
IS
  l_value                    apex_application_global.vc_arr2;    
  l_result                   apex_application_global.vc_arr2;    
 y                           NUMBER := 1;
BEGIN

-- Populate the array with all potential PASS values for the attribute
FOR x IN 
  (
  SELECT 
    value,
    result
  FROM 
    sv_sec_attribute_values av, 
    sv_sec_attributes a
  WHERE 
    a.attribute_id = av.attribute_id 
    AND a.attribute_key = p_attribute_key 
    AND av.attribute_set_id = p_attribute_set_id
  )
LOOP
  l_value(y) := x.value;
  l_result(y) := x.result;
  y := y + 1;
END LOOP;

-- Loop through a single attribute and determine whether it passed or failed
FOR x IN
  (
  SELECT 
    a.attribute_id,
    a.attribute_key,
    a.rule_type,
    a.rule_source,
    a.when_not_found
  FROM
    sv_sec_attribute_set_attrs asa,
    sv_sec_attributes a,
    sv_sec_attribute_sets s
  WHERE
    asa.attribute_id = a.attribute_id
    AND a.attribute_key = p_attribute_key
    AND s.attribute_set_id = asa.attribute_set_id
    AND s.attribute_set_id = p_attribute_set_id
  )
LOOP

  IF x.rule_source IN ('COLUMN','COLLECTION') THEN

    IF x.rule_type = 'NONE' THEN
      -- Unconditionally Pass, as no rule needs to be applied
      RETURN 'PASS';
    -- Value is NOT NULL

    ELSIF x.rule_type = 'NOT_NULL' THEN
      IF p_value IS NULL THEN
        RETURN 'FAIL';
      ELSE
        RETURN 'PASS';
      END IF;

    -- Value is LESS THAN    
    ELSIF x.rule_type = 'LESS_THAN' THEN
      IF TO_NUMBER(p_value) < l_value(1) THEN
        RETURN 'PASS';
      ELSE
        RETURN 'FAIL';
      END IF;

    -- Value is GREATER THAN
    ELSIF x.rule_type = 'GREATER_THAN' THEN
      IF TO_NUMBER(p_value) > l_value(1) THEN
        RETURN 'PASS';
      ELSE
        RETURN 'FAIL';
      END IF;

    -- Value is in COMPARISON LIST
    ELSIF x.rule_type = 'COMPARISON' THEN

      FOR z IN 1..l_value.COUNT
      LOOP      
        IF l_value(z) = p_value THEN
          RETURN l_result(z);
        END IF;
      END LOOP;

      RETURN x.when_not_found;

    -- Unhandled issue
    ELSE      
      RETURN 'FAIL';    

    END IF;
  
  ELSIF x.rule_source = 'PLSQL' THEN
  
    -- Not yet implemented  
    RETURN 'FAIL';

  END IF;

END LOOP;

RETURN NULL;

EXCEPTION
  WHEN OTHERS THEN
    logger.log('Attribute' || p_attribute_key || ' - Value:' || p_value || ' - Recommended Value: ' || p_recommended_value);
    sv_sec_error.raise_unanticipated;

END get_result;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ R E C O M M E N D E D _ V A L U E
--------------------------------------------------------------------------------
-- Retrns recommended value(s) for an attribute
--------------------------------------------------------------------------------
FUNCTION get_recommended_value
  (
  p_attribute_set_id         IN NUMBER,
  p_attribute_key            IN VARCHAR2
  )
RETURN VARCHAR2
IS
  l_recommended_value        VARCHAR2(4000);
  l_recommended_value_list   VARCHAR2(32767);
  l_counter                  NUMBER := 0;
  l_rule_type                sv_sec_attributes.rule_type%TYPE;
BEGIN

-- Get the rule type
SELECT rule_type INTO l_rule_type FROM sv_sec_attributes
  WHERE attribute_key = p_attribute_key;

-- Determine what to return based on the rule type
IF l_rule_type = 'NONE' THEN
  RETURN NULL;
ELSIF l_rule_type = 'NOT_NULL' THEN
  RETURN 'NOT NULL';
ELSE

  -- Loop through and return all recommended values for an attribute
  FOR x IN
    (
    SELECT 
      value,
      result
    FROM
      sv_sec_attributes sa,
      sv_sec_attribute_set_attrs sasa,
      sv_sec_attribute_values sav
    WHERE
      sa.attribute_id = sasa.attribute_id
      AND sasa.attribute_set_id = p_attribute_set_id
      AND sav.attribute_set_id = sasa.attribute_set_id
      AND sasa.attribute_id = sav.attribute_id(+)
      AND sa.attribute_key = p_attribute_key
      AND sav.result = 'PASS'
      AND sa.active_flag = 'Y'
    )
  LOOP
    l_recommended_value := x.value;
    l_recommended_value_list := l_recommended_value_list || '<li style="font-size:1.2rem; margin-left:10px;">' || x.value || '</li>';
    l_counter := l_counter + 1;
  END LOOP;    
    
  IF l_counter > 1 THEN
    RETURN NVL(l_recommended_value_list, 'n/a');
  ELSE
    IF l_rule_type = 'LESS_THAN' THEN
      RETURN 'Less Than ' || NVL(l_recommended_value, 'n/a');
    ELSIF l_rule_type = 'GREATER_THAN' THEN
      RETURN 'Greater Than ' || NVL(l_recommended_value, 'n/a');
    ELSE
      RETURN NVL(l_recommended_value, 'n/a');
    END IF;
  END IF;

END IF;

END get_recommended_value;


--------------------------------------------------------------------------------
-- PROCEURE: C A L C _ A T T R I B U T E _ C O L U M N
--------------------------------------------------------------------------------
-- 
--------------------------------------------------------------------------------
PROCEDURE calc_attribute_column
  (
  p_collection_id            IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_id             IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_app_session              IN NUMBER
  )
IS
  l_sql                      VARCHAR2(32767);
  x                          sv_sec_attributes%ROWTYPE;
  l_col_template             VARCHAR2(4000);
BEGIN

-- Fetch the attribute row
SELECT * INTO x FROM sv_sec_attributes WHERE attribute_id = p_attribute_id;

-- Fetch the SQL Template
SELECT col_template INTO l_col_template FROM sv_sec_col_templates
  WHERE col_template_id = x.col_template_id;

l_sql := REPLACE(l_col_template, '#ATTRIBUTE_KEY#', x.attribute_key);
l_sql := REPLACE(l_sql, '#COLUMN_NAME#', x.column_name);

sv_sec_collections.create_collection
  (
  p_collection_id            => p_collection_id,
  p_collection_name          => x.attribute_key,
  p_application_id           => p_application_id,
  p_app_session              => p_app_session,
  p_query                    => l_sql,
  p_attribute_set_id         => p_attribute_set_id
  );

EXCEPTION
  WHEN OTHERS THEN
    logger.log_error;
    raise_application_error(-20000, DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END calc_attribute_column;


--------------------------------------------------------------------------------
-- PROCEDURE: S U M M A R Y _ D A S H B O A R D
--------------------------------------------------------------------------------
-- Prints a dashboard for a Summary Page
--------------------------------------------------------------------------------
PROCEDURE summary_dashboard
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID')
  )
AS
  l_collection_id            sv_sec_collection.collection_id%TYPE;
  l_title                    apex_application_pages.page_title%TYPE;
  l_result                   VARCHAR2(100);
  l_pct_score                NUMBER;
  TYPE l_score_t             IS TABLE OF NUMBER index by binary_integer;
  l_score_arr                l_score_t;
  l_possible_score           NUMBER := 0;
  y                          NUMBER := 1;
  z                          NUMBER;
  l_pending_count            NUMBER;
  l_count                    NUMBER;
  l_total                    NUMBER := 0;
  l_total_pct                NUMBER := 0;
  l_attribute_name           VARCHAR2(255);
  l_total_possible_score     NUMBER := 0;
  l_not_found_html           VARCHAR2(10000);
  l_html                     VARCHAR2(10000);
BEGIN

-- Get the name based on the page name
SELECT page_title INTO l_title FROM apex_application_pages
  WHERE page_id = p_page_id
  AND application_id = p_sert_app_id;

-- Get the current collection ID
l_collection_id := sv_sec_util.get_collection_id(
  p_app_user                 => p_app_user,
  p_app_session              => p_app_session,
  p_application_id           => p_application_id);

-- Get the value of Result
l_result := NVL(v('P0_RESULT'),'Raw');

-- Produce the dashboard region for the specific summary page
FOR x IN (SELECT * FROM sv_sec_attributes WHERE summary_page_id = p_page_id AND active_flag = 'Y' ORDER BY attribute_key)
LOOP
  -- Determine if any components exist
  SELECT count(*) INTO l_count FROM
    sv_sec_collection_data
  WHERE
    attribute_id = x.attribute_id
    AND collection_id = l_collection_id;

  -- If there is no data found, then record the card
  IF l_count = 0 THEN

    -- Get the attribute name
    IF INSTR(x.attribute_name,'Contains') > 0 THEN
      l_attribute_name := SUBSTR(x.attribute_name, INSTR(x.attribute_name, 'Contains')+9);
    ELSE
      l_attribute_name := x.attribute_name;
    END IF;

    l_not_found_html := l_not_found_html || 
         '<li class="t-Cards-item">'
      || '<div class="t-Card t-Card-wrap"><a href="' || apex_util.prepare_url('f?p=' || p_sert_app_id || ':' || x.display_page_id || ':' || p_app_session) || '">'
      || '  <div class="t-Card-titleWrap"><h3 class="t-Card-title">' || 
        CASE 
          WHEN (INSTR(x.attribute_name, 'Contains') > 0) THEN
            SUBSTR(x.attribute_name, INSTR(x.attribute_name, 'Contains')+9)
          WHEN (INSTR(x.attribute_name, 'Inconsistencies') > 0) THEN
            REPLACE(x.attribute_name, 'Inconsistencies', NULL)
          ELSE x.attribute_name 
        END || '</h3></div>'
      || '<div class="t-Card-body">'
      || '  <div class="t-Card-desc" style="height:60px;">No matching components for this attribute</div>'
      || '  </div>'
      || '</a></div>'
      || '</li>';

  ELSE

    IF l_result = 'Approved' THEN

      SELECT count(*) INTO l_score_arr(y) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = x.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result IN ('PASS', 'APPROVED');

    ELSIF l_result = 'Pending' THEN

      -- PENDING Score
      SELECT count(*) INTO l_score_arr(y) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = x.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result IN ('PASS', 'PENDING', 'APPROVED');

    ELSIF l_result = 'Raw' THEN

      -- RAW Score
      SELECT count(*) INTO l_score_arr(y) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = x.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result = 'PASS';

    END IF;

    -- POSSIBLE Score
    SELECT count(*) INTO l_possible_score FROM
      sv_sec_collection_data cd
    WHERE
      cd.attribute_id = x.attribute_id
      AND cd.collection_id = l_collection_id;

    IF l_possible_score != 0 THEN
      l_pct_score := ROUND((l_score_arr(y)/l_possible_score)*100,NVL(apex_util.get_preference(p_preference => 'SCORE_PRECISION', p_user => v('G_WORKSPACE_ID') || '.' || v('APP_USER')),2));
      l_total_possible_score := l_total_possible_score + l_possible_score;
    END IF;

    -- Determine how many pending attributes exist
    SELECT
      COUNT(*) cnt
    INTO
      l_pending_count
    FROM
      sv_sec_collection_data cd
    WHERE
      cd.attribute_id = x.attribute_id
      AND cd.collection_id = l_collection_id
      AND result = 'PENDING';

    l_html := l_html || 
         '<li class="t-Cards-item">'
      || '<div class="t-Card t-Card-wrap"><a href="' || apex_util.prepare_url('f?p=' || p_sert_app_id || ':' || x.display_page_id || ':' || p_app_session) || '">'
      || '  <div class="t-Card-icon"><span class="t-Icon fa-laptop" style="width:48px; height:48px;background-color:'
      || sv_sec_util.get_color(p_pct_score => l_pct_score, p_possible_score => l_possible_score) || ';"><span class="t-Card-initials" role="presentation" style="line-height:4.5rem;">' || l_pct_score || '%</span></span></div>'
      || '  <div class="t-Card-titleWrap"><h3 class="t-Card-title">' || 
        CASE 
          WHEN (INSTR(x.attribute_name, 'Contains') > 0) THEN
            SUBSTR(x.attribute_name, INSTR(x.attribute_name, 'Contains')+9)
          WHEN (INSTR(x.attribute_name, 'Inconsistencies') > 0) THEN
            REPLACE(x.attribute_name, 'Inconsistencies', NULL)
          ELSE x.attribute_name END  || '</h3></div>'
      || '  <div class="t-Card-body">'
      || '    <div class="t-Card-desc">' || l_score_arr(y) || ' out of ' || l_possible_score || ' possible points</div>'
      || '    <div class="t-Card-info">'
      || '      <div class="a-Report-percentChart" style="background-color:#DBDBDB;">'
      || '        <div class="a-Report-percentChart-fill" style="width:' || l_pct_score || '%; background-color:#999;"></div>'
      || '      </div>'
      || '    </div>'
      || '  </div>'
      || '</a></div>'
      || '</li>';

    -- Increment the score
    l_total := l_total + l_score_arr(y);

    -- Increment the counter
    y := y + 1;
  END IF;
END LOOP;

-- Remove the last value from y
y := y - 1;

-- Print the Totals
IF l_possible_score = 0 THEN
  l_total_pct := 0;
  l_total := 0;
ELSE
  l_total_pct := ROUND((l_total/(l_total_possible_score))*100,1);
END IF;


htp.prn( 
             '<ul class="t-Cards t-Cards--compact t-Cards--displayInitials t-Cards--cols">'
          || '<li class="t-Cards-item" style="width:100%;">'
          || '  <div class="t-Card t-Card-wrap">'
          || '    <div class="t-Card-icon"' || CASE WHEN l_total_possible_score = 0 THEN 'style="display:none;"' END || '><span class="t-Icon fa-laptop" style="width:48px; height:48px;background-color:' 
          || sv_sec_util.get_color(p_pct_score => ROUND(l_total_pct), p_possible_score => l_total_possible_score) || ';">'
          || '      <span class="t-Card-initials" role="presentation" style="line-height:4.5rem;">' || CASE WHEN l_total_pct > 100 THEN 100 ELSE l_total_pct END || '%</span></span></div>'
          || '    <div class="t-Card-titleWrap"><h3 class="t-Card-title">' || l_title || '</h3></div>'
          || '    <div class="t-Card-body">' 
          || '      <div class="t-Card-desc">' || CASE WHEN l_total_possible_score = 0 THEN 'No Attributes in this application' 
            ELSE TO_CHAR(l_total, '999G999') || ' out of ' || TO_CHAR(l_total_possible_score, '999G999') || ' Possible Points' END || '</div>'
          || '    </div>'
          || '  </div>'
          || '</li>'
          || '</ul>'
          );

-- Open the UL
htp.prn('<ul class="t-Cards t-Cards--compact t-Cards--displayInitials t-Cards--3cols t-Cards--desc-2ln">');

-- Print the HTML for found attributes
htp.prn(l_html);

-- Print the HTML for not found attributes
htp.prn(l_not_found_html);

-- Close the UL
htp.prn('</ul>');

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END summary_dashboard;

--------------------------------------------------------------------------------
-- PROCEDURE: D A S H B O A R D
--------------------------------------------------------------------------------
-- Prints a dashboard for a specific page
--------------------------------------------------------------------------------
FUNCTION dashboard
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER   DEFAULT nv('APP_PAGE_ID'),
  p_format                   IN VARCHAR2 DEFAULT 'HTML',
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID')
  )
RETURN VARCHAR2
AS
  l_pct_score                NUMBER;
  l_collection_id            sv_sec_collection.collection_id%TYPE;
  l_total_score              NUMBER := 0;
  l_raw_score                NUMBER := 0;
  l_pending_score            NUMBER := 0;
  l_possible_score           NUMBER := 0;
  l_approved_score           NUMBER := 0;
  l_count                    NUMBER := 0;
  TYPE l_score_t             IS TABLE OF NUMBER index by binary_integer;
  TYPE l_score_label_t       IS TABLE OF VARCHAR2(255) index by binary_integer;
  l_score_arr                l_score_t;
  l_score_label_arr          l_score_label_t;
  l_component_id             NUMBER;
  l_page_id                  NUMBER;
  y                          NUMBER := 1;
  l_color_rgb                APEX_APPLICATION_GLOBAL.VC_ARR2;
  l_color                    VARCHAR2(255);
  l_html                     VARCHAR2(32767);
  l_severity_level           NUMBER;
  l_severity                 VARCHAR2(1000);
  l_time_to_fix              NUMBER;
BEGIN

-- Get the current collection ID
l_collection_id := sv_sec_util.get_collection_id(
  p_app_user       => p_app_user,
  p_app_session    => p_app_session,
  p_application_id => p_application_id);

-- Set the score labels
l_score_label_arr(1) := 'Approved';
l_score_label_arr(2) := 'Pending';
l_score_label_arr(3) := 'Raw';

-- Produce the dashboard region for the specific page
FOR x IN (SELECT * FROM sv_sec_attributes WHERE display_page_id = p_page_id)
LOOP

  -- Calculate the total time to fix
  SELECT
    NVL(ROUND((SUM(s.time_to_fix))/60,2),0)
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
    AND c.collection_id = l_collection_id
    AND a.attribute_id = x.attribute_id
    AND c.result NOT IN ('PASS','APPROVED','PENDING');

  IF p_format = 'HTML' THEN
    l_html := '<div>Approximate Time to Fix: ' || l_time_to_fix || ' hours</div><ul class="t-Cards t-Cards--compact t-Cards--displayInitials t-Cards--3cols t-Cards--desc-2ln">';
      
  ELSE

    -- PRINT PLACEHOLDER
    NULL;
    
  END IF;
  
  -- Determine if the attribute is in the current attribute set
  SELECT COUNT(*) INTO l_count FROM sv_sec_attribute_set_attrs
    WHERE attribute_id = x.attribute_id
    AND attribute_set_id = p_attribute_set_id;

  IF l_count < 1 THEN
    IF p_format = 'HTML' THEN
      -- Attribute is not part of the current set  
      l_html := l_html || 'This Attribute is not part of the current Attribute Set.  '
        || 'No information will be displayed.';
    ELSE
      -- PRINT PLACEHOLDER
      NULL;

    END IF;

  ELSE
    -- Determine if there are any values for this attribute
    SELECT count(*) INTO l_count FROM 
      sv_sec_collection_data
    WHERE
      attribute_id = x.attribute_id
      AND collection_id = l_collection_id;
    
    IF l_count = 0 THEN      
      IF p_format = 'HTML' THEN
        l_html := l_html || 'There are no matching components for this attribute.';
      END IF;
    ELSE
      -- Print the scores for the current attribute
      -- APPROVED Score
      SELECT count(*) INTO l_score_arr(1) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = x.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result IN ('PASS', 'APPROVED')
        AND CASE 
          WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND page_id = l_page_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND cd.page_id = l_page_id AND cd.component_id = l_component_id THEN 1
          WHEN l_page_id IS NULL AND l_component_id IS NULL THEN 1
          ELSE 0 END = 1;

      -- PENDING Score
      SELECT count(*) INTO l_score_arr(2) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = x.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result IN ('PASS', 'PENDING', 'APPROVED')
        AND CASE 
          WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND page_id = l_page_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND cd.page_id = l_page_id AND cd.component_id = l_component_id THEN 1
          WHEN l_page_id IS NULL AND l_component_id IS NULL THEN 1
          ELSE 0 END = 1;

      -- RAW Score
      SELECT count(*) INTO l_score_arr(3) FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = x.attribute_id
        AND cd.collection_id = l_collection_id
        AND cd.result = 'PASS'
        AND CASE 
          WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND page_id = l_page_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND cd.page_id = l_page_id AND cd.component_id = l_component_id THEN 1
          WHEN l_page_id IS NULL AND l_component_id IS NULL THEN 1
          ELSE 0 END = 1;

      -- POSSIBLE Score
      SELECT count(*) INTO l_possible_score FROM
        sv_sec_collection_data cd
      WHERE
        cd.attribute_id = x.attribute_id
        AND cd.collection_id = l_collection_id
        AND CASE 
          WHEN l_page_id IS NOT NULL AND l_component_id IS NULL AND page_id = l_page_id THEN 1
          WHEN l_page_id IS NOT NULL AND l_component_id IS NOT NULL AND cd.page_id = l_page_id AND cd.component_id = l_component_id THEN 1
          WHEN l_page_id IS NULL AND l_component_id IS NULL THEN 1
          ELSE 0 END = 1;
 
      -- Loop through all three scores and print the progress bar for each   
      FOR x IN 1..3 LOOP

        -- Calculate the percentage
        l_pct_score := ROUND((l_score_arr(x)/l_possible_score)*100,1);

        IF p_format = 'HTML' THEN
          -- Print the row
          l_html := l_html || 
            '<li class="t-Cards-item">  
               <div class="t-Card t-Card-wrap">
                 <div class="t-Card-icon"><span class="t-Icon fa-laptop" style="width:48px; height:48px;background-color:'
                 || sv_sec_util.get_color(p_pct_score => ROUND(l_pct_score), p_possible_score => l_possible_score) || ';"><span class="t-Card-initials" role="presentation" style="line-height:4.5rem;">' || l_pct_score || '%</span></span></div>
                 <div class="t-Card-titleWrap"><h3 class="t-Card-title">' || l_score_label_arr(x) || '</h3></div>
                 <div class="t-Card-body">
                   <div class="t-Card-desc">' || l_score_arr(x) || ' out of ' || l_possible_score || ' possible points</div>
                   <div class="t-Card-info">
                     <div class="a-Report-percentChart" style="background-color:#DBDBDB;">
                     <div class="a-Report-percentChart-fill" style="width:' || l_pct_score || '%; background-color:#999;"></div>
                   </div>
                 </div>
               </div>
               </div>
             </li>';

        ELSE
          -- PRINT PLACEHOLDER
          NULL;

        END IF;

      END LOOP;
    END IF;
  END IF;

END LOOP;

IF p_format = 'HTML' THEN
-- Close the region
  l_html := l_html || '</ul>';
  RETURN l_html;
ELSE
  NULL;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END dashboard;


--------------------------------------------------------------------------------
-- PROCEDURE: C A L C _ S C O R E 
--------------------------------------------------------------------------------
-- Determines the overall score and prints the corresponding region
--------------------------------------------------------------------------------
FUNCTION calc_score
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER  DEFAULT NULL,
  p_request                  IN VARCHAR2 DEFAULT v('REQUEST'),
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_workspace_id             IN NUMBER   DEFAULT nv('G_WORKSPACE_ID'),
  p_sert_app_id              IN NUMBER   DEFAULT nv('APP_ID'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_owner                    IN VARCHAR2,
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_user_workspace_id        IN NUMBER   DEFAULT nv('G_WORKSPACE_ID'),
  p_scheduled_eval           IN VARCHAR2 DEFAULT 'N'
  )
RETURN VARCHAR2
IS
  l_score                    NUMBER := 0;
  l_possible_score           NUMBER := 0;
  l_total_score              NUMBER := 0;
  l_total_possible_score     NUMBER := 0;
  l_pct_score                NUMBER;
  l_color                    VARCHAR2(100);
  l_html                     VARCHAR2(4000);
  l_total_cat                NUMBER;
  l_count                    NUMBER := 1;
  l_page_alias               VARCHAR2(255);
  l_collection               VARCHAR2(4000);
  l_attributes               VARCHAR2(1000);
  l_build_status             apex_applications.build_status%TYPE;
  l_attributes_a             htmldb_application_global.vc_arr2;
  l_collection_a             htmldb_application_global.vc_arr2;
  l_collection_id            sv_sec_collection.collection_id%TYPE;
  l_application_name         apex_applications.application_name%TYPE;
  l_dummy                    VARCHAR2(100);
  l_parse_as                 VARCHAR2(100);
BEGIN

-- Get the Parse As schemas
SELECT snippet INTO l_parse_as FROM sv_sec_snippets WHERE snippet_key = 'PARSE_AS';

-- Check to see that the APP is Run Only or the user is a member of SV_SERT_SU
SELECT build_status INTO l_build_status FROM apex_applications WHERE application_id = p_sert_app_id;

IF 1=1
--IF l_build_status = 'Run Only' OR sv_sec_util.user_has_role(p_workspace_id => p_user_workspace_id, p_user_name => p_app_user, p_role_name => 'SV_SERT_SU') 
THEN

  -- Check to see if the user has access to evaluate the application
  -- Use the core of the sv_sec_apex_applications_v here
  SELECT 
    COUNT(*)
  INTO 
    l_count 
  FROM
    apex_applications a,
    sv_sec_user_roles_v ur
  WHERE
    a.application_id NOT BETWEEN 3000 AND 8999
    --AND version != (SELECT sv_sec_util.get_version FROM dual)
    AND a.workspace_id = ur.workspace_id
    AND a.application_id = p_application_id
    AND ur.user_name = p_app_user
    AND ur.user_workspace_id = p_user_workspace_id;

  IF l_count > 0 THEN

    IF p_request = 'SCORE' THEN

      IF p_app_session > 0 THEN
        -- Reset the Progress bar
        apex_util.set_session_state('G_PROGRESS','"title": "Starting Evaluation...", "value": ""');

      END IF;

      -- Log the event
      IF p_app_session > 0 THEN
      sv_sec_log_events.log_exception_event
        (
        p_event_key       => 'MANUAL_EVAL',
        p_application_id  => p_application_id,
        p_number_affected => 1,
        p_sert_app_id     => p_sert_app_id,
        p_app_user        => p_app_user,
        p_app_session     => p_app_session,
        p_attribute_set_id => p_attribute_set_id
        );
    ELSE
      sv_sec_log_events.log_exception_event
        (
        p_event_key       => 'AUTO_EVAL',
        p_application_id  => p_application_id,
        p_number_affected => 1,
        p_sert_app_id     => p_sert_app_id,
        p_app_user        => 'Scheduler',
        p_app_session     => p_app_session,
        p_attribute_set_id => p_attribute_set_id
        );
    END IF;

    -- Clear out the Collection Data
    DELETE FROM sv_sec_collection WHERE 
      app_user = p_app_user
      AND app_session = p_app_session
      AND app_id = p_application_id;

    -- Clear out Old Collections
    DELETE FROM sv_sec_collection WHERE
      app_user = p_app_user
      AND created_on < (SYSDATE - 7);

    -- Create the Collection
    INSERT INTO sv_sec_collection
      (
      app_id,
      app_user,
      app_session,
      created_on                 
      )
    VALUES
      (
      p_application_id,
      p_app_user,
      p_app_session,
      SYSDATE
      )
    RETURNING collection_id INTO l_collection_id;

    -- Set the Context
    sv_sec_util.set_ctx
      (
      p_application_id   => p_application_id,
      p_app_session      => p_app_session,
      p_app_user         => p_app_user,
      p_collection_id    => l_collection_id,
      p_attribute_set_id => p_attribute_set_id
      );

    -- Pre-populate the collection-based attributes
    sv_sec_collections.create_score_collections
      (
      p_collection_id    => l_collection_id,
      p_application_id   => p_application_id,
      p_attribute_set_id => p_attribute_set_id,
      p_app_session      => p_app_session,
      p_app_user         => p_app_user
      );

    -- Next, calculate the column-based attributes
    -- Get the total number of categories for the Progress Bar
    SELECT COUNT(*) INTO l_total_cat FROM
      (
      SELECT DISTINCT
        c.category_key
      FROM
        sv_sec_categories c,
        sv_sec_attribute_sets aset,
        sv_sec_attribute_set_attrs asa,
        sv_sec_attributes a
      WHERE
        aset.attribute_set_id = asa.attribute_set_id
        AND aset.attribute_set_id = p_attribute_set_id
        AND a.attribute_id = asa.attribute_id
        AND a.category_id = c.category_id
        AND a.active_flag = 'Y'
        AND a.rule_source = 'COLUMN'
        AND asa.active_flag = 'Y'
        AND c.category_id > 0
      );

    -- Loop through all attributes in the specified attribute set that are not mapped to collections
    FOR x IN
    (
    SELECT
      a.attribute_key,
      a.attribute_id,
      a.rule_source
    FROM
      sv_sec_attribute_sets aset,
      sv_sec_attribute_set_attrs asa,
      sv_sec_attributes a
    WHERE
      aset.attribute_set_id = asa.attribute_set_id
      AND aset.attribute_set_id = p_attribute_set_id
      AND a.attribute_id = asa.attribute_id
      AND a.active_flag = 'Y'
      AND asa.active_flag = 'Y'
      AND a.rule_source != 'COLLECTION'
    )
    LOOP
      
      IF x.rule_source = 'COLUMN' THEN

        -- Evalute a specific attribute
        calc_attribute_column(
          p_collection_id    => l_collection_id,
          p_attribute_set_id => p_attribute_set_id,
          p_application_id   => p_application_id,
          p_attribute_id     => x.attribute_id,
          p_app_user         => p_app_user,
          p_app_session      => p_app_session
        );

      ELSIF x.rule_source = 'PLSQL' THEN
        
        null;
        
      END IF;
    END LOOP;

    IF p_app_session > 0 THEN
      apex_util.set_session_state('G_PROGRESS','"title": "Processing Exceptions...", "value": ""');
    END IF;

    -- Apply exceptions for all collection data
    sv_sec_exception.apply_exceptions
      (
      p_collection_id     => l_collection_id,
      p_application_id    => p_application_id,
      p_attribute_set_id  => p_attribute_set_id,
      p_app_user          => p_app_user,
      p_app_session       => p_app_session,
      p_sert_app_id       => p_sert_app_id
      );


  ------------------------------------------------------------------------------
  -- Recalculate the score only for a specific PAGE
  ------------------------------------------------------------------------------

  ELSIF p_request = 'PAGE_SCORE' THEN

    -- Log the event
    sv_sec_log_events.log_exception_event
      (
      p_event_key       => 'RECALC_PAGE',
      p_application_id  => p_application_id,
      p_page_id         => p_page_id,
      p_number_affected => 1,
      p_sert_app_id     => p_sert_app_id,
      p_app_user        => p_app_user,
      p_app_session     => p_app_session,
       p_attribute_set_id => p_attribute_set_id
      );

    -- Get the Collection ID
    l_collection_id := sv_sec_util.get_collection_id
      (
      p_app_user       => p_app_user,
      p_app_session    => p_app_session,
      p_application_id => p_application_id
      );
      
    -- Determine if the page is a summary page or a single attribute page
    SELECT COUNT(*) INTO l_count FROM sv_sec_attributes WHERE summary_page_id = p_page_id;
  
    IF l_count = 0 THEN
      -- Page is not summary page; get the attribute that matches the DISPLAY_PAGE_ID
      FOR q IN (SELECT a.attribute_id FROM sv_sec_attributes a, sv_sec_attribute_set_attrs asa WHERE a.display_page_id = p_page_id AND a.attribute_id = asa.attribute_id AND asa.attribute_set_id = p_attribute_set_id AND a.active_flag = 'Y' AND asa.active_flag = 'Y')
      LOOP
        l_attributes := l_attributes || q.attribute_id || ':';    
      END LOOP;
    ELSE
      -- Page is a summary page; get the corresponding attributes that map to this page
      FOR q IN (SELECT a.attribute_id FROM sv_sec_attributes a, sv_sec_attribute_set_attrs asa WHERE a.summary_page_id = p_page_id AND a.attribute_id = asa.attribute_id AND asa.attribute_set_id = p_attribute_set_id AND a.active_flag = 'Y' AND asa.active_flag = 'Y')
      LOOP
        l_attributes := l_attributes || q.attribute_id || ':';
      END LOOP;
    END IF;

    -- Convert the string to an array
    l_attributes_a := htmldb_util.string_to_table(l_attributes);

    -- Loop through all pages that need to be recalculated
    FOR z IN 1..l_attributes_a.COUNT
    LOOP

      -- Loop through each attribute mapped to the page
      FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_id = l_attributes_a(z))
      LOOP

        -- Remove the collection data for a specific attribute
        DELETE FROM sv_sec_collection_data WHERE collection_id = l_collection_id 
          AND attribute_id = l_attributes_a(z);

        -- Recreate each collection
        IF x.rule_source = 'COLLECTION' THEN

          FOR y IN
            (SELECT * FROM sv_sec_score_collections WHERE collection_name = x.attribute_key) 
          LOOP

            -- Calculate collection-based attributes
            sv_sec_collections.create_collection
              (
              p_collection_id            => l_collection_id,
              p_collection_name          => x.attribute_key,
              p_application_id           => p_application_id,
              p_app_session              => p_app_session,
              p_query                    => y.collection_sql,
              p_attribute_set_id         => p_attribute_set_id
              );

          END LOOP;
          
        -- Calculate non-collection based attributes
        ELSIF x.rule_source = 'COLUMN' THEN

            -- Evalute a specific attribute
            calc_attribute_column
              (
              p_collection_id    => l_collection_id,
              p_attribute_set_id => p_attribute_set_id,
              p_application_id   => p_application_id,
              p_attribute_id     => x.attribute_id,
              p_app_user         => p_app_user,
              p_app_session      => p_app_session
              );

        END IF;

        -- Apply exceptions for each attribute
        sv_sec_exception.apply_exceptions
        (
          p_collection_id    => l_collection_id,
          p_application_id   => p_application_id,
          p_attribute_set_id => p_attribute_set_id,
          p_app_user         => p_app_user,
          p_attribute_id     => l_attributes_a(z),
          p_app_session      => p_app_session,
          p_sert_app_id      => p_sert_app_id
        );

      END LOOP;
    END LOOP;
  END IF;

  -- Add the HTML for FAILed attributes
  UPDATE sv_sec_collection_data 
    SET exception = '<i class="fa fa-plus-circle" style="color:green;" title="Add Exception"></i>',
        exception_url = 'f?p=' || p_sert_app_id || ':10:' || p_app_session || ':::10:P10_EXCEPTION_PK:' || 'IND|' || attribute_id || '|' || page_id || '|' || component_id || '|' || column_id
    WHERE 
      result = 'FAIL' 
      AND collection_id = l_collection_id;

  -- Add the Notation icons, based on existing data
  sv_sec_util.apply_notations
    (
    p_collection_id    => l_collection_id,
    p_application_id   => p_application_id,
    p_attribute_set_id => p_attribute_set_id,
    p_sert_app_id      => p_sert_app_id,
    p_app_session      => p_app_session
    );
    
  -- Set the P1 Items
  IF p_app_session > 0 THEN
    apex_util.set_session_state('P1_APPLICATION_ID', p_application_id);
    apex_util.set_session_state('P1_EVAL_ATTRIBUTE_SET_ID', p_attribute_set_id);
  END IF;

  -- Record the Evaluation if run as a scheduled job
  IF p_app_session < 0 THEN
    l_dummy := sv_sec_util.print_name
      (
      p_application_id       => p_application_id,
      p_attribute_set_id     => p_attribute_set_id,
      p_record_score         => TRUE,
      p_app_user             => p_app_user,
      p_app_session          => p_app_session,
      p_app_eval_id          => p_app_eval_id,
      p_scheduled_eval       => p_scheduled_eval,
      p_evaluated_ws         => p_user_workspace_id
      );
  END IF;
  
ELSE
  -- Application is not accessible by the user
  logger.log('Application ' || p_application_id || ' is not accessible by this user');
  owa_util.redirect_url(apex_util.prepare_url('f?p=' || TO_CHAR(p_sert_app_id || ':4:' || p_app_session)));  

END IF;

ELSE
  -- Application is Run and Build
  logger.log('The SERT Application Status needs to be set to Run Only');
  owa_util.redirect_url(apex_util.prepare_url('f?p=' || TO_CHAR(p_sert_app_id || ':3:' || p_app_session)));  

END IF;

-- Return the Score Banner to G_SCORE
RETURN l_html;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;
  
END calc_score;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

END sv_sec;
/