CREATE OR REPLACE PACKAGE BODY sv_sec_export
AS 
  lf                         VARCHAR2(10) := CHR(10);           -- Line Feed
  cr                         VARCHAR2(10) := CHR(13);           -- Carriage Return
  vo                         VARCHAR2(10) := '''';              -- VARCHAR open
  vc                         VARCHAR2(10) := '''' || ',' || lf; -- VARCHAR close
  vc_last                    VARCHAR2(10) := ''''        || lf; -- VARCHAR close
  nc                         VARCHAR2(10) := ',' || lf;         -- NUMBER close
  nc_last                    VARCHAR2(10) :=        lf;         -- NUMBER close
  g_format                   VARCHAR2(10);


--------------------------------------------------------------------------------
-- PROCEDURE: P
--------------------------------------------------------------------------------
-- Prints a line of text
-- Can later be expanded to save to the database or export as other formats
--------------------------------------------------------------------------------
PROCEDURE p
  (
  p_val                     IN VARCHAR2
  )
IS
BEGIN

htp.p(p_val);

/**
IF g_format = 'UNIX' THEN
  htp.p(p_val || cr);
ELSIF g_format = 'DOS' THEN
  htp.p(p_val || cr || lf);
END IF;
**/

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END p;

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
        RETURN ''''||REPLACE(
           REPLACE(REPLACE(P_STR,'''',''''''),CHR(13),NULL),
           CHR(10),
           '''||chr(10)||'||CHR(10)||'''')||
           '''';

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END fix_quotes;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T _ C L O B
--------------------------------------------------------------------------------
-- Parses and prints a CLOB in the export file
--------------------------------------------------------------------------------
PROCEDURE print_clob
  (
  p_str                      IN VARCHAR2 DEFAULT NULL,
  p_var                      IN VARCHAR2 DEFAULT 'h'
  )
IS
  h                          VARCHAR2(32767) := NULL;
  s                          VARCHAR2(32767) := NULL;
  l_str                      VARCHAR2(32767) := NULL;
BEGIN

IF p_str IS NULL THEN
  H := P_VAR||' := null;';
  p(H);
  H := NULL;
ELSE
  L_STR := REPLACE(P_STR,CHR(13),NULL);
  FOR I IN 1..100 LOOP
    S := NULL;
    IF LENGTH(L_STR) > (I-1) * 400 THEN
      S := fix_quotes(SUBSTR(L_STR,1+(400*(I-1)),400));
    END IF;
    IF S IS NOT NULL THEN
      H := H||P_VAR||':='||P_VAR||'||'||S||';'||CHR(10);
    ELSE
      EXIT;
    END IF;
    p(H);
    H := NULL;
  END LOOP;
END IF;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END print_clob;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T _ H E A D E R
--------------------------------------------------------------------------------
-- Prints the header of the export file
--------------------------------------------------------------------------------
PROCEDURE print_header
  (
  p_file_name                IN VARCHAR2
  )
IS
BEGIN

-- Set the MIME type
owa_util.mime_header('application/octet', FALSE );
-- Set the name of the file
htp.p('Content-Disposition:attachment;filename="' || p_file_name || '"');
-- Close the HTTP Header
owa_util.http_header_close;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END print_header;


--------------------------------------------------------------------------------
-- PROCEDURE: S C O R E _ C O L L E C T I O N S
--------------------------------------------------------------------------------
-- Creates API calls to populate SV_SEC_SCORE_COLLECTIONS
--------------------------------------------------------------------------------
PROCEDURE score_collections
  (
  p_category_id              IN NUMBER,
  p_apex_version             IN VARCHAR2
  )
IS
  l_category_key             VARCHAR2(255);
BEGIN

-- SV_SEC_SCORE_COLLECTIONS
-- Only get values for the corresponsing version of APEX
FOR x IN 
  (
  SELECT 
    * 
  FROM 
    sv_sec_score_collections 
  WHERE 
    category_id = p_category_id 
    AND apex_version LIKE '%' || SUBSTR(p_apex_version,1,3) || '%'
  )
LOOP

  SELECT category_key INTO l_category_key FROM sv_sec_categories
    WHERE category_id = x.category_id;

  p(   'PROMPT == ..COLLECTION: ' || x.collection_name || lf
    || 'DECLARE'   || lf
    || '  a CLOB;' || lf
    || 'BEGIN '    || lf);

  print_clob(p_var => 'a', p_str => x.collection_sql);    

  p(   'sv_sec_import.score_collection('   || lf
    || '  p_collection_name       => ' || vo || x.collection_name          || vc
    || '  p_collection_key        => ' || vo || x.collection_key           || vc
    || '  p_category_key          => ' || vo || l_category_key             || vc
    || '  p_internal_flag         => ' || vo || x.internal_flag            || vc
    || '  p_apex_version          => ' || vo || SUBSTR(p_apex_version,1,3) || vc
    || '  p_collection_sql        => '       || 'a'                        || nc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END');

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END score_collections;


--------------------------------------------------------------------------------
-- PROCEDURE: C O L _ T E M P L A T E S
--------------------------------------------------------------------------------
-- Creates API calls to populate SV_SEC_COL_TEMPLATES
--------------------------------------------------------------------------------
PROCEDURE col_templates
  (
  P_attribute_set_id         IN NUMBER,
  p_apex_version             IN VARCHAR2
  )
IS
BEGIN

-- SV_SEC_COL_TEMPLATES
-- Only get values for the corresponsing version of APEX
FOR x IN 
  (
  SELECT
    *
  FROM
    sv_sec_col_templates
  WHERE
    apex_version LIKE '%' || SUBSTR(p_apex_version,1,3) || '%'
  )
LOOP

  p(   'PROMPT == COL_TEMPLATE: ' || x.col_template_name || lf
    || 'DECLARE'   || lf
    || '  a CLOB;' || lf
    || 'BEGIN ' || lf);

  print_clob(p_var => 'a', p_str => x.col_template);    

  p(   'sv_sec_import.col_template('   || lf
    || '  p_table_name            => ' || vo || x.table_name         || vc
    || '  p_col_template_name     => ' || vo || x.col_template_name  || vc
    || '  p_col_template_key      => ' || vo || x.col_template_key   || vc
    || '  p_internal_flag         => ' || vo || x.internal_flag      || vc
    || '  p_apex_version          => ' || vo || x.apex_version       || vc
    || '  p_col_template          => '       || 'a'                  || nc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END col_templates;

--------------------------------------------------------------------------------
-- PROCEDURE: A T T R _ R P T _ C O L S
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_ATTR_RPT_COLS
--------------------------------------------------------------------------------
PROCEDURE attr_rpt_cols
  (
  p_attribute_key            IN VARCHAR2
  )
IS
  l_attribute_id             NUMBER;
BEGIN
NULL;

-- Get the Attribute ID
SELECT attribute_id INTO l_attribute_id FROM sv_sec_attributes
  WHERE attribute_key = p_attribute_key;

FOR x IN (SELECT * FROM sv_sec_attr_rpt_inter WHERE attribute_id = l_attribute_id ORDER BY report_key)
LOOP

  p(   'PROMPT == ..SV_SEC_ATTR_RPT_INTER: ' || p_attribute_key || ': ' || x.report_key || lf
    || 'begin ' || lf
    || 'sv_sec_import.attr_rpt_inter('  || lf
    || '  p_attribute_key         => ' || vo || p_attribute_key      || vc
    || '  p_report_key            => ' || vo || x.report_key         || vc_last
    || ');'   || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

  FOR y IN (SELECT * FROM sv_sec_attr_rpt_cols WHERE attr_rpt_inter_id = x.attr_rpt_inter_id ORDER BY seq)
  LOOP
  
    p(   'PROMPT == ....SV_SEC_ATTR_RPT_COLS: ' || p_attribute_key || ': ' || y.column_name || lf
      || 'begin ' || lf
      || 'sv_sec_import.attr_rpt_cols('  || lf
      || '  p_attribute_key         => ' || vo || p_attribute_key      || vc
      || '  p_report_key            => ' || vo || x.report_key         || vc
      || '  p_column_name           => ' || vo || y.column_name        || vc
      || '  p_label                 => ' || vo || y.label              || vc
      || '  p_seq                   => ' ||       y.seq                || nc
      || '  p_format_mask           => ' || vo || y.format_mask        || vc
      || '  p_width                 => ' ||       y.width              || nc
      || '  p_alignment             => ' || vo || y.alignment          || vc_last
      || ');'   || lf
      || 'end;' || lf
      || '/'    || lf);

    p('-->>END' || lf);
   
  END LOOP;
END LOOP;

END attr_rpt_cols;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R I B U T E _ S E T S
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_ATTRIBUTE_SETS
--------------------------------------------------------------------------------
PROCEDURE attribute_sets
  (
  p_attribute_set_id         IN NUMBER,
  p_seed                     IN BOOLEAN
  )
IS
BEGIN

-- SV_SEC_ATTRIBUTE_SETS
FOR x IN (SELECT * FROM sv_sec_attribute_sets WHERE attribute_set_id = p_attribute_set_id)
LOOP

  IF p_seed = TRUE THEN

  p(
       'PROMPT == ATTRIBUTE SET: ' || x.attribute_set_name|| lf
    || 'begin ' || lf
    || 'sv_sec_import.attribute_set('  || lf
    || '  p_attribute_set_key     => ' || vo || 'DEFAULT'            || vc
    || '  p_attribute_set_name    => ' || vo || 'DEFAULT'            || vc
    || '  p_active_flag           => ' || vo || x.active_flag        || vc
    || '  p_description           => ' || vo || x.description        || vc
    || '  p_public_flag           => ' || vo || x.public_flag        || vc
    || '  p_workspace_id          => ' ||       x.workspace_id       || nc_last
    || ');'   || lf
    || 'end;' || lf
    || '/'    || lf);

  ELSE

  p(
       'PROMPT == ATTRIBUTE SET: ' || x.attribute_set_name|| lf
    || 'begin ' || lf
    || 'sv_sec_import.attribute_set('  || lf
    || '  p_attribute_set_key     => ' || vo || '<<ATTRIBUTE_SET_KEY>>'  || vc
    || '  p_attribute_set_name    => ' || vo || x.attribute_set_name || vc
    || '  p_active_flag           => ' || vo || x.active_flag        || vc
    || '  p_description           => ' || vo || x.description        || vc
    || '  p_public_flag           => ' || vo || x.public_flag        || vc
    || '  p_workspace_id          => ' ||       x.workspace_id       || nc_last
    || ');'   || lf
    || 'end;' || lf
    || '/'    || lf);
  
  END IF;


  p('-->>END');

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attribute_sets;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R I B U T E _ V A L U E S
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_ATTRIBUTE_VALUES
--------------------------------------------------------------------------------
PROCEDURE attribute_values
  (
  p_attribute_key            IN VARCHAR2,
  p_attribute_name           IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_seed                     IN BOOLEAN
  )
IS
  l_attribute_id             NUMBER;
BEGIN

-- Get the ATTRIBUTE_ID
SELECT attribute_id INTO l_attribute_id FROM sv_sec_attributes
  WHERE attribute_key = p_attribute_key;

-- Loop through all Attribute Sets
--FOR x IN 1..p_attribute_set_arr.COUNT
--LOOP

  FOR y IN 
    (
    SELECT
      s.attribute_set_key,
      av.value,
      av.result,
      av.active_flag
    FROM 
      sv_sec_attribute_values av, 
      sv_sec_attribute_sets s 
    WHERE 
      av.attribute_id = l_attribute_id 
      AND av.attribute_set_id = s.attribute_set_id
      AND s.attribute_set_id = p_attribute_set_id
    )
  LOOP
  
    IF p_seed = TRUE THEN
    
    p(   'PROMPT == ....ATTRIBUTE VALUE: ' || p_attribute_name || lf
      || 'BEGIN'     || lf);
         
    p(   'sv_sec_import.attribute_value('|| lf
      || '  p_attribute_key         => ' || vo || p_attribute_key      || vc
      || '  p_attribute_set_key     => ' || vo || 'DEFAULT'            || vc
      || '  p_value                 => ' || vo || y.value              || vc
      || '  p_result                => ' || vo || y.result             || vc
      || '  p_active_flag           => ' || vo || y.active_flag        || vc_last
      || '  );' || lf
      || 'END;' || lf
      || '/'    || lf);

    ELSE
    
    p(   'PROMPT == ....ATTRIBUTE VALUE: ' || p_attribute_name || lf
      || 'BEGIN'     || lf);
          
    p(   'sv_sec_import.attribute_value('|| lf
      || '  p_attribute_key         => ' || vo || p_attribute_key      || vc
      || '  p_attribute_set_key     => ' || vo || '<<ATTRIBUTE_SET_KEY>>'  || vc
      || '  p_value                 => ' || vo || y.value              || vc
      || '  p_result                => ' || vo || y.result             || vc
      || '  p_active_flag           => ' || vo || y.active_flag        || vc_last
      || '  );' || lf
      || 'END;' || lf
      || '/'    || lf);

    END IF;

    p('-->>END');

  END LOOP;
--END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attribute_values;


--------------------------------------------------------------------------------
-- PROCEDURE: A T T R I B U T E S
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_ATTRIBUTES
--------------------------------------------------------------------------------
PROCEDURE attributes
  (
  p_category_id              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_seed                     IN BOOLEAN
  )
IS
  l_category_key             sv_sec_categories.category_key%TYPE;
  l_collection_name          sv_sec_score_collections.collection_name%TYPE;
  l_col_template_key         sv_sec_col_templates.col_template_key%TYPE;
  l_component_sig_key        sv_sec_component_sigs.component_sig_key%TYPE;
BEGIN

-- SV_SEC_ATTRIBUTES
FOR x IN (SELECT * FROM sv_sec_attributes WHERE category_id = p_category_id)
LOOP

  -- First, fetch the category key
  SELECT NVL(category_key, 'UNKNOWN') INTO l_category_key FROM sv_sec_categories where category_id = x.category_id;

  -- Next, get the Score Collection Name, if one exists
  IF x.score_collection_id IS NOT NULL THEN
    SELECT collection_name INTO l_collection_name FROM sv_sec_score_collections
      WHERE score_collection_id = x.score_collection_id;  
  END IF;

  -- Get the Collection Template, if one exists
  IF x.col_template_id IS NOT NULL THEN
    SELECT col_template_key INTO l_col_template_key FROM sv_sec_col_templates
      WHERE col_template_id = x.col_template_id;  
  END IF;

  -- Get the Component Sig Key, if one exists
  IF x.component_sig_id IS NOT NULL THEN
    SELECT component_sig_key INTO l_component_sig_key FROM sv_sec_component_sigs
      WHERE component_sig_id = x.component_sig_id;
  END IF;
  
  p(
       'PROMPT == ..ATTRIBUTE: ' || x.attribute_name || lf
    || 'DECLARE'   || lf
    || '  a CLOB;' || lf
    || '  b CLOB;' || lf
    || '  c CLOB;' || lf
    || '  d CLOB;' || lf
    || '  e CLOB;' || lf
    || 'BEGIN'     || lf);
    
  print_clob(p_var => 'a', p_str => x.rule_plsql);    
  print_clob(p_var => 'b', p_str => x.info);    
  print_clob(p_var => 'c', p_str => x.fix);    
   
  p(
       'sv_sec_import.attribute(' || lf
    || '  p_category_key             => ' || vo || l_category_key             || vc
    || '  p_attribute_name           => ' || vo || x.attribute_name           || vc
    || '  p_attribute_key            => ' || vo || x.attribute_key            || vc
    || '  p_active_flag              => ' || vo || x.active_flag              || vc
    || '  p_rule_source              => ' || vo || x.rule_source              || vc
    || '  p_rule_type                => ' || vo || x.rule_type                || vc
    || '  p_table_name               => ' || vo || x.table_name               || vc
    || '  p_column_name              => ' || vo || x.column_name              || vc
    || '  p_view_name                => ' || vo || x.view_name                || vc
    || '  p_component_table          => ' || vo || x.component_table          || vc
    || '  p_component_column_id      => ' || vo || x.component_column_id      || vc
    || '  p_component_column_display => ' || vo || x.component_column_display || vc
    || '  p_column_table             => ' || vo || x.column_table             || vc
    || '  p_column_column_id         => ' || vo || x.column_column_id         || vc
    || '  p_column_column_display    => ' || vo || x.column_column_display    || vc
    || '  p_when_not_found           => ' || vo || x.when_not_found           || vc
    || '  p_internal_flag            => ' || vo || x.internal_flag            || vc    
    || '  p_impact                   => ' || vo || x.impact                   || vc
    || '  p_component_sig_key        => ' || vo || l_component_sig_key        || vc
    || '  p_help_page                => ' || vo || x.help_page                || vc
    || '  p_seq                      => ' ||       NVL(x.seq,99)              || nc);

  IF x.score_collection_id IS NOT NULL THEN
    p( '  p_collection_name          => ' || vo || l_collection_name          || vc);
  END IF;

  IF x.col_template_id IS NOT NULL THEN
    p( '  p_col_template_key         => ' || vo || l_col_template_key         || vc);  
  END IF;

  IF x.display_page_id IS NOT NULL THEN
    p( '  p_display_page_id          => ' ||       x.display_page_id          || nc);
  END IF;

  IF x.summary_page_id IS NOT NULL THEN
    p( '  p_summary_page_id          => ' ||       x.summary_page_id          || nc);
  END IF;

  p(
       '  p_rule_plsql               => ' ||       'a'                        || nc
    || '  p_info                     => ' ||       'b'                        || nc
    || '  p_fix                      => ' ||       'c'                        || nc_last
    || '  );' || lf
    || 'END;' || lf
    || '/'    || lf);

  p('-->>END');

  -- SV_SEC_ATTRIBUTE_VALUES
  attribute_values(
    p_attribute_key     => x.attribute_key,
    p_attribute_name    => x.attribute_name,
    p_attribute_set_id  => p_attribute_set_id,
    p_seed              => p_seed);  

  -- SV_ATTR_RPT_DEFN and COLS
  attr_rpt_cols(
    p_attribute_key     => x.attribute_key);

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attributes;


--------------------------------------------------------------------------------
-- PROCEDURE: C A T E G O R I E S
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_CATEGORIES
--------------------------------------------------------------------------------
PROCEDURE categories
  (
  p_attribute_set_id         IN NUMBER,
  p_seed                     IN BOOLEAN,
  p_apex_version             IN VARCHAR2
  )
IS
  l_classification_key       VARCHAR2(255);
BEGIN

-- SV_SEC_CATEGORIES
FOR x IN 
  (
  SELECT
    *
  FROM
    sv_sec_categories
  WHERE 
    category_id IN 
    (
    SELECT
      a.category_id
    FROM
      sv_sec_attributes a,
      sv_sec_attribute_set_attrs aa
    WHERE
      a.attribute_id = aa.attribute_id
      AND aa.attribute_set_id = p_attribute_set_id
    )
  )
LOOP

  -- Get the classification key
  SELECT classification_key INTO l_classification_key
    FROM sv_sec_classifications WHERE classification_id = x.classification_id;


  p(   'PROMPT == CATEGORY: ' || x.category_name || lf
    || 'BEGIN'     || lf);
    
  p(   'sv_sec_import.category('   || lf
    || '  p_category_name         => ' || vo || x.category_name      || vc
    || '  p_category_short_name   => ' || vo || x.category_short_name|| vc
    || '  p_category_key          => ' || vo || x.category_key       || vc
    || '  p_classification_key    => ' || vo || l_classification_key || vc
    || '  p_category_link         => ' || vo || x.category_link      || vc
    || '  p_display_page          => ' || vo || x.display_page       || vc
    || '  p_rpt_attribute_key     => ' || vo || x.rpt_attribute_key  || vc      
    || '  p_internal_flag         => ' || vo || x.internal_flag      || vc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);


  -- Generate the corresponding Score Collections
  score_collections
    (
    p_category_id  => x.category_id,
    p_apex_version => p_apex_version
    );

  -- Call the corresponding Attributes
  attributes
    (
    p_category_id       => x.category_id,
    p_attribute_set_id  => p_attribute_set_id,
    p_seed              => p_seed
    );

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END categories;


--------------------------------------------------------------------------------
-- PROCEDURE: C L A S S I F I C A T I O N S
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_CLASSIFICATIONS
--------------------------------------------------------------------------------
PROCEDURE classifications
IS
BEGIN

-- SV_SEC_CLASSIFICATIONS
FOR x IN (SELECT * FROM sv_sec_classifications)
LOOP

  p(   'PROMPT == CLASSIFICATION: ' || x.classification_name|| lf
    || 'begin ' || lf
    || 'sv_sec_import.classification('   || lf
    || '  p_classification_name   => ' || vo || x.classification_name|| vc
    || '  p_summary_page_id       => '       || x.summary_page_id    || nc
    || '  p_seq                   => '       || x.seq                || nc
    || '  p_classification_key    => ' || vo || x.classification_key || vc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END classifications;


--------------------------------------------------------------------------------
-- PROCEDURE: C O M P O N E N T _ S I G N A T U R E S
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_COMPONENT_SIGS
--------------------------------------------------------------------------------
PROCEDURE component_signatures
IS
BEGIN

-- SV_SEC_CLASSIFICATIONS
FOR x IN (SELECT * FROM sv_sec_component_sigs ORDER BY component_sig_key)
LOOP

  p(   'PROMPT == COMPONENT_SIGNATURE: ' || x.component_sig_key || lf
    || 'DECLARE'   || lf
    || '  a CLOB;' || lf
    || 'BEGIN    ' || lf);

  print_clob(p_var => 'a', p_str => x.component_sig);    

  p(   'sv_sec_import.component_signature('   || lf
    || '  p_component_sig_key     => ' || vo || x.component_sig_key  || vc
    || '  p_component_sig         => '       ||'a'                   || nc_last
    || '  );' || lf
    || 'END;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END component_signatures;

--------------------------------------------------------------------------------
-- PROCEDURE: H E L P _ T E X T
--------------------------------------------------------------------------------
-- Prints API calls for SV_SEC_HELP_TEXT and SV_SEC_HELP_INTER
--------------------------------------------------------------------------------
PROCEDURE help_text
IS
  l_static_id                VARCHAR2(255);
BEGIN

-- SV_SEC_HELP_TEXT
FOR x IN (SELECT * FROM sv_sec_help_text ORDER BY display_title)
LOOP

  p(   'PROMPT == HELP_TEXT: ' || x.display_title || lf
    || 'DECLARE'   || lf
    || '  a CLOB;' || lf
    || '  b CLOB;' || lf
    || '  c CLOB;' || lf
    || 'BEGIN ' || lf);

  print_clob(p_var => 'a', p_str => x.help_summary);    
  print_clob(p_var => 'b', p_str => x.help_text);    
  print_clob(p_var => 'c', p_str => x.custom_help_text);    
 
  p(   'sv_sec_import.help_text('   || lf
    || '  p_help_text_key         => ' || vo || x.help_text_key      || vc
    || '  p_display_title         => ' || vo || x.display_title      || vc
    || '  p_help_summary          => '       || 'a'                  || nc
    || '  p_help_text             => '       || 'b'                  || nc
    || '  p_custom_help_text      => '       || 'c'                  || nc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

-- SV_SEC_HELP_INTER
FOR x IN (SELECT hi.help_text_id, hi.component_id, hi.component_type, ht.help_text_key, hi.page_id 
  FROM sv_sec_help_inter hi, sv_sec_help_text ht WHERE hi.help_text_id = ht.help_text_id)
LOOP

  p(   'PROMPT == HELP_TEXT_INTER: ' || x.help_text_key || lf
    || 'BEGIN ' || lf
    || 'sv_sec_import.help_text_inter('   || lf
    || '  p_component_id          => ' || vo || x.component_id       || vc
    || CASE WHEN x.component_type = 'REGION' THEN
       '  p_page_id               => ' ||       x.page_id            || nc
       END
    || '  p_component_type        => ' || vo || x.component_type     || vc
    || '  p_help_text_key         => ' || vo || x.help_text_key      || vc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END help_text;


--------------------------------------------------------------------------------
-- PROCEDURE: ATTRIBUTE_SET_MAPPING
--------------------------------------------------------------------------------
-- Prints API calls for to map Attributes to Attribute Sets
--------------------------------------------------------------------------------
PROCEDURE attribute_set_mapping
  (
  p_attribute_set_id         IN NUMBER,
  p_seed                     IN BOOLEAN
  )
IS
BEGIN

FOR x IN 
  (
  SELECT
    s.attribute_set_key,
    a.attribute_key,
    asa.active_flag,
    asa.time_to_fix,
    asa.severity_level
  FROM
    sv_sec_attributes a,
    sv_sec_attribute_set_attrs asa,
    sv_sec_attribute_sets s
  WHERE
    a.attribute_id = asa.attribute_id
    AND s.attribute_set_id = asa.attribute_set_id
    AND s.attribute_set_id = p_attribute_set_id
  )
LOOP
  IF p_seed = TRUE THEN

  p(   'PROMPT == ATTRIBUTE SET MAPPING: DEFAULT - ' || x.attribute_key || lf
    || 'BEGIN ' || lf
    || 'sv_sec_import.attr_set_mapping('     || lf
    || '  p_attribute_set_key     => ' || vo || 'DEFAULT'            || vc
    || '  p_attribute_key         => ' || vo || x.attribute_key      || vc
    || '  p_time_to_fix           => '       || x.time_to_fix        || nc
    || '  p_severity_level        => '       || x.severity_level     || nc
    || '  p_active_flag           => ' || vo || x.active_flag        || vc_last


    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  ELSE

  p(   'PROMPT == ATTRIBUTE SET MAPPING: ' || x.attribute_set_key || ' - ' || x.attribute_key || lf
    || 'BEGIN ' || lf
    || 'sv_sec_import.attr_set_mapping('     || lf
    || '  p_attribute_set_key     => ' || vo || '<<ATTRIBUTE_SET_KEY>>'  || vc
    || '  p_attribute_key         => ' || vo || x.attribute_key      || vc
    || '  p_time_to_fix           => '       || x.time_to_fix        || nc
    || '  p_severity_level        => '       || x.severity_level     || nc
    || '  p_active_flag           => ' || vo || x.active_flag        || vc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END');

  END IF;


END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END attribute_set_mapping;


--------------------------------------------------------------------------------
-- PROCEDURE: EVENT_TYPES
--------------------------------------------------------------------------------
-- Creates API calls to populate SV_SEC_EVENT_TYPES
--------------------------------------------------------------------------------
PROCEDURE event_types
IS
BEGIN

-- SV_SEC_EVENT_TYPES
FOR x IN (SELECT * FROM sv_sec_event_types)
LOOP

  p(   'PROMPT == EVENT_TYPE: ' || x.event_name || lf
    || 'BEGIN '    || lf);
  p(   'sv_sec_import.event_type('   || lf
    || '  p_event_type_key        => ' || vo || x.event_type_key     || vc
    || '  p_event_name            => ' || vo || x.event_name         || vc
    || '  p_event_description     => ' || vo || x.event_description  || vc
    || '  p_event_message         => ' || vo || x.event_message      || vc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END event_types;


--------------------------------------------------------------------------------
-- PROCEDURE: C R E A T E _ S C R I P T
--------------------------------------------------------------------------------
-- Creates an installation script for the seed metadata
--------------------------------------------------------------------------------

PROCEDURE create_script 
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_attribute_set_id         IN VARCHAR2,
  p_apex_version             IN VARCHAR2 DEFAULT NULL
  )
IS
  l_attribute_set_arr        APEX_APPLICATION_GLOBAL.VC_ARR2;
BEGIN

-- Convert the Attribute Set IDs to an array
l_attribute_set_arr := apex_util.string_to_table(p_attribute_set_id);

-- Set the format globally
g_format := p_format;

-- Header
print_header(p_file_name => 'sv_sec_data.sql');

-- Attribute Sets
p('-- START: A T T R I B U T E _ S E T S');
attribute_sets
  (
  p_attribute_set_id => p_attribute_set_id,
  p_seed => TRUE
  );
p('-- FINISH: A T T R I B U T E _ S E T S');

-- Classifications 
p('-- START: C L A S S I F I C A T I O N S');
classifications;
p('-- FINISH: C L A S S I F I C A T I O N S');

-- Component Signatures
p('-- START: C O M P O N E N T _ S I G N A T U R E S');
component_signatures;
p('-- FINISH: C O M P O N E N T _ S I G N A T U R E S');

-- Collection Templates
p('-- START: S Q L _ T E M P L A T E S');
col_templates
  (
  p_attribute_set_id => p_attribute_set_id,
  p_apex_version     => p_apex_version
  );
p('-- FINISH: S Q L _ T E M P L A T E S');

-- Categories - which will call Attributes and Attribute Values
p('-- START: C A T E G O R I E S');
categories
  (
  p_attribute_set_id => p_attribute_set_id,
  p_seed             => TRUE,
  p_apex_version     => p_apex_version
  );
p('-- FINISH: C A T E G O R I E S');

-- Link Attributes to Attribute Sets
p('-- START: A T T R I B U T E _ S E T _ L I N K S');
attribute_set_mapping
  (
  p_attribute_set_id => p_attribute_set_id,
  p_seed => TRUE
  );
p('-- FINISH: A T T R I B U T E _ S E T _ L I N K S');

-- Help Text
p('-- START: H E L P   T E X T');
help_text;
p('-- FINISH: H E L P   T E X T');

-- Event Types
p('-- START: E V E N T _ T Y P E S');
event_types;
p('-- FINISH: E V E N T _ T Y P E S');

-- Add a Commit
p('commit' || lf || '/' || lf);
p('-->>END' || lf);

-- Send an error code so that the rest of the HTML does not render
htmldb_application.g_unrecoverable_error := true;

END create_script;



--------------------------------------------------------------------------------
-- PROCEDURE: C R E A T E _ A T T R _ S E T _ S C R I P T
--------------------------------------------------------------------------------
-- Creates an installation script for a specific attribute set
--------------------------------------------------------------------------------
PROCEDURE create_attr_set_script 
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_attribute_set_id         IN VARCHAR2,
  p_export_all               IN BOOLEAN DEFAULT FALSE,
  p_apex_version             IN VARCHAR2
  )
IS
  l_attribute_set_name       VARCHAR2(255);
BEGIN

-- Get the Attribute Set Name
SELECT attribute_set_name INTO l_attribute_set_name FROM sv_sec_attribute_sets
  WHERE attribute_set_id = p_attribute_set_id;

-- Set the format globally
g_format := p_format;


-- Header
IF p_export_all = FALSE THEN
  print_header(p_file_name => 'Attribute Set Export - ' || l_attribute_set_name || '.sql');
END IF;

-- Attribute Sets
p('-- START: A T T R I B U T E _ S E T S');
attribute_sets
    (
    p_attribute_set_id => p_attribute_set_id,
    p_seed => FALSE
    );
p('-- FINISH: A T T R I B U T E _ S E T S');

-- Collection Templates
p('-- START: S Q L _ T E M P L A T E S');
col_templates
  (
  p_attribute_set_id => p_attribute_set_id,
  p_apex_version     => p_apex_version
  );
p('-- FINISH: S Q L _ T E M P L A T E S');

-- Component Signatures
p('-- START: C O M P O N E N T _ S I G N A T U R E S');
component_signatures;
p('-- FINISH: C O M P O N E N T _ S I G N A T U R E S');

-- Cateories - which calls Attributes and Attribute Values
p('-- START: C A T E G O R I E S');
categories
  (
  p_attribute_set_id => p_attribute_set_id,
  p_seed             => FALSE,
  p_apex_version     => p_apex_version
  );
p('-- FINISH: C A T E G O R I E S');

-- Link Attributes to Attribute Sets
p('-- START: A T T R I B U T E _ S E T _ L I N K S');
attribute_set_mapping
  (
  p_attribute_set_id => p_attribute_set_id,
  p_seed => FALSE
  );
p('-- FINISH: A T T R I B U T E _ S E T _ L I N K S');

-- Add a Commit
p('commit' || lf || '/' || lf);
p('-->>END' || lf);

IF p_export_all = FALSE THEN
  -- Send an error code so that the rest of the HTML does not render
  htmldb_application.g_unrecoverable_error := true;
END IF;

END create_attr_set_script;


--------------------------------------------------------------------------------
-- PROCEDURE: C R E A T E _  A L L _ A T T R _ S E T _ S C R I P T
--------------------------------------------------------------------------------
-- Creates an installation script for a specific attribute set
--------------------------------------------------------------------------------
PROCEDURE create_all_attr_set_script 
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_apex_version             IN VARCHAR2
  )
IS
BEGIN


print_header(p_file_name => 'Attribute Set Export - All Attribute Sets.sql');

FOR x IN (SELECT * FROM sv_sec_attribute_sets WHERE attribute_set_id > 0)
LOOP

create_attr_set_script 
  (
  p_attribute_set_id         => x.attribute_set_id,
  p_export_all               => TRUE,
  p_apex_version             => p_apex_version
  );

-- Send an error code so that the rest of the HTML does not render
htmldb_application.g_unrecoverable_error := true;

END LOOP;

END create_all_attr_set_script;


--------------------------------------------------------------------------------
-- PROCEDURE: E X C E P T I O N S _ S C R I P T
--------------------------------------------------------------------------------
-- Creates an installation script for an Exception
--------------------------------------------------------------------------------
PROCEDURE exceptions_script
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER
  )
IS
  l_attribute_key            sv_sec_attributes.attribute_key%TYPE;
  l_column_key               VARCHAR2(255);
  l_column_rpt_type          VARCHAR2(255);
  l_count                    NUMBER;
  l_component_table          VARCHAR2(255);
  l_component_column_id      VARCHAR2(255);
  l_component_signature      VARCHAR2(4000);
  l_component_signature_sql  VARCHAR2(4000);
  l_component_sig_id         NUMBER;
 l_sql                       VARCHAR2(1000);
  l_attribute_set_key        VARCHAR2(255);
BEGIN

-- Set the format globally
g_format := p_format;

-- Get the Attribute Set Key
SELECT attribute_set_key INTO l_attribute_set_key FROM sv_sec_attribute_sets
  WHERE attribute_set_id = p_attribute_set_id;

-- Header
print_header(p_file_name => 'sv_sec_exceptions_app_' || p_application_id || '_' || l_attribute_set_key || '.sql');

FOR x IN (SELECT * FROM sv_sec_exceptions WHERE application_id = p_application_id AND attribute_set_id = p_attribute_set_id)
LOOP
  
  -- Reset all variables to NULL
  l_column_key := NULL;
  l_column_rpt_type := NULL;
  l_component_table := NULL;
  l_component_column_id := NULL;
  l_component_signature := NULL;
  l_component_signature_sql := NULL;
  l_sql := NULL;
  l_attribute_key := NULL;

  -- Look up attrbute_key and component table
  SELECT attribute_key, component_table, component_column_id, component_sig_id 
    INTO l_attribute_key, l_component_table, l_component_column_id, l_component_sig_id
    FROM sv_sec_attributes 
    WHERE attribute_id = x.attribute_id;

  -- Get the component signature, if one exists
  IF l_component_sig_id IS NOT NULL THEN

    SELECT component_sig INTO l_component_signature_sql FROM sv_sec_component_sigs
      WHERE component_sig_id = l_component_sig_id;
  
  END IF;
  
  
  -- Look up Component Type and Key
  IF x.component_id IS NOT NULL THEN
    
    l_sql := 'SELECT ' || l_component_signature_sql || ' FROM ' || l_component_table || ' WHERE ' || l_component_column_id || ' = ' || x.component_id;

    BEGIN
      EXECUTE IMMEDIATE l_sql  INTO l_component_signature; 
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
    END;

  END IF;
  
  -- Look up Column Alias
  IF x.column_id IS NOT NULL THEN

    SELECT COUNT(*) INTO l_count FROM apex_application_page_ir WHERE region_id = x.component_id AND page_id = x.page_id AND application_id = p_application_id;
    IF l_count = 1 THEN

      -- Get the column from IR Cols
      SELECT column_alias INTO l_column_key FROM apex_application_page_ir_col WHERE column_id = x.column_id;
      l_column_rpt_type := 'IR';

    ELSE
      -- Get the column from Std Col
      SELECT column_alias INTO l_column_key FROM apex_application_page_rpt_cols WHERE region_report_column_id = x.column_id;
      l_column_rpt_type := 'STD';
      
    END IF;  
  END IF;

  -- Print out the API calls for an exception  
  p(   'PROMPT == EXCEPTION: ' || l_attribute_key || lf
    || 'DECLARE'   || lf
    || '  a CLOB;' || lf
    || '  b CLOB;' || lf
    || '  c CLOB;' || lf
    || '  d CLOB;' || lf
    || '  e CLOB;' || lf
    || '  f CLOB;' || lf
    || 'BEGIN ' || lf);

  print_clob(p_var => 'a', p_str => x.justification);    
  print_clob(p_var => 'b', p_str => x.rejection);    
  print_clob(p_var => 'c', p_str => x.rejected_justification);    
  print_clob(p_var => 'd', p_str => x.val);
  print_clob(p_var => 'e', p_str => l_component_signature);
  print_clob(p_var => 'f', p_str => l_component_signature_sql);
 
  p(   'sv_sec_import.create_exception('   || lf
    || '  p_attribute_set_id      => '       || '<<ATTRIBUTE_SET_ID>>'|| nc
    || '  p_application_id        => '       || '<<APPLICATION_ID>>' || nc
    || '  p_attribute_key         => ' || vo || l_attribute_key      || vc
    || '  p_page_id               => '       || x.page_id            || nc
    || '  p_component_table       => ' || vo || l_component_table    || vc
    || '  p_component_column_id   => ' || vo || l_component_column_id|| vc
    || '  p_column_key            => ' || vo || l_column_key         || vc
    || '  p_column_rpt_type       => ' || vo || l_column_rpt_type    || vc
    || '  p_approved_flag         => ' || vo || x.approved_flag      || vc
    || '  p_created_by            => ' || vo || x.created_by         || vc
    || '  p_approved_by           => ' || vo || x.approved_by        || vc
    || '  p_rejected_by           => ' || vo || x.rejected_by        || vc
    || '  p_checksum              => ' || vo || x.checksum                || vc
    || '  p_created_on            => ' || vo || TO_CHAR(x.created_on,'DDMMYYYY_HHMISS')   || vc
    || '  p_approved_on           => ' || vo || TO_CHAR(x.approved_on, 'DDMMYYYY_HHMISS') || vc
    || '  p_rejected_on           => ' || vo || TO_CHAR(x.rejected_on, 'DDMMYYYY_HHMISS') || vc
    || '  p_justification         => '       || 'a'                  || nc
    || '  p_rejection             => '       || 'b'                  || nc
    || '  p_rejected_justification=> '       || 'c'                  || nc
    || '  p_val                   => '       || 'd'                  || nc
    || '  p_component_sig         => '       || 'e'                  || nc
    || '  p_component_sig_sql     => '       || 'f'                  || nc_last
   || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

-- Send an error code so that the rest of the HTML does not render
htmldb_application.g_unrecoverable_error := true;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END exceptions_script;


--------------------------------------------------------------------------------
-- PROCEDURE: N O T A T I O N S _ S C R I P T
--------------------------------------------------------------------------------
-- Creates an installation script for a Notation
--------------------------------------------------------------------------------
PROCEDURE notations_script
  (
  p_format                   IN VARCHAR2 DEFAULT 'UNIX',
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER
  )
IS
  l_attribute_key            sv_sec_attributes.attribute_key%TYPE;
  l_column_key               VARCHAR2(255);
  l_column_rpt_type          VARCHAR2(255);
  l_count                    NUMBER;
  l_component_table          VARCHAR2(255);
  l_component_column_id      VARCHAR2(255);
  l_component_signature      VARCHAR2(4000);
  l_component_signature_sql  VARCHAR2(4000);
  l_component_sig_id         NUMBER;
 l_sql                       VARCHAR2(1000);
  l_attribute_set_key        VARCHAR2(255);
BEGIN

-- Set the format globally
g_format := p_format;

-- Get the Attribute Set Key
SELECT attribute_set_key INTO l_attribute_set_key FROM sv_sec_attribute_sets
  WHERE attribute_set_id = p_attribute_set_id;

-- Header
print_header(p_file_name => 'sv_sec_notations_app_' || p_application_id || '_' || l_attribute_set_key || '.sql');

FOR x IN (SELECT * FROM sv_sec_notations WHERE application_id = p_application_id AND attribute_set_id = p_attribute_set_id)
LOOP
  
  -- Reset all variables to NULL
  l_column_key := NULL;
  l_column_rpt_type := NULL;
  l_component_table := NULL;
  l_component_column_id := NULL;
  l_component_signature := NULL;
  l_component_signature_sql := NULL;
  l_sql := NULL;
  l_attribute_key := NULL;

  -- Look up attrbute_key and component table
  SELECT attribute_key, component_table, component_column_id, component_sig_id 
    INTO l_attribute_key, l_component_table, l_component_column_id, l_component_sig_id
    FROM sv_sec_attributes 
    WHERE attribute_id = x.attribute_id;

  -- Get the component signature, if one exists
  IF l_component_sig_id IS NOT NULL THEN

    SELECT component_sig INTO l_component_signature_sql FROM sv_sec_component_sigs
      WHERE component_sig_id = l_component_sig_id;
  
  END IF;
  
  -- Look up Component Type and Key
  IF x.component_id IS NOT NULL THEN
    
    l_sql := 'SELECT ' || l_component_signature_sql || ' FROM ' || l_component_table || ' WHERE ' || l_component_column_id || ' = ' || x.component_id;

    BEGIN
      EXECUTE IMMEDIATE l_sql  INTO l_component_signature; 
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
    END;

  END IF;
  
  -- Look up Column Alias
  IF x.column_id IS NOT NULL THEN

    SELECT COUNT(*) INTO l_count FROM apex_application_page_ir WHERE region_id = x.component_id AND page_id = x.page_id AND application_id = p_application_id;
    IF l_count = 1 THEN

      -- Get the column from IR Cols
      SELECT column_alias INTO l_column_key FROM apex_application_page_ir_col WHERE column_id = x.column_id;
      l_column_rpt_type := 'IR';

    ELSE
      -- Get the column from Std Col
      SELECT column_alias INTO l_column_key FROM apex_application_page_rpt_cols WHERE region_report_column_id = x.column_id;
      l_column_rpt_type := 'STD';
      
    END IF;  
  END IF;

  -- Print out the API calls for a notation
  p(   'PROMPT == NOTATION: ' || l_attribute_key || lf
    || 'DECLARE'   || lf
    || '  a CLOB;' || lf
    || '  b CLOB;' || lf
    || '  c CLOB;' || lf
    || 'BEGIN ' || lf);

  print_clob(p_var => 'a', p_str => x.notation);    
  print_clob(p_var => 'b', p_str => l_component_signature);
  print_clob(p_var => 'c', p_str => l_component_signature_sql);
 
  p(   'sv_sec_import.create_notation('   || lf
    || '  p_attribute_set_id      => '       || '<<ATTRIBUTE_SET_ID>>'|| nc
    || '  p_application_id        => '       || '<<APPLICATION_ID>>' || nc
    || '  p_attribute_key         => ' || vo || l_attribute_key      || vc
    || '  p_component_table       => ' || vo || l_component_table    || vc);

  IF x.page_id IS NOT NULL THEN
    p( '  p_page_id               => '       || x.page_id            || nc);
  END IF;
  
  p(   '  p_component_column_id   => ' || vo || l_component_column_id|| vc
    || '  p_column_key            => ' || vo || l_column_key         || vc
    || '  p_column_rpt_type       => ' || vo || l_column_rpt_type    || vc
    || '  p_created_by            => ' || vo || x.created_by         || vc
    || '  p_created_on            => ' || vo || TO_CHAR(x.created_on,'DDMMYYYY_HHMISS')   || vc
    || '  p_notation              => '       || 'a'                  || nc
    || '  p_component_sig         => '       || 'b'                  || nc
    || '  p_component_sig_sql     => '       || 'c'                  || nc_last
    || '  );' || lf
    || 'end;' || lf
    || '/'    || lf);

  p('-->>END' || lf);

END LOOP;

-- Send an error code so that the rest of the HTML does not render
htmldb_application.g_unrecoverable_error := true;

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END notations_script;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_export;
/