CREATE OR REPLACE PACKAGE BODY sv_sec_rpt_generic
AS

  g_rpt_header_font          VARCHAR2(255) := 'Arial';
  g_rpt_header_font_size     NUMBER        := 8;
  g_rpt_body_font_color      VARCHAR2(255) := SYS_CONTEXT('SV_SERT_RPT_UTIL_CTX','RPT_BODY_FONT_COLOR');
  g_rpt_body_font_size       NUMBER        := 8;
  g_rpt_body_font            VARCHAR2(255) := 'Arial';
  g_p_width                  NUMBER        := 180;
  g_l_width                  NUMBER        := 260;

--------------------------------------------------------------------------------
-- FUNCTION: S H O W _ C O N F I G _ B U T T O N S
--------------------------------------------------------------------------------
-- Determines whether or not to show the config and print report buttons
--------------------------------------------------------------------------------
FUNCTION show_print_buttons
  (
  p_page_id                  IN NUMBER,
  p_sert_app_id              IN NUMBER
  )
RETURN BOOLEAN
IS
BEGIN
FOR x IN (SELECT * FROM apex_application_page_regions WHERE application_id = p_sert_app_id AND page_id = p_page_id AND static_id = 'rpt')
LOOP
  -- There is a region with the static ID of "rpt"; return TRUE
  RETURN TRUE;
END LOOP;

-- No regions contain the static ID of "rpt"; return FALSE
RETURN FALSE;

END show_print_buttons;


--------------------------------------------------------------------------------
-- PROCEDURE: U P D A T E _ G E N E R I C _ C O L S
--------------------------------------------------------------------------------
-- Updates the generic report columns settings
--------------------------------------------------------------------------------
PROCEDURE update_generic_cols
  (
  p_page_id                  IN NUMBER
  )
IS
BEGIN

-- Loop through all columns
FOR x IN 1..APEX_APPLICATION.g_f01.COUNT
LOOP
  -- Row is new; insert it 
  IF apex_application.g_f01(x) < 0 THEN
  
    INSERT INTO sv_sec_rpt_generic_cols
      (
      page_id,
      static_id,
      column_alias,
      heading_label,
      column_alignment,
      heading_alignment,
      column_width,
      active_flag,
      display_order
      )
    VALUES
      (
      p_page_id,
      'rpt',
      apex_application.g_f02(x),  -- 2) column_alias
      apex_application.g_f03(x),  -- 3) report_label
      apex_application.g_f04(x),  -- 4) column_alignment
      apex_application.g_f05(x),  -- 5) heading_alignment
      apex_application.g_f06(x),  -- 6) width
      apex_application.g_f07(x),  -- 7) active_flag
      apex_application.g_f08(x)   -- 8) display_order
      );

  -- Row exists; update it
  ELSE

    UPDATE sv_sec_rpt_generic_cols SET 
      heading_label     = apex_application.g_f03(x),
      column_alignment  = apex_application.g_f04(x),
      heading_alignment = apex_application.g_f05(x),
      column_width      = apex_application.g_f06(x),
      active_flag       = apex_application.g_f07(x),
      display_order     = apex_application.g_f08(x)
    WHERE
      rpt_generic_col_id = apex_application.g_f01(x);  -- 1) rpt_generic_col_id
  
  END IF;

END LOOP;

EXCEPTION
WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END update_generic_cols;


--------------------------------------------------------------------------------
-- PROCEDURE: U P D A T E _ G E N _ D I S P L A Y _ O R D E R
--------------------------------------------------------------------------------
-- Updates the DISPLAY_ORDER column asynchronously
--------------------------------------------------------------------------------
PROCEDURE update_gen_display_order
  (
  p_page_id                  IN NUMBER
  )
IS
BEGIN

UPDATE sv_sec_rpt_generic_cols SET 
  display_order = apex_application.g_x02
WHERE
  page_id = p_page_id
  AND static_id = 'rpt'
  AND column_alias = apex_application.g_x01;

