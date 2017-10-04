CREATE OR REPLACE PACKAGE BODY sv_sec_rpt_util
AS 

--------------------------------------------------------------------------------
-- PROCEDURE: I N I T
--------------------------------------------------------------------------------
PROCEDURE init
  (
  p_header                   IN VARCHAR2 DEFAULT NULL,
  p_orientation              IN VARCHAR2 DEFAULT 'P',
  p_app_user                 IN VARCHAR2 DEFAULT v('G_WORKSPACE_ID') || '.' || v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION')
  )
IS
BEGIN

/*
-- Set all of the report preferences
*/

-- Initialize the first page
pl_fpdf.FPDF
  (
  orientation => p_orientation,
  unit        => 'mm',
  format      => 'Letter'
  );
pl_fpdf.openpdf;
pl_fpdf.setdisplaymode ('fullpage', 'two');
pl_fpdf.setautopagebreak(true);
pl_fpdf.setXY(10,10);

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END init;


--------------------------------------------------------------------------------
-- FUNCTION: C O N V E R T _ H T M L 
--------------------------------------------------------------------------------
-- Converts an HTML region to a PLPDF-friendly format
--------------------------------------------------------------------------------
FUNCTION convert_html
  (
  p_clob                     IN CLOB
  )
RETURN CLOB
IS
  l_clob                     CLOB := p_clob;
BEGIN

