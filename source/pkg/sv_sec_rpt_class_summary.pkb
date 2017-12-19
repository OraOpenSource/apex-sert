CREATE OR REPLACE PACKAGE BODY sv_sec_rpt_class_summary
AS

--------------------------------------------------------------------------------
-- FUNCTION: G E T _ C O L O R
--------------------------------------------------------------------------------
PROCEDURE set_color
  (
  p_pct_score                IN NUMBER,
  p_possible_score           IN NUMBER
  )
IS
  l_color                    VARCHAR2(100);
BEGIN

l_color := sv_sec_util.get_color(p_pct_score => p_pct_score, p_possible_score => p_possible_score, p_print => TRUE);

CASE
  WHEN l_color = 'red'    THEN pl_fpdf.SetFillColor (255,0,0);
  WHEN l_color = 'yellow' THEN pl_fpdf.SetFillColor (255,215,0);
  WHEN l_color = 'green'  THEN pl_fpdf.SetFillColor (102,204,51);
  ELSE                         pl_fpdf.SetFillColor (0,0,0);
END CASE;

END;


--------------------------------------------------------------------------------
-- PROCEDURE: E X C E P T I O N S _ R P T 
--------------------------------------------------------------------------------
PROCEDURE exceptions_rpt
  (
  p_classification_key       IN VARCHAR2,
  p_application_id           IN NUMBER,
  p_approved_flag            IN VARCHAR2,
  p_title                    IN VARCHAR2
  )
IS
  y                          NUMBER := 0;
BEGIN

sv_sec_rpt_util.set_font
  (
  p_family => 'Arial',
  p_style => 'B',
  p_size => 12
  ); 

-- Create a new page
sv_sec_rpt_util.new_page;

-- Initialize Values and Options
pl_fpdf.setXY(10,10);
pl_fpdf.SetDrawColor(0,0,0);
pl_fpdf.SetLineWidth(.2);

-- Set the font
sv_sec_rpt_util.set_font
  (
  p_family => 'Arial',
  p_style => 'B',
  p_size => 16
  ); 

-- Print the header
pl_fpdf.Cell
  (
  pw      => 75,
  ph      => 5,
  ptxt    => p_title,
  palign  => 'L',
  pborder => '0'
  ); 

    
-- Set the font
sv_sec_rpt_util.set_font
  (
  p_family => 'Arial',
  p_style => NULL,
  p_size => 9
  ); 

-- Loop through the attributes
FOR x IN 
  (
  SELECT
    a.attribute_name,
    COUNT(*) c
  FROM
    sv_sec_exceptions e,
    sv_sec_classifications cl,
    sv_sec_categories c,
    sv_sec_attributes a
  WHERE
    e.attribute_id = a.attribute_id
    AND e.approved_flag = p_approved_flag
    AND e.application_id = p_application_id
    AND a.category_id = c.category_id
    AND c.classification_id = cl.classification_id
    AND cl.classification_key = p_classification_key
  GROUP BY
    a.attribute_name
  ORDER BY c DESC
  )
LOOP

--  plpdf.setCUrrentX(80);
--  plpdf.printCell(100,10,x.attribute_name || ' (' || x.c || ' exceptions)');
--  plpdf.lineBreak(5);
  y := y + 1;

END LOOP;

IF y = 0 THEN
--  plpdf.setCUrrentX(80);
--  plpdf.printCell(100,10,'No Data Found');
--  plpdf.lineBreak(5);
NULL;
END IF;

--plpdf.lineBreak(5);

END exceptions_rpt;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T 
--------------------------------------------------------------------------------
PROCEDURE print
  (
  p_application_id           IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_page_id                  IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_result                   IN VARCHAR2,
  p_all                      IN BOOLEAN  DEFAULT FALSE,
  p_init                     IN BOOLEAN  DEFAULT TRUE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN VARCHAR2 DEFAULT v('APP_SESSION')
  )
IS
  l_application_name         VARCHAR2(1000);
  l_blob                     BLOB;
  l_sql                      CLOB;
  l_value                    VARCHAR2(32767);
  l_header                   BOOLEAN := FALSE;
  l_classification_name      sv_sec_classifications.classification_name%TYPE;
  l_classification_key       sv_sec_classifications.classification_key%TYPE;
  l_count                    NUMBER := 0;
  l_rows                     NUMBER := 10 + 1;
  l_label                    VARCHAR2(1000);
  l_x                        NUMBER;
  l_y                        NUMBER := 25;
  l_cnt                      NUMBER := 1;
  l_color                    VARCHAR2(255);
  l_sum_score                NUMBER := 0;
  l_sum_possible_score       NUMBER := 0;
BEGIN

-- Get the Application Name
SELECT application_name INTO l_application_name FROM apex_applications
  WHERE application_id = p_application_id;

-- Get the Classification Name
SELECT classification_name, classification_key 
  INTO l_classification_name, l_classification_key
  FROM sv_sec_classifications
  WHERE summary_page_id = p_page_id;