htp.prn('{ "result": "success" }');

END update_gen_display_order;


--------------------------------------------------------------------------------
-- PROCEDURE: U P D A T E _ G E N _ A C T I V E _ F L A G
--------------------------------------------------------------------------------
-- Updates the ACTIVE_FLAG column asynchronously
--------------------------------------------------------------------------------
PROCEDURE update_gen_active_flag
  (
  p_page_id                  IN NUMBER
  )
IS
BEGIN

UPDATE sv_sec_rpt_generic_cols SET 
  active_flag = apex_application.g_x01
WHERE
  page_id = p_page_id
  AND static_id = 'rpt'
  AND column_alias = apex_application.g_x02;

htp.prn('{ "result": "success" }');

END update_gen_active_flag;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ A T T R I B U T E
--------------------------------------------------------------------------------
FUNCTION get_attribute
  (
  p_attribute_id             IN NUMBER
  )
  RETURN VARCHAR2
IS
  l_attribute_name           VARCHAR2(255);
BEGIN

SELECT htf.escape_sc(attribute_name) INTO l_attribute_name FROM sv_sec_attributes WHERE attribute_id = p_attribute_id;

RETURN l_attribute_name;

EXCEPTION
WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_attribute;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ S Q L _ C O L S
--------------------------------------------------------------------------------
FUNCTION get_sql_cols
  (
  p_attribute_id             IN NUMBER,
  p_report_key               IN VARCHAR2
  )
  RETURN VARCHAR2
IS
  l_cols                     VARCHAR2(1000) := 'X:';
BEGIN

FOR x IN 
  (
  SELECT rc.label 
    FROM sv_sec_attr_rpt_cols rc, sv_sec_attr_rpt_inter ri
      WHERE rc.attr_rpt_inter_id = ri.attr_rpt_inter_id
      AND ri.attribute_id = p_attribute_id
      AND ri.report_key = p_report_key
    ORDER BY rc.seq
  )  
LOOP
  l_cols := l_cols || x.label || ':';
END LOOP;

RETURN l_cols;

EXCEPTION
WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_sql_cols;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ S Q L
--------------------------------------------------------------------------------
FUNCTION get_sql
  (
  p_attribute_id             IN NUMBER,
  p_report_key               IN VARCHAR2,
  p_pdf                      IN BOOLEAN DEFAULT FALSE,
  p_app_page_id              IN NUMBER  DEFAULT NULL
  )
  RETURN VARCHAR2
IS
  l_sql                      VARCHAR2(4000);
  l_view_name                VARCHAR2(255);
  l_search                   VARCHAR2(4000);
BEGIN

FOR x IN 
  (
  SELECT rc.column_name 
    FROM sv_sec_attr_rpt_cols rc, sv_sec_attr_rpt_inter ri
      WHERE rc.attr_rpt_inter_id = ri.attr_rpt_inter_id
      AND ri.attribute_id = p_attribute_id
      AND ri.report_key = p_report_key
    ORDER BY rc.seq
  )  
LOOP
  l_sql := l_sql || x.column_name || ',';
  l_search := l_search || x.column_name || '||';
END LOOP;
l_sql := l_sql || 'EXCEPTION,NOTATION,';
SELECT view_name INTO l_view_name 
  FROM sv_sec_attributes WHERE attribute_id = p_attribute_id;

IF p_pdf = FALSE THEN

  l_sql := 'SELECT ' || SUBSTR(l_search,1,LENGTH(l_search)-2) || ' row_search, ' 
    ||  SUBSTR(l_sql, 1, (LENGTH(l_sql)-1));

  l_sql := l_sql || ' FROM ' || l_view_name || ' WHERE UPPER(' 
    || SUBSTR(l_search,1,LENGTH(l_search)-2) || ') LIKE ''%'' || UPPER(:P951_SEARCH) || ''%'' AND result LIKE :P951_RESULT ';

