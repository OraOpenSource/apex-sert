CREATE OR REPLACE PACKAGE BODY sv_sec_import
AS 

--------------------------------------------------------------------------------
-- FUNCTION: G E T _ A T T R I B U T E _ S E T _ I D
--------------------------------------------------------------------------------
-- Returns the corresponding ATTRIBUTE_ID
--------------------------------------------------------------------------------
FUNCTION get_attribute_set_id
  (
  p_attribute_set_key        IN VARCHAR2
  )
RETURN NUMBER
IS
  l_attribute_set_id         NUMBER;
BEGIN

IF p_attribute_set_key IN ('DEFAULT', 'DEFAULT 2.2', 'DEFAULT 2.1', 'DEFAULT (2.2)') THEN
  l_attribute_set_id := -1;
ELSE

  SELECT attribute_set_id INTO l_attribute_set_id
    FROM sv_sec_attribute_sets WHERE attribute_set_key = p_attribute_set_key;

END IF;

RETURN l_attribute_set_id;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_attribute_set_id;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ A T T R I B U T E _ I D
--------------------------------------------------------------------------------
-- Returns the corresponding ATTRIBUTE_ID
--------------------------------------------------------------------------------
FUNCTION get_attribute_id
  (
  p_attribute_key            IN VARCHAR2
  )
RETURN NUMBER
IS
  l_attribute_id             NUMBER;
BEGIN

SELECT attribute_id INTO l_attribute_id
  FROM sv_sec_attributes WHERE attribute_key = p_attribute_key;

RETURN l_attribute_id;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_attribute_id;


--------------------------------------------------------------------------------
-- PROCEDURE: C L A S S I F I C A T I O N
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_CLASSIFICATIONS
--------------------------------------------------------------------------------
PROCEDURE classification
  (
  p_classification_name      IN VARCHAR2,
  p_classification_key       IN VARCHAR2,
  p_summary_page_id          IN NUMBER,
  p_seq                      IN NUMBER
  )
IS
BEGIN

INSERT INTO sv_sec_classifications
  (
  classification_name,
  classification_key,
  summary_page_id,
  seq
  )
VALUES
  (
  p_classification_name,
  p_classification_key,
  p_summary_page_id,
  p_seq
  );

END classification;


--------------------------------------------------------------------------------
-- PROCEDURE: C O M P O N E N T _ S I G N A T U R E
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_CLASSIFICATIONS
--------------------------------------------------------------------------------
PROCEDURE component_signature
  (
  p_component_sig_key        IN VARCHAR2,
  p_component_sig            IN CLOB
  )
IS
  l_count                    NUMBER;
BEGIN

SELECT COUNT(*) INTO l_count FROM sv_sec_component_sigs
  WHERE component_sig_key = p_component_sig_key;

IF l_count = 0 THEN
  INSERT INTO sv_sec_component_sigs
    (
    component_sig_key,
    component_sig
    )
  VALUES
    (
    p_component_sig_key,
    p_component_sig
    );
END IF;

END component_signature;

--------------------------------------------------------------------------------
-- PROCEDURE: C A T E G O R Y
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_CATEGORIES
--------------------------------------------------------------------------------
PROCEDURE category
  (
  p_category_name            IN VARCHAR2,
  p_category_short_name      IN VARCHAR2,
  p_category_key             IN VARCHAR2,
  p_classification_key       IN VARCHAR2,
  p_category_link            IN VARCHAR2,
  p_display_page             IN VARCHAR2,
  p_internal_flag            IN VARCHAR2,
  p_rpt_attribute_key        IN VARCHAR2 DEFAULT NULL
  )
IS
  l_category_id              NUMBER;
  l_classification_id        NUMBER;
  l_count                    NUMBER;
BEGIN

-- Get the Classification Key
SELECT classification_id INTO l_classification_id 
  FROM sv_sec_classifications
  WHERE classification_key = p_classification_key;

-- Determine if the Category exists or not
SELECT COUNT(*) INTO l_count FROM sv_sec_categories
  WHERE category_key = p_category_key;
  
