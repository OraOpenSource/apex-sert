create or replace
PACKAGE sv_sec_util
AS 

PROCEDURE init
  (
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION')
  );

PROCEDURE set_ctx
  (
  p_application_id           IN VARCHAR2,
  p_app_session              IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_collection_id            IN NUMBER,
  p_attribute_set_id         IN NUMBER
  );

PROCEDURE unset_ctx
  (
  p_app_session              IN NUMBER DEFAULT nv('APP_SESSION')
  );

PROCEDURE about
  (
  p_application_id           IN NUMBER
  );

FUNCTION stale_eval
  (
  p_date_from                IN DATE,
  p_date_to                  IN DATE DEFAULT NULL      
  ) 
  RETURN VARCHAR2;

PROCEDURE populate_result
  (
  p_result                   IN VARCHAR2,
  p_app_user                 IN VARCHAR2,
  p_app_session              IN VARCHAR2
  );

FUNCTION get_collection_id
  (
  p_application_id           IN NUMBER,
  p_app_user                 IN VARCHAR2,
  p_app_session              IN VARCHAR2
  )
  RETURN NUMBER;

FUNCTION get_version_disp
  (
  p_version                  IN VARCHAR2
  )
  RETURN VARCHAR2;

FUNCTION get_version
  RETURN VARCHAR2;

FUNCTION get_color
  (
  p_pct_score                IN NUMBER,
  p_possible_score           IN NUMBER,
  p_print                    IN BOOLEAN DEFAULT FALSE,
  p_app_session              IN NUMBER  DEFAULT nv('APP_SESSION')
  )
RETURN VARCHAR2;

FUNCTION get_page_attribute_id
  (
  p_page_id                  IN NUMBER
  )
RETURN VARCHAR2;

FUNCTION get_help_class
  (
  p_page_id                  IN NUMBER
  )
RETURN VARCHAR2;

PROCEDURE prepare_url
  (
  p_url                      IN VARCHAR2
  );

PROCEDURE check_gt_lt_attr_val
  (
  p_attribute_set_id           IN NUMBER, 
  p_attribute_id               IN NUMBER,
  p_value                      IN VARCHAR2,
  p_result                     IN VARCHAR2
  );

FUNCTION internal_attr
  (
  p_attribute_id             IN NUMBER DEFAULT NULL
  )
RETURN BOOLEAN;

FUNCTION internal_attr_set
  (
  p_attribute_set_id         IN NUMBER DEFAULT NULL
  )
RETURN BOOLEAN;

PROCEDURE redirect_when_stale;

PROCEDURE log_page_view;

PROCEDURE get_progress;

PROCEDURE display_summary
  (
  p_banner                   IN BOOLEAN  DEFAULT FALSE,
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_classification_key       IN VARCHAR2,
  p_print                    IN BOOLEAN  DEFAULT FALSE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN VARCHAR2 DEFAULT v('APP_ID')
  );

FUNCTION print_name
  (
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_record_score             IN BOOLEAN  DEFAULT FALSE,
  p_app_user                 IN VARCHAR2 DEFAULT v('APP_USER'),
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_scheduled_eval           IN VARCHAR2 DEFAULT 'N',
  p_evaluated_ws             IN NUMBER   DEFAULT v('G_WORKSPACE_ID')
  )
RETURN VARCHAR2;

FUNCTION display_column
  (
  p_attribute_key            IN VARCHAR2
  )
  RETURN BOOLEAN;

PROCEDURE save_apex_link
  (
  p_page_id                  IN NUMBER,
  p_link                     IN VARCHAR2,
  p_rp                       IN VARCHAR2,
  p_component_name           IN VARCHAR2,
  p_category                 IN VARCHAR2
  );

FUNCTION get_apex_session
RETURN VARCHAR2;

PROCEDURE print_apex_session;

FUNCTION get_attr_sets
  (
  p_attribute_id             IN NUMBER
  )
  RETURN VARCHAR2;

FUNCTION is_disabled
  (
  p_attribute_set_id         IN NUMBER,
  p_workspace_id             IN NUMBER DEFAULT NULL
  )
  RETURN VARCHAR2;

FUNCTION logo
  RETURN VARCHAR2;

PROCEDURE compatibility_check
  (
  p_version                  IN VARCHAR
  );

FUNCTION copyright
  RETURN VARCHAR2;

FUNCTION get_component
  (
  p_component_id             IN NUMBER   DEFAULT NULL,
  p_attribute_id             IN NUMBER   DEFAULT NULL
  )
  RETURN VARCHAR2;


FUNCTION get_column
  (
  p_column_id                IN NUMBER   DEFAULT NULL,
  p_attribute_id             IN NUMBER   DEFAULT NULL
  )
  RETURN VARCHAR2;

