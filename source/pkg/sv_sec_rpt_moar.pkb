CREATE OR REPLACE PACKAGE BODY sv_sec_rpt_moar
AS

PROCEDURE print_clob
  (
  p_line_break               IN NUMBER DEFAULT 2,
  p_title                    IN VARCHAR2,
  p_clob                     IN CLOB
  )
IS
BEGIN

NULL;
-- Break for spacing
--plpdf.lineBreak(p_line_break);

-- Set the font and print the title
sv_sec_rpt_util.set_font(p_style => 'B', p_size => 9);
--plpdf.printCell(100,6,p_title);

-- Break for spacing
--plpdf.lineBreak(5);

-- Set the font and print the body
--sv_sec_rpt_util.set_font(p_size => 7);
--plpdf.printMultiLineCell(195,5,SUBSTR(p_clob,2),1); -- SUBSTR is needed to remove the first CHR(10)

END print_clob;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T _ A T T R I B U T E
--------------------------------------------------------------------------------
-- Prints an attribute report for a specific attribute
--------------------------------------------------------------------------------
PROCEDURE print_attribute
  (
  p_application_id           IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_page_id                  IN NUMBER   DEFAULT NULL,
  p_app_session              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_attribute_id             IN NUMBER   DEFAULT NULL,
  p_cover_page               IN BOOLEAN  DEFAULT TRUE,
  p_init                     IN BOOLEAN  DEFAULT TRUE,
  p_print                    IN BOOLEAN  DEFAULT TRUE,
  p_where                    IN VARCHAR2 DEFAULT NULL,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_incl_info                IN BOOLEAN  DEFAULT TRUE,
  p_incl_fix                 IN BOOLEAN  DEFAULT TRUE
  )
IS
  l_attr                     sv_sec_attributes%ROWTYPE;
  l_sql                      VARCHAR2(4000);
  l_attribute_set_name       VARCHAR2(255);
  l_page_id                  NUMBER := p_page_id;
  l_dummy                    VARCHAR2(100);
  l_classification_id        NUMBER;
BEGIN

-- Get the Attribute Set Name
SELECT attribute_set_name INTO l_attribute_set_name
  FROM sv_sec_attribute_sets WHERE attribute_set_id = p_attribute_set_id;

-- Fetch the attribute
IF p_attribute_id IS NULL THEN
  SELECT * INTO l_attr FROM sv_sec_attributes WHERE display_page_id = p_page_id;
ELSE
  SELECT * INTO l_attr FROM sv_sec_attributes WHERE attribute_id = p_attribute_id;
  
  IF l_page_id IS NULL THEN
    SELECT display_page_id INTO l_page_id FROM sv_sec_attributes WHERE attribute_id = p_attribute_id;
  END IF;

END IF;

-- Initialize
IF p_init = TRUE THEN
  sv_sec_rpt_util.init
    (
    p_header => l_attr.attribute_name || ' - ' || l_attribute_set_name,
    p_orientation => 'P',
    p_app_user => p_app_user
    );
END IF;

IF p_cover_page = TRUE THEN
  sv_sec_rpt_util.cover_page(
    p_title     => l_attr.attribute_name,
    p_sub_title => 'Attribute Set: '|| l_attribute_set_name);
END IF;

-- Create a new page
sv_sec_rpt_util.new_page(p_orientation => 'P');

-- Get the classification_id for a given attribute
SELECT classification_id INTO l_classification_id FROM sv_sec_categories
  WHERE category_id = l_attr.category_id;
  
IF p_where IS NOT NULL THEN
  l_sql := l_sql || ' WHERE result IN (' || p_where || ') ';
END IF;

sv_sec_rpt_generic.print
  (
  p_page_id                  => p_page_id,
  p_title                    => l_attr.attribute_name,
  p_application_id           => p_application_id,
  p_sert_app_id              => p_sert_app_id,
  p_app_session              => p_app_session,
  p_attribute_id             => l_attr.attribute_id,
  p_report_key               => 'ATTRIBUTE',
  p_result                   => NULL,
  p_order_by                 => ' ORDER BY 1, 2, 3',
  p_cover_page               => FALSE,
  p_init                     => FALSE,
  p_print                    => p_print,
  p_app_user                 => p_app_user,
  p_static_id                => 'rpt',
  p_orientation              => 'L'
  );

EXCEPTION
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END print_attribute;

