create or replace
PACKAGE sv_sec_scheduler
AS 

PROCEDURE run_sched_evals;

PROCEDURE run_eval
  (
  p_app_user                 IN VARCHAR2,
  p_app_session              IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_workspace_id             IN NUMBER,
  p_sert_app_id              IN NUMBER,
  p_save_pdf                 IN VARCHAR2,
  p_scoring_method           IN VARCHAR2 DEFAULT 'Raw',
  p_owner                    IN VARCHAR2,
  p_user_workspace_id        IN NUMBER
  );

PROCEDURE schedule_eval
  (
  p_application_id           IN NUMBER,
  p_scheduled_by             IN VARCHAR2,
  p_scheduled_ws             IN NUMBER,
  p_save_pdf                 IN VARCHAR2,
  p_scoring_method           IN VARCHAR2,
  p_attribute_set_id         IN NUMBER,
  p_eval_interval            IN VARCHAR2,
  p_time_of_day              IN VARCHAR2,
  p_day_of_week              IN VARCHAR2
  );

PROCEDURE schedule_group_eval
  (
  p_sched_grp_id             IN NUMBER,
  p_scheduled_by             IN VARCHAR2,
  p_scheduled_ws             IN NUMBER,
  p_eval_interval            IN VARCHAR2,
  p_time_of_day              IN VARCHAR2,
  p_day_of_week              IN VARCHAR2
  );


END sv_sec_scheduler;