ELSE

  l_sql := 'SELECT ' || SUBSTR(l_sql, 1, (LENGTH(l_sql)-1)) 
    || ' FROM ' || l_view_name;

  -- Add a WHERE clause if coming from Page 951
  IF p_app_page_id = 951 THEN
    l_sql := l_sql || ' WHERE result = :P951_RESULT ';
  END IF;
  
END IF;

RETURN l_sql;

EXCEPTION
WHEN OTHERS THEN sv_sec_error.raise_unanticipated;

END get_sql;


--------------------------------------------------------------------------------
--FUNCTION: G E T _ C O L _ O R D E R
--------------------------------------------------------------------------------
-- Gets the order of the columns used to wrap around the main query
--------------------------------------------------------------------------------
FUNCTION get_col_order
  (
  p_sert_app_id              IN NUMBER,
  p_page_id                  IN NUMBER,
  p_static_id                IN VARCHAR2
  )
RETURN VARCHAR2
IS
  l_select                   VARCHAR2(4000);
BEGIN

FOR x IN 
  (
  SELECT
    a.column_alias,
    a.display_order,
    a.column_type,
    a.format_mask
  FROM
    (
    SELECT
      pr.page_id||pr.static_id||prc.column_alias id,
      prc.column_alias,
      prc.display_order,
      prc.column_type,
      prc.format_mask
    FROM 
      APEX_APPLICATION_PAGE_IR_COL prc, 
      apex_application_page_regions pr
    WHERE
      prc.region_id = pr.region_id
      AND TRIM(pr.static_id) = p_static_id
      AND prc.application_id = p_sert_app_id
      AND prc.page_id = p_page_id
      AND prc.display_text_as != 'HIDDEN'
      AND prc.column_alias != 'EDIT'
    ) a,
    (
    SELECT
      page_id || static_id || column_alias id, 
      display_order
    FROM
      sv_sec_rpt_generic_cols
    ) b
  WHERE
    a.id = b.id(+)
  ORDER BY
    NVL(b.display_order, a.display_order)
  )
