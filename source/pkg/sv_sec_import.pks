CREATE OR REPLACE PACKAGE sv_sec_import
AS 

PROCEDURE classification
  (
  p_classification_name      IN VARCHAR2,
  p_classification_key       IN VARCHAR2,
  p_summary_page_id          IN NUMBER,
  p_seq                      IN NUMBER
  );

PROCEDURE component_signature
  (
  p_component_sig_key        IN VARCHAR2,
  p_component_sig            IN CLOB
  );

PROCEDURE category
  (
  p_category_name            IN VARCHAR2,
  p_category_short_name      IN VARCHAR2,
  p_category_key             IN VARCHAR2,
  p_classification_key       IN VARCHAR2,
  p_category_link            IN VARCHAR2,
  p_display_page             IN VARCHAR2,
  p_internal_flag            IN VARCHAR2,
  p_rpt_attribute_key        IN VARCHAR2 DEFAULT NULL
  );

PROCEDURE attribute_set
  (
  p_attribute_set_key        IN VARCHAR2,
  p_attribute_set_name       IN VARCHAR2,
  p_active_flag              IN VARCHAR2,
  p_description              IN VARCHAR2 DEFAULT NULL,
  p_public_flag              IN VARCHAR2,
  p_workspace_id             IN NUMBER
  );

PROCEDURE attribute
  (
  p_category_key             IN VARCHAR2,
  p_attribute_name           IN VARCHAR2,
  p_attribute_key            IN VARCHAR2,
  p_active_flag              IN VARCHAR2 DEFAULT 'Y',
  p_rule_type                IN VARCHAR2,
  p_rule_source              IN VARCHAR2,
  p_table_name               IN VARCHAR2 DEFAULT NULL,
  p_column_name              IN VARCHAR2 DEFAULT NULL,
  p_view_name                IN VARCHAR2 DEFAULT NULL,  
  p_component_table          IN VARCHAR2 DEFAULT NULL,
  p_component_column_id      IN VARCHAR2 DEFAULT NULL,
  p_component_column_display IN VARCHAR2 DEFAULT NULL,
  p_column_table             IN VARCHAR2 DEFAULT NULL,
  p_column_column_id         IN VARCHAR2 DEFAULT NULL,
  p_column_column_display    IN VARCHAR2 DEFAULT NULL,
  p_collection_name          IN VARCHAR2 DEFAULT NULL,
  p_when_not_found           IN VARCHAR2 DEFAULT NULL,
  p_internal_flag            IN VARCHAR2,
  p_seq                      IN NUMBER   DEFAULT 99,
  p_help_page                IN VARCHAR2 DEFAULT NULL,
  p_rule_plsql               IN CLOB     DEFAULT NULL,
  p_info                     IN CLOB     DEFAULT NULL,
  p_fix                      IN CLOB     DEFAULT NULL,
  p_info_pdf                 IN CLOB     DEFAULT NULL,
  p_fix_pdf                  IN CLOB     DEFAULT NULL,  
  p_impact                   IN VARCHAR  DEFAULT NULL,
  p_display_page_id          IN NUMBER   DEFAULT NULL,
  p_summary_page_id          IN NUMBER   DEFAULT NULL,
  p_col_template_key         IN VARCHAR2 DEFAULT NULL,
  p_component_sig_key        IN VARCHAR2 DEFAULT NULL
  );

PROCEDURE attribute_value
  (
  p_attribute_key            IN VARCHAR2,
  p_attribute_set_key        IN VARCHAR2,
  p_value                    IN VARCHAR2,
  p_result                   IN VARCHAR2,
  p_active_flag              IN VARCHAR2
  );

PROCEDURE help_text
  (
  p_help_text_key            IN VARCHAR2,
  p_display_title            IN VARCHAR2,
  p_help_summary             IN VARCHAR2,
  p_help_text                IN CLOB DEFAULT NULL,
  p_custom_help_text         IN CLOB DEFAULT NULL
  );
  
PROCEDURE help_text_inter
  (
  p_component_id             IN VARCHAR2,
  p_component_type           IN VARCHAR2,
  p_help_text_key            IN VARCHAR2,
  p_page_id                  IN NUMBER DEFAULT NULL
  );

