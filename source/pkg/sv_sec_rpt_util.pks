CREATE OR REPLACE PACKAGE sv_sec_rpt_util
AS 

PROCEDURE init
  (
  p_header                   IN VARCHAR2 DEFAULT NULL,
  p_orientation              IN VARCHAR2 DEFAULT 'P',
  p_app_user                 IN VARCHAR2 DEFAULT v('G_WORKSPACE_ID') || '.' || v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION')
  );
  
FUNCTION convert_html
  (
  p_clob                     IN CLOB
  )
RETURN CLOB;

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
  );

PROCEDURE cover_page
  (
  p_title                    IN VARCHAR2,
  p_sub_title                IN VARCHAR2,
  p_sub_title2               IN VARCHAR2 DEFAULT NULL
  );

PROCEDURE new_page
  (
  p_orientation              IN VARCHAR2 DEFAULT 'P'
  );

PROCEDURE header;

PROCEDURE footer
  (
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_orientation              IN VARCHAR2 DEFAULT 'L',
  p_watermark                IN VARCHAR2 DEFAULT 'CONFIDENTIAL'
  );

FUNCTION clob_to_blob
  (
  p_clob IN CLOB
  )
RETURN BLOB;
  
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
  );

END sv_sec_rpt_util;
/