--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T _ C A T E G O R Y
--------------------------------------------------------------------------------
-- Prints an attribute report for a specific category
--------------------------------------------------------------------------------

PROCEDURE print_category
  (
  p_application_id           IN NUMBER,
  p_page_id                  IN NUMBER   DEFAULT NULL,
  p_app_session              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_category_id              IN NUMBER   DEFAULT NULL,
  p_cover_page               IN BOOLEAN  DEFAULT TRUE,
  p_init                     IN BOOLEAN  DEFAULT TRUE,
  p_print                    IN BOOLEAN  DEFAULT TRUE,
  p_where                    IN VARCHAR2 DEFAULT NULL,
  p_sert_app_id              IN VARCHAR2 DEFAULT v('APP_ID')
  )
IS
  l_cat                      sv_sec_categories%ROWTYPE;
  l_sql                      VARCHAR2(4000);
  l_attribute_set_name       VARCHAR2(255);
  l_attribute_id             NUMBER;
  l_classification_id        NUMBER;
BEGIN

-- Get the Attribute Set Name
SELECT attribute_set_name INTO l_attribute_set_name
  FROM sv_sec_attribute_sets WHERE attribute_set_id = p_attribute_set_id;

-- Fetch the category
IF p_category_id IS NULL THEN
  SELECT * INTO l_cat FROM sv_sec_categories WHERE display_page =
    (SELECT page_alias FROM apex_application_pages WHERE page_id = 210--p_page_id
      AND application_id = p_sert_app_id);
ELSE
  SELECT * INTO l_cat FROM sv_sec_categories WHERE category_id = p_category_id;
END IF;

-- Get the classification_id
SELECT classification_id INTO l_classification_id FROM sv_sec_categories
  WHERE category_id = l_cat.category_id;

-- Fetch the attribute that stores the report definitions
SELECT attribute_id INTO l_attribute_id FROM sv_sec_attributes
  WHERE attribute_key = l_cat.rpt_attribute_key;

-- Initialize
IF p_init = TRUE THEN
  sv_sec_rpt_util.init
    (
    p_header => l_cat.category_short_name || ' - ' || l_attribute_set_name,
    p_orientation => 'P'
    );
END IF;

IF p_cover_page = TRUE THEN
  sv_sec_rpt_util.cover_page(
    p_title     => l_cat.category_short_name,
    p_sub_title => 'Attribute Set: '|| l_attribute_set_name);
END IF;

-- Create a new page
sv_sec_rpt_util.new_page(p_orientation => 'P');

-- Get the SQL
l_sql :=  sv_sec_rpt_generic.get_sql
  (
  p_attribute_id => l_attribute_id,
  p_report_key   => 'ATTRIBUTE',
  p_pdf          => TRUE
  );

IF p_where IS NOT NULL THEN
  l_sql := l_sql || ' WHERE result IN (' || p_where || ') ';
END IF;

sv_sec_rpt_generic.print
  (
  p_page_id                  => p_page_id,
  p_title                    => l_cat.category_name,
  p_sert_app_id              => p_sert_app_id,
  p_app_session              => p_app_session,
  p_attribute_id             => l_attribute_id,
  p_report_key               => 'ATTRIBUTE',
  p_result                   => NULL,
  p_order_by                 => ' ORDER BY 1, 2, 3',
  p_cover_page               => FALSE,
  p_init                     => FALSE,
  p_print                    => p_print,
  p_application_id           => p_application_id,
  p_static_id                => 'rpt',
  p_orientation              => 'L'
  );

EXCEPTION 
WHEN OTHERS THEN
  sv_sec_error.raise_unanticipated;

