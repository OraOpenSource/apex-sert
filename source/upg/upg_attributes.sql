PROMPT  =============================================================================
PROMPT  == MIGRATING ATTRIBUTES
PROMPT  =============================================================================

DECLARE
  l_category_key             VARCHAR2(255);
  l_category_id              NUMBER;
  l_collection_key           VARCHAR2(255);
  l_score_collection_id      NUMBER;
  l_col_template_key         VARCHAR2(255);
  l_col_template_id          NUMBER;
  l_component_sig_key        VARCHAR2(255);
  l_component_sig_id         NUMBER;
BEGIN

-- Loop through all attributes that are not internal
FOR x IN (SELECT * FROM ^upgrade_from_user_s..sv_sec_attributes WHERE internal_flag = 'N')
LOOP

  -- CATEGORY_KEY
  -- Get the category key from the previous version
  SELECT category_key INTO l_category_key FROM ^upgrade_from_user_s..sv_sec_categories
    WHERE category_id = x.category_id;

  -- Get the CATEGORY_ID from the new version
  SELECT category_id INTO l_category_id FROM ^upgrade_to_user_s..sv_sec_categories 
    WHERE category_key = l_category_key;
  
  -- SCORE_COLLECTION_KEY
  IF x.score_collection_id IS NOT NULL THEN
    -- Get the SCORE_COLLECTION_ID from the previous version
    SELECT collection_key INTO l_collection_key FROM ^upgrade_from_user_s..sv_sec_score_collections
      WHERE score_collection_id = x.category_id;

    -- Get the SCORE_COLLECTION_ID from the new version
    SELECT score_collection_id INTO l_score_collection_id FROM ^upgrade_to_user_s..sv_sec_score_collections
      WHERE collection_key = l_collection_key;

  END IF;

  -- COLUMN_TEMPLATE_KEY
  IF x.col_template_id IS NOT NULL THEN
    -- Get the COL_TEMPLATE_ID from the previous version
    SELECT col_template_key INTO l_col_template_key FROM ^upgrade_from_user_s..sv_sec_col_templates
      WHERE col_template_id = x.col_template_id;

    -- Get the COL_TEMPLATE_ID from the new version
    SELECT col_template_id INTO l_col_template_id FROM ^upgrade_to_user_s..sv_sec_col_templates
      WHERE col_template_key = l_col_template_key;

  END IF;

  -- COMPONENT_SIG_KEY
  IF x.component_sig_id IS NOT NULL THEN
    -- Get the COMPONENT_SIG_ID from the previous version
    SELECT component_sig_key INTO l_component_sig_key FROM ^upgrade_from_user_s..sv_sec_component_sigs
      WHERE component_sig_id = x.component_sig_id;

    -- Get the COMPONENT_SIG_ID from the new version
    SELECT component_sig_id INTO l_component_sig_id FROM ^upgrade_to_user_s..sv_sec_component_sigs
      WHERE component_sig_key = l_component_sig_key;

  END IF;

  -- Insert the new attribute, using the lookup values where needed
  INSERT INTO ^upgrade_to_user_s..sv_sec_attributes
    (
    category_id,
    attribute_name,
    attribute_key,
    active_flag,
    rule_source,
    table_name,
    column_name,
    view_name,
    score_collection_id,
    rule_plsql,
    rule_type,
    info,
    info_pdf,
    fix,
    fix_pdf,
    when_not_found,
    seq,
    internal_flag,
    help_page,
    impact,
    col_template_id,
    display_page_id,
    summary_page_id,
    component_table,
    component_column_id,
    component_column_display,
    column_table,
    column_column_id,
    column_column_display,
    component_sig_id
    )
  VALUES
    (
    l_category_id,
    x.attribute_name,
    x.attribute_key,
    x.active_flag,
    x.rule_source,
    x.table_name,
    x.column_name,
    x.view_name,
    l_score_collection_id,
    x.rule_plsql,
    x.rule_type,
    x.info,
    x.info_pdf,
    x.fix,
    x.fix_pdf,
    x.when_not_found,
    x.seq,
    x.internal_flag,
    x.help_page,
    x.impact,
    l_col_template_id,
    x.display_page_id,
    x.summary_page_id,
    x.component_table,
    x.component_column_id,
    x.component_column_display,
    x.column_table,
    x.column_column_id,
    x.column_column_display,
    l_component_sig_id
    );

  -- Reset the all key and ID variables
  l_category_id          := NULL;
  l_category_key         := NULL;  
  l_collection_key       := NULL;
  l_score_collection_id  := NULL;
  l_col_template_key     := NULL;
  l_col_template_id      := NULL;
  l_component_sig_key    := NULL;
  l_component_sig_id     := NULL;

END LOOP;

END;
/