IF l_count = 0 THEN
  INSERT INTO sv_sec_categories 
    (
    category_id, 
    classification_id,
    category_name, 
    category_short_name,
    category_key, 
    category_link,
    display_page, 
    internal_flag,
    rpt_attribute_key
    )
  VALUES
    (
    l_category_id,
    l_classification_id,
    p_category_name,
    p_category_short_name,
    p_category_key,
    p_category_link,
    p_display_page,
    p_internal_flag,
    p_rpt_attribute_key
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END category;

--------------------------------------------------------------------------------
-- PROCEDURE: A T T R I B U T E _ S E T
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_ATTRIBUTE_SETS
--------------------------------------------------------------------------------
PROCEDURE attribute_set
  (
  p_attribute_set_key        IN VARCHAR2,
  p_attribute_set_name       IN VARCHAR2,
  p_active_flag              IN VARCHAR2,
  p_description              IN VARCHAR2 DEFAULT NULL,
  p_public_flag              IN VARCHAR2,
  p_workspace_id             IN NUMBER
  )
IS
  l_attribute_set_id         NUMBER;
  l_count                    NUMBER;
BEGIN

-- Only use the attribute_set_id if it is < 0 (internal or default)
IF p_attribute_set_key IN ('DEFAULT', 'DEFAULT 2.2', 'DEFAULT 2.1', 'DEFAULT (2.2)') THEN
  l_attribute_set_id := -1;
END IF;

-- Check to see if the attribute set exists
SELECT COUNT(*) INTO l_count FROM sv_sec_attribute_sets
  WHERE attribute_set_key = p_attribute_set_key;

IF l_count = 0 THEN
  INSERT INTO sv_sec_attribute_sets 
    (
    attribute_set_id, 
    attribute_set_name, 
    active_flag, 
    description, 
    public_flag, 
    workspace_id, 
    attribute_set_key
    )
  VALUES
    (
    l_attribute_set_id,
    p_attribute_set_name, 
    p_active_flag, 
    p_description, 
    p_public_flag, 
    v('WORKSPACE_ID'), 
    p_attribute_set_key
    );
ELSE
  INSERT INTO sv_sec_attribute_sets 
    (
    attribute_set_id, 
    attribute_set_name, 
    active_flag, 
    description, 
    public_flag, 
    workspace_id, 
    attribute_set_key
    )
  VALUES
    (
    l_attribute_set_id,
    'Copy of ' ||p_attribute_set_name, 
    p_active_flag, 
    p_description, 
    p_public_flag, 
    p_workspace_id, 
    'COPY_OF_' || p_attribute_set_key
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attribute_set;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R I B U T E
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_ATTRIBUTES
--------------------------------------------------------------------------------
PROCEDURE attribute
  (
  p_category_key             IN VARCHAR2,
  p_attribute_name           IN VARCHAR2,
  p_attribute_key            IN VARCHAR2,
  p_active_flag              IN VARCHAR2 DEFAULT 'Y',
  p_rule_type                IN VARCHAR2,
  p_rule_source              IN VARCHAR2,
  p_table_name               IN VARCHAR2 DEFAULT NULL,
  p_column_name              IN VARCHAR2 DEFAULT NULL,
  p_view_name                IN VARCHAR2 DEFAULT NULL,
  p_component_table          IN VARCHAR2 DEFAULT NULL,
  p_component_column_id      IN VARCHAR2 DEFAULT NULL,
  p_component_column_display IN VARCHAR2 DEFAULT NULL,
  p_column_table             IN VARCHAR2 DEFAULT NULL,
  p_column_column_id         IN VARCHAR2 DEFAULT NULL,
  p_column_column_display    IN VARCHAR2 DEFAULT NULL,
  p_collection_name          IN VARCHAR2 DEFAULT NULL,
  p_when_not_found           IN VARCHAR2 DEFAULT NULL,
  p_internal_flag            IN VARCHAR2,
  p_seq                      IN NUMBER   DEFAULT 99,
  p_help_page                IN VARCHAR2 DEFAULT NULL,
  p_rule_plsql               IN CLOB     DEFAULT NULL,
  p_info                     IN CLOB     DEFAULT NULL,
  p_fix                      IN CLOB     DEFAULT NULL,
  p_info_pdf                 IN CLOB     DEFAULT NULL,
  p_fix_pdf                  IN CLOB     DEFAULT NULL,  
  p_impact                   IN VARCHAR  DEFAULT NULL,
  p_display_page_id          IN NUMBER   DEFAULT NULL,
  p_summary_page_id          IN NUMBER   DEFAULT NULL,
  p_col_template_key         IN VARCHAR2 DEFAULT NULL,
  p_component_sig_key        IN VARCHAR2 DEFAULT NULL
  )
IS
  l_category_id              NUMBER;
  l_score_collection_id      NUMBER;
  l_col_template_id          NUMBER;
  l_count                    NUMBER;
  l_component_sig_id         NUMBER;
BEGIN

-- Get the CATEGORY_ID
SELECT category_id INTO l_category_id
  FROM sv_sec_categories WHERE category_key = p_category_key;

-- Get the Score Collection ID
IF p_collection_name IS NOT NULL THEN
  SELECT score_collection_id INTO l_score_collection_id FROM sv_sec_score_collections
    WHERE collection_name = p_collection_name;
END IF;

-- Get the Collection Template ID
IF p_col_template_key IS NOT NULL THEN
  SELECT col_template_id INTO l_col_template_id FROM sv_sec_col_templates
    WHERE col_template_key = p_col_template_key;
END IF;

-- Get the Component Sig ID
IF p_component_sig_key IS NOT NULL THEN
  SELECT component_sig_id INTO l_component_sig_id FROM sv_sec_component_sigs
    WHERE component_sig_key = p_component_sig_key;
END IF;

-- Determine if the attribute exists or not
SELECT COUNT(*) INTO l_count FROM sv_sec_attributes
  WHERE attribute_key = p_attribute_key;

IF l_count = 0 THEN
  -- Insert the Attribute
  INSERT INTO sv_sec_attributes 
    (
    category_id, 
    attribute_name, 
    attribute_key, 
    active_flag, 
    rule_type, 
    rule_source, 
    table_name, 
    column_name,
    view_name,
    component_table,
    component_column_id,
    component_column_display,
    column_table,
    column_column_id,
    column_column_display,
    score_collection_id,
    rule_plsql, 
    info, 
    fix, 
    info_pdf,
    fix_pdf,
    when_not_found, 
    seq, 
    help_page, 
    internal_flag,
    impact,
    display_page_id,
    summary_page_id,
    col_template_id,
    component_sig_id
    )
  VALUES
    (
    l_category_id, 
    p_attribute_name, 
    p_attribute_key, 
    p_active_flag, 
    p_rule_type, 
    p_rule_source, 
    p_table_name, 
    p_column_name, 
    p_view_name,
    p_component_table,
    p_component_column_id,
    p_component_column_display,
    p_column_table,
    p_column_column_id,
    p_column_column_display,
    l_score_collection_id,
    p_rule_plsql, 
    p_info, 
    p_fix, 
    p_info_pdf,
    p_fix_pdf,
    p_when_not_found, 
    p_seq, 
    p_help_page, 
    p_internal_flag,
    p_impact,
    p_display_page_id,
    p_summary_page_id,
    l_col_template_id,
    l_component_sig_id
    );

END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attribute;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R I B U T E _ V A L U E
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_ATTRIBUTES
--------------------------------------------------------------------------------
PROCEDURE attribute_value
  (
  p_attribute_key            IN VARCHAR2,
  p_attribute_set_key        IN VARCHAR2,
  p_value                    IN VARCHAR2,
  p_result                   IN VARCHAR2,
  p_active_flag              IN VARCHAR2
  )
IS
  l_attribute_set_id         NUMBER;
  l_attribute_id             NUMBER;
BEGIN

-- Get the ATTRIBUTE_SET_ID
l_attribute_set_id := get_attribute_set_id(p_attribute_set_key => p_attribute_set_key);

-- Get the ATTRIBUTE_ID
l_attribute_id := get_attribute_id(p_attribute_key => p_attribute_key);

  -- Insert the Attribute Value
  INSERT INTO sv_sec_attribute_values 
    (
    attribute_set_id,
    attribute_id,
    value,
    result,
    active_flag
    )
  VALUES
    (
    l_attribute_set_id,
    l_attribute_id,
    p_value,
    p_result,
    p_active_flag
    );

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attribute_value;


--------------------------------------------------------------------------------
-- PROCEDURE: HELP_TEXT
--------------------------------------------------------------------------------
-- Inserts data into SV_SC_HELP_TEXT
--------------------------------------------------------------------------------
PROCEDURE help_text
  (
  p_help_text_key            IN VARCHAR2,
  p_display_title            IN VARCHAR2,
  p_help_summary             IN VARCHAR2,
  p_help_text                IN CLOB DEFAULT NULL,
  p_custom_help_text         IN CLOB DEFAULT NULL
  )
IS
BEGIN

-- Insert the Help Text
INSERT INTO sv_sec_help_text
  (
  help_text_key,
  display_title,
  help_summary,
  help_text,
  custom_help_text
  )
VALUES
  (
  p_help_text_key,
  p_display_title,
  p_help_summary,
  p_help_text,
  p_custom_help_text
  );

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END help_text;


--------------------------------------------------------------------------------
-- PROCEDURE: HELP_TEXT_INTER
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_HELP_TEXT_INTER
--------------------------------------------------------------------------------
PROCEDURE help_text_inter
  (
  p_component_id             IN VARCHAR2,
  p_component_type           IN VARCHAR2,
  p_help_text_key            IN VARCHAR2,
  p_page_id                  IN NUMBER DEFAULT NULL
  )
IS
  l_help_text_id             sv_sec_help_inter.help_text_id%TYPE;
BEGIN

-- Get the HELP_TEXT_ID
SELECT help_text_id INTO l_help_text_id FROM sv_sec_help_text
  WHERE help_text_key = p_help_text_key;

-- Insert the Item Help
INSERT INTO sv_sec_help_inter
  (
  help_text_id,
  component_id,
  component_type,
  page_id
  )
VALUES
  (
  l_help_text_id,
  p_component_id,
  p_component_type,
  p_page_id
  );

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END help_text_inter;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R _ S E T _ M A P P I N G
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_ATTRIBUTE_SET_ARTTRS
--------------------------------------------------------------------------------
PROCEDURE attr_set_mapping
  (
  p_attribute_set_key        IN VARCHAR2,
  p_attribute_key            IN VARCHAR2,
  p_time_to_fix              IN NUMBER,
  p_severity_level           IN NUMBER,
  p_active_flag              IN VARCHAR2 DEFAULT 'Y'
  )
IS
  l_attribute_set_id         NUMBER;
  l_attribute_id             NUMBER;
BEGIN

-- Get the ATTRIBUTE_SET_ID
l_attribute_set_id := get_attribute_set_id(p_attribute_set_key => p_attribute_set_key);

-- Get the ATTRIBUTE_ID
l_attribute_id := get_attribute_id(p_attribute_key => p_attribute_key);

-- Insert data into SC_SEC_ATTRIBUTE_SET_ATTRS
INSERT INTO sv_sec_attribute_set_attrs
    (
    attribute_set_id, 
    attribute_id, 
    time_to_fix,
    severity_level,
    active_flag
    )
VALUES
    (
    l_attribute_set_id,
    l_attribute_id, 
    p_time_to_fix,
    p_severity_level,
    p_active_flag
    );

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attr_set_mapping;


--------------------------------------------------------------------------------
-- PROCEDURE: S C O R E _ C O L L E C T I O N
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_SCORE_COLLECTIONS
--------------------------------------------------------------------------------
PROCEDURE score_collection
  (
  p_collection_name            IN VARCHAR2,
  p_collection_key             IN VARCHAR2,
  p_category_key               IN VARCHAR2,
  p_collection_sql             IN VARCHAR2,
  p_internal_flag              IN VARCHAR2,
  p_apex_version               IN VARCHAR2
  )
IS
  l_category_id                NUMBER;
  l_count                      NUMBER;
BEGIN

-- Get the Category ID
SELECT category_id INTO l_category_id FROM sv_sec_categories
  WHERE category_key = p_category_key;

-- Determine if the Score Collection exists or not
SELECT COUNT(*) INTO l_count FROM sv_sec_score_collections
  WHERE collection_key = p_collection_key;
  
IF l_count = 0 THEN
  -- Insert data into SV_SEC_SCORE_COLLECTIONS
  INSERT INTO sv_sec_score_collections
    (
    collection_name,
    collection_key,
    category_id,
    internal_flag,
    apex_version,
    collection_sql
    )
  VALUES
    (
    p_collection_name,
    p_collection_key,
    l_category_id,
    p_internal_flag,
    p_apex_version,
    p_collection_sql
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;


END score_collection;


--------------------------------------------------------------------------------
-- PROCEDURE: E V E N T _ T Y P E S
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_EVENT_TYPES
--------------------------------------------------------------------------------
PROCEDURE event_type
  (
  p_event_type_key           IN VARCHAR2,
  p_event_name               IN VARCHAR2,
  p_event_description        IN VARCHAR2,
  p_event_message            IN VARCHAR2
  )
IS
BEGIN

-- Insert data into SV_SEC_SCORE_COLLECTIONS
INSERT INTO sv_sec_event_types
  (
  event_type_key,
  event_name,
  event_description,
  event_message
  )
VALUES
  (
  p_event_type_key,
  p_event_name,
  p_event_description,
  p_event_message
  );

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;


END event_type;


--------------------------------------------------------------------------------
-- PROCEDURE: C O L _ T E M P L A T E S
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_COL_TEMPLATES
--------------------------------------------------------------------------------
PROCEDURE col_template
  (
  p_table_name               IN VARCHAR2,
  p_col_template_name        IN VARCHAR2,
  p_col_template_key         IN VARCHAR2,
  p_internal_flag            IN VARCHAR2,
  p_apex_version             IN VARCHAR2,
  p_col_template             IN VARCHAR2
  )
IS
  l_count                    NUMBER;
BEGIN

-- Check to see if the Column Template exists
SELECT count(*) INTO l_count FROM sv_sec_col_templates
  WHERE col_template_key = p_col_template_key;

IF l_count = 0 THEN
  -- Insert data into SV_SEC_COL_TEMPLATES
  INSERT INTO sv_sec_col_templates
    (
    table_name,
    col_template_name,
    col_template_key,
    internal_flag,
    apex_version,
    col_template
    )
  VALUES
    (
    p_table_name,
    p_col_template_name,
    p_col_template_key,
    p_internal_flag,
    p_apex_version,
    p_col_template
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END col_template;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R _ R P T _ I N T E R
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_ATTR_RPT_INTER
--------------------------------------------------------------------------------
PROCEDURE attr_rpt_inter
  (
  p_attribute_key            IN VARCHAR2,
  p_report_key               IN VARCHAR2
  )
IS
  l_attribute_id             sv_sec_attributes.attribute_id%TYPE;
  l_count                    NUMBER;
BEGIN

-- Get the Attribute ID
SELECT attribute_id INTO l_attribute_id FROM sv_sec_attributes
  WHERE attribute_key = p_attribute_key;

SELECT COUNT(*) INTO l_count FROM sv_sec_attr_rpt_inter
  WHERE report_key = p_report_key AND attribute_id = l_attribute_id;
  
IF l_count = 0 THEN

  -- Insert the record
  INSERT INTO sv_sec_attr_rpt_inter
    (
    attribute_id,
    report_key
    )
  VALUES
    (
    l_attribute_id,
    p_report_key
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attr_rpt_inter;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R _ R P T _ C O L S
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_ATTR_RPT_COLS
--------------------------------------------------------------------------------
PROCEDURE attr_rpt_cols
  (
  p_attribute_key            IN VARCHAR2,
  p_report_key               IN VARCHAR2,
  p_column_name              IN VARCHAR2,
  p_label                    IN VARCHAR2,
  p_seq                      IN NUMBER,
  p_format_mask              IN VARCHAR2 DEFAULT NULL,
  p_width                    IN NUMBER,
  p_alignment                IN VARCHAR2
  )
IS
  l_attribute_id             sv_sec_attributes.attribute_id%TYPE;
  l_attr_rpt_inter_id        sv_sec_attr_rpt_inter.attr_rpt_inter_id%TYPE;
  l_count                    NUMBER;
BEGIN

-- Get the Attribute ID
SELECT attribute_id INTO l_attribute_id FROM sv_sec_attributes
  WHERE attribute_key = p_attribute_key;

-- Get the Report Inter ID
SELECT attr_rpt_inter_id INTO l_attr_rpt_inter_id FROM sv_sec_attr_rpt_inter
  WHERE attribute_id = l_attribute_id
  AND report_key = p_report_key;

-- Determine if the column mapping already exists
SELECT COUNT(*) INTO l_count FROM sv_sec_attr_rpt_cols
  WHERE attr_rpt_inter_id = l_attr_rpt_inter_id
  AND column_name = p_column_name;

IF l_count = 0 THEN
  -- Insert the record
  INSERT INTO sv_sec_attr_rpt_cols
    (
    attr_rpt_inter_id,
    column_name,
    label,
    seq,
    format_mask,
    width,
    alignment
    )
  VALUES
    (
    l_attr_rpt_inter_id,
    p_column_name,
    p_label,
    p_seq,
    p_format_mask,
    p_width,
    p_alignment
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attr_rpt_cols;

--------------------------------------------------------------------------------
-- FUNCTION: F I X _ Q U O T E S
--------------------------------------------------------------------------------
-- Replaces any single quote in a string with two single quotes
--------------------------------------------------------------------------------
FUNCTION fix_quotes
  (
  p_str                      IN VARCHAR2 DEFAULT NULL
  ) 
RETURN VARCHAR2
IS
BEGIN
        RETURN ''''||
           REPLACE(P_STR,'''','''''')
           ||
           '''';

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END fix_quotes;


--------------------------------------------------------------------------------
-- PROCEDURE: C R E A T E _ E X C E P T I O N
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_EXCEPTION
--------------------------------------------------------------------------------
PROCEDURE create_exception(
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_key            IN VARCHAR2,
  p_page_id                  IN NUMBER   DEFAULT NULL,
  p_component_table          IN VARCHAR2 DEFAULT NULL,
  p_component_column_id      IN VARCHAR2 DEFAULT NULL,
  p_column_key               IN VARCHAR2 DEFAULT NULL,
  p_column_rpt_type          IN VARCHAR2 DEFAULT NULL,
  p_approved_flag            IN VARCHAR2 DEFAULT NULL,
  p_created_by               IN VARCHAR2 DEFAULT NULL,
  p_approved_by              IN VARCHAR2 DEFAULT NULL,
  p_rejected_by              IN VARCHAR2 DEFAULT NULL,
  p_checksum                 IN VARCHAR2,
  p_created_on               IN VARCHAR2 DEFAULT NULL,
  p_approved_on              IN VARCHAR2 DEFAULT NULL,
  p_rejected_on              IN VARCHAR2 DEFAULT NULL,
  p_justification            IN CLOB DEFAULT NULL,
  p_rejection                IN CLOB DEFAULT NULL,
  p_rejected_justification   IN CLOB DEFAULT NULL,
  p_val                      IN CLOB DEFAULT NULL,
  p_component_sig            IN CLOB DEFAULT NULL,
  p_component_sig_sql        IN CLOB DEFAULT NULL
  )
IS
  l_success                  BOOLEAN := TRUE;
  l_attribute_id             NUMBER;
  l_sql                      VARCHAR2(4000);
  l_component_id             NUMBER;
  l_column_id                NUMBER;
BEGIN

-- Translate the Attribute Key into an ID, and if not found, fail
FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_key = p_attribute_key)
LOOP
  l_attribute_id := x.attribute_id;
END LOOP;

IF l_attribute_id IS NULL THEN
  l_success := FALSE;
END IF;

-- Translate the Component items into an ID, and if not found, fail
IF p_component_table IS NOT NULL THEN

  -- Assemble the SQL to look up the Component ID
  l_sql := 'SELECT ' || p_component_column_id || ' FROM ' || p_component_table || ' WHERE ' 
    || p_component_sig_sql || ' = ' || fix_quotes(p_component_sig) 
    || ' AND application_id = ' || p_application_id;

  -- Attempt to get the Component ID
  BEGIN
    
    EXECUTE IMMEDIATE l_sql INTO l_component_id;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      logger.log('NO_DATA_FOUND: ' || l_sql);
      l_success := FALSE;
  END;

END IF;

-- Translate the Column Key into an ID, and if not found, fail
IF p_column_key IS NOT NULL THEN
  IF p_column_rpt_type = 'IR' THEN
  
    BEGIN
    
      SELECT column_id INTO l_column_id FROM apex_application_page_ir_col 
        WHERE column_alias  = p_column_key 
          AND application_id = p_application_id 
          AND page_id = p_page_id 
          AND region_id = l_component_id;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN l_success := FALSE;
    END;

  ELSIF p_column_rpt_type = 'STD' THEN

    BEGIN

      SELECT region_report_column_id INTO l_column_id FROM apex_application_page_rpt_cols 
        WHERE column_alias = p_column_key 
          AND application_id = p_application_id 
          AND page_id = p_page_id 
          AND region_id = l_component_id;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN l_success := FALSE;
    END;
    
  ELSE
    l_success := FALSE;
  END IF;

  IF l_column_id IS NULL THEN
    l_success := FALSE;
  END IF;
END IF;

-- Write the row to either SC_SEC_EXCEPTIONS or SV_SEC_EXCEPTIONS_FAIL
IF l_success = TRUE THEN
  -- Insert the record into SV_SEC_EXCEPTIONS
  INSERT INTO sv_sec_exceptions
    (
    attribute_set_id,
    application_id,
    attribute_id,
    page_id,
    component_id,
    column_id,
    justification,
    rejected_justification,
    rejection,
    approved_flag,
    created_by,
    created_on,
    approved_by,
    approved_on,
    rejected_by,
    rejected_on,
    val,
    checksum 
    )
  VALUES
    (
    p_attribute_set_id,
    p_application_id,
    l_attribute_id,
    p_page_id,
    l_component_id,
    l_column_id,
    p_justification,
    p_rejected_justification,
    p_rejection,
    p_approved_flag,
    p_created_by,
    TO_DATE(p_created_on, 'DDMMYYYY_HHMISS'),
    p_approved_by,
    TO_DATE(p_approved_on, 'DDMMYYYY_HHMISS'),
    p_rejected_by,
    TO_DATE(p_rejected_on, 'DDMMYYYY_HHMISS'),
    p_val,
    p_checksum 
    );

ELSE
  -- Insert the record into SV_SEC_EXCEPTIONS_FAIL
  INSERT INTO sv_sec_exceptions_fail
    (
    attribute_set_id,
    application_id,
    attribute_id,
    page_id,
    component_id,
    column_id,
    justification,
    rejected_justification,
    rejection,
    approved_flag,
    created_by,
    created_on,
    approved_by,
    approved_on,
    rejected_by,
    rejected_on,
    val,
    checksum,
    component_signature,
    sql
    )
  VALUES
    (
    p_attribute_set_id,
    p_application_id,
    l_attribute_id,
    p_page_id,
    l_component_id,
    l_column_id,
    p_justification,
    p_rejected_justification,
    p_rejection,
    p_approved_flag,
    p_created_by,
    TO_DATE(p_created_on, 'DDMMYYYY_HHMISS'),
    p_approved_by,
    TO_DATE(p_approved_on, 'DDMMYYYY_HHMISS'),
    p_rejected_by,
    TO_DATE(p_rejected_on, 'DDMMYYYY_HHMISS'),
    p_val,
    p_checksum,
    p_component_sig,
    l_sql
    );

END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END create_exception;


--------------------------------------------------------------------------------
-- PROCEDURE: C R E A T E _ N O T A T I O N 
--------------------------------------------------------------------------------
-- Inserts data into SV_SEC_NOTATION
--------------------------------------------------------------------------------
PROCEDURE create_notation
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_key            IN VARCHAR2,
  p_page_id                  IN NUMBER   DEFAULT NULL,
  p_component_table          IN VARCHAR2 DEFAULT NULL,
  p_component_column_id      IN VARCHAR2 DEFAULT NULL,
  p_column_key               IN VARCHAR2 DEFAULT NULL,
  p_column_rpt_type          IN VARCHAR2 DEFAULT NULL,
  p_created_by               IN VARCHAR2 DEFAULT NULL,
  p_created_on               IN VARCHAR2 DEFAULT NULL,
  p_notation                 IN CLOB     DEFAULT NULL,
  p_component_sig            IN CLOB DEFAULT NULL,
  p_component_sig_sql        IN CLOB DEFAULT NULL  
  )
IS
  l_success                  BOOLEAN := TRUE;
  l_attribute_id             NUMBER;
  l_sql                      VARCHAR2(4000);
  l_component_id             NUMBER;
  l_column_id                NUMBER;
BEGIN

-- Translate the Attribute Key into an ID, and if not found, fail
FOR x IN (SELECT * FROM sv_sec_attributes WHERE attribute_key = p_attribute_key)
LOOP
  l_attribute_id := x.attribute_id;
END LOOP;

IF l_attribute_id IS NULL THEN
  l_success := FALSE;
END IF;

-- Translate the Component items into an ID, and if not found, fail
IF p_component_table IS NOT NULL THEN

  -- Assemble the SQL to look up the Component ID
  l_sql := 'SELECT ' || p_component_column_id || ' FROM ' || p_component_table || ' WHERE ' 
    || p_component_sig_sql || ' = ' || fix_quotes(p_component_sig) 
    || ' AND application_id = ' || p_application_id;

  -- Attempt to get the Component ID
  BEGIN
    
    EXECUTE IMMEDIATE l_sql INTO l_component_id;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      logger.log('NO_DATA_FOUND: ' || l_sql);
      l_success := FALSE;
  END;

END IF;

-- Translate the Column Key into an ID, and if not found, fail
IF p_column_key IS NOT NULL THEN
  IF p_column_rpt_type = 'IR' THEN
  
    BEGIN
    
      SELECT column_id INTO l_column_id FROM apex_application_page_ir_col 
        WHERE column_alias  = p_column_key 
          AND application_id = p_application_id 
          AND page_id = p_page_id 
          AND region_id = l_component_id;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN l_success := FALSE;
    END;

  ELSIF p_column_rpt_type = 'STD' THEN

    BEGIN

      SELECT region_report_column_id INTO l_column_id FROM apex_application_page_rpt_cols 
        WHERE column_alias = p_column_key 
          AND application_id = p_application_id 
          AND page_id = p_page_id 
          AND region_id = l_component_id;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN l_success := FALSE;
    END;
    
  ELSE
    l_success := FALSE;
  END IF;

  IF l_column_id IS NULL THEN
    l_success := FALSE;
  END IF;
END IF;

-- Write the row to either SC_SEC_EXCEPTIONS or SV_SEC_EXCEPTIONS_FAIL
IF l_success = TRUE THEN
  -- Insert the record into SV_SEC_NOTATIONS
  INSERT INTO sv_sec_notations
    (
    attribute_set_id,
    application_id,
    attribute_id,
    page_id,
    component_id,
    column_id,
    notation,
    created_by,
    created_on
    )
  VALUES
    (
    p_attribute_set_id,
    p_application_id,
    l_attribute_id,
    p_page_id,
    l_component_id,
    l_column_id,
    p_notation,
    p_created_by,
    TO_DATE(p_created_on, 'DDMMYYYY_HHMISS')
    );

ELSE
  -- Insert the record into SV_SEC_NOTATIONS_FAIL
  INSERT INTO sv_sec_notations_fail
    (
    attribute_set_id,
    application_id,
    attribute_id,
    page_id,
    component_id,
    column_id,
    notation,
    created_by,
    created_on,
    component_signature,
    sql
    )
  VALUES
    (
    p_attribute_set_id,
    p_application_id,
    l_attribute_id,
    p_page_id,
    l_component_id,
    l_column_id,
    p_notation,
    p_created_by,
    TO_DATE(p_created_on, 'DDMMYYYY_HHMISS'),
    p_component_sig,
    l_sql
    );
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END create_notation;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_import;
/