END print_category;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T
--------------------------------------------------------------------------------
/*******************************************************************************
                                       .
                                       .
                                       .
                                       .
 ..=..        .              .8  .. .:+=
  .,+=..    ..    .:        ..  ..,=++,.
  ..+++=. . .=,.. :+.    ..=+.O.=++++. .
   .~++++=,..++:..=+.   .=++,~8+++++.. .
    .+++++++,+++=,++:..=++++++?+++=. . .              P R I N T S
    .:+++++++++=DO~D=++++?=+++=++=..   .
..   .=++++++++~,::,7NZZ. ?N+==+=.     .                 A L L 
++=.  .++++++++~N ..  ..M.Z:+?++.      .
.=+++=,:++++++. . ,=~MMMM   M8+:   ..  .                 T H E
  :+++++++++++~8+.MMMMMMM   .O=. ..... .
....+++++++++++=. MMMMMMMD  ,~==++=. ..=            T H I N G S ! ! ! 
...+++++++++++++M ..MMMMM,  ND+++,.:++++
   .~+++++++++++=M  MMMM=M..77=+=+++++~.
M...,:++++++++I~+=~. ?MI...ZI7O+++++~. .
OO=++++++++=+++++++D. ...87777$++++..  .
.MOZ++++=M=++++++++~77777777777~++++++++
++=OM+?~++++++++++NZM7777777777D++++++++
+++=8O=+++++++++++O M77777777777++++++++
+++++MOO++++++++++++=77777777777=+++:...
++++++~OM+++++++++++=77777777777=+=... .
~+++++++OO++++++++++N77777777777++++:...
*******************************************************************************/

PROCEDURE print
  (
  p_classifications          IN VARCHAR2,
  p_statuses                 IN VARCHAR2,
  p_application_id           IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_session              IN VARCHAR2 DEFAULT v('APP_SESSION'),
  p_print                    IN BOOLEAN  DEFAULT TRUE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_workspace_id             IN NUMBER   DEFAULT nv('WORKSPACE_ID'),
  p_scoring_method           IN VARCHAR2,
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_incl_info                IN BOOLEAN  DEFAULT TRUE,
  p_incl_fix                 IN BOOLEAN  DEFAULT TRUE
  )
IS
  l_classifications          APEX_APPLICATION_GLOBAL.VC_ARR2;
  l_where                    APEX_APPLICATION_GLOBAL.VC_ARR2;
  l_where_sql                VARCHAR2(255);
  l_attribute_set_name       VARCHAR2(255);
  l_application_name         VARCHAR2(255);
  l_summary_page_id          NUMBER;
  l_page_id                  NUMBER;
BEGIN

-- Get the Attribute Set Name
SELECT attribute_set_name INTO l_attribute_set_name
  FROM sv_sec_attribute_sets WHERE attribute_set_id = p_attribute_set_id;

-- Get the Application Name
SELECT application_name INTO l_application_name
  FROM apex_applications WHERE application_id = p_application_id;

-- Decompose the classifications
l_classifications := apex_util.string_to_table(p_classifications);

-- Create the WHERE clause
l_where := apex_util.string_to_table(p_statuses);
FOR x IN 1..l_where.COUNT
LOOP
  l_where_sql := l_where_sql || '''' || l_where(x) || '''' || ',';
END LOOP;
l_where_sql := SUBSTR(l_where_sql, 1, (LENGTH(l_where_sql)-1));

-- Initialize
sv_sec_rpt_util.init
  (
  p_header                   => p_application_id || ': ' || l_application_name 
    || ' - Attribute Set: ' || l_attribute_set_name || ' - ' || p_scoring_method,
  p_orientation              => 'L',
  p_app_session              => p_app_session
  );

-- Print the Cover Page
sv_sec_rpt_util.cover_page(
  p_title      => p_application_id || ': ' || l_application_name,
  p_sub_title  => 'Attribute Set: ' || l_attribute_set_name,
  p_sub_title2 => 'Scoring Method: ' || p_scoring_method);

