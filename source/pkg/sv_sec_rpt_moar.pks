CREATE OR REPLACE PACKAGE sv_sec_rpt_moar
AS 

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
  );

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
  );

PROCEDURE print
  (
  p_classifications          IN VARCHAR2,
  p_statuses                 IN VARCHAR2,
  p_application_id           IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_session              IN VARCHAR2 DEFAULT v('APP_SESSION'),
  p_print                    IN BOOLEAN DEFAULT TRUE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_workspace_id             IN NUMBER   DEFAULT nv('WORKSPACE_ID'),
  p_scoring_method           IN VARCHAR2,
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_incl_info                IN BOOLEAN  DEFAULT TRUE,
  p_incl_fix                 IN BOOLEAN  DEFAULT TRUE
);

END sv_sec_rpt_moar;
/