PROCEDURE attr_set_mapping
  (
  p_attribute_set_key        IN VARCHAR2,
  p_attribute_key            IN VARCHAR2,
  p_time_to_fix              IN NUMBER,
  p_severity_level           IN NUMBER,
  p_active_flag              IN VARCHAR2 DEFAULT 'Y'
  );

PROCEDURE score_collection
  (
  p_collection_name          IN VARCHAR2,
  p_collection_key           IN VARCHAR2,
  p_category_key             IN VARCHAR2,
  p_collection_sql           IN VARCHAR2,
  p_internal_flag            IN VARCHAR2,
  p_apex_version             IN VARCHAR2
  );

PROCEDURE event_type
  (
  p_event_type_key           IN VARCHAR2,
  p_event_name               IN VARCHAR2,
  p_event_description        IN VARCHAR2,
  p_event_message            IN VARCHAR2
  );

PROCEDURE col_template
  (
  p_table_name               IN VARCHAR2,
  p_col_template_name        IN VARCHAR2,
  p_col_template_key         IN VARCHAR2,
  p_internal_flag            IN VARCHAR2,
  p_apex_version             IN VARCHAR2,
  p_col_template             IN VARCHAR2
  );

PROCEDURE attr_rpt_inter
  (
  p_attribute_key            IN VARCHAR2,
  p_report_key               IN VARCHAR2
  );

PROCEDURE attr_rpt_cols
  (
  p_attribute_key            IN VARCHAR2,
  p_report_key               IN VARCHAR2,
  p_column_name              IN VARCHAR2,
  p_label                    IN VARCHAR2,
  p_seq                      IN NUMBER,
  p_format_mask              IN VARCHAR2 DEFAULT NULL,
  p_width                    IN NUMBER,
  p_alignment                IN VARCHAR2
  );
  
PROCEDURE create_exception(
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_key            IN VARCHAR2,
  p_page_id                  IN NUMBER   DEFAULT NULL,
  p_component_table          IN VARCHAR2 DEFAULT NULL,
  p_component_column_id      IN VARCHAR2 DEFAULT NULL,
  p_column_key               IN VARCHAR2 DEFAULT NULL,
  p_column_rpt_type          IN VARCHAR2 DEFAULT NULL,
  p_approved_flag            IN VARCHAR2 DEFAULT NULL,
  p_created_by               IN VARCHAR2 DEFAULT NULL,
  p_approved_by              IN VARCHAR2 DEFAULT NULL,
  p_rejected_by              IN VARCHAR2 DEFAULT NULL,
  p_checksum                 IN VARCHAR2,
  p_created_on               IN VARCHAR2 DEFAULT NULL,
  p_approved_on              IN VARCHAR2 DEFAULT NULL,
  p_rejected_on              IN VARCHAR2 DEFAULT NULL,
  p_justification            IN CLOB DEFAULT NULL,
  p_rejection                IN CLOB DEFAULT NULL,
  p_rejected_justification   IN CLOB DEFAULT NULL,
  p_val                      IN CLOB DEFAULT NULL,
  p_component_sig            IN CLOB DEFAULT NULL,
  p_component_sig_sql        IN CLOB DEFAULT NULL
 );

PROCEDURE create_notation
  (
  p_attribute_set_id         IN NUMBER,
  p_application_id           IN NUMBER,
  p_attribute_key            IN VARCHAR2,
  p_page_id                  IN NUMBER   DEFAULT NULL,
  p_component_table          IN VARCHAR2 DEFAULT NULL,
  p_component_column_id      IN VARCHAR2 DEFAULT NULL,
  p_column_key               IN VARCHAR2 DEFAULT NULL,
  p_column_rpt_type          IN VARCHAR2 DEFAULT NULL,
  p_created_by               IN VARCHAR2 DEFAULT NULL,
  p_created_on               IN VARCHAR2 DEFAULT NULL,
  p_notation                 IN CLOB DEFAULT NULL,
  p_component_sig            IN CLOB DEFAULT NULL,
  p_component_sig_sql        IN CLOB DEFAULT NULL  
  );
  
END sv_sec_import;
/