IF p_init = TRUE THEN
  -- Initialize the report
  sv_sec_rpt_util.init
    (
    p_orientation => 'L',
    p_header => 'Classification Summary - ' || p_application_id 
      || ': ' || l_classification_name || ' - ' || p_result
    );

  -- Set auto page breaks on
  pl_fpdf.setautopagebreak(true);

END IF;

IF p_all = FALSE THEN

  -- Print the Cover Page
  sv_sec_rpt_util.cover_page(
    p_title => 'Classification Summary - ' || l_classification_name,
    p_sub_title => p_application_id || ': ' || l_application_name,
    p_sub_title2 => l_classification_name || ' - ' || p_result);

END IF;

-- Create a new page
sv_sec_rpt_util.new_page;

-- Initialize Values and Options
pl_fpdf.setXY(10,10);
pl_fpdf.SetDrawColor(0,0,0);
pl_fpdf.SetLineWidth(.2);

-- Loop thorugh the SQL for the Box
FOR x IN 
(SELECT
  SUBSTR(category_name, INSTR(category_name, ':')+1) label,
  score,
  possible_score
FROM
  (
  SELECT
    category_name,
    display_page,
    SUM(possible_score) possible_score,
    SUM(score) score
  FROM
    (
    SELECT
      c.category_name,
      c.display_page,
      COUNT(*) score,
      0 possible_score
    FROM
      sv_sec_collection_data cd,
      sv_sec_categories c,
      sv_sec_classifications cl,
      sv_sec_result_temp r
    WHERE
      c.category_key = cd.category_key
      AND cd.result = r.result
      AND r.app_session = p_app_session
      AND r.app_user = p_app_user
      AND cl.classification_id = c.classification_id
      AND cl.classification_key = l_classification_key
      AND cd.collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
    GROUP BY
      c.category_name,
      c.display_page
    UNION
    SELECT
      c.category_name,
      c.display_page,
      0 score,
      COUNT(*) possible_score
    FROM
      sv_sec_collection_data cd,
      sv_sec_classifications cl,
      sv_sec_categories c
    WHERE
      c.category_key = cd.category_key
      AND cl.classification_id = c.classification_id
      AND cl.classification_key = l_classification_key
      AND cd.collection_id = SYS_CONTEXT('SV_SERT_CTX', 'COLLECTION_ID')
    GROUP BY
      c.category_name,
      c.display_page
    )
  GROUP BY
    category_name,
    display_page
  )
ORDER BY
  (score/possible_score)*100,
  label
  )
LOOP
  
  --Compute the SUMs 
  l_sum_score := l_sum_score + x.score;
  l_sum_possible_score := l_sum_possible_score + x.possible_score;

  -- Set X for Alternate columns
  IF MOD(l_cnt, 3) = 1 THEN
    l_x := 10;
  ELSIF MOD(l_cnt,3) = 2 THEN
    l_x := 100;
  ELSE
    l_x := 190;
  END IF;
  
  -- Set the coordinates
  pl_fpdf.setXY(l_x,l_y+1);

  -- Set the header font  
  sv_sec_rpt_util.set_font
    (
    p_family => 'Arial',
    p_size   => 14,
    p_style  => 'B'
    ); 

  -- Print the header
  pl_fpdf.Cell
    (
    pw      => 7,
    ph      => 5,
    ptxt    => x.label,
    palign  => 'L',
    pborder => '0'
    ); 

  -- Drop the cursor
  pl_fpdf.setXY(l_x+1,l_y+6);
  
  -- Set the detail font
  sv_sec_rpt_util.set_font
    (
    p_family => 'Arial',
    p_size   => 10,
    p_style  => NULL
    ); 

  -- Print the details
  pl_fpdf.Cell
    (
    pw      => 75,
    ph      => 5,
    ptxt    => x.score || ' out of ' || x.possible_score || ' points',
    palign  => 'L',
    pborder => '0'
    ); 

  -- Set the border
  pl_fpdf.SetDrawColor(0,0,0);
  pl_fpdf.SetFillColor (100,100,100);

  -- Set the percentage font color
  set_color(p_pct_score => (x.score/x.possible_score)*100, p_possible_score => x.possible_score);

  -- Print the main box
  pl_fpdf.rect
    (
    px => l_x,
    py => l_y,
    pw => 75,
    ph => 17
    );

  -- Print the percentage meter
  pl_fpdf.rect
    (
    px => l_x+3,
    py => l_y+12,
    pw => 50,
    ph => 3
   );

  -- Change the border color
  pl_fpdf.SetDrawColor(0,0,0);

  -- Print the percentage filler
  pl_fpdf.rect
    (
    px => l_x+3.2,
    py => l_y+12.2,
    pw => (((x.score/x.possible_score)*100)/2)-.3,
    ph => 2.6,
    pstyle => 'F'
  );

  -- Move the cursor
  pl_fpdf.setXY(l_x+55,l_y+10);
  
  -- Set the percentage font
  sv_sec_rpt_util.set_font
    (
    p_family => 'Arial',
    p_size   => 14,
    p_style  => 'B'
    ); 

  -- Print the percentage
  pl_fpdf.Cell
    (
    pw      => 10,
    ph      => 5,
    ptxt    => ROUND(((x.score /x.possible_score)*100),1) || '%',
    palign  => 'L',
    pborder => '0'
    ); 

  -- Move down after printing three cells
  IF MOD(l_cnt,3) = 0 THEN
    l_y := l_y + 20;
  END IF;

  -- Increment the counter
  l_cnt := l_cnt + 1;