LOOP
  l_select := l_select || CASE 
    WHEN x.column_type IN ('DATE','NUMBER') AND (x.format_mask IS NOT NULL AND x.format_mask != 'SINCE') THEN 'TO_CHAR(' || x.column_alias || ',''' || x.format_mask || '''' || '),'
    ELSE x.column_alias || ',' 
    END;
END LOOP;

RETURN SUBSTR(l_select, 1, (LENGTH(l_select)-1));

END get_col_order;


--------------------------------------------------------------------------------
-- FUNCTION: G E T _ O R D E R _ B Y
--------------------------------------------------------------------------------
-- Returns the ORDER BY Clause for a generic report based on IR settings
--------------------------------------------------------------------------------
FUNCTION get_order_by
  (
  p_sert_app_id              IN NUMBER,
  p_page_id                  IN NUMBER,
  p_static_id                IN VARCHAR2,
  p_app_user                 IN VARCHAR2  
  )
RETURN VARCHAR2
IS
  l_order_by                 VARCHAR2(4000);
BEGIN

-- Get the ORDER BY clause, if one exists
FOR x IN 
  (
  SELECT 
    ir.* 
  FROM 
    APEX_APPLICATION_PAGE_IR_RPT ir, 
    apex_application_page_regions r 
  WHERE 
    ir.region_id = r.region_id 
    AND ir.application_id = p_sert_app_id 
    AND ir.page_id = p_page_id 
    AND r.static_id = p_static_id 
    AND ir.application_user = p_app_user
  )
LOOP

  l_order_by :=               CASE WHEN x.sort_column_1 != '0' THEN                                                            x.sort_column_1 || ' ' || x.sort_direction_1 END;
  l_order_by := l_order_by || CASE WHEN x.sort_column_2 != '0' THEN CASE WHEN l_order_by IS NOT NULL THEN ',' ELSE NULL END || x.sort_column_2 || ' ' || x.sort_direction_2 END;
  l_order_by := l_order_by || CASE WHEN x.sort_column_3 != '0' THEN CASE WHEN l_order_by IS NOT NULL THEN ',' ELSE NULL END || x.sort_column_3 || ' ' || x.sort_direction_3 END;
  l_order_by := l_order_by || CASE WHEN x.sort_column_4 != '0' THEN CASE WHEN l_order_by IS NOT NULL THEN ',' ELSE NULL END || x.sort_column_4 || ' ' || x.sort_direction_4 END;
  l_order_by := l_order_by || CASE WHEN x.sort_column_5 != '0' THEN CASE WHEN l_order_by IS NOT NULL THEN ',' ELSE NULL END || x.sort_column_5 || ' ' || x.sort_direction_5 END;
  l_order_by := l_order_by || CASE WHEN x.sort_column_6 != '0' THEN CASE WHEN l_order_by IS NOT NULL THEN ',' ELSE NULL END || x.sort_column_6 || ' ' || x.sort_direction_6 END;

END LOOP;

-- RETURN the ORDER BY clause, if one was found
IF l_order_by IS NOT NULL THEN
  RETURN ' ORDER BY ' || l_order_by;
ELSE
  RETURN NULL;
END IF;

END get_order_by;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T 
--------------------------------------------------------------------------------
PROCEDURE print
  (
  p_application_id           IN NUMBER   DEFAULT NULL,
  p_static_id                IN VARCHAR2 DEFAULT NULL,
  p_page_id                  IN VARCHAR2,
  p_title                    IN VARCHAR2 DEFAULT NULL,
  p_sert_app_id              IN NUMBER,
  p_order_by                 IN VARCHAR2 DEFAULT NULL,
  p_result                   IN VARCHAR2 DEFAULT NULL,
  p_app_session              IN VARCHAR2,
  p_sql                      IN VARCHAR2 DEFAULT NULL,
  p_attribute_id             IN NUMBER   DEFAULT NULL,
  p_orientation              IN VARCHAR2 DEFAULT 'P',
  p_report_key               IN VARCHAR2 DEFAULT NULL,
  p_cover_page               IN BOOLEAN  DEFAULT TRUE,
  p_init                     IN BOOLEAN  DEFAULT TRUE,
  p_print                    IN BOOLEAN  DEFAULT TRUE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER')
  )
IS
  l_application_id           NUMBER := p_application_id;
  l_application_name         VARCHAR2(1000);
  l_blob                     BLOB;
  l_sql                      CLOB;
  l_value                    VARCHAR2(32767);
  l_header                   BOOLEAN := FALSE;
  l_cursor                   INTEGER;
  l_colcount                 INTEGER;
  l_dummy                    INTEGER;
  l_columns                  dbms_sql.desc_tab2;
  l_bind                     VARCHAR2(255) DEFAULT 'x';
  l_bind_val                 VARCHAR2(4000);
  y                          NUMBER := 1;
  z                          NUMBER;
  l_region_id                NUMBER;
  l_region_name              VARCHAR2(255);
  l_row                      NUMBER := 0;
  l_fill                     VARCHAR2(10);
  n                          NUMBER := 1;
  TYPE                       arr_t IS TABLE OF VARCHAR2(4000) INDEX BY BINARY_INTEGER;
  l_col_width                arr_t;
  l_col_align                arr_t;
  l_heading_align            arr_t;
  l_heading_label            arr_t;
  l_col_value                arr_t;
  l_col_active_flag          arr_t;
  l_col_alias                arr_t;
  l_title                    VARCHAR2(1000);
  l_calc_header              BOOLEAN := FALSE;
  l_category_name            VARCHAR2(255);
  l_dummy_vc                 VARCHAR2(100);
BEGIN

-- Get the title of the page from the APEX view, if one was not provided
IF p_title IS NULL THEN
  SELECT page_name INTO l_title FROM apex_application_pages WHERE application_id = p_sert_app_id AND page_id = p_page_id;
END IF;

IF l_application_id IS NOT NULL THEN

  -- Get the Application Name
  SELECT application_name INTO l_application_name FROM apex_applications
    WHERE application_id = l_application_id;

  IF p_init = TRUE THEN
    -- Initialize the report
    sv_sec_rpt_util.init
      (
      p_header => l_title || ' - ' || l_application_id || ': ' || l_application_name 
        || CASE WHEN p_result IS NOT NULL THEN ' - ' || p_result END,
      p_orientation => p_orientation
      );
  END IF;
  
  IF p_cover_page = TRUE THEN
    -- Print the Cover Page
    sv_sec_rpt_util.cover_page
      (
      p_title => l_title,
      p_sub_title => l_application_id || ': ' || l_application_name,
      p_sub_title2 => CASE WHEN p_result = '%' THEN NULL ELSE p_result END)
      ;
  END IF;
  
ELSE

  IF p_init = TRUE THEN
    -- Initialize the report
    sv_sec_rpt_util.init
      (
      p_header => l_title 
        || CASE WHEN p_result IS NOT NULL THEN ' - ' || p_result END,
      p_orientation => p_orientation
      );
  END IF;
  
  IF p_cover_page = TRUE THEN
    -- Print the Cover Page
    sv_sec_rpt_util.cover_page
      (
      p_title => l_title,
      p_sub_title => p_result
      );
  END IF;
  
END IF;

IF p_init = TRUE THEN
  -- Create a new page
  sv_sec_rpt_util.new_page(p_orientation => p_orientation);
END IF;

logger.log('page_id:' || p_page_id);

-- Either get the SQL from a report or use the SQL passed to the procedure
IF p_sql IS NULL THEN
  SELECT region_source, region_id, region_name INTO l_sql, l_region_id, l_region_name FROM apex_application_page_regions 
    WHERE application_id = p_sert_app_id 
    AND static_id = 'rpt'
    AND page_id = p_page_id;
  l_sql := l_sql || ' ' || p_order_by;
ELSE
    l_sql := p_sql || p_order_by;
END IF;

-- Get a more detailed header if it is SQLi
FOR x IN 
  (
  SELECT 
    a.attribute_name
  FROM 
    sv_sec_attributes a, sv_sec_categories c, sv_sec_classifications cl 
  WHERE 
    a.attribute_id = p_attribute_id 
    AND a.category_id = c.category_id 
    AND c.classification_id = cl.classification_id 
    AND cl.classification_key = 'SQL_INJECTION'
  )
LOOP
  l_region_name := x.attribute_name;
END LOOP;

-- Get the proper order of the columns and use append them to the query
l_sql := 
  'SELECT ' 
  || get_col_order
    (  
    p_sert_app_id => p_sert_app_id,
    p_page_id     => p_page_id,
    p_static_id   => 'rpt'
    ) 
  || ' FROM (' || l_sql || ')';

-- Get the ORDER BY clause from the IR
l_sql := l_sql || get_order_by
  (
  p_sert_app_id => p_sert_app_id,
  p_page_id     => p_page_id,
  p_static_id   => 'rpt',
  p_app_user    => p_app_user
  );

-- Open the cursor
l_cursor := dbms_sql.open_cursor;

-- Parse the SQL statement
dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);
 
-- Bind in the variables
WHILE l_bind IS NOT NULL
LOOP
  l_bind := REPLACE(REPLACE(REPLACE(REGEXP_SUBSTR (l_sql, ':[^ ]*', 1, y),CHR(10),NULL),CHR(13),NULL),' ', NULL);
  l_bind_val := v(SUBSTR(l_bind,2));
  IF l_bind IS NOT NULL THEN
    BEGIN
      dbms_sql.bind_variable(l_cursor, l_bind, l_bind_val); 
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
  END IF; 
  y := y + 1;  
END LOOP;
    
-- Describe the resulting columns
dbms_sql.describe_columns2(l_cursor, l_colcount, l_columns);

-- Execute the cursor & loop through all of the records
l_dummy := dbms_sql.execute(l_cursor);

FOR y IN l_columns.FIRST .. l_columns.LAST
LOOP
  dbms_sql.define_column(l_cursor, y, l_value, 10000);
END LOOP;

-- Set the color for alternating rows
pl_fpdf.SetFillColor(230,230,230);

-- Print the report header
sv_sec_rpt_util.set_font
  (
      p_family => g_rpt_header_font,
      p_size   => 14,
      p_style  => 'B'
      ); 
      
    pl_fpdf.setXY(10,10);

    pl_fpdf.Cell
      ( 
      pw => 100,
      ph => 20,
      ptxt => NVL(l_region_name, l_title || CASE WHEN p_result IS NOT NULL THEN ' - ' || p_result ELSE NULL END),
      palign => 'L',
      pborder => '0'
      ); 

-- Determine the value and generate the row
WHILE (dbms_sql.fetch_rows(l_cursor) > 0)
LOOP
  
  -- Set the fill background, alternating rows  
  l_fill := CASE WHEN mod(l_row,2) =1 then '1' else '0' END;
  
  z := 1;
    
  IF l_header = FALSE THEN
      
    -- Set Header Font
    sv_sec_rpt_util.set_font
      (
      p_family => g_rpt_header_font,
      p_size   => g_rpt_header_font_size,
      p_style  => 'B'
      );

    -- Print the Dashboard Region
    l_dummy_vc := sv_sec.dashboard
      (
      p_attribute_set_id         => nv('P0_ATTRIBUTE_SET_ID'),
      p_application_id           => l_application_id,
      p_app_user                 => p_app_user,
      p_app_session              => p_app_session,
      p_page_id                  => p_page_id,
      p_format                   => 'PDF'
      );

    -- Set Header Font
    sv_sec_rpt_util.set_font
      (
      p_family => g_rpt_header_font,
      p_size   => g_rpt_header_font_size,
      p_style  => 'B'
      );

    IF l_calc_header = FALSE THEN
      FOR y IN
       (    
       SELECT
         a.column_alias,
         NVL(b.report_label, a.report_label) heading,
         NVL(b.column_alignment, a.column_alignment) column_alignment,
         NVL(b.heading_alignment, a.heading_alignment) heading_alignment,
         NVL(b.width, 20) print_column_width,
         NVL(b.active_flag, 'Y') active_flag
      FROM
        (
        SELECT
          pr.page_id||pr.static_id||prc.column_alias id,
          prc.column_alias,
          SUBSTR(prc.column_alignment,1,1) column_alignment,
          SUBSTR(prc.heading_alignment,1,1) heading_alignment,
          prc.report_label,
          prc.display_order,
          pr.static_id
        FROM 
          APEX_APPLICATION_PAGE_IR_COL prc, 
          apex_application_page_regions pr
        WHERE
          prc.region_id = pr.region_id
          AND TRIM(pr.static_id) = 'rpt'
          AND prc.application_id = p_sert_app_id
          AND prc.page_id = p_page_id
          AND prc.display_text_as != 'HIDDEN'
          AND prc.column_alias != 'EDIT'
        ) a,
        (
        SELECT
          rpt_generic_col_id,
          page_id || static_id || column_alias id, 
          column_width width, 
          heading_label report_label, 
          heading_alignment, 
          column_alignment,
          display_order,
          active_flag
        FROM
          sv_sec_rpt_generic_cols
        ) b
      WHERE
        a.id = b.id(+)
      ORDER BY
         NVL(b.display_order, a.display_order)
         )
      LOOP     
        l_col_alias(n) := y.column_alias;
        l_heading_label(n) := y.heading;
        l_heading_align(n) := y.heading_alignment;
        l_col_width(n) := y.print_column_width;
        l_col_align(n) := y.column_alignment; 
        l_col_active_flag(n) := y.active_flag;
        n := n + 1;
      END LOOP;

    l_calc_header := TRUE;

    END IF;

    -- Move cursor down
    pl_fpdf.setXY(10,30);
    
    -- Reset the border
    pl_fpdf.setLineWidth(.25);
    pl_fpdf.setDrawColor(0,0,0);

    -- Loop through the row and print it
    FOR y IN 1..l_heading_label.COUNT
    LOOP

      -- Check to ensure that the ACTIVE_FLAG is set to Y
      IF l_col_active_flag(y) = 'Y' THEN

        pl_fpdf.Cell
          ( 
          pw => l_col_width(y),
          ph => 5,
          ptxt => l_heading_label(y),
          palign => SUBSTR(l_heading_align(y),1,1),
          pborder => 'B'
         ); 

      END IF;
    END LOOP;

    -- Leave space for the header
    pl_fpdf.setXY(10,35);
  
    -- Set the header flag to TRUE so that it is not re-printed
    l_header := TRUE;

  END IF;
    
  -- Set the body font color
  sv_sec_rpt_util.set_font
    (
    p_family => g_rpt_body_font,
    p_size   => g_rpt_body_font_size,
    p_r      => TO_NUMBER(SUBSTR(g_rpt_body_font_color,2,2),'XXX'),
    p_g      => TO_NUMBER(SUBSTR(g_rpt_body_font_color,4,2),'XXX'),
    p_b      => TO_NUMBER(SUBSTR(g_rpt_body_font_color,6,2),'XXX')
    ); 

  -- Loop through all of the columns and render the core of the report
  FOR x IN 1..l_col_active_flag.COUNT
  LOOP
    
    -- Parse through each row
    dbms_sql.column_value(l_cursor, x, l_value);
    
    IF l_col_active_flag(x) = 'Y' THEN
      -- Print the cell
      pl_fpdf.Cell
        ( 
        pw      => NVL(l_col_width(x),25),
        ph      => 5,
        ptxt    => l_value,
        palign  => SUBSTR(l_col_align(x),1,1),
        pborder => '0',
        pfill   => l_fill
        ); 
    END IF;
 
  END LOOP;

  -- Increment the row counter
  l_row := l_row + 1;
  
  -- Increment the row position
  pl_fpdf.setXY(x => 10, y => pl_fpdf.gety+5);

  -- Create a new page, if needed
  IF pl_fpdf.gety > 190 THEN

    -- Create a new page
    pl_fpdf.AddPage(); 
    
    -- Reset the Header flag
    l_header := FALSE;

  END IF;

END LOOP;

-- Print the row count or No Data Found message
pl_fpdf.setY(pl_fpdf.getY+5);

CASE WHEN l_row > 0 THEN
  pl_fpdf.Cell
    ( 
    pw => CASE WHEN p_orientation = 'P' THEN g_p_width ELSE g_l_width END,
    ph => 5,
    ptxt => CASE 
      WHEN l_row = 1 THEN '1 Row Printed' 
      ELSE l_row || ' Rows Printed' END,
    palign => 'R'
    ); 
ELSE

  pl_fpdf.setXY(10,100);
  pl_fpdf.Cell
    ( 
    pw => CASE WHEN p_orientation = 'P' THEN g_p_width ELSE g_l_width END,
    ph => 5,
    ptxt => 'There is no data for this report that matches your criteria',
    palign => 'C'
    ); 

END CASE;

-- Close the cursor
dbms_sql.close_cursor(l_cursor);

-- Send the contents of the PDF document to l_blob and Print it
IF p_print = TRUE THEN
  sv_sec_rpt_util.send_pdf
    (
    p_filename => 'App ' || l_application_id || ' - '
      || l_title || ' - ' || TO_CHAR(SYSDATE,'DD-MON-YYYY HH.MIPM')
    );
END IF;

EXCEPTION
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END print;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_rpt_generic;
/