-- Loop thorugh each classification
FOR x IN 1..l_classifications.COUNT
LOOP

  -- Determine the summary page ID
  SELECT summary_page_id INTO l_summary_page_id FROM sv_sec_classifications WHERE classification_key = l_classifications(x);

  -- Print the Classification Summary Page
  sv_sec_rpt_class_summary.print
    (
    p_application_id     => p_application_id,
    p_sert_app_id        => p_sert_app_id,
    p_page_id            => l_summary_page_id,
    p_attribute_set_id   => p_attribute_set_id,
    p_result             => l_attribute_set_name,
    p_init               => FALSE,
    p_all                => TRUE,
    p_app_user           => p_app_user,
    p_app_session        => p_app_session
    );
 
  /*
  -- Print a single set of SQL Injection recommendations vs. one per page
  IF l_classifications(x) = 'SQL_INJECTION' THEN
  
    -- Add a new page if either the info or fix is to be printed
    IF p_incl_info = TRUE OR p_incl_fix = TRUE THEN
      plpdf.newPage;  
    END IF;

    -- Print the corresponding SQLi Info and Fix regions
    IF p_incl_info = TRUE THEN
      FOR x IN (SELECT * FROM sv_sec_help_text WHERE help_text_key = 'SQLI_DBMS_INFO')
      LOOP
        print_clob(p_title => x.display_title, p_clob => x.help_text);
      END LOOP;
    END IF;

    IF p_incl_fix = TRUE THEN
      FOR x IN (SELECT * FROM sv_sec_help_text WHERE help_text_key = 'SQLI_DBMS_FIX')
      LOOP
        print_clob(p_title => x.display_title, p_clob => x.help_text);
      END LOOP;
    END IF;

    IF p_incl_info = TRUE THEN
      FOR x IN (SELECT * FROM sv_sec_help_text WHERE help_text_key = 'SQLI_EXEC_INFO')
      LOOP
        print_clob(p_title => x.display_title, p_clob => x.help_text);
      END LOOP;
    END IF;

    IF p_incl_fix = TRUE THEN
      FOR x IN (SELECT * FROM sv_sec_help_text WHERE help_text_key = 'SQLI_EXEC_FIX')
      LOOP
        print_clob(p_title => x.display_title, p_clob => x.help_text);
      END LOOP;
    END IF;

    IF p_incl_info = TRUE THEN
      FOR x IN (SELECT * FROM sv_sec_help_text WHERE help_text_key = 'SQLI_ITEM_INFO')
      LOOP
        print_clob(p_title => x.display_title, p_clob => x.help_text);
      END LOOP;
    END IF;

    IF p_incl_fix = TRUE THEN
      FOR x IN (SELECT * FROM sv_sec_help_text WHERE help_text_key = 'SQLI_ITEM_FIX')
      LOOP
        print_clob(p_title => x.display_title, p_clob => x.help_text);
      END LOOP;
    END IF;

  
  END IF;
  */
  
  -- Loop through all categories for a classification
  FOR y IN (SELECT * FROM sv_sec_categories WHERE classification_id = 
   (SELECT classification_id FROM sv_sec_classifications WHERE classification_key = l_classifications(x))
     ORDER BY category_name)
  LOOP
  
    -- If Classification = SETTINGS, then print the category summaries
    IF l_classifications(x) = 'SETTINGS' THEN
    
      -- Get the page_id for the category
      SELECT page_id INTO l_page_id FROM apex_application_pages WHERE application_id = p_sert_app_id AND page_alias = y.display_page;
    
      sv_sec_rpt_moar.print_category
        (
        p_application_id   => p_application_id,
        p_category_id      => y.category_id,
        p_app_session      => p_app_session,
        p_attribute_set_id => p_attribute_set_id,
        p_cover_page       => FALSE,
        p_init             => FALSE,
        p_print            => FALSE,
        p_where            => l_where_sql,
        p_sert_app_id      => p_sert_app_id,
        p_page_id          => l_page_id
        );

    -- Loop thorugh all attributes associated with the category AND attribute_set
    ELSE
      FOR z IN (SELECT * FROM sv_sec_attributes WHERE category_id = y.category_id ORDER BY attribute_name)
      LOOP
  
        sv_sec_rpt_moar.print_attribute
          (
          p_page_id          => z.display_page_id,
          p_sert_app_id      => p_sert_app_id,
          p_application_id   => p_application_id,
          p_attribute_id     => z.attribute_id,
          p_app_session      => p_app_session,
          p_attribute_set_id => p_attribute_set_id,
          p_cover_page       => FALSE,
          p_init             => FALSE,
          p_print            => FALSE,
          p_where            => l_where_sql,
          p_app_user         => p_app_user,
          p_incl_info        => p_incl_info,
          p_incl_fix         => p_incl_fix
          );

      END LOOP;
    END IF; 
  END LOOP;
END LOOP;

-- Print the Report
sv_sec_rpt_util.send_pdf
  (
  p_filename                 => 'App ' || p_application_id 
    || ' - Attribute Set ' || l_attribute_set_name,
  p_toc                      => TRUE,
  p_print                    => p_print,
  p_workspace_id             => p_workspace_id,
  p_application_id           => p_application_id,
  p_attribute_set_id         => p_attribute_set_id,
  p_app_user                 => p_app_user,
  p_app_eval_id              => p_app_eval_id
  );

EXCEPTION 
WHEN OTHERS THEN
  sv_sec_error.raise_unanticipated;

END print;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_rpt_moar;
/