END LOOP;

-- Reset position to print the title
pl_fpdf.setXY(10,10);

-- Set the font
sv_sec_rpt_util.set_font
  (
  p_family => 'Arial',
  p_size   => 18,
  p_style  => 'B'
  ); 

-- Print the header
pl_fpdf.Cell
    (
    pw      => 50,
    ph      => 5,
    ptxt    => l_classification_name,
    palign  => 'L',
    pborder => '0'
    ); 

-- Set the font and position
sv_sec_rpt_util.set_font
  (
  p_family => 'Arial',
  p_size   => 10,
  p_style  => NULL
  ); 

pl_fpdf.setXY(10,15);

-- Print the sub header
pl_fpdf.Cell
    (
    pw      => 50,
    ph      => 5,
    ptxt    => l_sum_score || ' out of ' || l_sum_possible_score || ' possible points',
    palign  => 'L',
    pborder => '0'
    ); 

-- Change the border color
pl_fpdf.SetDrawColor(0,0,0);

-- Set the color
set_color(p_pct_score => (l_sum_score/l_sum_possible_score)*100, p_possible_score => l_sum_possible_score);

-- Set the position and font
pl_fpdf.setXY(245,10);
sv_sec_rpt_util.set_font
  (
  p_family => 'Arial',
  p_size   => 16,
  p_style  => 'B'
  ); 

-- Print the percentage
pl_fpdf.SetTextColor(255,255,255);
pl_fpdf.Cell
  (
  pw      => 20,
  ph      => 10,
  ptxt    => ROUND((l_sum_score/l_sum_possible_score)*100,1)||'%',
  palign  => 'C',
  pborder => '1',
  pfill  => '1'
  ); 

/*
exceptions_rpt
  (
  p_classification_key => l_classification_key,
  p_application_id => p_application_id,
  p_approved_flag => 'P',
  p_title => 'Exceptions Awaiting Approval'
  );

exceptions_rpt
  (
  p_classification_key => l_classification_key,
  p_application_id => p_application_id,
  p_approved_flag => 'S',
  p_title => 'Stale Exceptions'
  );
*/

IF p_all = FALSE THEN

  -- Send the contents of the PDF document to l_blob and Print it
  sv_sec_rpt_util.send_pdf(p_filename => l_application_name || ' - ' || l_classification_name);

END IF;

EXCEPTION
WHEN no_data_found THEN
  raise_application_error(-20001, 'No Data Found!<br />' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
WHEN others THEN
  logger.log(sqlerrm || ' : ' ||  DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  raise_application_error(-20001, '<br />' || sqlerrm || '<br />' ||  DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END print;


--------------------------------------------------------------------------------
-- PROCEDURE: P R I N T _ A L L
--------------------------------------------------------------------------------
-- Loops through all Authorization Schemes for an Application
--------------------------------------------------------------------------------
PROCEDURE print_all
  (
  p_application_id           IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_result                   IN VARCHAR2,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN VARCHAR2 DEFAULT v('APP_SESSION')
  )
IS
  l_application_name         VARCHAR2(255);
BEGIN

-- Get the Application Name
SELECT application_name INTO l_application_name FROM apex_applications
  WHERE application_id = p_application_id;

-- Print the Cover Page
sv_sec_rpt_util.cover_page(
  p_title => 'Classification Summary',
  p_sub_title => p_application_id || ': ' || l_application_name,
  p_sub_title2 => p_result);

-- Loop through all auth schemes
FOR x IN (SELECT * FROM sv_sec_classifications ORDER BY classification_name)
LOOP

  -- Call print for each one 
  print
    (
    p_application_id           => p_application_id,
    p_sert_app_id              => p_sert_app_id,
    p_page_id                  => x.summary_page_id,
    p_attribute_set_id         => p_attribute_set_id,
    p_result                   => p_result,
    p_all                      => TRUE,
    p_init                     => FALSE,
    p_app_user                 => p_app_user,
    p_app_session              => p_app_session
    );

END LOOP;

-- Send the contents of the PDF document to l_blob and Print it
sv_sec_rpt_util.send_pdf(p_filename => l_application_name);

END print_all;


END sv_sec_rpt_class_summary;
/