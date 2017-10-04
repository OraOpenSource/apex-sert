CREATE OR REPLACE PACKAGE sv_sec_rpt_generic
AS 

FUNCTION show_print_buttons
  (
  p_page_id                  IN NUMBER,
  p_sert_app_id              IN NUMBER
  )
RETURN BOOLEAN;

PROCEDURE update_generic_cols
  (
  p_page_id                  IN NUMBER
  );

PROCEDURE update_gen_display_order
  (
  p_page_id                  IN NUMBER
  );

PROCEDURE update_gen_active_flag
  (
  p_page_id                  IN NUMBER
  );

FUNCTION get_attribute
  (
  p_attribute_id             IN NUMBER
  )
  RETURN VARCHAR2;

FUNCTION get_sql_cols
  (
  p_attribute_id             IN NUMBER,
  p_report_key               IN VARCHAR2
  )
  RETURN VARCHAR2;

FUNCTION get_sql
  (
  p_attribute_id             IN NUMBER,
  p_report_key               IN VARCHAR2,
  p_pdf                      IN BOOLEAN DEFAULT FALSE,
  p_app_page_id              IN NUMBER  DEFAULT NULL
  )
  RETURN VARCHAR2;

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
  );

END sv_sec_rpt_generic;
/