-- Replace encoded characters
l_clob := REPLACE(l_clob, '&#39;', '''');
l_clob := REPLACE(l_clob, '&quot;', '"');
l_clob := REPLACE(l_clob, '&nbsp;', ' ');
l_clob := REPLACE(l_clob, '&amp;', '&');
l_clob := REPLACE(l_clob, '&lt;', '<');
l_clob := REPLACE(l_clob, '&gt;', '>');

-- Strip out all other HMTL tags
l_clob := REPLACE(l_clob, '<u>', NULL);
l_clob := REPLACE(l_clob, '</u>', NULL);
l_clob := REPLACE(l_clob, '<p>', NULL);
l_clob := REPLACE(l_clob, '</p>', NULL);
l_clob := REPLACE(l_clob, '<strong>', NULL);
l_clob := REPLACE(l_clob, '</strong>', NULL);
l_clob := REPLACE(l_clob, '<em>', NULL);
l_clob := REPLACE(l_clob, '</em>', NULL);
l_clob := REPLACE(l_clob, '<br />', NULL);
l_clob := REPLACE(l_clob, '<span style="text-decoration: underline;">', NULL);
l_clob := REPLACE(l_clob, '<br />', NULL);
l_clob := REPLACE(l_clob, '<pre style="margin-left: 40px;">', NULL);
l_clob := REPLACE(l_clob, '</pre>', NULL);
l_clob := REPLACE(l_clob, '</span>', NULL);

-- Needed for PLPDF to interpret line breaks properly
l_clob := REPLACE(l_clob, CHR(13), NULL);
l_clob := REPLACE(l_clob, CHR(10), CHR(13));

-- Return the converted CLOB
RETURN l_clob;

END convert_html;


--------------------------------------------------------------------------------
-- PROCEDURE: S E T _ F O N T
--------------------------------------------------------------------------------
-- Sets both the font and font color in one API call
--------------------------------------------------------------------------------
PROCEDURE set_font
  (
  p_family                   IN VARCHAR2 DEFAULT 'Arial',
  p_size                     IN NUMBER   DEFAULT 10,
  p_style                    IN VARCHAR2 DEFAULT NULL,
  p_r                        IN NUMBER   DEFAULT 0,
  p_g                        IN NUMBER   DEFAULT 0,
  p_b                        IN NUMBER   DEFAULT 0,
  p_r_bkg                    IN NUMBER   DEFAULT 255,
  p_g_bkg                    IN NUMBER   DEFAULT 255,
  p_b_bkg                    IN NUMBER   DEFAULT 255
  )
IS
BEGIN

pl_fpdf.SetFont
  (
  pfamily => p_family,
  pstyle => p_style,
  psize => p_size
  );

pl_fpdf.SetTextColor
  (
  r => p_r, 
  g => p_g, 
  b => p_b
  );

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END set_font;


--------------------------------------------------------------------------------
-- PROCEDURE: C O V E R _ P A G E
--------------------------------------------------------------------------------
PROCEDURE cover_page
  (
  p_title                    IN VARCHAR2,
  p_sub_title                IN VARCHAR2,
  p_sub_title2               IN VARCHAR2 DEFAULT NULL
  )
IS
  l_template_id              NUMBER;
  l_template_pdf             BLOB;
  l_count                    NUMBER;
   img varchar2(2000);

BEGIN

-- Initialize the first page
pl_fpdf.AddPage();

set_font
  (
  p_family => 'Arial',
  p_style => '',
  p_size => 30
  ); 

pl_fpdf.setXY(10,30);

pl_fpdf.Cell
  (
  pw => 260,
  ph => 20,
  ptxt => p_title,
  palign => 'L',
  pborder => '0'
  ); 

set_font
  (
  p_family => 'Arial',
  p_style => 'I',
  p_size => 14
  ); 

pl_fpdf.setLineWidth(4);
pl_fpdf.setDrawColor(218, 161, 88);
pl_fpdf.Line
  (
  x1 => 10,
  y1 => 50,
  x2 => 270,
  y2 => 50
  );

pl_fpdf.setXY(10,50);

pl_fpdf.Cell
  (
  pw => 260,
  ph => 20,
  ptxt => 'Created on ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH:MI PM'),
  palign => 'L',
  pborder => '0'
  ); 

set_font
  (
  p_family => 'Arial',
  p_style => 'B',
  p_size => 12
  ); 

pl_fpdf.setXY(10,190);

pl_fpdf.Cell
  (
  pw => 260,
  ph => 20,
  ptxt => 'Powered by APEX-SERT',
  palign => 'R',
  pborder => '0'
  ); 

pl_fpdf.setXY(10,10);

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END cover_page;


--------------------------------------------------------------------------------
-- PROCEDURE: N E W _ P A G E
--------------------------------------------------------------------------------
PROCEDURE new_page
  (
  p_orientation              IN VARCHAR2 DEFAULT 'P'
  )
IS
BEGIN

-- Set the Header Procedure
pl_fpdf.setHeaderProc('sv_sec_rpt_util.header');

-- Set the Footer Procedure
pl_fpdf.setHeaderProc('sv_sec_rpt_util.footer');

-- Create a new page
pl_fpdf.AddPage();

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END new_page;


--------------------------------------------------------------------------------
-- PROCEDURE: H E A D E R
--------------------------------------------------------------------------------
PROCEDURE header
IS
BEGIN

set_font
  (
  p_family => 'Arial',
  p_style => NULL,
  p_size => 8
  ); 

pl_fpdf.setXY(10,10);

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END header;


--------------------------------------------------------------------------------
-- PROCEDURE: F O O T E R 
--------------------------------------------------------------------------------
PROCEDURE footer
  (
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_orientation              IN VARCHAR2 DEFAULT 'L',
  p_watermark                IN VARCHAR2 DEFAULT 'CONFIDENTIAL'
  )
IS
  l_y_date                   NUMBER;
  l_y_pageno                 NUMBER;
BEGIN

IF p_orientation = 'L' THEN
  l_y_date := 200;
  l_y_pageno := 60;
ELSE
  l_y_date := 200;
  l_y_pageno := 60;
END IF;

set_font
  (
  p_family => 'Arial',
  p_style => NULL,
  p_size => 9
  ); 

pl_fpdf.setLineWidth(.25);
pl_fpdf.setDrawColor(0,0,0);

pl_fpdf.Line
  (
  x1 => 10,
  y1 => 200,
  x2 => 270,
  y2 => 200
  );
    
pl_fpdf.setXY(10,l_y_date);

pl_fpdf.Cell
  ( 
  pw => l_y_date,
  ph => 10,
  ptxt => 'Printed on ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH:MI PM') 
    || CASE WHEN p_app_user IS NULL THEN NULL ELSE ' by ' || p_app_user END,
  palign => 'L'
  ); 

pl_fpdf.Cell
  ( 
  pw => l_y_pageno,
  ph => 10,
  ptxt => 'Page ' || pl_fpdf.pageNo,
  palign => 'R'
  ); 

pl_fpdf.setXY(10,l_y_date);
  
set_font
  (
  p_family => 'Arial',
  p_style => 'BI',
  p_size => 12
  ); 

pl_fpdf.Cell
  ( 
  pw => l_y_date + l_y_pageno,
  ph => 10,
  ptxt => p_watermark,
  palign => 'C'
  ); 

pl_fpdf.setXY(10,10);

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END footer;


--------------------------------------------------------------------------------
-- FUNCTION: C L O B _ T O _ B L O B 
--------------------------------------------------------------------------------
FUNCTION clob_to_blob(p_clob IN CLOB)
  RETURN BLOB
IS
  pos                        PLS_INTEGER := 1;
  buffer                     RAW(32767);
  l_blob                     BLOB;
  l_clob_length              PLS_INTEGER := DBMS_LOB.getLength(p_clob);
BEGIN
DBMS_LOB.createTemporary(l_blob, true);
DBMS_LOB.open(l_blob, DBMS_LOB.LOB_ReadWrite);
LOOP
  buffer := UTL_RAW.cast_to_raw( DBMS_LOB.SUBSTR( p_clob, 16000, pos ) );
  IF UTL_RAW.LENGTH( buffer ) > 0 THEN
    DBMS_LOB.writeAppend( l_blob, UTL_RAW.LENGTH( buffer ), buffer );
  END IF;
  pos := pos + 16000;
  EXIT WHEN pos > l_clob_length;
END LOOP;
RETURN l_blob;

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END clob_to_blob;


--------------------------------------------------------------------------------
-- PROCEDURE: S E N D _ P D F
--------------------------------------------------------------------------------
PROCEDURE send_pdf
  (
  p_filename                 IN VARCHAR2,
  p_toc                      IN BOOLEAN  DEFAULT FALSE,
  p_print                    IN BOOLEAN  DEFAULT TRUE,
  p_workspace_id             IN NUMBER   DEFAULT nv('WORKSPACE_ID'),
  p_application_id           IN NUMBER   DEFAULT nv('APP_ID'),
  p_attribute_set_id         IN NUMBER   DEFAULT -1,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_eval_id              IN NUMBER   DEFAULT NULL
  )
IS
  l_blob                     BLOB;
  l_mime_type                VARCHAR2(255)  := 'application/pdf';
  l_filename                 VARCHAR2(1000) := p_filename || '.pdf';
BEGIN

-- Print the table of content, if requested
IF p_toc = TRUE THEN
  NULL;
    /*
    plpdf.AddTOC(
      p_item_height       => 7,
      p_title_font_family => 'Arial',
      p_title_font_style  => 'BU',
      p_title_font_size   => 14,
      p_title_height      => 15,
      p_title_text        => 'Table of Contents',
      p_title_body_gap    => 5,
      p_item_font_size    => 9,
      p_separator         => '.',
      p_move_to           => 2,
      p_level_indent      => 10
      );
    */
END IF;

-- Send the contents of the PDF document to l_blob and Print it
IF p_print = TRUE THEN

  pl_fpdf.Output
    (
    pname => l_filename,
    pdest => 'I'
    );
  apex_application.g_unrecoverable_error := TRUE;

ELSE

  INSERT INTO SV_SEC_SCHEDULED_RESULTS
    (
    WORKSPACE_ID,
    APPLICATION_ID,
    ATTRIBUTE_SET_ID,
    FILE_NAME,
    MIME_TYPE,
    FILE_CONTENTS,
    CREATED_BY,
    APP_EVAL_ID
  )
  VALUES
  (
    p_workspace_id,
    p_application_id,
    p_attribute_set_id,
    l_filename,
    l_mime_type,
    l_blob,
    p_app_user,
    p_app_eval_id
  );

END IF;

EXCEPTION 
WHEN others THEN
  sv_sec_error.raise_unanticipated;

END send_pdf;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END sv_sec_rpt_util;
/
