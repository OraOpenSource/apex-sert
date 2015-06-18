CREATE OR REPLACE PACKAGE BODY sv_sec_help
AS

--------------------------------------------------------------------------------
-- PROCECDURE: P R I N T _ H E L P
--------------------------------------------------------------------------------
PROCEDURE print_help
  (
  p_label                    IN VARCHAR2,
  p_help_text                IN CLOB,
  p_custom_help_text         IN CLOB DEFAULT NULL
  )
IS
BEGIN

-- Needed to make bold text the same size as non-bold text
htp.prn('<style type="text/css">strong {font-size:12px;} li strong{font-size: 11px;}</style>');

-- Print the label and help
htp.prn(p_label || '^' || REPLACE(p_help_text, '#WORKSPACE_IMAGES#', 
  'wwv_flow_file_mgr.get_file?p_security_group_id='
  || APEX_CUSTOM_AUTH.GET_SECURITY_GROUP_ID || '&p_fname='));
  
-- Include custom help, if it exists
IF LENGTH(p_custom_help_text) > 0 THEN
  htp.p(('<br /><br /><b>Custom Help:</b><br />' || p_custom_help_text));
END IF;

htp.prn('</help_text>'
  || '</help>');

EXCEPTION
  WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END print_help;


--------------------------------------------------------------------------------
-- PROCECDURE: D I S P L A Y _ H E L P
--------------------------------------------------------------------------------
PROCEDURE display_help
  (
  p_component_id               IN VARCHAR2,
  p_component_type             IN VARCHAR2,
  p_page_id                    IN NUMBER DEFAULT NULL
  )
IS
  l_component_id             VARCHAR2(255) := p_component_id;
  l_static_id                VARCHAR2(255);
  l_display_title            sv_sec_help_text.display_title%TYPE;
  l_help_text                sv_sec_help_text.help_text%TYPE;
  l_custom_help_text         sv_sec_help_text.custom_help_text%TYPE;
BEGIN

IF apex_custom_auth.is_session_valid OR v('APP_PAGE_ID') = 101 THEN

  IF p_component_type = 'PAGE' THEN
    SELECT page_title INTO l_display_title FROM apex_application_pages
      WHERE application_id = v('APP_ID') and TO_CHAR(page_id) = l_component_id;
  
  ELSIF p_component_type = 'REGION' THEN
  
    -- Remove the "R" from the beginning of the component_id
    l_component_id := SUBSTR(l_component_id,2);

    SELECT static_id INTO l_static_id FROM apex_application_page_regions
      WHERE application_id = v('APP_ID') AND TO_CHAR(region_id) = l_component_id;
  
    SELECT region_name INTO l_display_title FROM apex_application_page_regions
      WHERE application_id = v('APP_ID') and TO_CHAR(region_id) = l_component_id;

    l_component_id := l_static_id;

  ELSIF p_component_type = 'ITEM' THEN
    SELECT label INTO l_display_title FROM apex_application_page_items
      WHERE application_id = v('APP_ID') and item_name = l_component_id;

  ELSIF p_component_type = 'CATEGORY' THEN
 
    SELECT category_name INTO l_display_title FROM sv_sec_categories
      WHERE category_key = l_component_id;
    
  END IF;

  -- Fetch the help for a specific component
  FOR x IN 
    (
    SELECT
      help_text,
      custom_help_text,
      display_title
    FROM 
      sv_sec_help_text ht,
      sv_sec_help_inter hi
    WHERE
      hi.help_text_id = ht.help_text_id
      AND hi.component_id = l_component_id
      AND hi.component_type = p_component_type
      AND 
      CASE 
        WHEN p_page_id IS NULL THEN 1
        WHEN p_page_id IS NOT NULL AND page_id = p_page_id THEN 1
       ELSE 0 END = 1
    )
  LOOP
    IF l_display_title IS NULL THEN
      l_display_title := x.display_title;
    END IF;
    l_help_text := x.help_text;
    l_custom_help_text := x.custom_help_text;
  END LOOP;

  -- Print the Page Help
  print_help(
    p_label            => NVL(l_display_title, 'No Help Available'),
    p_help_text        => NVL(l_help_text, 'There is no help available for this component.'),
    p_custom_help_text => l_custom_help_text);

ELSE
  htp.prn('You are not authenticated.');
END IF;

END display_help;
  

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_help;
/