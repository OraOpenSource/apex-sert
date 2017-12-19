CREATE OR REPLACE PACKAGE sv_sec_rpt_class_summary
AS 

PROCEDURE set_color
  (
  p_pct_score                IN NUMBER,
  p_possible_score           IN NUMBER
  );

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
  );

PROCEDURE print_all
  (
  p_application_id           IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_result                   IN VARCHAR2,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN VARCHAR2 DEFAULT v('APP_SESSION')
  );

END sv_sec_rpt_class_summary;
/