PROCEDURE add_attributes
  (
  p_attribute_set_id         IN NUMBER
  );
  
PROCEDURE remove_attribute
  (
  p_attribute_set_attrs_id   IN NUMBER
  );
  
PROCEDURE toggle_attr_vals
  (
  p_attribute_id             IN NUMBER,
  p_value                    IN VARCHAR2
  );  
  
FUNCTION int_attr
  (
  p_attribute_id             IN NUMBER
  )
RETURN VARCHAR2;

FUNCTION int_category
  (
  p_category_id              IN NUMBER
  )
RETURN VARCHAR2;

FUNCTION gt_lt_value
  (
  p_attribute_id             IN NUMBER,
  p_attribute_set_id         IN NUMBER
  )
RETURN BOOLEAN;

PROCEDURE copy_inline_attrs
  (
  p_copy_to                  IN NUMBER
  );

PROCEDURE copy_attr_set
  (
  p_copy_from                IN NUMBER,
  p_copy_to                  IN NUMBER
  );

PROCEDURE copy_attribute
  (
  p_attribute_id             IN NUMBER,
  p_attribute_set_id         IN NUMBER   DEFAULT NULL,
  p_attribute_sets           IN VARCHAR2 DEFAULT NULL,
  p_attribute_name           IN VARCHAR2,
  p_attribute_key            IN VARCHAR2
  );

PROCEDURE show_info
  (
  p_attribute_id             IN NUMBER
  );

PROCEDURE show_fix
  (
  p_attribute_id             IN NUMBER DEFAULT NULL,
  p_attribute_value_id       IN NUMBER DEFAULT NULL
  );
  
PROCEDURE view_source
  (
  p_id                       IN NUMBER DEFAULT NULL,
  p_component_type           IN VARCHAR2 DEFAULT NULL
  );

PROCEDURE record_eval
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN VARCHAR,
  p_app_user                 IN VARCHAR,
  p_approved_score           IN NUMBER,
  p_pending_score            IN NUMBER,
  p_raw_score                IN NUMBER,
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_app_eval_id              IN NUMBER   DEFAULT NULL,
  p_scheduled_eval           IN VARCHAR2 DEFAULT 'N',
  p_evaluated_ws             IN NUMBER   DEFAULT nv('G_WORKSPACE_ID')
  );
  
PROCEDURE apply_notations
  (
  p_collection_id            IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_app_session              IN NUMBER   DEFAULT nv('APP_SESSION'),
  p_sert_app_id              IN VARCHAR2 DEFAULT v('APP_ID')
  );  

FUNCTION notation_history_sql
  (
  p_application_id           IN NUMBER,
  p_attribute_set_id         IN NUMBER,
  p_notation_pk              IN VARCHAR2
  )
RETURN VARCHAR2;

FUNCTION get_checksum
  (
  p_value                    IN CLOB DEFAULT NULL
  )
  RETURN RAW;

PROCEDURE record_cookie
  (
  p_session_id               IN NUMBER,
  p_cookie_val               IN VARCHAR2
  );

PROCEDURE builder_auth
  (
  p_session_id               IN NUMBER
  );

FUNCTION builder_auth_fcn
  (
  p_username                 IN VARCHAR2,
  p_password                 IN VARCHAR2
  )
  RETURN BOOLEAN;
  
FUNCTION user_has_role
  (
  p_application_id           IN VARCHAR2 DEFAULT NULL,
  p_workspace_id             IN VARCHAR2,
  p_user_name                IN VARCHAR2,
  p_role_name                IN VARCHAR2
  )
  RETURN BOOLEAN;

FUNCTION user_has_role_vc
  (
  p_application_id           IN VARCHAR2 DEFAULT NULL,
  p_workspace_id             IN VARCHAR2,
  p_user_name                IN VARCHAR2,
  p_role_name                IN VARCHAR2
  )
  RETURN VARCHAR2;

FUNCTION is_account_locked
  (
  p_user_name                IN VARCHAR2
  )
RETURN VARCHAR2;

PROCEDURE purge_evals
  (
  p_eval_type                IN VARCHAR2
  );

PROCEDURE purge_events
  (
  p_event_type               IN VARCHAR2
  );

FUNCTION bc_buttons
  (
  p_button_key               IN VARCHAR2
  )
RETURN BOOLEAN;

PROCEDURE prepare_url
  (
  p_type                     IN VARCHAR2,
  p_page                     IN NUMBER   DEFAULT NULL,
  p_request                  IN VARCHAR2 DEFAULT NULL
  );

END sv_sec_util;