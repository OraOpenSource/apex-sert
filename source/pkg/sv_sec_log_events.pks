CREATE OR REPLACE
PACKAGE sv_sec_log_events
AS
PROCEDURE LOG_EXCEPTION_EVENT
  (
    p_event_key              IN VARCHAR2 DEFAULT NULL,
    p_number_affected        IN NUMBER   DEFAULT 1,
    p_application_id         IN NUMBER   DEFAULT NULL,
    p_attribute_id           IN NUMBER   DEFAULT NULL,
    p_page_id                IN NUMBER   DEFAULT nv('G_APP_PAGE_ID'),
    p_component_id           IN VARCHAR2 DEFAULT NULL,
    p_column_id              IN NUMBER   DEFAULT NULL,
    p_message                IN VARCHAR2 DEFAULT NULL,
    p_sert_app_id            IN NUMBER   DEFAULT nv('APP_ID'),
    p_app_user               IN VARCHAR2 DEFAULT v('APP_USER'),
    p_app_session            IN NUMBER   DEFAULT nv('APP_SESSION'),
    p_attribute_set_id       IN NUMBER,
    p_user_workspace_id      IN NUMBER   DEFAULT nv('G_WORKSPACE_ID'),
    p_justification          IN VARCHAR2 DEFAULT NULL,
    p_exception_id           IN NUMBER   DEFAULT NULL
  );
END SV_SEC_LOG_EVENTS;