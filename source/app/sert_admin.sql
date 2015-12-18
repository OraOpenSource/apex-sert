set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 202 - SERT Administration
--
-- Application Export:
--   Application:     202
--   Name:            SERT Administration
--   Date and Time:   08:26 Friday December 18, 2015
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.5.00.08
--   Instance ID:     63122780454626
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                     20
--     Items:                   29
--     Computations:             1
--     Validations:              9
--     Processes:               29
--     Regions:                 29
--     Buttons:                 21
--     Dynamic Actions:         20
--   Shared Components:
--     Logic:
--       Items:                  2
--       Computations:           1
--     Navigation:
--       Parent Tabs:            7
--       Tab Sets:               7
--         Tabs:                 7
--       Lists:                  1
--       Breadcrumbs:            1
--         Entries:             17
--       NavBar Entries:         4
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 6
--         Region:              17
--         Label:                3
--         List:                 4
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               7
--         Report:               5
--       Shortcuts:             11
--       Plug-ins:               2
--     Globalization:
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,218164628115200380));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,202);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,202));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,202));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,202),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,202),
  p_owner => nvl(wwv_flow_application_install.get_schema,'SV_SERT_APEX'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'SERT Administration'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'SERT_ADMIN'),
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20151218082613',
  p_max_session_length_sec=> 9999,
  p_max_session_idle_sec=> 1999,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'B',
  p_flow_language=> 'en-us',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_allow_feedback_yn=> 'N',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 506237230236596306 + wwv_flow_api.g_id_offset,
  p_logout_url=> 'f?p=&APP_ID.:102:&SESSION.',
  p_application_tab_set=> 1,
  p_logo_image => 'TEXT:APEX-SERT Admin',
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> '@SV_VERSION@',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_restrict_to_user_list=> 'SV_DEV',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'N',
  p_browser_frame=>'S',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER',
  p_authorize_public_pages_yn=>'Y',
  p_csv_encoding=> 'Y',
  p_include_legacy_javascript=> 'Y',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss=> '20151218082613',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'DESKTOP'
 ,p_display_seq => 10
 ,p_use_auto_detect => false
 ,p_is_default => true
 ,p_theme_id => 101
 ,p_home_url => 'f?p=&APP_ID.:1:&SESSION.'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 218208618719772901 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
--application/plug-in setting/dynamic_action_plugin_com_skillbuilders_modal_page
wwv_flow_api.create_plugin_setting (
  p_id => 218213318501773441 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'PLUGIN_COM_SKILLBUILDERS_MODAL_PAGE'
 ,p_attribute_01 => '1'
 ,p_attribute_02 => '.5'
 ,p_attribute_03 => 'N'
 ,p_attribute_04 => 'none'
 ,p_attribute_05 => '100'
 ,p_attribute_06 => '300'
 ,p_attribute_07 => 'N'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 799359640742696161 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 0,
  p_icon_image => '',
  p_icon_subtext=> 'Logout',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Logout',
  p_icon_height=> 32,
  p_icon_width=> 32,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'USER_IS_NOT_PUBLIC_USER',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_reference_id=> 9848027047569055,
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 253223832442713713 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 10,
  p_icon_image => '',
  p_icon_subtext=> 'Reset Password',
  p_icon_target=> 'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'USER_IS_NOT_PUBLIC_USER',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 766279809697862334 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 10,
  p_icon_image => '',
  p_icon_subtext=> 'APEX Builder',
  p_icon_target=> 'f?p=4000:1500:&G_APEX_BUILDER_SESSION_ID.',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> 'G_APEX_BUILDER_SESSION_ID',
  p_icon_bar_disp_cond_type=> 'ITEM_IS_NOT_NULL',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 799349763760602529 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 100,
  p_icon_image => '',
  p_icon_subtext=> 'Home',
  p_icon_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1:::',
  p_icon_image_alt=> 'Home',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'USER_IS_NOT_PUBLIC_USER',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
--application/shared_components/logic/application_items/g_logo
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 785236684177159101 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_LOGO'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/g_result
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 253231809520877419 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_RESULT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

prompt  ...application level computations
--
 
begin
 
--application/shared_components/logic/application_computations/g_logo
wwv_flow_api.create_flow_computation (
  p_id => 253246516960891895 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'G_LOGO',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'FUNCTION_BODY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'RETURN sv_sec_util.logo;',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
--application/shared_components/navigation/tabs/standard/t_home
wwv_flow_api.create_tab (
  p_id=> 762522598625568040 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_HOME',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_HOME',
  p_tab_text => 'Home',
  p_tab_step => 1,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'Applications',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_logs
wwv_flow_api.create_tab (
  p_id=> 506291140906769750 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_LOGS',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_LOGS',
  p_tab_text => 'Logs',
  p_tab_step => 1500,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'Applications',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_mailqueue
wwv_flow_api.create_tab (
  p_id=> 255451931345828194 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_MAILQUEUE',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_MAILQUEUE',
  p_tab_text => 'Mail Queue',
  p_tab_step => 1600,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'Applications',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_preferences
wwv_flow_api.create_tab (
  p_id=> 254658117547064058 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_PREFERENCES',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_PREFERENCES',
  p_tab_text => 'Preferences',
  p_tab_step => 400,
  p_tab_also_current_for_pages => '410',
  p_tab_parent_tabset=>'Applications',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_roles
wwv_flow_api.create_tab (
  p_id=> 506367255793320899 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_ROLES',
  p_tab_sequence=> 20,
  p_tab_name=> 'T_ROLES',
  p_tab_text => 'Roles',
  p_tab_step => 200,
  p_tab_also_current_for_pages => '210',
  p_tab_parent_tabset=>'Applications',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_scheduledevaluations
wwv_flow_api.create_tab (
  p_id=> 254985308679978726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_SCHEDULING',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_SCHEDULEDEVALUATIONS',
  p_tab_text => 'Scheduled Evaluations',
  p_tab_step => 500,
  p_tab_also_current_for_pages => '540,510,520,530,525,535',
  p_tab_parent_tabset=>'Applications',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_users
wwv_flow_api.create_tab (
  p_id=> 253205528091173234 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_USERS',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_USERS',
  p_tab_text => 'Users',
  p_tab_step => 300,
  p_tab_also_current_for_pages => '310',
  p_tab_parent_tabset=>'Applications',
  p_tab_comment  => '');
 
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
--application/shared_components/navigation/tabs/parent/t_home
wwv_flow_api.create_toplevel_tab (
  p_id=> 762522292391566253 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'Applications',
  p_tab_sequence=> 0,
  p_tab_name  => 'T_HOME',
  p_tab_text  => 'Home',
  p_tab_target=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_HOME',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_roles
wwv_flow_api.create_toplevel_tab (
  p_id=> 506367824395323151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'Applications',
  p_tab_sequence=> 10,
  p_tab_name  => 'T_ROLES',
  p_tab_text  => 'Roles',
  p_tab_target=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_ROLES',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_users
wwv_flow_api.create_toplevel_tab (
  p_id=> 253205220472170997 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'Applications',
  p_tab_sequence=> 40,
  p_tab_name  => 'T_USERS',
  p_tab_text  => 'Users',
  p_tab_target=> 'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_USERS',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_preferences
wwv_flow_api.create_toplevel_tab (
  p_id=> 254657907158061071 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'Applications',
  p_tab_sequence=> 40,
  p_tab_name  => 'T_PREFERENCES',
  p_tab_text  => 'Preferences',
  p_tab_target=> 'f?p=&APP_ID.:400:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_PREFERENCES',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_scheduling
wwv_flow_api.create_toplevel_tab (
  p_id=> 254985132443976159 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'Applications',
  p_tab_sequence=> 50,
  p_tab_name  => 'T_SCHEDULING',
  p_tab_text  => 'Scheduling',
  p_tab_target=> 'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_SCHEDULING',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_mailqueue
wwv_flow_api.create_toplevel_tab (
  p_id=> 255451321648825379 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'Applications',
  p_tab_sequence=> 980,
  p_tab_name  => 'T_MAILQUEUE',
  p_tab_text  => 'Mail Queue',
  p_tab_target=> 'f?p=&APP_ID.:1600:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_MAILQUEUE',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_logs
wwv_flow_api.create_toplevel_tab (
  p_id=> 506290935018767968 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'Applications',
  p_tab_sequence=> 999,
  p_tab_name  => 'T_LOGS',
  p_tab_text  => 'Logs',
  p_tab_target=> 'f?p=&APP_ID.:1500:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_LOGS',
  p_tab_comment=> '');
 
 
end;
/

prompt  ...Shared Lists of values
--
prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
wwv_flow_api.create_page_group(
  p_id=>763642315792196441 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'SQLi : Processes',
  p_group_desc=>'');
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00000
prompt  ...PAGE 0: Page Zero
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 0
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_name => 'Page Zero'
 ,p_step_title => 'Page Zero'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140716124329'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 255013817296545723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Scheduling',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 255013332402540618 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 778798257565427461+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'SELECT 1 FROM dual WHERE :APP_PAGE_ID BETWEEN 500 AND 599',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 506285440681703442 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_display_sequence=> 11,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(799351041276602597 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 798726761922451704+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'IF owa_util.get_cgi_env(''HTTP_USER_AGENT'') LIKE ''%MSIE%'' THEN'||unistr('\000a')||
'  htp.prn('''||unistr('\000a')||
'  <style type="text/css">'||unistr('\000a')||
'  #box-body {'||unistr('\000a')||
'      margin-top: 30px;'||unistr('\000a')||
'  }       '||unistr('\000a')||
'  </style>'||unistr('\000a')||
'  '');'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 752381669597164706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Bump for Admin Pages in IE',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 550,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'SELECT 1 FROM dual '||unistr('\000a')||
'WHERE '||unistr('\000a')||
'  :APP_PAGE_ID BETWEEN 1000 AND 1999',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'IF owa_util.get_cgi_env(''HTTP_USER_AGENT'') NOT LIKE ''%MSIE%'' THEN'||unistr('\000a')||
'  htp.prn('''||unistr('\000a')||
'  <style type="text/css">'||unistr('\000a')||
'  #box-body {'||unistr('\000a')||
'      margin-top: 60px;'||unistr('\000a')||
'  }       '||unistr('\000a')||
'  </style>'||unistr('\000a')||
'  '');'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 763793190328021449 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'One Level Tab Tuck',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 480,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'NOT_EXISTS',
  p_plug_display_when_condition => 'SELECT 1 FROM dual WHERE :APP_PAGE_ID BETWEEN 500 AND 599',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<style type="text/css">'||unistr('\000a')||
'#tab { width: 14%; }'||unistr('\000a')||
'</style>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 765310072813251325 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Tab Adjustments',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 560,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => '!'||(778527769234392373+ wwv_flow_api.g_id_offset),
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<script type="text/javascript">'||unistr('\000a')||
'$(document).ready(function(){'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'        $("#apexir_rollover").appendTo("body");'||unistr('\000a')||
''||unistr('\000a')||
'});'||unistr('\000a')||
'</script>';

wwv_flow_api.create_page_plug (
  p_id=> 767216402495893491 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'IR position:absolute Fix',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 0,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'IF :APP_PAGE_ID BETWEEN 10 AND 49 THEN'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'Required for the drop down menus on IE 7+');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<style type="text/css">'||unistr('\000a')||
'.apexir_WORKSHEET_DATA { width:750px; border: 1px solid #ccc; }'||unistr('\000a')||
''||unistr('\000a')||
'</style>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 775671756649372712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'CSS Overrides',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 110,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'NEVER',
  p_plug_display_when_condition => 'IF :APP_PAGE_ID BETWEEN 700 AND 799 OR :APP_PAGE_ID BETWEEN 500 AND 599 THEN'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'Reduces the width of IRs when they are included in specific pages.');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<script type="text/javascript">'||unistr('\000a')||
'$(document).ready(function(){'||unistr('\000a')||
'	$("ul.dropdown li").dropdown();'||unistr('\000a')||
'});'||unistr('\000a')||
''||unistr('\000a')||
'$.fn.dropdown = function() {'||unistr('\000a')||
''||unistr('\000a')||
'	$(this).hover(function(){'||unistr('\000a')||
'		$(this).addClass("hover");'||unistr('\000a')||
'		$(''> .dir'',this).addClass("open");'||unistr('\000a')||
'		$(''ul:first'',this).css(''visibility'', ''visible'');'||unistr('\000a')||
'	},function(){'||unistr('\000a')||
'		$(this).removeClass("hover");'||unistr('\000a')||
'		$(''.open'',this).removeClass("open");'||unistr('\000a')||
'		$(''ul:first'',this).css(''visibility'', ''';

s:=s||'hidden'');'||unistr('\000a')||
'	});'||unistr('\000a')||
''||unistr('\000a')||
'}'||unistr('\000a')||
'</script>';

wwv_flow_api.create_page_plug (
  p_id=> 776021952963751683 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Dropdown CSS jQuery',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'FUNCTION_BODY',
  p_plug_display_when_condition => 'IF :APP_PAGE_ID BETWEEN 200 AND 999 THEN'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'Required for the drop down menus on IE 7+');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<style type="text/css">'||unistr('\000a')||
''||unistr('\000a')||
'.apexir_WORKSHEET_DATA tr.odd:hover td{background-color:#95b0bc!important; }'||unistr('\000a')||
''||unistr('\000a')||
'.apexir_WORKSHEET_DATA tr.even:hover td{background-color:#95b0bc!important;}'||unistr('\000a')||
''||unistr('\000a')||
'.apexir_WORKSHEET_DATA th '||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#tabBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'        background-color: #727272;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.apexir_WORKSHEET_DATA th.current {'||unistr('\000a')||
'        background';

s:=s||': url(#WORKSPACE_IMAGES#sReportBG-Dark-Hover.png) 0 0 repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'button.apexir-button {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 100% -50px no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'button.apexir-button span {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 0 0 no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'button.apexir-go-button {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 100% -200px no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'button.apexir-go';

s:=s||'-button span {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 0 -150px no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#apexir_TOOLBAR button.dhtmlMenu {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 100% -100px no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#apexir_TOOLBAR button.dhtmlMenu span {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 0 0 no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#apexir_TOOLBAR button.dhtmlMenuOn {'||unistr('\000a')||
'        background: url(#WORKSPACE_';

s:=s||'IMAGES#sIRButton.png) 100% -100px no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#apexir_TOOLBAR button.dhtmlMenuOn span {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 0 0 no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'div.apexir_COLUMN_SELECTOR a.apexir_SEARCHICON {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sIRButton.png) 0 -250px no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#success_message {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sReportBG.png) 0 -200px #DADADA repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'';

s:=s||'#notification_message {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sReportBG.png) 0 -200px #DADADA repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#tabs'||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#tabBackground.png); '||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#region-tabs '||unistr('\000a')||
'{'||unistr('\000a')||
'    background: url(#WORKSPACE_IMAGES#subTabBackground.png) repeat-x #ddd;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#left-sidebar {'||unistr('\000a')||
'    background: url(#WORKSPACE_IMAGES#sidebarBackground.png) repeat-x #c5c4c3;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'th.reportHeader {'||unistr('\000a')||
'      ';

s:=s||'          background: url(#WORKSPACE_IMAGES#tabBackground.png) #768896 repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'.tabTD, .tabTable td'||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#subTabBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.tabTable td.currentTab'||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#formHeaderBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.sidebar'||unistr('\000a')||
'{'||unistr('\000a')||
'        background: #c5c3c3;'||unistr('\000a')||
'	background-im';

s:=s||'age: url(#WORKSPACE_IMAGES#sidebarBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.formRegionHeader, .exceptionRegionHeader'||unistr('\000a')||
'{'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#formRegionTitleBackground.png) repeat-x scroll 0 0 #6f8c9b;'||unistr('\000a')||
'        height: 30px;'||unistr('\000a')||
'}     '||unistr('\000a')||
''||unistr('\000a')||
'.verticalReport th'||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#formHeaderBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.par';

s:=s||'entTabTable td'||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#tabBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.parentTabTable td.currentParentTab'||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#formHeaderBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.reportHeader '||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#formHeaderBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.tab'||unistr('\000a')||
'{'||unistr('\000a')||
'	bac';

s:=s||'kground-image: url(#WORKSPACE_IMAGES#subTabBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'button.button-default {'||unistr('\000a')||
'        background: transparent url(#WORKSPACE_IMAGES#sButtons.png) no-repeat right -49px;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'button.button-default span {'||unistr('\000a')||
'        background: transparent url(#WORKSPACE_IMAGES#sButtons.png) no-repeat left 0;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'div.error_container div.sErrorText {'||unistr('\000a')||
'        background: ur';

s:=s||'l(#WORKSPACE_IMAGES#sErrorIcon.png) 0 5px no-repeat;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'ul.dropdown li.hover,'||unistr('\000a')||
'ul.dropdown li:hover '||unistr('\000a')||
'{'||unistr('\000a')||
'	background-color: #697888;'||unistr('\000a')||
'        background-image: url(#WORKSPACE_IMAGES#tabCurrentBackground.png); '||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'ul#tabs li.first-current, li.current '||unistr('\000a')||
'{'||unistr('\000a')||
'        background-color: #768896;'||unistr('\000a')||
'        background-image: url(#WORKSPACE_IMAGES#formRegionTitleBackground.png); '||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'ul.dropdown li .currentTab '||unistr('\000a')||
'{'||unistr('\000a')||
'  ';

s:=s||'      background-color: #697888;'||unistr('\000a')||
'        background-image: url(#WORKSPACE_IMAGES#tabCurrentBackground.png); '||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'ul.dropdown li'||unistr('\000a')||
'{'||unistr('\000a')||
'	background-image: url(#WORKSPACE_IMAGES#subTabBackground.png); '||unistr('\000a')||
'        background-repeat:repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'ul.dropdown ul li'||unistr('\000a')||
'{'||unistr('\000a')||
'        background-image: none;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'ul#region-tabs li.rt-current {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#formRegionTitleBackground.png) #768896 ';

s:=s||'repeat-x;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'#hidePanel {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sidebarHide.png) no-repeat;'||unistr('\000a')||
'        background-color: #bbb;'||unistr('\000a')||
'}'||unistr('\000a')||
'#showPanel {'||unistr('\000a')||
'        background: url(#WORKSPACE_IMAGES#sidebarShow.png) no-repeat;'||unistr('\000a')||
'        background-color: #bbb;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.ui-progressbar-value {'||unistr('\000a')||
'    background-image: url(#WORKSPACE_IMAGES#pbar-ani.gif);'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.ui-widget-header { '||unistr('\000a')||
'    background: url("#WORKSPACE_IMAGES#formRe';

s:=s||'gionTitleBackground.png") repeat-x scroll 0 0 #6F8C9B;'||unistr('\000a')||
'    border: 1px solid #AAAAAA;'||unistr('\000a')||
'    color: #FFF;'||unistr('\000a')||
'    font-weight: bold;'||unistr('\000a')||
'}'||unistr('\000a')||
'.ui-widget-header .ui-icon {'||unistr('\000a')||
'    background-image: url("#WORKSPACE_IMAGES#CLOSE.png");'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.ui-icon-closethick {'||unistr('\000a')||
'    background-position: 0px 0px;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'</style>';

wwv_flow_api.create_page_plug (
  p_id=> 777357254695387418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'CSS Images',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 130,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_HEADER',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_plug_display_when_condition => 'IF :APP_PAGE_ID BETWEEN 10 AND 49 THEN'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>778214733216302261 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:0:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>779030258863618174 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&FLOW_ID.:0:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 99,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 763248818187689229 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Page Help'
 ,p_event_sequence => 0
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.pageHelp'
 ,p_triggering_condition_type => 'JAVASCRIPT_EXPRESSION'
 ,p_triggering_expression => 'this.triggeringElement.innerHTML == ''Help'''
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 763249097996689253 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 763248818187689229 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);'||unistr('\000a')||
'get.addParam(''x01'',&APP_PAGE_ID.);'||unistr('\000a')||
'get.addParam(''x02'',''PAGE'');'||unistr('\000a')||
's = get.get().split("^");'||unistr('\000a')||
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");'||unistr('\000a')||
'd.dialog({'||unistr('\000a')||
'    title: s[0],'||unistr('\000a')||
'    bgiframe: true,'||unistr('\000a')||
'    width: 750,'||unistr('\000a')||
'    height: 750,'||unistr('\000a')||
'    modal: true,'||unistr('\000a')||
'    draggable : false,'||unistr('\000a')||
'    buttons: {'||unistr('\000a')||
'      Close: function() { $( this ).dialog( "close" ); }'||unistr('\000a')||
'		  }'||unistr('\000a')||
'    })'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 763259904521499064 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Region Help'
 ,p_event_sequence => 0
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.regionHelp'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 763260188283499080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 763259904521499064 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);'||unistr('\000a')||
'get.addParam(''x01'',this.triggeringElement.id);'||unistr('\000a')||
'get.addParam(''x02'',''REGION'');'||unistr('\000a')||
'get.addParam(''x03'',&APP_PAGE_ID.);'||unistr('\000a')||
's = get.get().split("^");'||unistr('\000a')||
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");'||unistr('\000a')||
'd.dialog({'||unistr('\000a')||
'    title: s[0],'||unistr('\000a')||
'    bgiframe: true,'||unistr('\000a')||
'    width: 750,'||unistr('\000a')||
'    height: 750,'||unistr('\000a')||
'    modal: true,'||unistr('\000a')||
'    draggable : false,'||unistr('\000a')||
'    buttons: {'||unistr('\000a')||
'      Close: function() { $( this ).dialog( "close" ); }'||unistr('\000a')||
'		  }'||unistr('\000a')||
'    })'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 763261618420531503 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Item Help'
 ,p_event_sequence => 0
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.itemHelp'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 763261916713531503 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 763261618420531503 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);'||unistr('\000a')||
'get.addParam(''x01'',this.triggeringElement.title);'||unistr('\000a')||
'get.addParam(''x02'',''ITEM'');'||unistr('\000a')||
's = get.get().split("^");'||unistr('\000a')||
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");'||unistr('\000a')||
'd.dialog({'||unistr('\000a')||
'    title: s[0],'||unistr('\000a')||
'    bgiframe: true,'||unistr('\000a')||
'    width: 500,'||unistr('\000a')||
'    height: 200,'||unistr('\000a')||
'    modal: true,'||unistr('\000a')||
'    draggable : false,'||unistr('\000a')||
'    buttons: {'||unistr('\000a')||
'      Close: function() { $( this ).dialog( "close" ); }'||unistr('\000a')||
'		  }'||unistr('\000a')||
'    })'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 763737314909202260 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Embedded Page Help'
 ,p_event_sequence => 0
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.embeddedPageHelp'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 763737611856202260 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 763737314909202260 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);'||unistr('\000a')||
'get.addParam(''x01'',$v(pFlowStepId));'||unistr('\000a')||
'get.addParam(''x02'',''PAGE'');'||unistr('\000a')||
's = get.get().split("|");'||unistr('\000a')||
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");'||unistr('\000a')||
'd.dialog({'||unistr('\000a')||
'    title: s[0],'||unistr('\000a')||
'    bgiframe: true,'||unistr('\000a')||
'    width: 750,'||unistr('\000a')||
'    height: 750,'||unistr('\000a')||
'    modal: true,'||unistr('\000a')||
'    draggable : false,'||unistr('\000a')||
'    buttons: {'||unistr('\000a')||
'      Close: function() { $( this ).dialog( "close" ); }'||unistr('\000a')||
'		  }'||unistr('\000a')||
'    })'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 763916292944148348 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Classification Help'
 ,p_event_sequence => 0
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.classificationHelp'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 763916602979148366 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 763916292944148348 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);'||unistr('\000a')||
'get.addParam(''x01'',this.triggeringElement.id);'||unistr('\000a')||
'get.addParam(''x02'',''CLASSIFICATION'');'||unistr('\000a')||
's = get.get().split("^");'||unistr('\000a')||
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");'||unistr('\000a')||
'd.dialog({'||unistr('\000a')||
'    title: s[0],'||unistr('\000a')||
'    bgiframe: true,'||unistr('\000a')||
'    width: 750,'||unistr('\000a')||
'    height: 750,'||unistr('\000a')||
'    modal: true,'||unistr('\000a')||
'    draggable : false,'||unistr('\000a')||
'    buttons: {'||unistr('\000a')||
'      Close: function() { $( this ).dialog( "close" ); }'||unistr('\000a')||
'		  }'||unistr('\000a')||
'    })'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 765115304890863227 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Category Help'
 ,p_event_sequence => 0
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.categoryHelp'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 765115594228863257 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 765115304890863227 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);'||unistr('\000a')||
'get.addParam(''x01'',this.triggeringElement.id);'||unistr('\000a')||
'get.addParam(''x02'',''CATEGORY'');'||unistr('\000a')||
'get.addParam(''x03'',&APP_PAGE_ID.);'||unistr('\000a')||
's = get.get().split("^");'||unistr('\000a')||
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");'||unistr('\000a')||
'd.dialog({'||unistr('\000a')||
'    title: s[0],'||unistr('\000a')||
'    bgiframe: true,'||unistr('\000a')||
'    width: 750,'||unistr('\000a')||
'    height: 750,'||unistr('\000a')||
'    modal: true,'||unistr('\000a')||
'    draggable : false,'||unistr('\000a')||
'    buttons: {'||unistr('\000a')||
'      Close: function() { $( this ).dialog( "close" ); }'||unistr('\000a')||
'		  }'||unistr('\000a')||
'    })'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 778231400036740418 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Hide IR Filters'
 ,p_event_sequence => 0
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
 ,p_display_when_type => 'FUNCTION_BODY'
 ,p_display_when_cond => 'IF :REQUEST != ''EXPAND'' OR :APP_PAGE_ID < 999 THEN'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'END IF;'
  );
wwv_flow_api.create_page_da_action (
  p_id => 778231717398740424 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 778231400036740418 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'if( $(''#apexir_CONTROLS_IMAGE'').attr("src") == ''#IMAGE_PREFIX#minus.gif'') { '||unistr('\000a')||
'gReport.toggle_controls($x(''apexir_CONTROL_PANEL_CONTROL'')); '||unistr('\000a')||
'} '
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 778264507215035793 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Show IR Filters'
 ,p_event_sequence => 0
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
 ,p_display_when_type => 'REQUEST_EQUALS_CONDITION'
 ,p_display_when_cond => 'EXPAND'
  );
wwv_flow_api.create_page_da_action (
  p_id => 778264802929035796 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 778264507215035793 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'if( $(''#apexir_CONTROLS_IMAGE'').attr("src") != ''#IMAGE_PREFIX#minus.gif'') { '||unistr('\000a')||
'gReport.toggle_controls($x(''apexir_CONTROL_PANEL_CONTROL'')); '||unistr('\000a')||
'} '
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 778560813784576044 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Init Sidebar'
 ,p_event_sequence => 0
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
 ,p_display_when_type => 'VAL_OF_ITEM_IN_COND_EQ_COND2'
 ,p_display_when_cond => 'G_SIDEBAR'
 ,p_display_when_cond2 => 'HIDE'
  );
wwv_flow_api.create_page_da_action (
  p_id => 778561117202576048 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 778560813784576044 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_affected_elements_type => 'JQUERY_SELECTOR'
 ,p_affected_elements => '#left-sidebar'
 ,p_attribute_01 => 'hideSidebar(0);'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 778537910885116441 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Show Sidebar'
 ,p_event_sequence => 110
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => '#showPanel'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
 ,p_display_when_type => 'NEVER'
  );
wwv_flow_api.create_page_da_action (
  p_id => 778538216186116446 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 778537910885116441 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'showSidebar();'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 778560495645561342 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 778537910885116441 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => ':G_SIDEBAR := ''SHOW'';'
 ,p_stop_execution_on_error => 'N'
 ,p_wait_for_result => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 778538499588122631 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Hide Sidebar'
 ,p_event_sequence => 110
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => '#hidePanel'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
 ,p_display_when_type => 'NEVER'
  );
wwv_flow_api.create_page_da_action (
  p_id => 778538802815122631 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 778538499588122631 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'hideSidebar(500);'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 778560709843565446 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 778538499588122631 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => ':G_SIDEBAR := ''HIDE'';'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 760291084092822396 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Open Modal Window'
 ,p_event_sequence => 640
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => '#openModalWindow'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
 ,p_display_when_cond => 'IF :APP_PAGE_ID BETWEEN 200 AND 999 THEN'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'END IF;'
  );
wwv_flow_api.create_page_da_action (
  p_id => 760304792741099236 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 760291084092822396 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_COM_SKILLBUILDERS_MODAL_PAGE'
 ,p_attribute_02 => 'TRIG_ELEMENT_ATTR'
 ,p_attribute_03 => 'f?p=&APP_ID.:1:&APP_SESSION.:::1:::'
 ,p_attribute_05 => 'link'
 ,p_attribute_06 => 'div#success-message'
 ,p_attribute_07 => 'AUTO'
 ,p_attribute_10 => 'createExceptionForm'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 778214345989302260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 0,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to reset pagination.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'GO,P0_SEARCH,RESET',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P0_SEARCH,P0_ROWS';

wwv_flow_api.create_page_process(
  p_id     => 778214536964302260 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 0,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Reset report search',
  p_process_sql_clob => p,
  p_process_error_message=> 'Unable to clear cache.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>778214156905302253 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Home
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_HOME'
 ,p_name => 'Home'
 ,p_alias => 'HOME'
 ,p_step_title => 'Home'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Home'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_welcome_text => '<style type="text/css">'||unistr('\000a')||
'.formRegionContent {'||unistr('\000a')||
'        padding: 5px;'||unistr('\000a')||
'        width:  99%;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20141021070619'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  app.workspace,'||unistr('\000a')||
'  app.application_id,'||unistr('\000a')||
'  app.application_name,'||unistr('\000a')||
'  app.last_updated_on,'||unistr('\000a')||
'  ast.attribute_set_name,'||unistr('\000a')||
'  ae.app_user,'||unistr('\000a')||
'  ae.eval_date,'||unistr('\000a')||
'  ae.approved_score,'||unistr('\000a')||
'  ae.pending_score,'||unistr('\000a')||
'  ae.raw_score'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  ('||unistr('\000a')||
'  SELECT'||unistr('\000a')||
'    max(app_eval_id) app_eval_id,'||unistr('\000a')||
'    application_id'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    sv_sec_app_evals'||unistr('\000a')||
'  GROUP BY'||unistr('\000a')||
'    application_id'||unistr('\000a')||
'  ) a,'||unistr('\000a')||
'  sv_sec_app_evals ae,'||unistr('\000a')||
'  apex_applications app,  '||unistr('\000a')||
'  sv_sec';

s:=s||'_attribute_sets ast'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  a.app_eval_id = ae.app_eval_id'||unistr('\000a')||
'  AND ae.application_id = app.application_id'||unistr('\000a')||
'  AND ae.attribute_set_id = ast.attribute_set_id';

wwv_flow_api.create_page_plug (
  p_id=> 506382348655481530 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Most Recent Evaluation per Application',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  app.workspace,'||unistr('\000a')||
'  app.application_id,'||unistr('\000a')||
'  app.application_name,'||unistr('\000a')||
'  app.last_updated_on,'||unistr('\000a')||
'  ast.attribute_set_name,'||unistr('\000a')||
'  ae.app_user,'||unistr('\000a')||
'  ae.eval_date,'||unistr('\000a')||
'  ae.approved_score,'||unistr('\000a')||
'  ae.pending_score,'||unistr('\000a')||
'  ae.raw_score'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  ('||unistr('\000a')||
'  SELECT'||unistr('\000a')||
'    max(app_eval_id) app_eval_id,'||unistr('\000a')||
'    application_id'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    sv_sec_app_evals'||unistr('\000a')||
'  GROUP BY'||unistr('\000a')||
'    application_id'||unistr('\000a')||
'  ) a,'||unistr('\000a')||
'  sv_sec_app_evals ae,'||unistr('\000a')||
'  apex_applications app,  '||unistr('\000a')||
'  sv_sec';

a1:=a1||'_attribute_sets ast'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  a.app_eval_id = ae.app_eval_id'||unistr('\000a')||
'  AND ae.application_id = app.application_id'||unistr('\000a')||
'  AND ae.attribute_set_id = ast.attribute_set_id';

wwv_flow_api.create_worksheet(
  p_id=> 506382451545481530+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_region_id=> 506382348655481530+wwv_flow_api.g_id_offset,
  p_name=> 'Recent Evaluations',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_csv_output_enclosed_by=>'/',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 506382451545481530);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506382726966481537+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'WORKSPACE',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Workspace',
  p_report_label           =>'Workspace',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506382824412481537+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APPLICATION_ID',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'App ID',
  p_report_label           =>'App ID',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506382935892481537+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APPLICATION_NAME',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Name',
  p_report_label           =>'Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506383024914481537+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LAST_UPDATED_ON',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Last Updated',
  p_report_label           =>'Last Updated',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'DD-MON-YYYY HH:MIPM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506383145357481537+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ATTRIBUTE_SET_NAME',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Attr&nbsp;Set',
  p_report_label           =>'Attr&nbsp;Set',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506383236263481538+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APP_USER',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'User',
  p_report_label           =>'User',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506383325020481538+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'EVAL_DATE',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Date',
  p_report_label           =>'Date',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'DD-MON-YYYY HH:MIPM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506383434821481538+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APPROVED_SCORE',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Approved',
  p_report_label           =>'Approved',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506383548378481538+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'PENDING_SCORE',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Pending',
  p_report_label           =>'Pending',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506383648006481538+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'RAW_SCORE',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Raw',
  p_report_label           =>'Raw',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'RUN:WORKSPACE:APPLICATION_ID:APPLICATION_NAME:LAST_UPDATED_ON:ATTRIBUTE_SET_NAME:APP_USER:EVAL_DATE:APPROVED_SCORE:PENDING_SCORE:RAW_SCORE';

wwv_flow_api.create_worksheet_rpt(
  p_id => 506383749347481711+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 506382451545481530+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2531867',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>10,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'EVAL_DATE',
  p_sort_direction_1        =>'DESC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>776293158489366407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'sv_sec_util.populate_result'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_result       => :P1_RESULT,'||unistr('\000a')||
'  p_app_user     => :APP_USER,'||unistr('\000a')||
'  p_app_session  => :APP_SESSION'||unistr('\000a')||
'  );';

wwv_flow_api.create_page_process(
  p_id     => 779882098386991833 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Change Scoring Method',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_RESULT',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> 'Scoring Method Updated.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P1_SEARCH := '''';';

wwv_flow_api.create_page_process(
  p_id     => 779888105911287192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Reset Page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>779887999678285329 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 779888310067288348 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>779887999678285329 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'sv_sec_util.dashboard_xml(p_attribute_set_id => :P1_ATTRIBUTE_SET_ID);';

wwv_flow_api.create_page_process(
  p_id     => 754082259160287294 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 40,
  p_process_point=> 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'dashboardXML',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00010
prompt  ...PAGE 10: Reset Password
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 10
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_name => 'Reset Password'
 ,p_step_title => 'Reset Password'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Reset Password'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140616151657'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 253237202978987862 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'Reset Password',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 253237429766987863 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 10,
  p_button_plug_id => 253237202978987862+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 253237607928987863 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 20,
  p_button_plug_id => 253237202978987862+wwv_flow_api.g_id_offset,
  p_button_name    => 'RESET_PASSWORD',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Reset Password',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>253239710249987870 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>253237607928987863+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 13-JUN-2014 09:28 by SSPENDOL');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253238224321987864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_VERIFY_PASSWORD',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 253237202978987862+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Verify New Password',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253238404754987864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_PASSWORD',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 253237202978987862+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'New Password',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253240210400991195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_CURRENT_PASSWORD',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 0,
  p_item_plug_id => 253237202978987862+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Current Password',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253239132004987869 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 10,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Passwords Must Match',
  p_validation_sequence=> 30,
  p_validation => 'IF :P10_PASSWORD != :P10_VERIFY_PASSWORD THEN'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Passwords must match.',
  p_always_execute=>'N',
  p_when_button_pressed=> 253237607928987863 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253239321680987869 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 10,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Password Strength',
  p_validation_sequence=> 40,
  p_validation => ':G_RESULT := APEX_UTIL.STRONG_PASSWORD_VALIDATION'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_username       => :P10_USER_NAME,'||unistr('\000a')||
'  p_password       => :P10_PASSWORD,'||unistr('\000a')||
'  p_old_password   => :P10_CURRENT_PASSWORD,'||unistr('\000a')||
'  p_workspace_name => ''x'''||unistr('\000a')||
'  );'||unistr('\000a')||
''||unistr('\000a')||
'IF :G_RESULT IS NOT NULL THEN'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => '&G_RESULT.',
  p_always_execute=>'N',
  p_when_button_pressed=> 253237607928987863 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253242712272076863 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 10,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Current Password is Correct',
  p_validation_sequence=> 50,
  p_validation => 'RETURN APEX_UTIL.IS_LOGIN_PASSWORD_VALID'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_username  => :APP_USER,'||unistr('\000a')||
'  p_password  => :P10_CURRENT_PASSWORD'||unistr('\000a')||
'  );',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Please enter your Current Password.',
  p_always_execute=>'N',
  p_when_button_pressed=> 253237607928987863 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 253240210400991195 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'sv_sec_admin.reset_current_user_password'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_password => :P10_PASSWORD'||unistr('\000a')||
'  );';

wwv_flow_api.create_page_process(
  p_id     => 253239401048987869 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 10,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Reset Password',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>253237607928987863 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Password Reset.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 10
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Login
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 101
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_name => 'Login'
 ,p_alias => 'LOGIN'
 ,p_step_title => 'Login'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140616100445'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 506271548116668431 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506271754062668432 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 506271548116668431+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Username',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726449707451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506271953748668434 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 506271548116668431+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Password',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726449707451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506272150664668434 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 506271548116668431+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_protection_level => 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.send_login_username_cookie ('||unistr('\000a')||
'    p_username => lower(:P101_USERNAME) );';

wwv_flow_api.create_page_process(
  p_id     => 506272531779668435 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.login('||unistr('\000a')||
'    p_username => :P101_USERNAME,'||unistr('\000a')||
'    p_password => :P101_PASSWORD );';

wwv_flow_api.create_page_process(
  p_id     => 506272347894668434 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 506272944079668435 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P101_USERNAME := apex_authentication.get_login_username_cookie;';

wwv_flow_api.create_page_process(
  p_id     => 506272733610668435 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00102
prompt  ...PAGE 102: Reset Password
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 102
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_name => 'Reset Password'
 ,p_step_title => 'Reset Password'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070639'
  );
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 102
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00200
prompt  ...PAGE 200: Roles
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 200
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_ROLES'
 ,p_name => 'Roles'
 ,p_step_title => 'Roles'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20150617094521'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  ur.user_role_id,'||unistr('\000a')||
'  ur.workspace_id,'||unistr('\000a')||
'  ur.created_on,'||unistr('\000a')||
'  ur.created_by,'||unistr('\000a')||
'  REPLACE(ur.role_name, ''SV_SERT_'', NULL) role_name,'||unistr('\000a')||
'  ur.user_workspace_id,'||unistr('\000a')||
'  ur.user_name,'||unistr('\000a')||
'  NVL(w1.workspace,''** All Workspaces **'') workspace,'||unistr('\000a')||
'  w2.workspace user_workspace,'||unistr('\000a')||
'  ur.user_name || '' ('' || w2.workspace || '')'' user_and_workspace'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_user_roles ur,'||unistr('\000a')||
'  apex_workspaces w1,'||unistr('\000a')||
'  apex_workspaces w2'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'';

s:=s||'  ur.workspace_id = w1.workspace_id(+)'||unistr('\000a')||
'  AND ur.user_workspace_id = w2.workspace_id(+)';

wwv_flow_api.create_page_plug (
  p_id=> 506369239763336996 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_plug_name=> 'SERT User Roles',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  ur.user_role_id,'||unistr('\000a')||
'  ur.workspace_id,'||unistr('\000a')||
'  ur.created_on,'||unistr('\000a')||
'  ur.created_by,'||unistr('\000a')||
'  REPLACE(ur.role_name, ''SV_SERT_'', NULL) role_name,'||unistr('\000a')||
'  ur.user_workspace_id,'||unistr('\000a')||
'  ur.user_name,'||unistr('\000a')||
'  NVL(w1.workspace,''** All Workspaces **'') workspace,'||unistr('\000a')||
'  w2.workspace user_workspace,'||unistr('\000a')||
'  ur.user_name || '' ('' || w2.workspace || '')'' user_and_workspace'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_user_roles ur,'||unistr('\000a')||
'  apex_workspaces w1,'||unistr('\000a')||
'  apex_workspaces w2'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'';

a1:=a1||'  ur.workspace_id = w1.workspace_id(+)'||unistr('\000a')||
'  AND ur.user_workspace_id = w2.workspace_id(+)';

wwv_flow_api.create_worksheet(
  p_id=> 506369435494337002+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_region_id=> 506369239763336996+wwv_flow_api.g_id_offset,
  p_name=> 'eSERT User Roles',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::P210_USER_ROLE_ID:#USER_ROLE_ID#',
  p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="">',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 506369435494337002);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506369533472337006+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'USER_ROLE_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'User Role Id',
  p_report_label           =>'User Role Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506369633707337006+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'WORKSPACE_ID',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Workspace Id',
  p_report_label           =>'Workspace Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506369726712337006+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_ON',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Created On',
  p_report_label           =>'Created On',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'DD-MON-YYYY HH:MIPM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506369841217337006+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_BY',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Created By',
  p_report_label           =>'Created By',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506369923110337006+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ROLE_NAME',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Role Name',
  p_report_label           =>'Role Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506370046163337007+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'USER_WORKSPACE_ID',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'User Workspace Id',
  p_report_label           =>'User Workspace Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506370133346337007+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'USER_NAME',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'User Name',
  p_report_label           =>'User Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506370237683337007+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'WORKSPACE',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Workspace',
  p_report_label           =>'Workspace',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506370352009337007+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'USER_WORKSPACE',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'User Workspace',
  p_report_label           =>'User Workspace',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 506370450616337008+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'USER_AND_WORKSPACE',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'User And Workspace',
  p_report_label           =>'User And Workspace',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'WORKSPACE:ROLE_NAME:USER_AND_WORKSPACE:CREATED_BY:CREATED_ON:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 506370532345337008+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 200,
  p_worksheet_id => 506369435494337002+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2531735',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'ROLE_NAME',
  p_sort_direction_1        =>'ASC',
  p_sort_column_2           =>'CREATED_ON',
  p_sort_direction_2        =>'DESC',
  p_break_on                =>'WORKSPACE',
  p_break_enabled_on        =>'WORKSPACE',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 506391527941655290 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 200,
  p_button_sequence=> 10,
  p_button_plug_id => 506369239763336996+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:210::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 200
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00210
prompt  ...PAGE 210: Manage Roles
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 210
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_ROLES'
 ,p_name => 'Manage Roles'
 ,p_step_title => 'Manage Roles'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140716064235'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 506373551223404519 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 210,
  p_plug_name=> 'Manage Roles',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 506373847974404520 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 210,
  p_button_sequence=> 30,
  p_button_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P210_USER_ROLE_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 506374150598404521 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 210,
  p_button_sequence=> 10,
  p_button_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 506373741443404520 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 210,
  p_button_sequence=> 40,
  p_button_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P210_USER_ROLE_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 506373924784404520 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 210,
  p_button_sequence=> 20,
  p_button_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'P210_USER_ROLE_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>506374736149404526 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:200:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506374952283404527 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_USER_ROLE_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'User Role Id',
  p_source=>'USER_ROLE_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726449707451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506375152517404537 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_WORKSPACE_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Workspace',
  p_source=>'WORKSPACE_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT'||unistr('\000a')||
'  workspace,'||unistr('\000a')||
'  workspace_id'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  apex_workspaces'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  workspace NOT IN (''INTERNAL'',''COM.ORACLE.APEX.REPOSITORY'')'||unistr('\000a')||
'ORDER BY'||unistr('\000a')||
'  workspace',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506375329240404539 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_USER_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'User Name',
  p_source=>'USER_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT'||unistr('\000a')||
'  user_name || '' ('' ||'||unistr('\000a')||
'  CASE'||unistr('\000a')||
'    WHEN is_admin = ''Yes'' AND is_application_developer = ''No'' THEN ''Admin'''||unistr('\000a')||
'    WHEN is_admin = ''Yes'' AND is_application_developer = ''Yes'' THEN ''Admin'''||unistr('\000a')||
'    WHEN is_admin = ''No''  AND is_application_developer = ''No'' THEN ''User'''||unistr('\000a')||
'    WHEN is_admin = ''No''  AND is_application_developer = ''Yes'' THEN ''Developer'''||unistr('\000a')||
'    ELSE ''Other'''||unistr('\000a')||
'  END || '')'' a,'||unistr('\000a')||
'  user_name b'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  apex_workspace_apex_users'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  workspace_id = :P210_USER_WORKSPACE_ID'||unistr('\000a')||
'ORDER BY'||unistr('\000a')||
'  user_name',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_lov_cascade_parent_items=> 'P210_USER_WORKSPACE_ID',
  p_ajax_optimize_refresh=> 'Y',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506375531429404539 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_USER_WORKSPACE_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'User Workspace',
  p_source=>'USER_WORKSPACE_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT'||unistr('\000a')||
'  workspace,'||unistr('\000a')||
'  workspace_id'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  apex_workspaces'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  workspace NOT IN (''INTERNAL'',''COM.ORACLE.APEX.REPOSITORY'')'||unistr('\000a')||
'ORDER BY'||unistr('\000a')||
'  workspace',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Select a Workspace -',
  p_lov_null_value=> '',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>506375754174404540 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_ROLE_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 506373551223404519+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Role Name',
  p_source=>'ROLE_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC:Administrator;SV_SERT_ADMIN,Approve in a Specific Workspace;SV_SERT_APPROVER,Schedule in a Specific Workspace;SV_SERT_SCHEDULER,Evaluate in a Specific Workspace;SV_SERT_EVALUATOR,Evaluate & Schedule in All Workspaces;SV_SERT_EVALUATOR_SCHEDULER_ALL,Approve in All Workspaces;SV_SERT_APPROVER_ALL',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Select a Role -',
  p_lov_null_value=> '',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 506391442009649824 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_computation_sequence => 10,
  p_computation_item=> 'P210_WORKSPACE_ID',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '0',
  p_compute_when => 'IF :P210_ROLE_NAME NOT IN (''SV_SERT_APPROVER'',''SV_SERT_SCHEDULER'',''SV_SERT_EVALUATOR'') THEN'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'END IF;',
  p_compute_when_type=>'FUNCTION_BODY');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 506389046633584987 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 210
 ,p_name => 'Hide/Show Workspace'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P210_ROLE_NAME'
 ,p_triggering_condition_type => 'NOT_IN_LIST'
 ,p_triggering_expression => 'SV_SERT_APPROVER,SV_SERT_SCHEDULER,SV_SERT_EVALUATOR'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 506389324945584989 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 210
 ,p_event_id => 506389046633584987 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P210_WORKSPACE_ID'
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 506389543590584989 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 210
 ,p_event_id => 506389046633584987 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P210_WORKSPACE_ID'
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 506390533913638021 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 210
 ,p_name => 'Hide/Show User'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P210_USER_WORKSPACE_ID'
 ,p_triggering_condition_type => 'NULL'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 506390841501638022 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 210
 ,p_event_id => 506390533913638021 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P210_USER_NAME'
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 506391038767638022 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 210
 ,p_event_id => 506390533913638021 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P210_USER_NAME'
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:SV_SEC_USER_ROLES:P210_USER_ROLE_ID:USER_ROLE_ID';

wwv_flow_api.create_page_process(
  p_id     => 506376548695404543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 210,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from SV_SEC_USER_ROLES',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DELETE FROM '||unistr('\000a')||
'  sv_sec_user_notif_prefs '||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  role_name = :P210_ROLE_NAME'||unistr('\000a')||
'  AND workspace_id = :P210_WORKSPACE_ID'||unistr('\000a')||
'  AND user_workspace_id = :P210_USER_WORKSPACE_ID'||unistr('\000a')||
'  AND user_name = :P210_USER_NAME;';

wwv_flow_api.create_page_process(
  p_id     => 255003722662409151 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 210,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Clean Up SV_SEC_USER_NOTIF_PREFS',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>506373924784404520 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:SV_SEC_USER_ROLES:P210_USER_ROLE_ID:USER_ROLE_ID|IUD';

wwv_flow_api.create_page_process(
  p_id     => 506376731504404543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 210,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of SV_SEC_USER_ROLES',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'210';

wwv_flow_api.create_page_process(
  p_id     => 506376945428404543 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 210,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>506373924784404520 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 210
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00300
prompt  ...PAGE 300: Users
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 300
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_USERS'
 ,p_name => 'Users'
 ,p_step_title => 'Users'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20150617094531'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  user_name,'||unistr('\000a')||
'  email,'||unistr('\000a')||
'  date_created,'||unistr('\000a')||
'  CASE '||unistr('\000a')||
'    WHEN locked = ''UNLOCK'' THEN ''<a title="Lock Account" href="#" id="'' || user_name || ''" class="lockAccount" style="color:black;"><img src="#WORKSPACE_IMAGES#UNLOCK.gif"></a>'' '||unistr('\000a')||
'    ELSE ''<a title="Unlock Account" href="#" id="'' || user_name || ''" class="unlockAccount" style="color:black;"><img src="#WORKSPACE_IMAGES#LOCK.gif"></a>'' '||unistr('\000a')||
'  END lock';

s:=s||'_acct,'||unistr('\000a')||
'  user_name remove_user'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  ('||unistr('\000a')||
'  SELECT'||unistr('\000a')||
'    user_name,'||unistr('\000a')||
'    email,'||unistr('\000a')||
'    date_created,'||unistr('\000a')||
'    CASE WHEN sv_sec_util.is_account_locked(p_user_name => user_name) = ''Y'' THEN ''LOCK'' ELSE ''UNLOCK'' END locked'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    apex_workspace_apex_users'||unistr('\000a')||
'  WHERE'||unistr('\000a')||
'    workspace_id = :WORKSPACE_ID'||unistr('\000a')||
'  )';

wwv_flow_api.create_page_plug (
  p_id=> 253205709868177408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_plug_name=> 'SERT Admin Users',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  user_name,'||unistr('\000a')||
'  email,'||unistr('\000a')||
'  date_created,'||unistr('\000a')||
'  CASE '||unistr('\000a')||
'    WHEN locked = ''UNLOCK'' THEN ''<a title="Lock Account" href="#" id="'' || user_name || ''" class="lockAccount" style="color:black;"><img src="#WORKSPACE_IMAGES#UNLOCK.gif"></a>'' '||unistr('\000a')||
'    ELSE ''<a title="Unlock Account" href="#" id="'' || user_name || ''" class="unlockAccount" style="color:black;"><img src="#WORKSPACE_IMAGES#LOCK.gif"></a>'' '||unistr('\000a')||
'  END lock';

a1:=a1||'_acct,'||unistr('\000a')||
'  user_name remove_user'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  ('||unistr('\000a')||
'  SELECT'||unistr('\000a')||
'    user_name,'||unistr('\000a')||
'    email,'||unistr('\000a')||
'    date_created,'||unistr('\000a')||
'    CASE WHEN sv_sec_util.is_account_locked(p_user_name => user_name) = ''Y'' THEN ''LOCK'' ELSE ''UNLOCK'' END locked'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    apex_workspace_apex_users'||unistr('\000a')||
'  WHERE'||unistr('\000a')||
'    workspace_id = :WORKSPACE_ID'||unistr('\000a')||
'  )';

wwv_flow_api.create_worksheet(
  p_id=> 253205824978177408+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_region_id=> 253205709868177408+wwv_flow_api.g_id_offset,
  p_name=> 'eSERT Admin Users',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.::P310_USER_NAME:#USER_NAME#',
  p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="">',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 253205824978177408);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 253206401861177421+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_worksheet_id => 253205824978177408+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'USER_NAME',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'User Name',
  p_report_label           =>'User Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 253206503789177422+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_worksheet_id => 253205824978177408+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'EMAIL',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Email',
  p_report_label           =>'Email',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 253206622519177422+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_worksheet_id => 253205824978177408+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DATE_CREATED',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Date Created',
  p_report_label           =>'Date Created',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 253215929345514206+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_worksheet_id => 253205824978177408+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LOCK_ACCT',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'&nbsp;',
  p_report_label           =>'&nbsp;',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 253225203315752644+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_worksheet_id => 253205824978177408+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'REMOVE_USER',
  p_display_order          =>15,
  p_column_identifier      =>'O',
  p_column_label           =>'&nbsp;',
  p_report_label           =>'&nbsp;',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'#',
  p_column_linktext        =>'<img src="#WORKSPACE_IMAGES#TRASH.gif">',
  p_column_link_attr       =>'id="#USER_NAME#" class="removeUser" title="Remove User"',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'USER_NAME:EMAIL:DATE_CREATED:RESET_PASSWORD:LOCK_ACCT:REMOVE_USER::ID';

wwv_flow_api.create_worksheet_rpt(
  p_id => 253207110560177663+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 300,
  p_worksheet_id => 253205824978177408+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2532072',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'USER_NAME',
  p_sort_direction_1        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 253224730411741504 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 300,
  p_button_sequence=> 10,
  p_button_plug_id => 253205709868177408+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:310::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253212921445341594 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 300,
  p_name=>'P300_USER_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 253205709868177408+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 253220119105672032 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_name => 'Lock Account'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.lockAccount'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 253221031707672036 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253220119105672032 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => 'Are you sure that you want to lock this account?'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253220406683672035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253220119105672032 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P300_USER_NAME'
 ,p_attribute_01 => 'JAVASCRIPT_EXPRESSION'
 ,p_attribute_05 => 'this.triggeringElement.id;'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253220608090672035 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253220119105672032 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 50
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'apex_util.lock_account'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_user_name => :P300_USER_NAME'||unistr('\000a')||
'  );'
 ,p_attribute_02 => 'P300_USER_NAME'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253220807263672036 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253220119105672032 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 60
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 253205709868177408 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 253221432049685290 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_name => 'Unlock Account'
 ,p_event_sequence => 30
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.unlockAccount'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 253222317369685292 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253221432049685290 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => 'Are you sure that you want to unlock this account?'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253221710984685291 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253221432049685290 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P300_USER_NAME'
 ,p_attribute_01 => 'JAVASCRIPT_EXPRESSION'
 ,p_attribute_05 => 'this.triggeringElement.id;'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253221931513685291 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253221432049685290 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 50
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'apex_util.unlock_account'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_user_name => :P300_USER_NAME'||unistr('\000a')||
'  );'
 ,p_attribute_02 => 'P300_USER_NAME'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253222112271685291 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253221432049685290 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 60
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 253205709868177408 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 253225306909763149 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_name => 'Remove User'
 ,p_event_sequence => 40
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.removeUser'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 253226223363763150 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253225306909763149 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => 'Are you sure that you want to remove this user?  This action cannot be undone.'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253225606824763150 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253225306909763149 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P300_USER_NAME'
 ,p_attribute_01 => 'JAVASCRIPT_EXPRESSION'
 ,p_attribute_05 => 'this.triggeringElement.id;'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253225830979763150 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253225306909763149 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 50
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'IF :P300_USER_NAME != ''ADMIN'' THEN'||unistr('\000a')||
'  sv_sec_admin.delete_user'||unistr('\000a')||
'    ('||unistr('\000a')||
'    p_user_name => :P300_USER_NAME'||unistr('\000a')||
'    );'||unistr('\000a')||
'END IF;'
 ,p_attribute_02 => 'P300_USER_NAME'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253226007072763150 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 300
 ,p_event_id => 253225306909763149 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 60
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 253205709868177408 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 300
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00310
prompt  ...PAGE 310: Manage User
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 310
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_USERS'
 ,p_name => 'Manage User'
 ,p_step_title => 'Manage User'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140616153628'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 253227400938780310 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 310,
  p_plug_name=> 'Manage eSERT Admin User',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 253228022409786541 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 310,
  p_button_sequence=> 20,
  p_button_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 253228225525787436 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 310,
  p_button_sequence=> 30,
  p_button_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P310_USER_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 253280401262656561 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 310,
  p_button_sequence=> 40,
  p_button_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'DEFINED_BY_DA',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'IF :P310_USER_ID IS NULL OR :P310_USER_NAME = ''ADMIN'' THEN'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_button_condition_type=> 'FUNCTION_BODY',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 253272030513151333 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 310,
  p_button_sequence=> 60,
  p_button_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P310_USER_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>253228732583798976 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 13-JUN-2014 09:28 by SSPENDOL');
 
wwv_flow_api.create_page_branch(
  p_id=>253282006934667688 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP,310::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'BEFORE_COMPUTATION',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>253280401262656561+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 16-JUN-2014 12:06 by SSPENDOL');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253227710981783198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_USER_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'User Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P310_USER_NAME',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253227915829784678 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253228907433801158 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_PASSWORD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Password',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253230320986833392 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_VERIFY_PASSWORD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Verify Password',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_encrypt_session_state_yn=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253270527696122042 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_USER_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>253272303426238118 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_ACCOUNT_LOCKED',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Account Locked',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC:Yes;Y,No;N',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>254135131146847763 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 310,
  p_name=>'P310_RESET_PASSWORD',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 253227400938780310+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'Y',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Change Password<br />on 1st Login',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC:Yes;Y,No;N',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253230111982830809 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Check for Duplicate Username',
  p_validation_sequence=> 10,
  p_validation => 'RETURN APEX_UTIL.IS_USERNAME_UNIQUE'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_username => :P310_USER_NAME'||unistr('\000a')||
'  );',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'That user name is already in use.  Please choose another.',
  p_always_execute=>'N',
  p_when_button_pressed=> 253228225525787436 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253230506572838748 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P310_EMAIL is valid',
  p_validation_sequence=> 20,
  p_validation => 'P310_EMAIL',
  p_validation2 => '^[a-zA-Z0-9][a-zA-Z0-9\.\-]{1,}@[a-zA-Z0-9]{1}[a-zA-Z0-9\.\-]{1,}\.{1}[a-zA-Z]{2,4}$',
  p_validation_type => 'REGULAR_EXPRESSION',
  p_error_message => 'Please enter a valid e-mail address.',
  p_always_execute=>'N',
  p_validation_condition=> 'SAVE,CREATE',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 253227915829784678 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253230729775845449 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Passwords Must Match',
  p_validation_sequence=> 30,
  p_validation => 'IF :P310_PASSWORD != :P310_VERIFY_PASSWORD THEN'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Passwords must match.',
  p_always_execute=>'N',
  p_validation_condition=> 'RETURN sv_sec_admin.run_password_validation'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_password                 => :P310_PASSWORD,'||unistr('\000a')||
'  p_password_verify          => :P310_PASSWORD_VERIFY,'||unistr('\000a')||
'  p_request                  => :REQUEST'||unistr('\000a')||
'  );',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253231505711876316 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Password Strength',
  p_validation_sequence=> 40,
  p_validation => 'RETURN sv_sec_admin.password_strength'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_user_name => :P310_USER_NAME,'||unistr('\000a')||
'  p_password  => :P310_PASSWORD'||unistr('\000a')||
'  );',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => '&G_RESULT.',
  p_always_execute=>'N',
  p_validation_condition=> 'IF :REQUEST = ''CREATE'' THEN'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'ELSIF :REQUEST = ''SAVE'' AND :P310_PASSWORD IS NULL AND :P310_VERIFY_PASSWORD IS NULL THEN'||unistr('\000a')||
'  RETURN FALSE;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'  RETURN TRUE;'||unistr('\000a')||
'END IF;',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_only_for_changed_rows=> 'Y',
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253275610146325181 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P310_PASSWORD is NOT NULL',
  p_validation_sequence=> 50,
  p_validation => 'P310_PASSWORD',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# must have some value.',
  p_always_execute=>'N',
  p_validation_condition=> 'RETURN sv_sec_admin.run_password_validation'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_password                 => :P310_PASSWORD,'||unistr('\000a')||
'  p_password_verify          => :P310_PASSWORD_VERIFY,'||unistr('\000a')||
'  p_request                  => :REQUEST'||unistr('\000a')||
'  );',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_associated_item=> 253228907433801158 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 253276504521342446 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P310_VERIFY_PASSWORD is NOT NULL',
  p_validation_sequence=> 60,
  p_validation => 'P310_VERIFY_PASSWORD',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#LABEL# must have some value.',
  p_always_execute=>'N',
  p_validation_condition=> 'RETURN sv_sec_admin.run_password_validation'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_password                 => :P310_PASSWORD,'||unistr('\000a')||
'  p_password_verify          => :P310_PASSWORD_VERIFY,'||unistr('\000a')||
'  p_request                  => :REQUEST'||unistr('\000a')||
'  );',
  p_validation_condition_type=> 'FUNCTION_BODY',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 253280714076660208 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 310
 ,p_name => 'Confirm Delete'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 253280401262656561 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 253281006639660211 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 310
 ,p_event_id => 253280714076660208 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => 'Are you sure that you want to delete this user?'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 253281320309662051 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 310
 ,p_event_id => 253280714076660208 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_01 => 'DELETE'
 ,p_attribute_02 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'sv_sec_admin.CREATE_USER('||unistr('\000a')||
'  p_user_name      => :P310_USER_NAME,'||unistr('\000a')||
'  p_password       => :P310_PASSWORD,'||unistr('\000a')||
'  p_email          => :P310_EMAIL,'||unistr('\000a')||
'  p_account_locked => :P310_ACCOUNT_LOCKED'||unistr('\000a')||
'  );';

wwv_flow_api.create_page_process(
  p_id     => 253228428427797777 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Create User',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>253228225525787436 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'User Created',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'sv_sec_admin.update_user'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_user_name                => :P310_USER_NAME,'||unistr('\000a')||
'  p_password                 => :P310_PASSWORD,'||unistr('\000a')||
'  p_email                    => :P310_EMAIL,'||unistr('\000a')||
'  p_account_locked           => :P310_ACCOUNT_LOCKED,'||unistr('\000a')||
'  p_reset_password           => :P310_RESET_PASSWORD'||unistr('\000a')||
'  );';

wwv_flow_api.create_page_process(
  p_id     => 253272831608255645 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Update User',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>253272030513151333 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'User Modified.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'sv_sec_admin.get_user'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_user_name => :P310_USER_NAME'||unistr('\000a')||
'  );';

wwv_flow_api.create_page_process(
  p_id     => 253271311335136291 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get User Name & ID',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P310_USER_NAME',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'sv_sec_admin.delete_user'||unistr('\000a')||
'  ('||unistr('\000a')||
'  p_user_name => :P310_USER_NAME'||unistr('\000a')||
'  );';

wwv_flow_api.create_page_process(
  p_id     => 253280505418657740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 310,
  p_process_sequence=> 10,
  p_process_point=> 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Delete User',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>253280401262656561 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'User Deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 310
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00400
prompt  ...PAGE 400: Preferences
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 400
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_PREFERENCES'
 ,p_name => 'Preferences'
 ,p_step_title => 'Preferences'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070225'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  snippet_id,'||unistr('\000a')||
'  snippet_key,'||unistr('\000a')||
'  snippet'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_snippets'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  editable = ''Y''';

wwv_flow_api.create_page_plug (
  p_id=> 254658513523072345 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 400,
  p_plug_name=> 'Preferences',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  snippet_id,'||unistr('\000a')||
'  snippet_key,'||unistr('\000a')||
'  snippet'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_snippets'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  editable = ''Y''';

wwv_flow_api.create_worksheet(
  p_id=> 254658606314072345+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 400,
  p_region_id=> 254658513523072345+wwv_flow_api.g_id_offset,
  p_name=> 'Preferences',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:410:&SESSION.::&DEBUG.::P410_SNIPPET_ID:#SNIPPET_ID#',
  p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 254658606314072345);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 254658808505072350+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 400,
  p_worksheet_id => 254658606314072345+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SNIPPET_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Snippet Id',
  p_report_label           =>'Snippet Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 254658904048072351+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 400,
  p_worksheet_id => 254658606314072345+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SNIPPET_KEY',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Preference',
  p_report_label           =>'Preference',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 254659011299072351+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 400,
  p_worksheet_id => 254658606314072345+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SNIPPET',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Value',
  p_report_label           =>'Value',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SNIPPET_ID:SNIPPET_KEY:SNIPPET:SNIPPET_CLOB';

wwv_flow_api.create_worksheet_rpt(
  p_id => 254659214561072651+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 400,
  p_worksheet_id => 254658606314072345+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2546593',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 400
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00410
prompt  ...PAGE 410: Manage Preference
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 410
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_PREFERENCES'
 ,p_name => 'Manage Preference'
 ,p_step_title => 'Manage Preference'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070230'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 254660214766140696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 410,
  p_plug_name=> 'Manage Preference',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 254660430954140696 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 410,
  p_button_sequence=> 30,
  p_button_plug_id => 254660214766140696+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P410_SNIPPET_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 254660618784140697 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 410,
  p_button_sequence=> 10,
  p_button_plug_id => 254660214766140696+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:400:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>254660822398140699 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:400:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>254661014761140701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_SNIPPET_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 254660214766140696+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Snippet Id',
  p_source=>'SNIPPET_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726449707451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>254661230877140710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_SNIPPET_KEY',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 254660214766140696+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Snippet Key',
  p_source=>'SNIPPET_KEY',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_read_only_when=>'P410_SNIPPET_ID',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>254661409550140712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 410,
  p_name=>'P410_SNIPPET',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 254660214766140696+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Snippet',
  p_source=>'SNIPPET',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726449707451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:SV_SEC_SNIPPETS:P410_SNIPPET_ID:SNIPPET_ID';

wwv_flow_api.create_page_process(
  p_id     => 254661805372140714 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from SV_SEC_SNIPPETS',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:SV_SEC_SNIPPETS:P410_SNIPPET_ID:SNIPPET_ID|U';

wwv_flow_api.create_page_process(
  p_id     => 254662014787140715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of SV_SEC_SNIPPETS',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'410';

wwv_flow_api.create_page_process(
  p_id     => 254662230278140715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 410,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 410
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00500
prompt  ...PAGE 500: Scheduled Individual Evaluations
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 500
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_SCHEDULING'
 ,p_name => 'Scheduled Individual Evaluations'
 ,p_step_title => 'Scheduled Individual Evaluations'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070237'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  se.sched_eval_id,'||unistr('\000a')||
'  se.scoring_method,'||unistr('\000a')||
'  se.application_id,'||unistr('\000a')||
'  se.eval_interval,'||unistr('\000a')||
'  TO_DATE(se.time_of_day,''HH24'') time,'||unistr('\000a')||
'  se.day_of_week,'||unistr('\000a')||
'  ats.attribute_set_name,'||unistr('\000a')||
'  a.application_name,'||unistr('\000a')||
'  se.scheduled_by || '' ('' || w.workspace || '')'' scheduled_by'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_evals se,'||unistr('\000a')||
'  sv_sec_attribute_sets ats,'||unistr('\000a')||
'  apex_applications a,'||unistr('\000a')||
'  apex_workspaces w'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  se.application_id = a.application_i';

s:=s||'d'||unistr('\000a')||
'  AND se.attribute_set_id = ats.attribute_set_id'||unistr('\000a')||
'  AND se.scheduled_ws = w.workspace_id  ';

wwv_flow_api.create_page_plug (
  p_id=> 255011531579530880 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_plug_name=> 'Scheduled Individual Evaluations',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  se.sched_eval_id,'||unistr('\000a')||
'  se.scoring_method,'||unistr('\000a')||
'  se.application_id,'||unistr('\000a')||
'  se.eval_interval,'||unistr('\000a')||
'  TO_DATE(se.time_of_day,''HH24'') time,'||unistr('\000a')||
'  se.day_of_week,'||unistr('\000a')||
'  ats.attribute_set_name,'||unistr('\000a')||
'  a.application_name,'||unistr('\000a')||
'  se.scheduled_by || '' ('' || w.workspace || '')'' scheduled_by'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_evals se,'||unistr('\000a')||
'  sv_sec_attribute_sets ats,'||unistr('\000a')||
'  apex_applications a,'||unistr('\000a')||
'  apex_workspaces w'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  se.application_id = a.application_i';

a1:=a1||'d'||unistr('\000a')||
'  AND se.attribute_set_id = ats.attribute_set_id'||unistr('\000a')||
'  AND se.scheduled_ws = w.workspace_id  ';

wwv_flow_api.create_worksheet(
  p_id=> 255011628999530881+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_region_id=> 255011531579530880+wwv_flow_api.g_id_offset,
  p_name=> 'Individual Scheduled Evaluations',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255011628999530881);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255011810925530890+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCORING_METHOD',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Scoring',
  p_report_label           =>'Scoring',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255011908930530894+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APPLICATION_ID',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'ID',
  p_report_label           =>'ID',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255012004748530894+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'EVAL_INTERVAL',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Interval',
  p_report_label           =>'Interval',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255012128653530894+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TIME',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Time',
  p_report_label           =>'Time',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'FMHH PM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255012214633530894+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DAY_OF_WEEK',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Day',
  p_report_label           =>'Day',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255012310591530895+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ATTRIBUTE_SET_NAME',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Attribute Set',
  p_report_label           =>'Attribute Set',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255012403091530895+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APPLICATION_NAME',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Application',
  p_report_label           =>'Application',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255012608168530895+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHEDULED_BY',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Scheduled By',
  p_report_label           =>'Scheduled By',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255031102133863627+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_EVAL_ID',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'&nbsp;',
  p_report_label           =>'&nbsp;',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'#',
  p_column_linktext        =>'<img src="#WORKSPACE_IMAGES#TRASH.gif" alt="Remove App">',
  p_column_link_attr       =>'class="removeEval" id="#SCHED_EVAL_ID#"',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'APPLICATION_ID:APPLICATION_NAME:ATTRIBUTE_SET_NAME:SCORING_METHOD:EVAL_INTERVAL:TIME:DAY_OF_WEEK:SCHEDULED_BY:SCHED_EVAL_ID:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255012832271531097+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 500,
  p_worksheet_id => 255011628999530881+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2550129',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'APPLICATION_ID',
  p_sort_direction_1        =>'DESC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>255031808151874846 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 500,
  p_name=>'P500_SCHED_EVAL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 255011531579530880+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 255031230876871924 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 500
 ,p_name => 'Remove App Evaluation'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.removeEval'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 255031532221871928 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 500
 ,p_event_id => 255031230876871924 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => 'Are you sure that you want to remove this scheduled evaluation?'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 255032121657878718 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 500
 ,p_event_id => 255031230876871924 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P500_SCHED_EVAL_ID'
 ,p_attribute_01 => 'JAVASCRIPT_EXPRESSION'
 ,p_attribute_05 => 'this.triggeringElement.id;'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 255032332392881808 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 500
 ,p_event_id => 255031230876871924 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'DELETE FROM sv_sec_sched_evals'||unistr('\000a')||
'  WHERE sched_eval_id = :P500_SCHED_EVAL_ID;'
 ,p_attribute_02 => 'P500_SCHED_EVAL_ID'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 255032503087882902 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 500
 ,p_event_id => 255031230876871924 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 40
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 255011531579530880 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 500
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00510
prompt  ...PAGE 510: Scheduled Group Evaluations
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 510
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_SCHEDULING'
 ,p_name => 'Scheduled Group Evaluations'
 ,p_step_title => 'Scheduled Group Evaluations'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Scheduled Group Evaluations'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070242'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  TO_DATE(sge.time_of_day,''HH24'') time_of_day,'||unistr('\000a')||
'  sge.eval_interval,'||unistr('\000a')||
'  sge.day_of_week,'||unistr('\000a')||
'  sg.sched_grp_name,'||unistr('\000a')||
'  sl.sched_list_name,'||unistr('\000a')||
'  sl.sched_list_id,'||unistr('\000a')||
'  sg.sched_grp_id,'||unistr('\000a')||
'  sge.sched_grp_eval_id,'||unistr('\000a')||
'  sg.created_by || '' ('' || w.workspace || '')'' created_by'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_grp_evals sge,'||unistr('\000a')||
'  sv_sec_sched_grp sg,'||unistr('\000a')||
'  sv_sec_sched_lists sl,'||unistr('\000a')||
'  apex_workspaces w'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sge.sched_grp_id = sg.sched_grp';

s:=s||'_id'||unistr('\000a')||
'  AND sg.sched_list_id = sl.sched_list_id'||unistr('\000a')||
'  AND sg.created_ws = w.workspace_id';

wwv_flow_api.create_page_plug (
  p_id=> 255020423590605192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_plug_name=> 'Scheduled Group Evaluations',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  TO_DATE(sge.time_of_day,''HH24'') time_of_day,'||unistr('\000a')||
'  sge.eval_interval,'||unistr('\000a')||
'  sge.day_of_week,'||unistr('\000a')||
'  sg.sched_grp_name,'||unistr('\000a')||
'  sl.sched_list_name,'||unistr('\000a')||
'  sl.sched_list_id,'||unistr('\000a')||
'  sg.sched_grp_id,'||unistr('\000a')||
'  sge.sched_grp_eval_id,'||unistr('\000a')||
'  sg.created_by || '' ('' || w.workspace || '')'' created_by'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_grp_evals sge,'||unistr('\000a')||
'  sv_sec_sched_grp sg,'||unistr('\000a')||
'  sv_sec_sched_lists sl,'||unistr('\000a')||
'  apex_workspaces w'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sge.sched_grp_id = sg.sched_grp';

a1:=a1||'_id'||unistr('\000a')||
'  AND sg.sched_list_id = sl.sched_list_id'||unistr('\000a')||
'  AND sg.created_ws = w.workspace_id';

wwv_flow_api.create_worksheet(
  p_id=> 255020531245605192+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_region_id=> 255020423590605192+wwv_flow_api.g_id_offset,
  p_name=> 'Scheduled Group Evaluations',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255020531245605192);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255020700957605193+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TIME_OF_DAY',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Time',
  p_report_label           =>'Time',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'FMHH PM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255020826753605193+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'EVAL_INTERVAL',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Interval',
  p_report_label           =>'Interval',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255020932188605193+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DAY_OF_WEEK',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Day',
  p_report_label           =>'Day',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255021001752605193+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_GRP_NAME',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Schedule Group',
  p_report_label           =>'Schedule Group',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255021121213605194+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_LIST_NAME',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Distribution List',
  p_report_label           =>'Distribution List',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255021222952605194+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_LIST_ID',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Sched List Id',
  p_report_label           =>'Sched List Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255021332727605194+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_GRP_ID',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Sched Grp Id',
  p_report_label           =>'Sched Grp Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255021510916605195+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_BY',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Created By',
  p_report_label           =>'Created By',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255026823988755839+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_GRP_EVAL_ID',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'&nbsp;',
  p_report_label           =>'&nbsp;',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'#',
  p_column_linktext        =>'<img src="#WORKSPACE_IMAGES#TRASH.gif" title="Remove">',
  p_column_link_attr       =>'class="removeEval" id="#SCHED_GRP_EVAL_ID#"',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SCHED_GRP_NAME:SCHED_LIST_NAME:EVAL_INTERVAL:TIME_OF_DAY:DAY_OF_WEEK:CREATED_BY:SCHED_GRP_EVAL_ID:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255021727086605333+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 510,
  p_worksheet_id => 255020531245605192+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2550218',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'SCHED_GRP_NAME',
  p_sort_direction_1        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>255034432008929019 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 510,
  p_name=>'P510_SCHED_GRP_EVAL_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 255020423590605192+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 255032828283909020 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 510
 ,p_name => 'Remove App Evaluation'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => 'a.removeEval'
 ,p_bind_type => 'live'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 255033117747909027 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 510
 ,p_event_id => 255032828283909020 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_CONFIRM'
 ,p_attribute_01 => 'Are you sure that you want to remove this scheduled group evaluation?'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 255033304407909027 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 510
 ,p_event_id => 255032828283909020 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SET_VALUE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P510_SCHED_GRP_EVAL_ID'
 ,p_attribute_01 => 'JAVASCRIPT_EXPRESSION'
 ,p_attribute_05 => 'this.triggeringElement.id;'
 ,p_attribute_09 => 'N'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 255033501975909027 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 510
 ,p_event_id => 255032828283909020 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 30
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_EXECUTE_PLSQL_CODE'
 ,p_attribute_01 => 'DELETE FROM sv_sec_sched_grp_evals'||unistr('\000a')||
'  WHERE sched_grp_eval_id = :P510_SCHED_GRP_EVAL_ID;'
 ,p_attribute_02 => 'P510_SCHED_GRP_EVAL_ID'
 ,p_stop_execution_on_error => 'Y'
 ,p_wait_for_result => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 255033710311909027 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 510
 ,p_event_id => 255032828283909020 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 40
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 255020423590605192 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 510
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00520
prompt  ...PAGE 520: Schedule Groups
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 520
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_SCHEDULING'
 ,p_name => 'Schedule Groups'
 ,p_step_title => 'Schedule Groups'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Schedule Groups'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070247'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  sg.sched_grp_id,'||unistr('\000a')||
'  sg.sched_grp_name,'||unistr('\000a')||
'  sg.created_on,'||unistr('\000a')||
'  l.sched_list_name,'||unistr('\000a')||
'  l.sched_list_id,'||unistr('\000a')||
'  sg.created_by || '' ('' || w.workspace || '')'' created_by,'||unistr('\000a')||
'  COUNT(sga.sched_grp_app_id) number_of_apps'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_grp sg,'||unistr('\000a')||
'  apex_workspaces w,'||unistr('\000a')||
'  sv_sec_sched_lists l,'||unistr('\000a')||
'  sv_sec_sched_grp_apps sga'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sg.created_ws = w.workspace_id'||unistr('\000a')||
'  AND sg.sched_list_id = l.sched_list_id'||unistr('\000a')||
'  AND sg.sch';

s:=s||'ed_grp_id = sga.sched_grp_id(+)'||unistr('\000a')||
'GROUP BY'||unistr('\000a')||
'  sg.sched_grp_id,'||unistr('\000a')||
'  sg.sched_grp_name,'||unistr('\000a')||
'  sg.created_on,'||unistr('\000a')||
'  l.sched_list_name,'||unistr('\000a')||
'  l.sched_list_id,'||unistr('\000a')||
'  sg.created_by || '' ('' || w.workspace || '')''';

wwv_flow_api.create_page_plug (
  p_id=> 255023300638645352 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_plug_name=> 'Schedule Groups',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  sg.sched_grp_id,'||unistr('\000a')||
'  sg.sched_grp_name,'||unistr('\000a')||
'  sg.created_on,'||unistr('\000a')||
'  l.sched_list_name,'||unistr('\000a')||
'  l.sched_list_id,'||unistr('\000a')||
'  sg.created_by || '' ('' || w.workspace || '')'' created_by,'||unistr('\000a')||
'  COUNT(sga.sched_grp_app_id) number_of_apps'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_grp sg,'||unistr('\000a')||
'  apex_workspaces w,'||unistr('\000a')||
'  sv_sec_sched_lists l,'||unistr('\000a')||
'  sv_sec_sched_grp_apps sga'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sg.created_ws = w.workspace_id'||unistr('\000a')||
'  AND sg.sched_list_id = l.sched_list_id'||unistr('\000a')||
'  AND sg.sch';

a1:=a1||'ed_grp_id = sga.sched_grp_id(+)'||unistr('\000a')||
'GROUP BY'||unistr('\000a')||
'  sg.sched_grp_id,'||unistr('\000a')||
'  sg.sched_grp_name,'||unistr('\000a')||
'  sg.created_on,'||unistr('\000a')||
'  l.sched_list_name,'||unistr('\000a')||
'  l.sched_list_id,'||unistr('\000a')||
'  sg.created_by || '' ('' || w.workspace || '')''';

wwv_flow_api.create_worksheet(
  p_id=> 255023413326645352+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_region_id=> 255023300638645352+wwv_flow_api.g_id_offset,
  p_name=> 'Schedule Groups',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:525:&SESSION.::&DEBUG.::P525_SCHED_GRP_ID:#SCHED_GRP_ID#',
  p_detail_link_text=>'<img src="#WORKSPACE_IMAGES#EDIT.gif">',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255023413326645352);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255023608306645353+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_GRP_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Sched Grp Id',
  p_report_label           =>'Sched Grp Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255023732697645353+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_GRP_NAME',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Group Name',
  p_report_label           =>'Group Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255023810185645353+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_ON',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Created On',
  p_report_label           =>'Created On',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255023904157645353+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_LIST_NAME',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Notification List',
  p_report_label           =>'Notification List',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255024030502645354+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_LIST_ID',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Sched List Id',
  p_report_label           =>'Sched List Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255024121991645354+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_BY',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Created By',
  p_report_label           =>'Created By',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255024329462645354+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NUMBER_OF_APPS',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'# of Apps',
  p_report_label           =>'# of Apps',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SCHED_GRP_NAME:SCHED_LIST_NAME:CREATED_BY:CREATED_ON:NUMBER_OF_APPS:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255024402461645491+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 520,
  p_worksheet_id => 255023413326645352+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2550245',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'SCHED_GRP_NAME',
  p_sort_direction_1        =>'ASC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 520
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00525
prompt  ...PAGE 525: Manage Schedule Groups
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 525
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_SCHEDULING'
 ,p_name => 'Manage Schedule Groups'
 ,p_step_title => 'Manage Schedule Groups'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
 ,p_step_template => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070251'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 255034922370976197 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_plug_name=> 'Manage Schedule Groups',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  sga.application_id,'||unistr('\000a')||
'  sga.scoring_method,'||unistr('\000a')||
'  w.workspace,'||unistr('\000a')||
'  ats.attribute_set_name,'||unistr('\000a')||
'  a.application_name,'||unistr('\000a')||
'  sga.save_pdf'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_grp_apps sga,'||unistr('\000a')||
'  apex_workspaces w,'||unistr('\000a')||
'  sv_sec_attribute_sets ats,'||unistr('\000a')||
'  apex_applications a'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sga.workspace_id = w.workspace_id'||unistr('\000a')||
'  AND sga.attribute_set_id = ats.attribute_set_id'||unistr('\000a')||
'  AND sga.application_id = a.application_id'||unistr('\000a')||
'  AND sga.sched_grp_id = :P52';

s:=s||'5_SCHED_GRP_ID';

wwv_flow_api.create_page_plug (
  p_id=> 255040312325027440 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_plug_name=> 'Scheduled Group Applications',
  p_region_name=>'',
  p_parent_plug_id=>255034922370976197 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'N',
  p_plug_template=> 778723108686973860+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  sga.application_id,'||unistr('\000a')||
'  sga.scoring_method,'||unistr('\000a')||
'  w.workspace,'||unistr('\000a')||
'  ats.attribute_set_name,'||unistr('\000a')||
'  a.application_name,'||unistr('\000a')||
'  sga.save_pdf'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_grp_apps sga,'||unistr('\000a')||
'  apex_workspaces w,'||unistr('\000a')||
'  sv_sec_attribute_sets ats,'||unistr('\000a')||
'  apex_applications a'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sga.workspace_id = w.workspace_id'||unistr('\000a')||
'  AND sga.attribute_set_id = ats.attribute_set_id'||unistr('\000a')||
'  AND sga.application_id = a.application_id'||unistr('\000a')||
'  AND sga.sched_grp_id = :P52';

a1:=a1||'5_SCHED_GRP_ID';

wwv_flow_api.create_worksheet(
  p_id=> 255040424550027440+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_region_id=> 255040312325027440+wwv_flow_api.g_id_offset,
  p_name=> 'Scheduled Group Applications',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255040424550027440);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255040802848027485+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_worksheet_id => 255040424550027440+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APPLICATION_ID',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'ID',
  p_report_label           =>'ID',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255040919853027485+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_worksheet_id => 255040424550027440+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCORING_METHOD',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Scoring',
  p_report_label           =>'Scoring',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255041022569027485+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_worksheet_id => 255040424550027440+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'WORKSPACE',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Workspace',
  p_report_label           =>'Workspace',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255041101411027485+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_worksheet_id => 255040424550027440+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ATTRIBUTE_SET_NAME',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Attr Set',
  p_report_label           =>'Attr Set',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255041229073027486+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_worksheet_id => 255040424550027440+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'APPLICATION_NAME',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Name',
  p_report_label           =>'Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255041325342027486+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_worksheet_id => 255040424550027440+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SAVE_PDF',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'PDF',
  p_report_label           =>'PDF',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'EDIT:REMOVE:APPLICATION_ID:SCORING_METHOD:WORKSPACE:ATTRIBUTE_SET_NAME:APPLICATION_NAME:SAVE_PDF';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255041413710027874+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 525,
  p_worksheet_id => 255040424550027440+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2550415',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 255035106618976198 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 525,
  p_button_sequence=> 30,
  p_button_plug_id => 255034922370976197+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P525_SCHED_GRP_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 255035417317976200 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 525,
  p_button_sequence=> 10,
  p_button_plug_id => 255034922370976197+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:520:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 255035232644976198 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 525,
  p_button_sequence=> 20,
  p_button_plug_id => 255034922370976197+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'P525_SCHED_GRP_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>255035931817976204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 525,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:520:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>255036124056976206 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 525,
  p_name=>'P525_SCHED_GRP_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 255034922370976197+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Sched Grp Id',
  p_source=>'SCHED_GRP_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726449707451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>255036318106976213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 525,
  p_name=>'P525_SCHED_GRP_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 255034922370976197+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Group Name',
  p_source=>'SCHED_GRP_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>255036532732976214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 525,
  p_name=>'P525_SCHED_LIST_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 255034922370976197+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Notification List',
  p_source=>'SCHED_LIST_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'SELECT'||unistr('\000a')||
'  sched_list_name,'||unistr('\000a')||
'  sched_list_id'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_lists'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  created_by||created_ws = (SELECT created_by||created_ws FROM sv_sec_sched_grp WHERE sched_grp_id = :P525_SCHED_GRP_ID)'||unistr('\000a')||
'ORDER BY'||unistr('\000a')||
'  sched_list_name',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:SV_SEC_SCHED_GRP:P525_SCHED_GRP_ID:SCHED_GRP_ID';

wwv_flow_api.create_page_process(
  p_id     => 255036921141976217 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 525,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from SV_SEC_SCHED_GRP',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:SV_SEC_SCHED_GRP:P525_SCHED_GRP_ID:SCHED_GRP_ID|UD';

wwv_flow_api.create_page_process(
  p_id     => 255037121836976220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 525,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of SV_SEC_SCHED_GRP',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'525';

wwv_flow_api.create_page_process(
  p_id     => 255037328743976221 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 525,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>255035232644976198 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 525
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00530
prompt  ...PAGE 530: Notification Lists
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 530
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_SCHEDULING'
 ,p_name => 'Notification Lists'
 ,p_step_title => 'Notification Lists'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Notification Lists'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070256'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  sl.sched_list_id,'||unistr('\000a')||
'  sl.sched_list_name,'||unistr('\000a')||
'  sl.created_on,'||unistr('\000a')||
'  sl.created_by || '' ('' || w.workspace || '')'' created_by,'||unistr('\000a')||
'  COUNT(slm.sched_list_member_id) number_of_members'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_lists sl,'||unistr('\000a')||
'  sv_sec_sched_list_members slm,'||unistr('\000a')||
'  apex_workspaces w'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sl.created_ws = w.workspace_id'||unistr('\000a')||
'  AND sl.sched_list_id = slm.sched_list_id(+)'||unistr('\000a')||
'GROUP BY'||unistr('\000a')||
'  sl.sched_list_id,'||unistr('\000a')||
'  sl.sched_list_name,'||unistr('\000a')||
'  sl.';

s:=s||'created_on,'||unistr('\000a')||
'  sl.created_by || '' ('' || w.workspace || '')''';

wwv_flow_api.create_page_plug (
  p_id=> 255025507712652497 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_plug_name=> 'Notification Lists',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  sl.sched_list_id,'||unistr('\000a')||
'  sl.sched_list_name,'||unistr('\000a')||
'  sl.created_on,'||unistr('\000a')||
'  sl.created_by || '' ('' || w.workspace || '')'' created_by,'||unistr('\000a')||
'  COUNT(slm.sched_list_member_id) number_of_members'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_lists sl,'||unistr('\000a')||
'  sv_sec_sched_list_members slm,'||unistr('\000a')||
'  apex_workspaces w'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sl.created_ws = w.workspace_id'||unistr('\000a')||
'  AND sl.sched_list_id = slm.sched_list_id(+)'||unistr('\000a')||
'GROUP BY'||unistr('\000a')||
'  sl.sched_list_id,'||unistr('\000a')||
'  sl.sched_list_name,'||unistr('\000a')||
'  sl.';

a1:=a1||'created_on,'||unistr('\000a')||
'  sl.created_by || '' ('' || w.workspace || '')''';

wwv_flow_api.create_worksheet(
  p_id=> 255025614195652498+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_region_id=> 255025507712652497+wwv_flow_api.g_id_offset,
  p_name=> 'Notification Lists',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_detail_link=>'f?p=&APP_ID.:535:&SESSION.::&DEBUG.::P535_SCHED_LIST_ID:#SCHED_LIST_ID#',
  p_detail_link_text=>'<img src="#WORKSPACE_IMAGES#EDIT.gif">',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255025614195652498);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255025809053652499+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_worksheet_id => 255025614195652498+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_LIST_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Sched List Id',
  p_report_label           =>'Sched List Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255025914153652499+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_worksheet_id => 255025614195652498+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCHED_LIST_NAME',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Notification List',
  p_report_label           =>'Notification List',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255026020943652499+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_worksheet_id => 255025614195652498+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_ON',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Created On',
  p_report_label           =>'Created On',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255026103118652500+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_worksheet_id => 255025614195652498+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_BY',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Created By',
  p_report_label           =>'Created By',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255026210597652500+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_worksheet_id => 255025614195652498+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NUMBER_OF_MEMBERS',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'# of Members',
  p_report_label           =>'# of Members',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'SCHED_LIST_NAME:CREATED_BY:CREATED_ON:NUMBER_OF_MEMBERS:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255026327048652629+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 530,
  p_worksheet_id => 255025614195652498+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2550264',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 530
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00535
prompt  ...PAGE 535: Manage Notification Lists
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 535
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_SCHEDULING'
 ,p_name => 'Manage Notification Lists'
 ,p_step_title => 'Manage Notification Lists'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
 ,p_step_template => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070301'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 255042430584072627 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_plug_name=> 'Manage Notification Lists',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  first_name,'||unistr('\000a')||
'  last_name,'||unistr('\000a')||
'  email,'||unistr('\000a')||
'  include_pdfs'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_list_members'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sched_list_id = :P535_SCHED_LIST_ID';

wwv_flow_api.create_page_plug (
  p_id=> 255045022677077692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_plug_name=> 'Notification List Members',
  p_region_name=>'',
  p_parent_plug_id=>255042430584072627 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'N',
  p_plug_template=> 778723108686973860+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  first_name,'||unistr('\000a')||
'  last_name,'||unistr('\000a')||
'  email,'||unistr('\000a')||
'  include_pdfs'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  sv_sec_sched_list_members'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  sched_list_id = :P535_SCHED_LIST_ID';

wwv_flow_api.create_worksheet(
  p_id=> 255045114376077692+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_region_id=> 255045022677077692+wwv_flow_api.g_id_offset,
  p_name=> 'Notification List Members',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'Y',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'Y',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'Y',
  p_allow_hide_extra_columns=>'Y',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255045114376077692);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255045326973077693+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_worksheet_id => 255045114376077692+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FIRST_NAME',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'First Name',
  p_report_label           =>'First Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255045426261077695+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_worksheet_id => 255045114376077692+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LAST_NAME',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Last Name',
  p_report_label           =>'Last Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255045509032077696+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_worksheet_id => 255045114376077692+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'EMAIL',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Email',
  p_report_label           =>'Email',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255045630472077697+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_worksheet_id => 255045114376077692+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'INCLUDE_PDFS',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Include PDFs',
  p_report_label           =>'Include PDFs',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'FIRST_NAME:LAST_NAME:EMAIL:INCLUDE_PDFS';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255045723023077872+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 535,
  p_worksheet_id => 255045114376077692+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2550458',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 255042606452072628 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 535,
  p_button_sequence=> 30,
  p_button_plug_id => 255042430584072627+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P535_SCHED_LIST_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 255042932587072629 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 535,
  p_button_sequence=> 10,
  p_button_plug_id => 255042430584072627+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:530:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 255042727232072628 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 535,
  p_button_sequence=> 20,
  p_button_plug_id => 255042430584072627+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'N',
  p_button_condition=> 'P535_SCHED_LIST_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>255043407237072633 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 535,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:530:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>255043626987072634 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 535,
  p_name=>'P535_SCHED_LIST_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 255042430584072627+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Sched List Id',
  p_source=>'SCHED_LIST_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726449707451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>255043831074072643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 535,
  p_name=>'P535_SCHED_LIST_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 255042430584072627+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Notification List Name',
  p_source=>'SCHED_LIST_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 798726666474451704+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:SV_SEC_SCHED_LISTS:P535_SCHED_LIST_ID:SCHED_LIST_ID';

wwv_flow_api.create_page_process(
  p_id     => 255044218819072647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 535,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from SV_SEC_SCHED_LISTS',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:SV_SEC_SCHED_LISTS:P535_SCHED_LIST_ID:SCHED_LIST_ID|UD';

wwv_flow_api.create_page_process(
  p_id     => 255044427702072648 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 535,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of SV_SEC_SCHED_LISTS',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'535';

wwv_flow_api.create_page_process(
  p_id     => 255044602202072648 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 535,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>255042727232072628 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 535
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00540
prompt  ...PAGE 540: Job Runs
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 540
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_SCHEDULING'
 ,p_name => 'Job Runs'
 ,p_step_title => 'Job Runs'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20140717070305'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select * from all_scheduler_job_run_details'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  job_name LIKE ''SV_SERT%''';

wwv_flow_api.create_page_plug (
  p_id=> 255016114441563769 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_plug_name=> 'Job Runs',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select * from all_scheduler_job_run_details'||unistr('\000a')||
'WHERE'||unistr('\000a')||
'  job_name LIKE ''SV_SERT%''';

wwv_flow_api.create_worksheet(
  p_id=> 255016223583563770+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_region_id=> 255016114441563769+wwv_flow_api.g_id_offset,
  p_name=> 'Job Runs',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'Y',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'Y',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'Y',
  p_allow_hide_extra_columns=>'Y',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255016223583563770);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255016409479563774+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LOG_ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Log ID',
  p_report_label           =>'Log ID',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255016531342563774+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LOG_DATE',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Log Date',
  p_report_label           =>'Log Date',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'DD-MON-YYYY HH:MIPM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255016607490563775+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'OWNER',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Owner',
  p_report_label           =>'Owner',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255016709866563775+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'JOB_NAME',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Job Name',
  p_report_label           =>'Job Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255016821235563775+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'JOB_SUBNAME',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Job Subname',
  p_report_label           =>'Job Subname',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255016902312563775+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'STATUS',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Status',
  p_report_label           =>'Status',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017003097563775+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ERROR#',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Error#',
  p_report_label           =>'Error#',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017124111563776+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'REQ_START_DATE',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Req Start Date',
  p_report_label           =>'Req Start Date',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'DD-MON-YYYY HH:MIPM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017204594563776+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ACTUAL_START_DATE',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Actual Start Date',
  p_report_label           =>'Actual Start Date',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'DD-MON-YYYY HH:MIPM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017317244563776+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'RUN_DURATION',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Run Duration',
  p_report_label           =>'Run Duration',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'N',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'OTHER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017426766563776+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'INSTANCE_ID',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Instance Id',
  p_report_label           =>'Instance Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017521776563777+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SESSION_ID',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Session Id',
  p_report_label           =>'Session Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017625050563777+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SLAVE_PID',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Slave Pid',
  p_report_label           =>'Slave Pid',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017706931563777+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CPU_USED',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'Cpu Used',
  p_report_label           =>'Cpu Used',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'N',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'OTHER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017820324563777+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREDENTIAL_OWNER',
  p_display_order          =>15,
  p_column_identifier      =>'O',
  p_column_label           =>'Credential Owner',
  p_report_label           =>'Credential Owner',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255017915667563777+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREDENTIAL_NAME',
  p_display_order          =>16,
  p_column_identifier      =>'P',
  p_column_label           =>'Credential Name',
  p_report_label           =>'Credential Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255018001088563778+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DESTINATION_OWNER',
  p_display_order          =>17,
  p_column_identifier      =>'Q',
  p_column_label           =>'Destination Owner',
  p_report_label           =>'Destination Owner',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255018120108563778+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DESTINATION',
  p_display_order          =>18,
  p_column_identifier      =>'R',
  p_column_label           =>'Destination',
  p_report_label           =>'Destination',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255018205329563778+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ADDITIONAL_INFO',
  p_display_order          =>19,
  p_column_identifier      =>'S',
  p_column_label           =>'Additional Info',
  p_report_label           =>'Additional Info',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'LOG_ID:LOG_DATE:JOB_NAME:STATUS:ERROR#:ADDITIONAL_INFO';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255018315134564005+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 540,
  p_worksheet_id => 255016223583563770+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2550184',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'LOG_ID',
  p_sort_direction_1        =>'DESC',
  p_sort_column_2           =>'LOG_DATE',
  p_sort_direction_2        =>'DESC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 540
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01500
prompt  ...PAGE 1500: Logs
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1500
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_LOGS'
 ,p_name => 'Logs'
 ,p_step_title => 'Logs'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_required_role => 'MUST_NOT_BE_PUBLIC_USER'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20141022143013'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT * FROM logger_logs';

wwv_flow_api.create_page_plug (
  p_id=> 780323865044607269 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_plug_name=> 'Logs',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 798712839278451694+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT * FROM logger_logs';

wwv_flow_api.create_worksheet(
  p_id=> 780323958897607269+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_region_id=> 780323865044607269+wwv_flow_api.g_id_offset,
  p_name=> 'Logs',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '10000',
  p_max_row_count_message=> 'This query returns more than 10,000 rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'Y',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'Y',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV',
  p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />',
  p_allow_exclude_null_values=>'Y',
  p_allow_hide_extra_columns=>'Y',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 780323958897607269);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324155452607312+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Id',
  p_report_label           =>'Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324260577607323+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LOGGER_LEVEL',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Logger Level',
  p_report_label           =>'Logger Level',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324370436607324+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TEXT',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Text',
  p_report_label           =>'Text',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324477512607324+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TIME_STAMP',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Time Stamp',
  p_report_label           =>'Time Stamp',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324557488607324+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCOPE',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Scope',
  p_report_label           =>'Scope',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324666818607324+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MODULE',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Module',
  p_report_label           =>'Module',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324769780607324+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ACTION',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Action',
  p_report_label           =>'Action',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324883087607324+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'USER_NAME',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'User Name',
  p_report_label           =>'User Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780324974014607324+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CLIENT_IDENTIFIER',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Client Identifier',
  p_report_label           =>'Client Identifier',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780325078299607325+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CALL_STACK',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Call Stack',
  p_report_label           =>'Call Stack',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780325184334607325+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'UNIT_NAME',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Unit Name',
  p_report_label           =>'Unit Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780325277631607325+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LINE_NO',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Line No',
  p_report_label           =>'Line No',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780325359576607325+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SCN',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Scn',
  p_report_label           =>'Scn',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 780325475886607325+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'EXTRA',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'Extra',
  p_report_label           =>'Extra',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'TIME_STAMP:ACTION:TEXT';

wwv_flow_api.create_worksheet_rpt(
  p_id => 780325578253608005+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1500,
  p_worksheet_id => 780323958897607269+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'12871',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'TIME_STAMP',
  p_sort_direction_1        =>'DESC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 780327979863674696 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1500,
  p_button_sequence=> 10,
  p_button_plug_id => 780323865044607269+wwv_flow_api.g_id_offset,
  p_button_name    => 'PURGE_LOGS',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(798710242842451693+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Purge Logs',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(''Are you sure? \n\nPurging the log will remove all entries, and can not be undone.'', ''PURGE'');'||unistr('\000a')||
'',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>780328562332679121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1500,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:1500:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-JAN-2011 09:14 by SSPENDOL');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'delete from logger_logs;';

wwv_flow_api.create_page_process(
  p_id     => 780328667873680710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1500,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Purge Logs',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> 'Logs Purged.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1500
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_01600
prompt  ...PAGE 1600: Mail Queue
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1600
 ,p_user_interface_id => 218208518691772893 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_MAILQUEUE'
 ,p_name => 'Mail Queue'
 ,p_step_title => 'Mail Queue'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Mail Queue'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'SSPENDOL'
 ,p_last_upd_yyyymmddhh24miss => '20141022150635'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  *'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  apex_mail_queue';

wwv_flow_api.create_page_plug (
  p_id=> 255449624611823401 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_plug_name=> 'Mail Queue',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 763788715263678546+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT'||unistr('\000a')||
'  *'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  apex_mail_queue';

wwv_flow_api.create_worksheet(
  p_id=> 255449732724823401+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_region_id=> 255449624611823401+wwv_flow_api.g_id_offset,
  p_name=> 'Mail Queue',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV:HTML:EMAIL',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'SSPENDOL',
  p_internal_uid=> 255449732724823401);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255449913956823404+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'ID',
  p_report_label           =>'ID',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450003909823410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_TO',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'To',
  p_report_label           =>'To',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450114387823410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_FROM',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'From',
  p_report_label           =>'From',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450216728823410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_REPLYTO',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Reply To',
  p_report_label           =>'Reply To',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450316483823410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_SUBJ',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Subject',
  p_report_label           =>'Subject',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450403869823411+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_CC',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'CC',
  p_report_label           =>'CC',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450521182823411+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_BCC',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'BCC',
  p_report_label           =>'BCC',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450622118823411+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_BODY',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'Body',
  p_report_label           =>'Body',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450716014823411+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_BODY_HTML',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'Body (HTML)',
  p_report_label           =>'Body (HTML)',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450801860823411+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_SEND_COUNT',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'Send Count',
  p_report_label           =>'Send Count',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255450913762823412+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'MAIL_SEND_ERROR',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Send Error',
  p_report_label           =>'Send Error',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255451023847823412+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LAST_UPDATED_BY',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Last Updated By',
  p_report_label           =>'Last Updated By',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 255451112242823413+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LAST_UPDATED_ON',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Last Updated On',
  p_report_label           =>'Last Updated On',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'CENTER',
  p_format_mask            =>'DD-MON-YYYY HH:MIPM',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:MAIL_TO:MAIL_FROM:MAIL_REPLYTO:MAIL_SUBJ:MAIL_SEND_COUNT:MAIL_SEND_ERROR:LAST_UPDATED_ON:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 255451422687825700+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1600,
  p_worksheet_id => 255449732724823401+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'2554515',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1600
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/scheduling
 
begin
 
wwv_flow_api.create_list (
  p_id=> 255013332402540618 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Scheduling',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 255013704136541931 + wwv_flow_api.g_id_offset,
  p_list_id=> 255013332402540618 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Individual Evaluations',
  p_list_item_link_target=> 'f?p=&APP_ID.:500:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 255014501151550527 + wwv_flow_api.g_id_offset,
  p_list_id=> 255013332402540618 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Group Evaluations',
  p_list_item_link_target=> 'f?p=&APP_ID.:510:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 255014710847553270 + wwv_flow_api.g_id_offset,
  p_list_id=> 255013332402540618 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Schedule Groups',
  p_list_item_link_target=> 'f?p=&APP_ID.:520:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '520,525',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 255015019505555823 + wwv_flow_api.g_id_offset,
  p_list_id=> 255013332402540618 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Notification Lists',
  p_list_item_link_target=> 'f?p=&APP_ID.:530:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '530,535',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 255015226777557908 + wwv_flow_api.g_id_offset,
  p_list_id=> 255013332402540618 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'Job Runs',
  p_list_item_link_target=> 'f?p=&APP_ID.:540:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 799351041276602597 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
wwv_flow_api.create_menu_option (
  p_id=>253205001193169325 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Users',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:300:&SESSION.',
  p_page_id=>300,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>253227317038778905 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>253205001193169325 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Create User',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:310:&SESSION.',
  p_page_id=>310,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>254657721917059258 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Preferences',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:400:&SESSION.',
  p_page_id=>400,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>254662512845140715 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>254657721917059258 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Manage Preference',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:410:&SESSION.',
  p_page_id=>410,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>254984922352974352 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Scheduled Individual Evaluations',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::',
  p_page_id=>500,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>255015923291560952 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Job Runs',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:540:&SESSION.',
  p_page_id=>540,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>255020332154605192 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Scheduled Group Evaluations',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:510:&SESSION.',
  p_page_id=>510,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>255023230488645352 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Schedule Groups',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:520:&SESSION.',
  p_page_id=>520,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>255025406409652497 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Notification Lists',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:530:&SESSION.',
  p_page_id=>530,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>255037626144976224 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>255023230488645352 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Manage Schedule Groups',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:525:&SESSION.',
  p_page_id=>525,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>255044901819072652 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>255025406409652497 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Manage Notification Lists',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:535:&SESSION.',
  p_page_id=>535,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_menu_option (
  p_id=>255449501458823400 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Mail Queue',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:1600:&SESSION.',
  p_page_id=>1600,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>506285725877703442 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>null,
  p_option_sequence=>10,
  p_short_name=>'Page Zero',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:0:&SESSION.',
  p_page_id=>0,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>506367629553320900 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Roles',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:200:&SESSION.',
  p_page_id=>200,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>506377243197404544 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>506367629553320900 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Manage Roles',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:210:&SESSION.',
  p_page_id=>210,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>780323054367042681 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Logs',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:1500:&SESSION.',
  p_page_id=>1500,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>799351543793602645 + wwv_flow_api.g_id_offset,
  p_menu_id=>799351041276602597 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Home',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_page_id=>1,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

prompt  ...page templates for application: 202
--
--application/shared_components/user_interface/templates/page/error_page
prompt  ......Page template 763968397529181090
 
begin
 
wwv_flow_api.create_template (
  p_id => 763968397529181090 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'Error Page'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if gte IE 7]>'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if !IE]> -->'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<!-- <![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#IMAGE_PREFIX#libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'
 ,p_box => 
'<div id="body">'||unistr('\000a')||
' <div id="two-col-sb-left">'||unistr('\000a')||
'  <div id="left-sidebar">'||unistr('\000a')||
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  <div id="main">'||unistr('\000a')||
'   <div id="main-sb-left">'||unistr('\000a')||
'    <div id="menu">'||unistr('\000a')||
'     <div id="navbar">#NAVIGATION_BAR#<span class="app-user">&USER.</span></div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="box-body">'||unistr('\000a')||
'   <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFIC'||
'ATION#</div>'||unistr('\000a')||
'   <div class="notification" id="notification-message" style="text-align:center;">'||unistr('\000a')||
'An error has occurred and has been logged.</div>'||unistr('\000a')||
'<div class="formRegion">'||unistr('\000a')||
'  <div class="formRegionHeader">'||unistr('\000a')||
'    <div class="formRegionTitleNoHelp">Error</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="formRegionContent">'||unistr('\000a')||
'  <span style="font-size:12px;">'||unistr('\000a')||
'  Complete error details, including the stack trace, are available in '||
'the <a href="f?p=&APP_ID.:1500:&APP_SESSION.">Error Log</a>.</span>'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="right-sidebar"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
' </div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'<a name="END"></a>'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_non_curr_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a class="pageHelp" href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" width=""'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_reference_id => 10510441759767050
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 776257007869755349
 
begin
 
wwv_flow_api.create_template (
  p_id => 776257007869755349 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'Login'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if gte IE 7]>'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if !IE]> -->'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<!-- <![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<script src="/i/libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'
 ,p_box => 
'<div id="body">'||unistr('\000a')||
' <div id="two-col-sb-left">'||unistr('\000a')||
'  <div id="left-sidebar">'||unistr('\000a')||
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>'||unistr('\000a')||
'      #REGION_POSITION_02##REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="main-sb-left">'||unistr('\000a')||
'   <div id="menu">'||unistr('\000a')||
'    <div id="navbar">&nbsp;</div>'||unistr('\000a')||
'    <div id="breadcrumbs">#REGION_POSITION_01#</div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="box-body">'||unistr('\000a')||
'   <div id="messages">#SUCCESS_MESSAGE##NOTI'||
'FICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="right-sidebar"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'<a name="END"></a>'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_non_curr_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" width=""'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_reference_id => 10510441759767050
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 779045383844170080
 
begin
 
wwv_flow_api.create_template (
  p_id => 779045383844170080 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'Two Level Tabs'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if gte IE 7]>'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if !IE]> -->'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<!-- <![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<style type="text/css">'||unistr('\000a')||
'#breadcrumbs{height:33px;}'||unistr('\000a')||
'</style>'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#IMAGE_PREFIX#libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'
 ,p_box => 
'<div id="body">'||unistr('\000a')||
' <div id="two-col-sb-left">'||unistr('\000a')||
'  <div id="left-sidebar">'||unistr('\000a')||
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>'||unistr('\000a')||
'      #REGION_POSITION_02##REGION_POSITION_08#'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  <div id="main">'||unistr('\000a')||
'   <div id="main-sb-left">'||unistr('\000a')||
'    <div id="menu">'||unistr('\000a')||
'     <div id="navbar">#NAVIGATION_BAR#<span class="app-user">&USER. (&G_WORKSPACE_NAME.)</span></div>'||unistr('\000a')||
'     <div id="tab-holder"><ul id="tabs">#PARENT_T'||
'AB_CELLS#</ul></div>'||unistr('\000a')||
'     <div id="breadcrumbs">#REGION_POSITION_01#</div>'||unistr('\000a')||
'     <div id="list-tabs">#REGION_POSITION_03#</div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="box-body">'||unistr('\000a')||
'   <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'      #BOX_BODY#'||unistr('\000a')||
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="right-sidebar"></div>'||unistr('\000a')||
'  </di'||
'v>'||unistr('\000a')||
' </div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<li class="current">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_non_curr_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a class="pageHelp" href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_reference_id => 10510441759767050
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 798708459018451693
 
begin
 
wwv_flow_api.create_template (
  p_id => 798708459018451693 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if gte IE 7]>'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if !IE]> -->'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<!-- <![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# style="background-color: #eee;"><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'
 ,p_box => 
'<div>'||unistr('\000a')||
' <div>#SUCCESS_MESSAGE#</div>'||unistr('\000a')||
' <div>#BOX_BODY#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'#FORM_CLOSE##DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="success-message">#SUCCESS_MESSAGE#</div>'
 ,p_notification_message => '<div class="t13notification">#MESSAGE#</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t13NavigationBar">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 4
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_reference_id => 244412628968574478
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 798708738969451693
 
begin
 
wwv_flow_api.create_template (
  p_id => 798708738969451693 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'Printer Friendly'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'
 ,p_box => 
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top">#LOGO##REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_08#</td>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top">'||unistr('\000a')||
'<div style="border:1px solid black;">#SUCCESS_MESSAG'||
'E##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'#REGION_POSITION_05#'
 ,p_footer_template => 
'#FORM_CLOSE##DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="t13success">#SUCCESS_MESSAGE#</div>'
 ,p_notification_message => '<div class="t13notification">#MESSAGE#</div>'
 ,p_navigation_bar => '<div id="t13NavBar">#BAR_BODY#</div>'
 ,p_navbar_entry => '<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 5
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_reference_id => 244412953876574478
 ,p_translate_this_template => 'N'
 ,p_template_comment => '3'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 798709635467451693
 
begin
 
wwv_flow_api.create_template (
  p_id => 798709635467451693 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'One Level Tabs'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if gte IE 7]>'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if !IE]> -->'||unistr('\000a')||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_@SV_VERSION@.css" type="text/css" /> '||unistr('\000a')||
'<!-- <![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<script src="#IMAGE_PREFIX#libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'
 ,p_box => 
'<div id="body">'||unistr('\000a')||
' <div id="two-col-sb-left">'||unistr('\000a')||
'  <div id="left-sidebar">'||unistr('\000a')||
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>'||unistr('\000a')||
'      #REGION_POSITION_02##REGION_POSITION_08#'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  <div id="main">'||unistr('\000a')||
'   <div id="main-sb-left">'||unistr('\000a')||
'    <div id="menu">'||unistr('\000a')||
'     <div id="navbar">#NAVIGATION_BAR#<span class="app-user">&USER.</span></div>'||unistr('\000a')||
'     <div id="tab-holder"><ul id="tabs">#PARENT_TAB_CELLS#</ul></div>'||unistr('\000a')||
''||
'     <div id="breadcrumbs">#REGION_POSITION_01#</div>'||unistr('\000a')||
'     <div id="list-tabs">#REGION_POSITION_03#</div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="box-body">'||unistr('\000a')||
'   <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'      #BOX_BODY##REGION_POSITION_06#'||unistr('\000a')||
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="right-sidebar"></div>'||unistr('\000a')||
'  </div'||
'>'||unistr('\000a')||
' </div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success" id="success-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_non_current_tab => '<li class="sub#TAB_STATUS#">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_current_tab => '<li class="current">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_top_non_curr_tab => '<li class="#TAB_STATUS#">'||unistr('\000a')||
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#'||unistr('\000a')||
'</li>'
 ,p_notification_message => '<div class="notification" id="notification-message">'||unistr('\000a')||
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a class="pageHelp" href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" width=""'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_reference_id => 10510441759767050
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button_page_popup
prompt  ......Button Template 761912204746558528
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 761912204746558528 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button - Page Popup'
 ,p_template => 
'<button value="#LABEL#" class="button-default" type="button" #BUTTON_ATTRIBUTES#>'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_reference_id => 244427238837574489
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 101
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/view_scorecard_button
prompt  ......Button Template 762516695415510335
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 762516695415510335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'View Scorecard Button'
 ,p_template => 
'<button value="#LABEL#" id="showScorecard" class="button-default button-recalc" type="button">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_reference_id => 244427238837574489
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 101
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/import_button
prompt  ......Button Template 765356902195213544
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 765356902195213544 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Import Button'
 ,p_template => 
'<button value="#LABEL#" onclick="javascript:importFile();" class="button-default" type="button">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 6
 ,p_theme_id => 101
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/recalculate_page_button
prompt  ......Button Template 773674035237303124
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 773674035237303124 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Recalculate Page Button'
 ,p_template => 
'<button value="#LABEL#" onclick="javascript:svScan(&P200_APPLICATION_ID.,$v(''P0_ATTRIBUTE_SET_ID''),&APP_PAGE_ID.,''PAGE_SCORE'');" class="button-default button-recalc" type="button">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_reference_id => 244427238837574489
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 101
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/recalculate_button
prompt  ......Button Template 779030680109624769
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 779030680109624769 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Recalculate Button'
 ,p_template => 
'<button value="#LABEL#" onclick="javascript:svScan(&P200_APPLICATION_ID.,$v(''P0_ATTRIBUTE_SET_ID''),&APP_PAGE_ID.,''SCORE'');" class="button-default button-recalc" type="button">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_reference_id => 244427238837574489
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 101
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_evaluate
prompt  ......Button Template 780016493063311673
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 780016493063311673 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button - Evaluate'
 ,p_template => 
'<button value="#LABEL#" onclick="javascript:svScan($v(''P1_APPLICATION_ID''),$v(''P1_EVAL_ATTRIBUTE_SET_ID''),800,''SCORE'');" class="button-default" type="button" #BUTTON_ATTRIBUTES#>'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_reference_id => 244427238837574489
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 101
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 798710242842451693
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 798710242842451693 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<button value="#LABEL#" onclick="#LINK#" class="button-default" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">'||unistr('\000a')||
'  <span>#LABEL#</span>'||unistr('\000a')||
'</button>'
 ,p_reference_id => 244427238837574489
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 101
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/application_name_and_score
prompt  ......region template 761177005471866552
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 761177005471866552 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" style="padding: none;">#BODY#</div>'
 ,p_page_plug_template_name => 'Application Name and Score'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_popup
prompt  ......region template 761356581874881712
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 761356581874881712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegionPopup" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="formRegionHeader">'||unistr('\000a')||
'    <div class="formRegionTitleNoHelp">#TITLE#</div>'||unistr('\000a')||
'    <div class="formRegionPopupButtons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Popup'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/dashboard_region
prompt  ......region template 763725404190800106
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 763725404190800106 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'  <div class="formRegionDashboardButtons">#CREATE#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Dashboard Region'
 ,p_plug_table_bgcolor => '#FFFFFF'
 ,p_theme_id => 101
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#FFFFFF'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 11075013368112103
 ,p_translate_this_template => 'N'
 ,p_template_comment => '<table class="wideContentRegion" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#">'||unistr('\000a')||
' <tbody>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'   <td colspan="2" class="contentRegionBody">#BODY#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
' </tbody>'||unistr('\000a')||
'</table>'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_wide
prompt  ......region template 763788715263678546
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 763788715263678546 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="formRegionHeader">'||unistr('\000a')||
'    <div class="formRegionTitleNoHelp">#TITLE#</div>'||unistr('\000a')||
'    <div class="formRegionButtons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Wide'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_subform_wide
prompt  ......region template 764616197863719553
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 764616197863719553 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegionDashboard" style="width:800px;" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="formRegionHeaderDashboard">'||unistr('\000a')||
'    <div class="formRegionTitleDashboard">#TITLE#</div>'||unistr('\000a')||
'    <div class="formRegionButtonsDashboard"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Subform, Wide'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 11462331722353385
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Form Region is shimed out a minimum of 600px'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_region_wide_no_title_summary
prompt  ......region template 764897713217390162
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 764897713217390162 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
''||unistr('\000a')||
'<div class="&G_HELP_CLASS."><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a></div>'||unistr('\000a')||
''||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Report Region - Wide, No Title, Summary'
 ,p_theme_id => 101
 ,p_theme_class_id => 9
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/dashboard_region_w_help
prompt  ......region template 764936514967542030
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 764936514967542030 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<div>'||unistr('\000a')||
'  <div class="dashboardTableTitle" style="padding:5px;">#TITLE#</div>'||unistr('\000a')||
'<div style="float:right;margin-top:-25px;padding-right:10px;"><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'    <div class="formRegionDashboardBu'||
'ttons">#CREATE#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Dashboard Region w/Help'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/dashboard_region_w_help_and_print
prompt  ......region template 765567503688426936
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 765567503688426936 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<div>'||unistr('\000a')||
'  <div class="dashboardTableTitle" style="padding:5px;">#TITLE#</div>'||unistr('\000a')||
'<div style="float:right;margin-top:-25px;padding-right:10px;"><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a>&nbsp;&nbsp;<a href=""RPT_CAT"" ><img src="#WORKSPACE_IMAGES#PRINT.gif"/></a></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'  <div'||
' class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'    <div class="formRegionDashboardButtons">#CREATE#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Dashboard Region w/Help and Print'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_dashboard_2_up
prompt  ......region template 766864495700060193
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 766864495700060193 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegionDashboard2Up"  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# style="min-height:195px;">'||unistr('\000a')||
'  <div class="formRegionHeaderDashboard">'||unistr('\000a')||
'    <div class="formRegionTitleDashboard">'||unistr('\000a')||
'      <div style="float:left;">#TITLE#</div>'||unistr('\000a')||
'      <div style="float:right;">#CREATE#<a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"></a></div>'||unistr('\000a')||
'     </div>'||unistr('\000a')||
'    <div c'||
'lass="formRegionButtonsDashboard"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Dashboard, 2 Up'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 11462331722353385
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Form Region is shimed out a minimum of 600px'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_dashboard_2_3
prompt  ......region template 766957991324569443
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 766957991324569443 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegionDashboard23"  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# style="min-height:195px;">'||unistr('\000a')||
'  <div class="formRegionHeaderDashboard">'||unistr('\000a')||
'    <div class="formRegionTitleDashboard">'||unistr('\000a')||
'      <div style="float:left;">#TITLE#</div>'||unistr('\000a')||
'      <div style="float:right;">#CREATE#<a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"></a></div>'||unistr('\000a')||
'     </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  '||
'<div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Dashboard, 2/3'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 11462331722353385
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Form Region is shimed out a minimum of 600px'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_wide_jquery_tab
prompt  ......region template 775936497918323221
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 775936497918323221 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="tipTabs" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Wide jQuery Tab'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 244415943492574480
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Form Region is shimed out a minimum of 600px'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_no_title
prompt  ......region template 778422356021748147
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 778422356021748147 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><table class="sidebarRegion">'||unistr('\000a')||
' <tbody>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'   <td style="text-align:center;">#BODY#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
' </tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Sidebar Region - No Title'
 ,p_theme_id => 101
 ,p_theme_class_id => 2
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 10523728904379071
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_dashboard
prompt  ......region template 778477515244417604
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 778477515244417604 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegionDashboard"  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# style="min-height:195px;">'||unistr('\000a')||
'  <div class="formRegionHeaderDashboard">'||unistr('\000a')||
'    <div class="formRegionTitleDashboard">'||unistr('\000a')||
'      <div style="float:left;">#TITLE#</div>'||unistr('\000a')||
'      <div style="float:right;">#CREATE#<a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"></a></div>'||unistr('\000a')||
'     </div>'||unistr('\000a')||
'    <div clas'||
's="formRegionButtonsDashboard"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Dashboard'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 11462331722353385
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Form Region is shimed out a minimum of 600px'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_subform
prompt  ......region template 778723108686973860
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 778723108686973860 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegionDashboard" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="formRegionHeaderDashboard">'||unistr('\000a')||
'    <div class="formRegionTitleDashboard">#TITLE#</div>'||unistr('\000a')||
'    <div class="formRegionButtonsDashboard"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Subform'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 11462331722353385
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Form Region is shimed out a minimum of 600px'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 798711637471451694
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 798711637471451694 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_ID#">#BODY#</div>'
 ,p_page_plug_template_name => 'Breadcrumb Region'
 ,p_theme_id => 101
 ,p_theme_class_id => 6
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 244414428813574479
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region_wide_w_help_icon
prompt  ......region template 798712839278451694
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 798712839278451694 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
' <div class="formRegionHeader">'||unistr('\000a')||
'  <div class="formRegionTitle">'||unistr('\000a')||
'   <div style="float:left;padding:5px;">#TITLE#</div>'||unistr('\000a')||
'   <div style="float:right;">'||unistr('\000a')||
'    <div class="formRegionButtons" style="float:left;">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'    <div style="float:right;padding-top'||
':7px;padding-right:5px;" class="formRegionHelpIcon"><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP.gif"></a></div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
' </div>'||unistr('\000a')||
' <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Form Region - Wide w/Help Icon'
 ,p_theme_id => 101
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 244415943492574480
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Form Region is shimed out a minimum of 600px'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_region_wide_no_title
prompt  ......region template 798715834431451697
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 798715834431451697 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="&G_HELP_CLASS."><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a></div>'||unistr('\000a')||
'  <div class="formRegionContent">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Report Region - Wide, No TItle'
 ,p_plug_table_bgcolor => '#FFFFFF'
 ,p_theme_id => 101
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#FFFFFF'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_reference_id => 11075013368112103
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/region_tabs
prompt  ......list template 778470591527098623
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="rt-current">'||unistr('\000a')||
'<a href="#LINK#"><span></span>#TEXT#</a>'||unistr('\000a')||
'</li>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'';

t2:=t2||'<li class="rt-non-current">'||unistr('\000a')||
'<a href="#LINK#"><span></span>#TEXT#</a>'||unistr('\000a')||
'</li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>778470591527098623 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Region Tabs',
  p_theme_id  => 101,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div id="region-tab-holder">'||unistr('\000a')||
'<ul id="region-tabs">',
  p_list_template_after_rows=>'</ul></div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/region_sub_tabs
prompt  ......list template 778798257565427461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="rt-current">'||unistr('\000a')||
'<a href="#LINK#"><span></span>#TEXT#</a>'||unistr('\000a')||
'</li>'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'';

t2:=t2||'<li class="rt-non-current">'||unistr('\000a')||
'<a href="#LINK#"><span></span>#TEXT#</a>'||unistr('\000a')||
'</li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>778798257565427461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Region Sub Tabs',
  p_theme_id  => 101,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<div id="region-subtab-holder">'||unistr('\000a')||
'<ul id="region-tabs">',
  p_list_template_after_rows=>'</ul></div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/main_sub_tabs
prompt  ......list template 779039165003079496
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'  <li id="tab"><a href="#LINK#" class="currentTab">#TEXT#</a></li>'||unistr('\000a')||
'';

t2:=t2||'  <li id="tab""><a href="#LINK#">#TEXT#</a></li>'||unistr('\000a')||
'';

t3:=t3||'  <li><a href="#LINK#" class="currentSubTab">#TEXT#</a></li>';

t4:=t4||'  <li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'  <li id="tab"><a href="#LINK#" class="currentTab">#TEXT#&#9660;</a>';

t6:=t6||'  <li id="tab"><a href="#LINK#">#TEXT# &#9660;</a>';

t7:=t7||'  <li><a href="#LINK#" class="currentSubTab">#TEXT# &#9654;</a>';

t8:=t8||'  <li><a href="#LINK#">#TEXT# &#9654;</a>';

wwv_flow_api.create_list_template (
  p_id=>779039165003079496 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Main Sub Tabs',
  p_theme_id  => 101,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<!--[if !IE]> -->'||unistr('\000a')||
'<style type="text/css">'||unistr('\000a')||
'#box-body { margin-top: 145px; }'||unistr('\000a')||
'#breadcrumbs { border: none; box-shadow: none; height: 8px; }'||unistr('\000a')||
'#list-tabs {'||unistr('\000a')||
'        padding: 6 12 12 12;'||unistr('\000a')||
'	height: 90px;'||unistr('\000a')||
'	border-bottom: 1px solid #ccc;'||unistr('\000a')||
'        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.1);'||unistr('\000a')||
'        -moz-box-shadow: 0 1px 1px rgba(0,0,0,.1);'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<!-- <![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<!--[if gte IE 7]>'||unistr('\000a')||
'<style type="text/css">'||unistr('\000a')||
'#box-body { padding-top: 160px; }'||unistr('\000a')||
'#breadcrumbs { border: none; box-shadow: none; height: 8px; }'||unistr('\000a')||
'#list-tabs {'||unistr('\000a')||
'        padding: 6px 12px 12px 12px;'||unistr('\000a')||
'	height: 90px;'||unistr('\000a')||
'	border-bottom: 1px solid #ccc;'||unistr('\000a')||
'        z-index: 9999;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<!-- <![endif]-->'||unistr('\000a')||
''||unistr('\000a')||
'<ul id="nav_tab" class="dropdown dropdown-horizontal">',
  p_list_template_after_rows=>'  </li></ul>',
  p_before_sub_list=>'<ul>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 798722135270451700
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="currentListItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="currentListItem"><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li class="currentListItem"><a href="#LINK#">#TEXT#</a></li><ul>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li><ul>';

t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>798722135270451700 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="unorderedList">',
  p_list_template_after_rows=>'</ul>',
  p_before_sub_list=>'<br />',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_reference_id=>244426133351574489,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/application_name_and_score_report
prompt  ......report template 761182990542909610
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'#COLUMN_VALUE#';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 761182990542909610 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Application Name and Score Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report_#REGION_STATIC_ID#">',
  p_row_template_after_rows =>'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_row_style_mouse_over=>'#CCCCCC',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_reference_id=> 244421041606574485,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/sidebar_events
prompt  ......report template 763558996448859406
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||' <tr>'||unistr('\000a')||
'  <th style="width:15px;">#ICON#</th>'||unistr('\000a')||
'  <th style="font-weight:bold;">#CREATED_BY#<br /><span style="font-weight:normal;font-size:8px;">#CREATED_BY_WS#</span></th>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <th colspan="2">#MESSAGE#</th>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <td colspan="2">'||unistr('\000a')||
'   <span style="float:right;color:#666;font-weight:normal;font-size:9px;">#CREATED_ON#</span>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
' </tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 763558996448859406 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Sidebar Events',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="sidebarReport">',
  p_row_template_after_rows =>'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 101,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/narrow_report
prompt  ......report template 765315798671227999
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>';

c2:=c2||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="dataAlt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 765315798671227999 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Narrow Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" class="wideReport" style="width:360px;min-width:350px;" border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'',
  p_row_template_after_rows =>'  <tfoot>#PAGINATION#</tfoot>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'#EXTERNAL_LINK##CSV_LINK#',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th#ALIGNMENT# class="reportHeader" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>',
  p_row_template_display_cond1=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'EVEN_ROW_NUMBERS',
  p_pagination_template=>'<div class="pagination" id="pagination#REGION_ID#">#TEXT#</div>',
  p_next_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#NEXT.gif"></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#PREV.gif"></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#LAST.gif"></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#FIRST.gif"></a>',
  p_row_style_mouse_over=>'#CCCCCC',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_reference_id=> 244421041606574485,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 765315798671227999 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'   <tr>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/wide_report_for_subregions
prompt  ......report template 778984606760783123
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>';

c2:=c2||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="dataAlt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 778984606760783123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Wide Report for SubRegions',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" class="wideReport"  style="width:730px;min-width:730px;" border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'',
  p_row_template_after_rows =>'  <tfoot>#PAGINATION#</tfoot>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'#EXTERNAL_LINK##CSV_LINK#',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th#ALIGNMENT# class="reportHeader" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>',
  p_row_template_display_cond1=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'EVEN_ROW_NUMBERS',
  p_pagination_template=>'<div class="pagination" id="pagination#REGION_ID#">#TEXT#</div>',
  p_next_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#NEXT.gif"></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#PREV.gif"></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#LAST.gif"></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#FIRST.gif"></a>',
  p_row_style_mouse_over=>'#CCCCCC',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_reference_id=> 244421041606574485,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 778984606760783123 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'   <tr>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/wide_report
prompt  ......report template 798724265433451702
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>';

c2:=c2||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="dataAlt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 798724265433451702 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Wide Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" class="wideReport"  border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" width="100%">'||unistr('\000a')||
'',
  p_row_template_after_rows =>'  <tfoot>#PAGINATION#</tfoot>'||unistr('\000a')||
'  </table>'||unistr('\000a')||
'#EXTERNAL_LINK##CSV_LINK#',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th#ALIGNMENT# class="reportHeader" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>',
  p_row_template_display_cond1=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'EVEN_ROW_NUMBERS',
  p_pagination_template=>'<div class="pagination" id="pagination#REGION_ID#">#TEXT#</div>',
  p_next_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#NEXT.gif"></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#PREV.gif"></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#LAST.gif"></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#FIRST.gif"></a>',
  p_row_style_mouse_over=>'#CCCCCC',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_reference_id=> 244421041606574485,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 798724265433451702 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'   <tr>',
  p_row_template_after_last =>'</tr>'||unistr('\000a')||
'');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 798726264953451704
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 798726264953451704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span style="display:none;">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t13InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 101,
  p_theme_class_id => 13,
  p_reference_id=> 244426737444574489,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 798726449707451704
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 798726449707451704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="itemHelp" href="#" title="#CURRENT_ITEM_NAME#" tabindex="999">',
  p_template_body2=>':</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_reference_id=> 244426937131574489,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 798726666474451704
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 798726666474451704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="itemHelp" href="#" title="#CURRENT_ITEM_NAME#" tabindex="999">*',
  p_template_body2=>':</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_reference_id=> 244427141770574489,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 798726761922451704
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 798726761922451704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div id="breadcrumb_container">'||unistr('\000a')||
'	<ul>',
  p_current_page_option=>'		<li class="active"><a href="#LINK#">#NAME#</a></li>',
  p_non_current_page_option=>'		<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'<li class="sep">&gt;</li>',
  p_after_last=>'	</ul>'||unistr('\000a')||
'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_reference_id            => 244428037569574490,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 798727554952451707
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 798727554952451707 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_13/theme_V22.css" type="text/css">'||unistr('\000a')||
''||unistr('\000a')||
'#THEME_CSS#',
  p_page_body_attr=>'onload="first_field()" style="background-color:#FFFFFF;margin:0;"',
  p_before_field_text=>'<div class="t13PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t13PopupBody">',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_reference_id       => 244428541002574491,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 798726958422451704
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 798726958422451704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> '',
  p_day_of_week_format=> '<th class="t13DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t13CalendarHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t13MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t13Calendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t13DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t13Day" valign="top">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t13Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="t13WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t13WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t13NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t13NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t13WeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t13MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t13DayOfWeek"><a href="#">#IDAY#</a><br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t13WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t13Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t13Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t13NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t13Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t13DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t13DayCalendarHolder"> <tr> <td class="t13MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t13DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t13Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t13Today">',
  p_daily_time_open_format => '<th class="t13Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '',
  p_agenda_past_day_format => '',
  p_agenda_today_day_format => '',
  p_agenda_future_day_format => '',
  p_agenda_past_entry_format => '',
  p_agenda_today_entry_format => '',
  p_agenda_future_entry_format => '',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_reference_id=> 244428235927574490);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/sert_theme
prompt  ......theme 798727756408451707
begin
wwv_flow_api.create_theme (
  p_id =>798727756408451707 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 101,
  p_theme_name=>'SERT Theme',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>798709635467451693 + wwv_flow_api.g_id_offset,
  p_error_template=>763968397529181090 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>798708738969451693 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'',
  p_login_template=>798705860048451689 + wwv_flow_api.g_id_offset,
  p_default_button_template=>798710242842451693 + wwv_flow_api.g_id_offset,
  p_default_region_template=>null + wwv_flow_api.g_id_offset,
  p_default_chart_template =>null + wwv_flow_api.g_id_offset,
  p_default_form_template  =>null + wwv_flow_api.g_id_offset,
  p_default_reportr_template => null,
  p_default_tabform_template=>null + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>null + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>null + wwv_flow_api.g_id_offset,
  p_default_irr_template=>null + wwv_flow_api.g_id_offset,
  p_default_report_template => null,
  p_default_label_template=>798726449707451704 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>798726761922451704 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>null + wwv_flow_api.g_id_offset,
  p_default_list_template=>798722135270451700 + wwv_flow_api.g_id_offset,
  p_default_option_label=>798726449707451704 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>798726666474451704 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 202
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/rpt_p920
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:920:&SESSION.:PRINT'');';

wwv_flow_api.create_shortcut (
 p_id=> 755977665494433699 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_P920',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/rpt_p905
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:905:&SESSION.:PRINT'');';

wwv_flow_api.create_shortcut (
 p_id=> 755978869659860816 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_P905',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/rpt_p925
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:925:&SESSION.:PRINT'');';

wwv_flow_api.create_shortcut (
 p_id=> 755979368807974074 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_P925',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/rpt_p930
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:930:&SESSION.:PRINT'');';

wwv_flow_api.create_shortcut (
 p_id=> 755979885430978902 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_P930',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/rpt_p935
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:935:&SESSION.:PRINT'');';

wwv_flow_api.create_shortcut (
 p_id=> 755980376389023570 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_P935',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/rpt_p940
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:940:&SESSION.:PRINT'');';

wwv_flow_api.create_shortcut (
 p_id=> 755980859551028165 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_P940',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/rpt_p945
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:945:&SESSION.:PRINT'');';

wwv_flow_api.create_shortcut (
 p_id=> 755981582539044283 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_P945',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/rpt_cat
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_util.prepare_url(''f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.:PRINT_CATEGORY'');'||unistr('\000a')||
'';

wwv_flow_api.create_shortcut (
 p_id=> 756029377975158166 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'RPT_CAT',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/init_ir_controls
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<!-- -->';

wwv_flow_api.create_shortcut (
 p_id=> 776665609561887230 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'INIT_IR_CONTROLS',
 p_shortcut_type=> 'HTML_TEXT',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/black_ir_links
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<style type="text/css">'||unistr('\000a')||
'div#apexir_DATA_PANEL .apexir_WORKSHEET_DATA td a {'||unistr('\000a')||
'    color: black;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>';

wwv_flow_api.create_shortcut (
 p_id=> 778213506448430187 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'BLACK_IR_LINKS',
 p_shortcut_type=> 'HTML_TEXT',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/delete_confirm_msg
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 798299266595396000 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/apex_users
prompt  ......authentication 506237230236596306
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 506237230236596306 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'APEX Users'
 ,p_scheme_type => 'NATIVE_APEX_ACCOUNTS'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/item_type/com_oracle_apex_group_selectlist
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2658469474232376785 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.ORACLE.APEX.GROUP_SELECTLIST'
 ,p_display_name => 'Group Select List'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'-- The render procedure is responsible for the rendering of the actual HTML control'||unistr('\000a')||
'-- of the new widget. APEX still takes care of the table cell for the layout,'||unistr('\000a')||
'-- the label, pre- and post element text. Only the html code between the pre- and'||unistr('\000a')||
'-- post element text is rendered by the plug-in. The render procedure has a'||unistr('\000a')||
'-- defined interface which every plug-in has to implement. It''s designed in a wa'||
'y'||unistr('\000a')||
'-- that future enhancements to the interface will not break existing plug-ins.'||unistr('\000a')||
'function render_group_selectlist ('||unistr('\000a')||
'    p_item                in apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value               in varchar2,'||unistr('\000a')||
'    p_is_readonly         in boolean,'||unistr('\000a')||
'    p_is_printer_friendly in boolean )'||unistr('\000a')||
'    return apex_plugin.t_page_item_render_result'||unistr('\000a')||
'is'||unistr('\000a')||
'    -- cons'||
'tants for accessing our l_column_value_list array'||unistr('\000a')||
'    c_display_column constant number := 1;'||unistr('\000a')||
'    c_return_column  constant number := 2;'||unistr('\000a')||
'    c_group_column   constant number := 3;'||unistr('\000a')||
'    '||unistr('\000a')||
'    -- value without the lov null value'||unistr('\000a')||
'    l_value             varchar2(32767) := case when p_value = p_item.lov_null_value then null else p_value end;'||unistr('\000a')||
''||unistr('\000a')||
'    l_name              varchar2(30);'||unistr('\000a')||
'    l_display_value     '||
'varchar2(32767);'||unistr('\000a')||
'    l_is_selected       boolean := false;'||unistr('\000a')||
'    l_value_found       boolean := false;'||unistr('\000a')||
'    l_column_value_list wwv_flow_plugin_util.t_column_value_list;'||unistr('\000a')||
'    l_group_value       varchar2(4000);'||unistr('\000a')||
'    l_last_group_value  varchar2(4000);'||unistr('\000a')||
'    l_open_group        boolean := false;'||unistr('\000a')||
'    l_result            wwv_flow_plugin.t_page_item_render_result;'||unistr('\000a')||
'    '||unistr('\000a')||
'    procedure print_option_local ('||unistr('\000a')||
'    '||
'    p_display_value in varchar2,'||unistr('\000a')||
'        p_return_value  in varchar2,'||unistr('\000a')||
'        p_compare_value in varchar2 )'||unistr('\000a')||
'    is'||unistr('\000a')||
'        l_is_selected boolean := false;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        if not l_value_found and apex_plugin_util.is_equal(p_return_value, p_compare_value)'||unistr('\000a')||
'        then'||unistr('\000a')||
'            l_value_found := true;'||unistr('\000a')||
'            l_is_selected := true;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- add list entry'||unistr('\000a')||
'        apex_plugi'||
'n_util.print_option ('||unistr('\000a')||
'            p_display_value => p_display_value,'||unistr('\000a')||
'            p_return_value  => p_return_value,'||unistr('\000a')||
'            p_is_selected   => l_is_selected,'||unistr('\000a')||
'            p_attributes    => p_item.element_option_attributes );'||unistr('\000a')||
'    end print_option_local;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    -- During plug-in development it''s very helpful to have some debug information'||unistr('\000a')||
'    if wwv_flow.g_debug then'||unistr('\000a')||
'        apex_plugin_util'||
'.debug_page_item ('||unistr('\000a')||
'            p_plugin              => p_plugin,'||unistr('\000a')||
'            p_page_item           => p_item,'||unistr('\000a')||
'            p_value               => p_value,'||unistr('\000a')||
'            p_is_readonly         => p_is_readonly,'||unistr('\000a')||
'            p_is_printer_friendly => p_is_printer_friendly );'||unistr('\000a')||
'    end if;'||unistr('\000a')||
''||unistr('\000a')||
'    -- Based on the flags we normally generate different HTML code, but that'||unistr('\000a')||
'    -- depends on the plug-in.'||unistr('\000a')||
'    if p'||
'_is_readonly or p_is_printer_friendly then'||unistr('\000a')||
'        apex_plugin_util.print_hidden_if_readonly ('||unistr('\000a')||
'            p_item_name           => p_item.name,'||unistr('\000a')||
'            p_value               => p_value,'||unistr('\000a')||
'            p_is_readonly         => p_is_readonly,'||unistr('\000a')||
'            p_is_printer_friendly => p_is_printer_friendly );'||unistr('\000a')||
''||unistr('\000a')||
'        -- get the display value'||unistr('\000a')||
'        l_display_value := apex_plugin_util.get_display_data '||
'('||unistr('\000a')||
'                               p_sql_statement     => p_item.lov_definition,'||unistr('\000a')||
'                               p_min_columns       => 3, -- LOV requires 3 column'||unistr('\000a')||
'                               p_max_columns       => 3,'||unistr('\000a')||
'                               p_component_name    => p_item.name,'||unistr('\000a')||
'                               p_display_column_no => c_display_column,'||unistr('\000a')||
'                               p_search_col'||
'umn_no  => c_return_column,'||unistr('\000a')||
'                               p_search_string     => l_value,'||unistr('\000a')||
'                               p_display_extra     => p_item.lov_display_extra );'||unistr('\000a')||
''||unistr('\000a')||
'        -- emit display span with the value'||unistr('\000a')||
'        apex_plugin_util.print_display_only ('||unistr('\000a')||
'            p_item_name        => p_item.name,'||unistr('\000a')||
'            p_display_value    => l_display_value,'||unistr('\000a')||
'            p_show_line_breaks => fals'||
'e,'||unistr('\000a')||
'            p_escape           => true,'||unistr('\000a')||
'            p_attributes       => p_item.element_attributes );'||unistr('\000a')||
'    else'||unistr('\000a')||
'        -- If a page item saves state, we have to call the get_input_name_for_page_item'||unistr('\000a')||
'        -- to render the internal hidden p_arg_names field. It will also return the'||unistr('\000a')||
'        -- HTML field name which we have to use when we render the HTML input field.'||unistr('\000a')||
'        l_name := apex_plugi'||
'n.get_input_name_for_page_item(false);'||unistr('\000a')||
'        sys.htp.prn(''<select name="''||l_name||''" id="''||p_item.name||''" ''||'||unistr('\000a')||
'                  coalesce(p_item.element_attributes, ''class="group_selectlist"'')||''>'');'||unistr('\000a')||
''||unistr('\000a')||
'        -- add display null entry'||unistr('\000a')||
'        if p_item.lov_display_null then'||unistr('\000a')||
'            wwv_flow_utilities.add_null_value_entry(''ITEM'', l_name, p_item.lov_null_value);'||unistr('\000a')||
'            -- add list entry'||
''||unistr('\000a')||
'            print_option_local ('||unistr('\000a')||
'                    p_display_value => p_item.lov_null_text,'||unistr('\000a')||
'                    p_return_value  => p_item.lov_null_value,'||unistr('\000a')||
'                    p_compare_value => nvl(l_value, p_item.lov_null_value) );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        -- get all values'||unistr('\000a')||
'        l_column_value_list := apex_plugin_util.get_data ('||unistr('\000a')||
'                                   p_sql_statement      => p_it'||
'em.lov_definition,'||unistr('\000a')||
'                                   p_min_columns        => 3,'||unistr('\000a')||
'                                   p_max_columns        => 3,'||unistr('\000a')||
'                                   p_component_name     => p_item.name );'||unistr('\000a')||
''||unistr('\000a')||
'        -- loop through the result'||unistr('\000a')||
'        for i in 1 .. l_column_value_list(c_display_column).count'||unistr('\000a')||
'        loop'||unistr('\000a')||
'            l_group_value := l_column_value_list(c_group_column)(i);'||
''||unistr('\000a')||
'            -- has the group changed?'||unistr('\000a')||
'            if (l_group_value <> l_last_group_value) or'||unistr('\000a')||
'               (l_group_value is     null and l_last_group_value is not null) or'||unistr('\000a')||
'               (l_group_value is not null and l_last_group_value is     null)'||unistr('\000a')||
'            then'||unistr('\000a')||
'                if l_open_group then'||unistr('\000a')||
'                    sys.htp.p(''</optgroup>'');'||unistr('\000a')||
'                    l_open_group := false;'||unistr('\000a')||
'   '||
'             end if;'||unistr('\000a')||
'                if l_group_value is not null then'||unistr('\000a')||
'                    sys.htp.p (''<optgroup label="''||sys.htf.escape_sc(l_group_value)||''">'');'||unistr('\000a')||
'                    l_open_group := true;'||unistr('\000a')||
'                end if;'||unistr('\000a')||
'                l_last_group_value := l_group_value;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            -- add list entry'||unistr('\000a')||
'            print_option_local ('||unistr('\000a')||
'                p_display_value =>'||
' l_column_value_list(c_display_column)(i),'||unistr('\000a')||
'                p_return_value  => l_column_value_list(c_return_column )(i),'||unistr('\000a')||
'                p_compare_value => l_value );'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
''||unistr('\000a')||
'        if l_open_group then'||unistr('\000a')||
'            sys.htp.p(''</optgroup>'');'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- Show at least the value if it hasn''t been found in the database'||unistr('\000a')||
'        if not l_value_found and l_value is not null and '||
'p_item.lov_display_extra then'||unistr('\000a')||
'            print_option_local ('||unistr('\000a')||
'                p_display_value => l_value,'||unistr('\000a')||
'                p_return_value  => l_value,'||unistr('\000a')||
'                p_compare_value => l_value );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        -- close our select list'||unistr('\000a')||
'        sys.htp.p(''</select>'');'||unistr('\000a')||
'        -- Tell APEX that this field is navigable'||unistr('\000a')||
'        l_result.is_navigable := true;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    return l_result;'||unistr('\000a')||
''||
'end render_group_selectlist;'||unistr('\000a')||
''
 ,p_render_function => 'render_group_selectlist'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:READONLY:QUICKPICK:SOURCE:ELEMENT:ELEMENT_OPTION:ENCRYPT:LOV:LOV_REQUIRED:LOV_DISPLAY_NULL'
 ,p_sql_min_column_count => 3
 ,p_sql_max_column_count => 3
 ,p_sql_examples => '<pre>'||unistr('\000a')||
'select e.ename as d,'||unistr('\000a')||
'       e.empno as r,'||unistr('\000a')||
'       d.dname as grp'||unistr('\000a')||
'  from emp e,'||unistr('\000a')||
'       dept d'||unistr('\000a')||
' where d.deptno = e.deptno'||unistr('\000a')||
' order by grp, d'||unistr('\000a')||
'</pre>'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<p>'||unistr('\000a')||
'	<strong>Group Select List</strong> is a replacement for the built-in select list. It provides the possibility to group the entries of the select list.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	This is done by adding a third column, the &quot;group column&quot; to the &quot;List of Values SQL Statement&quot;. Don&#39;t forget to order the result of your List of Values by the group column and then by the display column. For details have a look at the &quot;List of Values Examples&quot;.</p>'||unistr('\000a')||
''
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://www.oracleapex.info/'
  );
null;
 
end;
/

--application/shared_components/plugins/dynamic_action/com_skillbuilders_modal_page
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'COM_SKILLBUILDERS_MODAL_PAGE'
 ,p_display_name => 'Enkitec Custom Modal Page (2.0.0)'
 ,p_category => 'EFFECT'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'FUNCTION apex_modal_page_render ('||unistr('\000a')||
'   p_dynamic_action IN APEX_PLUGIN.T_DYNAMIC_ACTION,'||unistr('\000a')||
'   p_plugin         IN APEX_PLUGIN.T_PLUGIN '||unistr('\000a')||
')'||unistr('\000a')||
''||unistr('\000a')||
'   RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT'||unistr('\000a')||
'   '||unistr('\000a')||
'IS'||unistr('\000a')||
''||unistr('\000a')||
'   l_result             APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;'||unistr('\000a')||
'   l_dialog_title       VARCHAR2(4000) := p_dynamic_action.attribute_01;'||unistr('\000a')||
'   l_url_location       VARCHAR2(50) := NVL(p_dynamic_action.at'||
'tribute_02, ''STATIC'');'||unistr('\000a')||
'   l_static_url         VARCHAR2(4000) := p_dynamic_action.attribute_03;'||unistr('\000a')||
'   l_attr_name          VARCHAR2(4000) := NVL(p_dynamic_action.attribute_05, ''data-url'');'||unistr('\000a')||
'   l_close_sel          VARCHAR2(4000) := NVL(p_dynamic_action.attribute_06, ''div#success-message'');'||unistr('\000a')||
'   l_hw_mode            VARCHAR2(4000) := NVL(p_dynamic_action.attribute_07, ''AUTO'');'||unistr('\000a')||
'   l_height             VAR'||
'CHAR2(4000) := p_dynamic_action.attribute_08;'||unistr('\000a')||
'   l_width              VARCHAR2(4000) := p_dynamic_action.attribute_09;'||unistr('\000a')||
'   l_modal_page_id      VARCHAR2(4000) := p_dynamic_action.attribute_10;'||unistr('\000a')||
'   l_theme              NUMBER := NVL(p_plugin.attribute_01, 3);'||unistr('\000a')||
'   l_overlay_opacity    NUMBER := NVL(TO_NUMBER(p_plugin.attribute_02, ''999.99'', ''NLS_NUMERIC_CHARACTERS = ''''.,''''''), .5);'||unistr('\000a')||
'   l_scrolling       '||
'   VARCHAR2(1) := NVL(p_plugin.attribute_03, ''N'');'||unistr('\000a')||
'   l_transition         VARCHAR2(50) := NVL(p_plugin.attribute_04, ''none'');'||unistr('\000a')||
'   l_initial_height     NUMBER := NVL(p_plugin.attribute_05, 100);'||unistr('\000a')||
'   l_initial_width      NUMBER := NVL(p_plugin.attribute_06, 100);'||unistr('\000a')||
'   l_draggable          VARCHAR2(1) := NVL(p_plugin.attribute_07, ''Y'');'||unistr('\000a')||
'   l_custom_css_path    VARCHAR2(4000) := p_plugin.attribute_08;'||unistr('\000a')||
'  '||
' l_custom_css_file    VARCHAR2(4000) := p_plugin.attribute_09;'||unistr('\000a')||
'   l_loading_image_src  VARCHAR2(32767);'||unistr('\000a')||
'   l_onload_code        VARCHAR2(32767);'||unistr('\000a')||
'   l_crlf               CHAR(2) := CHR(13)||CHR(10);'||unistr('\000a')||
''||unistr('\000a')||
'BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'   IF apex_application.g_debug'||unistr('\000a')||
'   THEN'||unistr('\000a')||
'      apex_plugin_util.debug_dynamic_action('||unistr('\000a')||
'         p_plugin         => p_plugin,'||unistr('\000a')||
'         p_dynamic_action => p_dynamic_action '||unistr('\000a')||
'      );'||unistr('\000a')||
'   END IF;'||unistr('\000a')||
'   '||unistr('\000a')||
''||
'   IF l_theme = 2 --User selected custom theme'||unistr('\000a')||
'   THEN'||unistr('\000a')||
''||unistr('\000a')||
'        apex_css.add_file('||unistr('\000a')||
'           p_name      => RTRIM(RTRIM(l_custom_css_file,''.css''),''.CSS''),'||unistr('\000a')||
'           p_directory => wwv_flow.do_substitutions(l_custom_css_path),'||unistr('\000a')||
'           p_version   => NULL'||unistr('\000a')||
'        );'||unistr('\000a')||
'  ELSE '||unistr('\000a')||
''||unistr('\000a')||
'      IF (owa_util.get_cgi_env(''HTTP_USER_AGENT'')) LIKE ''%MSIE%'' THEN'||unistr('\000a')||
'        apex_css.add_file('||unistr('\000a')||
'           p_name      ='||
'> ''sumneva_theme_ie'','||unistr('\000a')||
'           p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'           p_version   => NULL'||unistr('\000a')||
'        );'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        apex_css.add_file('||unistr('\000a')||
'           p_name      => ''sumneva_theme'','||unistr('\000a')||
'           p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'           p_version   => NULL'||unistr('\000a')||
'        );'||unistr('\000a')||
'      END IF; '||unistr('\000a')||
''||unistr('\000a')||
'  END IF;'||unistr('\000a')||
''||unistr('\000a')||
'   apex_javascript.add_library('||unistr('\000a')||
'      p_name      => ''jquery.colorbox-min'','||unistr('\000a')||
'      p_direct'||
'ory => p_plugin.file_prefix,'||unistr('\000a')||
'      p_version   => NULL'||unistr('\000a')||
'   );'||unistr('\000a')||
'   '||unistr('\000a')||
'   apex_javascript.add_library('||unistr('\000a')||
'      p_name      => ''apex_modal_page.min'','||unistr('\000a')||
'      p_directory => p_plugin.file_prefix,'||unistr('\000a')||
'      p_version   => NULL '||unistr('\000a')||
'   );'||unistr('\000a')||
''||unistr('\000a')||
'   l_onload_code := ''apex.jQuery(document).apex_modal_page({'' || l_crlf'||unistr('\000a')||
'      || ''   '' || apex_javascript.add_attribute(''transition'',  l_transition) || l_crlf'||unistr('\000a')||
'      || ''   '' || apex_'||
'javascript.add_attribute(''draggable'',  '||unistr('\000a')||
'         CASE l_draggable'||unistr('\000a')||
'            WHEN ''Y'' THEN TRUE'||unistr('\000a')||
'            ELSE FALSE'||unistr('\000a')||
'         END'||unistr('\000a')||
'      ) || l_crlf'||unistr('\000a')||
'      || ''   '' || apex_javascript.add_attribute(''initialHeight'',  l_initial_height) || l_crlf'||unistr('\000a')||
'      || ''   '' || apex_javascript.add_attribute(''initialWidth'',  l_initial_width) || l_crlf'||unistr('\000a')||
'      || ''   '' || apex_javascript.add_attribute(''overlayOpacity'||
''',  l_overlay_opacity) || l_crlf'||unistr('\000a')||
'      || ''   '' || apex_javascript.add_attribute(''scrolling'',  '||unistr('\000a')||
'         CASE l_scrolling'||unistr('\000a')||
'            WHEN ''Y'' THEN TRUE'||unistr('\000a')||
'            ELSE FALSE'||unistr('\000a')||
'         END'||unistr('\000a')||
'      ) || l_crlf'||unistr('\000a')||
'      || ''   '' || apex_javascript.add_attribute(''loadingImageSrc'', l_loading_image_src, FALSE, FALSE) || l_crlf'||unistr('\000a')||
'      || ''});'';'||unistr('\000a')||
'      '||unistr('\000a')||
'   apex_javascript.add_onload_code('||unistr('\000a')||
'      p_code => l_onlo'||
'ad_code'||unistr('\000a')||
'   ); '||unistr('\000a')||
''||unistr('\000a')||
'   l_result.javascript_function := '||unistr('\000a')||
'      ''function(){'' || l_crlf ||'||unistr('\000a')||
'      ''   if (this.browserEvent !== ''''load''''){'' || l_crlf ||'||unistr('\000a')||
'      ''      apex.jQuery(document).apex_modal_page(''''openPageFromApexThis'''', this);'' || l_crlf ||'||unistr('\000a')||
'      ''   }'' || l_crlf ||'||unistr('\000a')||
'      ''}'';'||unistr('\000a')||
''||unistr('\000a')||
'   l_result.attribute_01 := l_dialog_title;'||unistr('\000a')||
'   l_result.attribute_02 := l_url_location;'||unistr('\000a')||
'   l_result.attribute_03 := l_'||
'static_url;'||unistr('\000a')||
'   l_result.attribute_05 := l_attr_name;'||unistr('\000a')||
'   l_result.attribute_06 := l_close_sel;'||unistr('\000a')||
'   l_result.attribute_07 := l_hw_mode;'||unistr('\000a')||
'   l_result.attribute_08 := l_height;'||unistr('\000a')||
'   l_result.attribute_09 := l_width;'||unistr('\000a')||
'   l_result.attribute_10 := l_modal_page_id;'||unistr('\000a')||
''||unistr('\000a')||
'   RETURN l_result;'||unistr('\000a')||
'    '||unistr('\000a')||
'END apex_modal_page_render;'
 ,p_render_function => 'apex_modal_page_render'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<br />'||unistr('\000a')||
''
 ,p_version_identifier => '2.0.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 761755602606209427 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Theme'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'The Theme setting is used to change the look and feel of the modal window. '
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 761756406415210507 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 761755602606209427 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Sumneva Theme'
 ,p_return_value => '1'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 761756776764211399 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 761755602606209427 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Custom Theme'
 ,p_return_value => '2'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 761222394309054077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Overlay Opacity'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => true
 ,p_default_value => '.5'
 ,p_display_length => 3
 ,p_max_length => 3
 ,p_is_translatable => false
 ,p_help_text => 'The Overlay Opacity setting is used to adjust the darkness of the overlay behind the modal dialog. Specify a number between 0 and 1 where 0 is transparent and 1 is completely obscured. The default value of .5 is in the middle and allows the users to see the screen behind but focuses their attention on the modal dialog.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 761222897688073936 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 17
 ,p_prompt => 'Scrolling'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_help_text => 'The Scrolling setting is used to specify whether or not the modal can include scroll bars across the top and bottom of the modal to allow users to see all of the content in the page. When set to No, any overflow cotent will be hidden from view.<br /> '||unistr('\000a')||
'<br />'||unistr('\000a')||
'This setting must be used in conjunction with the Height and Width settings in the component settings. A later version of this plug-in will move this setting to the component settings.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 761223419505080144 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 15
 ,p_prompt => 'Transition'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'none'
 ,p_is_translatable => false
 ,p_help_text => 'The Transition setting can be used to apply some effects to the opening and closing of the modal dialog. '
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 761223922968081156 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 761223419505080144 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'None'
 ,p_return_value => 'none'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 761224296218092267 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 761223419505080144 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Elastic'
 ,p_return_value => 'elastic'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 761224701066093698 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 761223419505080144 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Fade'
 ,p_return_value => 'fade'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 11057039596112974595 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Initial Height'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '100'
 ,p_display_length => 2
 ,p_max_length => 3
 ,p_is_translatable => false
 ,p_help_text => 'The Initial Height setting is used to specify the initial height (in pixels) of the modal page when it opens but before the main content loads. '
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 11057040778581979020 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Initial Width'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '300'
 ,p_display_length => 2
 ,p_max_length => 3
 ,p_is_translatable => false
 ,p_help_text => 'The Initial Width setting is used to specify the initial width (in pixels) of the modal page when it opens but before the main content loads.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 761226321629109019 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 18
 ,p_prompt => 'Draggable'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_help_text => 'The Draggable setting is used to specify whether or not the user should be able to move the modal dialog around on the screen.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 761227206654123489 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 12
 ,p_prompt => 'Custom CSS Path'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 50
 ,p_max_length => 500
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 761755602606209427 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => '2'
 ,p_help_text => 'The Custom CSS Path setting is used to specify the path to a custom CSS file for the theme. This setting is only displayed when the Theme is set to custom. See Optional Performance Upgrade for additional information.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 761227715443135468 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 13
 ,p_prompt => 'Custom CSS Filename'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 50
 ,p_max_length => 500
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 761755602606209427 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => '2'
 ,p_help_text => 'The Custom CSS Filename setting is used to specify the name of the file that contains custom CSS for the theme. Only the name of the file should be included with this setting as it is assumed the extension will be ¿¿¿¿¿¿.css¿¿¿¿¿¿. This setting is only displayed when the Theme is set to custom.  See Optional Performance Upgrade for additional information.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 28454090588970745582 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Dialog Title'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_max_length => 50
 ,p_is_translatable => false
 ,p_help_text => 'Use this attribute to specify the title displayed in the modal page.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 28454083399790729772 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'URL Location'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'STATIC'
 ,p_is_translatable => false
 ,p_help_text => 'Use this attribute to specify whether the URL for the modal page is static or dynamic. '
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 28454085681913734012 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 28454083399790729772 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Statically Defined'
 ,p_return_value => 'STATIC'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 28454086794380737633 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 28454083399790729772 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Attribute of Triggering Element'
 ,p_return_value => 'TRIG_ELEMENT_ATTR'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 28454077679358723839 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Static URL'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'f?p=&APP_ID.:1:&APP_SESSION.:::1:::'
 ,p_display_length => 50
 ,p_max_length => 500
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 28454083399790729772 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'STATIC'
 ,p_help_text => 'Use this attribute to specify a static URL for the modal page.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 36518786215497224117 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Attribute Name'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'href'
 ,p_display_length => 30
 ,p_max_length => 50
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 28454083399790729772 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'TRIG_ELEMENT_ATTR'
 ,p_help_text => 'Use this attribute to specify which attribute of the triggering element contains the URL for the modal page. This is often the href attribute of anchor elements.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 36518916213962412887 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Auto-close On Element Selector'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'div#success-message'
 ,p_display_length => 30
 ,p_max_length => 500
 ,p_is_translatable => false
 ,p_help_text => 'Use this attribute to specify a jQuery selector used to close the modal page automatically. The selector is executed when the modal page is loaded. If the selector selects anything, the modal page will close and the Auto Close event will be triggered. Typically this is only used for modal pages that are submitted for processing where the success message is used to auto-close the modal page.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 13850656698259404545 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Dialog Height/Width Mode'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'AUTO'
 ,p_is_translatable => false
 ,p_help_text => 'Use this attribute to control the size of the modal page. The default value of "Auto" will try to automatically determine the appropriate size of the page based on the content. However, if you need more control, this attribute allows you set the height and width as a percentage of the total window size or by a fixed number of pixels.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 13850695287308410837 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 13850656698259404545 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 1
 ,p_display_value => 'Auto'
 ,p_return_value => 'AUTO'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 13850658503107405934 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 13850656698259404545 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Static by percent of window'
 ,p_return_value => 'STATIC_%'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 13850659072763406594 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 13850656698259404545 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Static by pixels'
 ,p_return_value => 'STATIC_PX'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 13850878574850482876 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Height'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_display_length => 2
 ,p_max_length => 3
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 13850656698259404545 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'STATIC_%,STATIC_PX'
 ,p_help_text => 'Use this attribute to set the height of the modal page. This value can be used to specify a percentage of the total screen or specific number of pixels which is determined by the Dialog Height/Width Mode attribute.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 13850880888010486688 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Width'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_display_length => 2
 ,p_max_length => 3
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 13850656698259404545 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'STATIC_%,STATIC_PX'
 ,p_help_text => 'Use this attribute to set the width of the modal page. This value can be used to specify a percentage of the total screen or specific number of pixels which is determined by the Dialog Height/Width Mode attribute.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 13850922579184521962 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => 'Modal Page ID'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_max_length => 50
 ,p_is_translatable => false
 ,p_help_text => 'Use this attribute to associate an identifier, such as "create-customer-page", with the modal page that has been opened. When the modal page closes this identifier will be passed back with the event object so that the closing of one modal page can be differentiated from another. The value can be accessed from the data object of "this" in a Dynamic Action with: this.data.modalPageId'
  );
wwv_flow_api.create_plugin_event (
  p_id => 36456325099934761055 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_name => 'modalpageautoclose'
 ,p_display_name => 'Auto Close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 11056608184985592989 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_name => 'modalpageclose'
 ,p_display_name => 'Close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 761258694476671050 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_name => 'modalpageendopen'
 ,p_display_name => 'End Open'
  );
wwv_flow_api.create_plugin_event (
  p_id => 761259099671672581 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_name => 'modalpagemanualclose'
 ,p_display_name => 'Manual Close'
  );
wwv_flow_api.create_plugin_event (
  p_id => 761259405211674181 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_name => 'modalpagestartopen'
 ,p_display_name => 'Start Open'
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2866756E6374696F6E2861297B612E776964676574282275692E617065785F6D6F64616C5F70616765222C7B6F7074696F6E733A7B7472616E736974696F6E3A6E756C6C2C6C6F6164696E67496D6167655372633A6E756C6C2C696E697469616C486569';
wwv_flow_api.g_varchar2_table(2) := '6768743A6E756C6C2C696E697469616C57696474683A6E756C6C2C6F7665726C61794F7061636974793A6E756C6C2C7363726F6C6C696E673A6E756C6C2C647261676761626C653A6E756C6C7D2C5F6372656174655072697661746553746F726167653A';
wwv_flow_api.g_varchar2_table(3) := '66756E6374696F6E28297B76617220623D746869733B6966286128222370646562756722292E6C656E677468297B617065782E646562756728274D6F64616C2050616765202D20537461727420225F6372656174655072697661746553746F7261676522';
wwv_flow_api.g_varchar2_table(4) := '27297D622E5F76616C7565733D7B75726C3A6E756C6C2C6469616C6F675469746C653A6E756C6C2C636C6F736553656C6563746F723A6E756C6C2C70726576656E7444656661756C743A6E756C6C2C68656967687457696474684D6F64653A6E756C6C2C';
wwv_flow_api.g_varchar2_table(5) := '6865696768743A6E756C6C2C77696474683A6E756C6C2C636C6F7365456C656D656E7453656C6563746F723A6E756C6C2C6D6F64616C5061676549643A6E756C6C2C6D6F64616C50616765436C6F736556616C75653A6E756C6C2C6469616C6F67546F70';
wwv_flow_api.g_varchar2_table(6) := '3A302C6469616C6F674C6566743A302C696672616D654865696768743A302C696672616D6557696474683A302C686173565363726F6C6C3A66616C73652C686173485363726F6C6C3A66616C73652C6175746F436C6F7365643A66616C73652C64656275';
wwv_flow_api.g_varchar2_table(7) := '673A6128222370646562756722292E6C656E677468213D3D307D3B622E5F656C656D656E74733D7B2477696E646F773A7B7D2C246469616C6F673A7B7D2C24777261707065723A7B7D2C24696672616D653A7B7D7D3B696628622E5F76616C7565732E64';
wwv_flow_api.g_varchar2_table(8) := '65627567297B617065782E646562756728274D6F64616C2050616765202D20456E6420225F6372656174655072697661746553746F726167652227297D7D2C5F6372656174653A66756E6374696F6E28297B76617220633D746869733B76617220623D6E';
wwv_flow_api.g_varchar2_table(9) := '657720496D61676528293B622E7372633D632E6F7074696F6E732E6C6F6164696E67496D6167655372633B6966286128222370646562756722292E6C656E677468297B617065782E646562756728274D6F64616C2050616765202D20537461727420225F';
wwv_flow_api.g_varchar2_table(10) := '6372656174652227293B617065782E646562756728222E2E2E4F7074696F6E7322293B666F72286E616D6520696E20632E6F7074696F6E73297B617065782E646562756728222E2E2E2E2E2E222B6E616D652B273A2022272B632E6F7074696F6E735B6E';
wwv_flow_api.g_varchar2_table(11) := '616D655D2B272227297D7D632E5F6372656174655072697661746553746F7261676528293B632E5F656C656D656E74732E2477696E646F773D612877696E646F77293B696628632E5F76616C7565732E6465627567297B617065782E646562756728274D';
wwv_flow_api.g_varchar2_table(12) := '6F64616C2050616765202D20456E6420225F6372656174652227297D7D2C6F70656E506167653A66756E6374696F6E28642C632C662C652C622C67297B76617220683D746869733B76617220693D7B7469746C653A756E646566696E65642C636C6F7365';
wwv_flow_api.g_varchar2_table(13) := '53656C6563746F723A756E646566696E65642C6D6F64616C5061676549643A756E646566696E65642C6865696768743A756E646566696E65647D3B696628682E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C20506167';
wwv_flow_api.g_varchar2_table(14) := '65202D20537461727420226F70656E506167652227297D682E5F76616C7565732E6175746F436C6F7365643D66616C73653B682E5F76616C7565732E6469616C6F675469746C653D643B682E5F76616C7565732E636C6F7365456C656D656E7453656C65';
wwv_flow_api.g_varchar2_table(15) := '63746F723D633B682E5F76616C7565732E6D6F64616C5061676549643D663B682E5F76616C7565732E68656967687457696474684D6F64653D653B682E5F76616C7565732E6865696768743D623B682E5F76616C7565732E77696474683D673B612E636F';
wwv_flow_api.g_varchar2_table(16) := '6C6F72626F78287B7472616E736974696F6E3A682E6F7074696F6E732E7472616E736974696F6E2C7469746C653A682E5F76616C7565732E6469616C6F675469746C652C6865696768743A682E6F7074696F6E732E696E697469616C4865696768742B22';
wwv_flow_api.g_varchar2_table(17) := '7078222C77696474683A682E6F7074696F6E732E696E697469616C57696474682B227078222C696672616D653A747275652C7363726F6C6C696E673A682E6F7074696F6E732E7363726F6C6C696E672C66617374496672616D653A66616C73652C6F7665';
wwv_flow_api.g_varchar2_table(18) := '726C6179436C6F73653A66616C73652C6F7061636974793A682E6F7074696F6E732E6F7665726C61794F7061636974792C687265663A682E5F76616C7565732E75726C2C6F6E4F70656E3A66756E6374696F6E28297B696628682E6F7074696F6E732E64';
wwv_flow_api.g_varchar2_table(19) := '7261676761626C65297B61282223636F6C6F72626F7822292E647261676761626C6528292E6373732822637572736F72222C226D6F766522297D6128646F63756D656E74292E747269676765722822617065786D6F64616C706167656F70656E22297D2C';
wwv_flow_api.g_varchar2_table(20) := '6F6E436F6D706C6574653A66756E6374696F6E28297B682E5F68616E646C65496672616D654C6F616428293B6128646F63756D656E74292E747269676765722822617065786D6F64616C70616765636F6D706C65746522297D2C6F6E436C65616E75703A';
wwv_flow_api.g_varchar2_table(21) := '66756E6374696F6E28297B682E5F656C656D656E74732E2477696E646F772E756E62696E642822726573697A65222C682E5F636865636B526573697A6554696D6572293B69662821682E5F76616C7565732E6175746F436C6F736564297B6128646F6375';
wwv_flow_api.g_varchar2_table(22) := '6D656E74292E7472696767657228226D6F64616C706167656D616E75616C636C6F7365222C7B6D6F64616C5061676549643A682E5F76616C7565732E6D6F64616C5061676549642C6D6F64616C50616765436C6F736556616C75653A2828682E5F76616C';
wwv_flow_api.g_varchar2_table(23) := '7565732E6D6F64616C50616765436C6F736556616C7565293F682E5F76616C7565732E6D6F64616C50616765436C6F736556616C75653A2222297D297D682E5F76616C7565732E6D6F64616C50616765436C6F736556616C75653D6E756C6C7D2C6F6E43';
wwv_flow_api.g_varchar2_table(24) := '6C6F7365643A66756E6374696F6E28297B6128646F63756D656E74292E747269676765722822617065786D6F64616C70616765636C6F73656422297D7D293B682E5F656C656D656E74732E2477696E646F772E62696E642822726573697A65222C7B7569';
wwv_flow_api.g_varchar2_table(25) := '773A687D2C682E5F636865636B526573697A6554696D6572293B696628682E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20456E6420226F70656E506167652227297D7D2C6F70656E506167654672';
wwv_flow_api.g_varchar2_table(26) := '6F6D41706578546869733A66756E6374696F6E2869297B76617220673D746869733B76617220653D692E616374696F6E2E61747472696275746530323B76617220683D692E616374696F6E2E61747472696275746530333B76617220643D692E61637469';
wwv_flow_api.g_varchar2_table(27) := '6F6E2E61747472696275746530353B76617220633D692E616374696F6E2E61747472696275746530373B76617220623B76617220663B696628672E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D2053';
wwv_flow_api.g_varchar2_table(28) := '7461727420226F70656E5061676546726F6D41706578546869732227297D696628653D3D3D2253544154494322297B672E5F76616C7565732E75726C3D687D656C73657B696628653D3D3D22545249475F454C454D454E545F4154545222297B672E5F76';
wwv_flow_api.g_varchar2_table(29) := '616C7565732E75726C3D6128692E74726967676572696E67456C656D656E74292E617474722864297D7D696628633D3D3D224155544F22297B623D66616C73653B663D66616C73657D656C73657B696628633D3D3D225354415449435F505822297B623D';
wwv_flow_api.g_varchar2_table(30) := '692E616374696F6E2E61747472696275746530382B227078223B663D692E616374696F6E2E61747472696275746530392B227078227D656C73657B696628633D3D3D225354415449435F2522297B623D692E616374696F6E2E6174747269627574653038';
wwv_flow_api.g_varchar2_table(31) := '2B2225223B663D692E616374696F6E2E61747472696275746530392B2225227D7D7D672E6F70656E5061676528692E616374696F6E2E61747472696275746530312C692E616374696F6E2E61747472696275746530362C692E616374696F6E2E61747472';
wwv_flow_api.g_varchar2_table(32) := '696275746531302C632C622C66293B696628672E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20456E6420226F70656E5061676546726F6D41706578546869732227297D7D2C5F68616E646C654966';
wwv_flow_api.g_varchar2_table(33) := '72616D654C6F61643A66756E6374696F6E28297B76617220653D746869733B652E5F656C656D656E74732E24696672616D653D61282223636F6C6F72626F7820696672616D6522293B76617220623D652E5F656C656D656E74732E24696672616D652E63';
wwv_flow_api.g_varchar2_table(34) := '6F6E74656E747328292E66696E6428652E5F76616C7565732E636C6F7365456C656D656E7453656C6563746F72293B76617220643D652E5F656C656D656E74732E24696672616D652E6765742830292E636F6E74656E7457696E646F773B76617220633D';
wwv_flow_api.g_varchar2_table(35) := '642E617065782E6A51756572793B696628652E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20537461727420225F68616E646C65496672616D654C6F61642227297D6328652E5F656C656D656E7473';
wwv_flow_api.g_varchar2_table(36) := '2E24696672616D652E636F6E74656E747328292E676574283029292E62696E642822617065786265666F7265706167657375626D6974222C66756E6374696F6E28297B6128222363626F784C6F61646564436F6E74656E7422292E6869646528293B6128';
wwv_flow_api.g_varchar2_table(37) := '222363626F784C6F6164696E674F7665726C617922292E73686F7728293B6128222363626F784C6F6164696E674772617068696322292E73686F7728297D293B652E5F656C656D656E74732E24696672616D652E636F6E74656E747328292E66696E6428';
wwv_flow_api.g_varchar2_table(38) := '2223617065782D6465762D746F6F6C6261722C2368746D6C6462446576546F6F6C62617222292E72656D6F766528293B696628622E6C656E677468297B652E5F76616C7565732E6175746F436C6F7365643D747275653B6A51756572792E636F6C6F7262';
wwv_flow_api.g_varchar2_table(39) := '6F782E636C6F736528293B6128646F63756D656E74292E7472696767657228226D6F64616C706167656175746F636C6F7365222C7B6D6F64616C5061676549643A652E5F76616C7565732E6D6F64616C5061676549642C22246D6F64616C50616765436C';
wwv_flow_api.g_varchar2_table(40) := '6F73654F626A656374223A622E636C6F6E652874727565297D297D656C73657B652E5F656C656D656E74732E24696672616D652E636F6E74656E747328292E66696E642822626F647922292E63737328226D617267696E222C2230707822293B61282223';
wwv_flow_api.g_varchar2_table(41) := '63626F784C6F6164696E674F7665726C617922292E6869646528293B6128222363626F784C6F6164696E674772617068696322292E6869646528293B6128222363626F784C6F61646564436F6E74656E7422292E73686F7728293B652E5F726573697A65';
wwv_flow_api.g_varchar2_table(42) := '4D6F64616C28293B652E5F656C656D656E74732E24696672616D652E72656D6F7665436C617373282275692D68656C7065722D68696464656E2D61636365737369626C6522293B652E5F656C656D656E74732E24696672616D652E6F6E6528226C6F6164';
wwv_flow_api.g_varchar2_table(43) := '222C66756E6374696F6E28297B652E5F68616E646C65496672616D654C6F616428297D297D696628652E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20456E6420225F68616E646C65496672616D65';
wwv_flow_api.g_varchar2_table(44) := '4C6F61642227297D7D2C5F726573697A654D6F64616C3A66756E6374696F6E2862297B76617220633D746869733B696628632E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20537461727420225F72';
wwv_flow_api.g_varchar2_table(45) := '6573697A654D6F64616C2227297D632E5F656C656D656E74732E2477696E646F772E756E62696E642822726573697A65222C632E5F636865636B526573697A6554696D6572293B69662862297B6A51756572792E636F6C6F72626F782E726573697A6528';
wwv_flow_api.g_varchar2_table(46) := '7B77696474683A622E77696474682C6865696768743A622E6865696768742C696E6E65724865696768743A622E696E6E65724865696768742C696E6E657257696474683A622E696E6E657257696474687D297D656C73657B696628632E5F76616C756573';
wwv_flow_api.g_varchar2_table(47) := '2E68656967687457696474684D6F64653D3D3D224155544F22297B6A51756572792E636F6C6F72626F782E726573697A65287B696E6E65724865696768743A632E5F656C656D656E74732E24696672616D652E636F6E74656E747328292E686569676874';
wwv_flow_api.g_varchar2_table(48) := '28292C696E6E657257696474683A632E5F656C656D656E74732E24696672616D652E636F6E74656E747328292E776964746828297D297D656C73657B6A51756572792E636F6C6F72626F782E726573697A65287B696E6E65724865696768743A632E5F76';
wwv_flow_api.g_varchar2_table(49) := '616C7565732E6865696768742C696E6E657257696474683A632E5F76616C7565732E77696474687D297D7D632E5F656C656D656E74732E2477696E646F772E62696E642822726573697A65222C7B7569773A637D2C632E5F636865636B526573697A6554';
wwv_flow_api.g_varchar2_table(50) := '696D6572293B696628632E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20456E6420225F726573697A654D6F64616C2227297D7D2C5F636865636B526573697A6554696D65723A66756E6374696F6E';
wwv_flow_api.g_varchar2_table(51) := '2863297B76617220623D632E646174612E7569773B696628622E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20537461727420225F636865636B526573697A6554696D65722227297D696628622E5F';
wwv_flow_api.g_varchar2_table(52) := '76616C7565732E74696D6572297B636C65617254696D656F757428622E5F76616C7565732E74696D6572297D622E5F76616C7565732E74696D65723D73657454696D656F75742866756E6374696F6E28297B622E5F68616E646C6557696E646F77526573';
wwv_flow_api.g_varchar2_table(53) := '697A6528297D2C3530293B696628622E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20456E6420225F636865636B526573697A6554696D65722227297D7D2C5F68616E646C6557696E646F77526573';
wwv_flow_api.g_varchar2_table(54) := '697A653A66756E6374696F6E28297B76617220623D746869733B696628622E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20537461727420225F68616E646C6557696E646F77526573697A65222729';
wwv_flow_api.g_varchar2_table(55) := '7D696628622E5F76616C7565732E68656967687457696474684D6F6465213D3D224155544F22297B622E5F726573697A654D6F64616C28297D696628622E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C205061676520';
wwv_flow_api.g_varchar2_table(56) := '2D20456E6420225F68616E646C6557696E646F77526573697A652227297D7D2C636C6F73653A66756E6374696F6E2863297B76617220623D746869733B696628622E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050';
wwv_flow_api.g_varchar2_table(57) := '616765202D2053746172742022636C6F73652227297D622E5F76616C7565732E6D6F64616C50616765436C6F736556616C75653D633B6A51756572792E636F6C6F72626F782E636C6F736528293B696628622E5F76616C7565732E6465627567297B6170';
wwv_flow_api.g_varchar2_table(58) := '65782E646562756728274D6F64616C2050616765202D20456E642022636C6F73652227297D7D2C726573697A653A66756E6374696F6E2862297B7569773D746869733B6966287569772E5F76616C7565732E6465627567297B617065782E646562756728';
wwv_flow_api.g_varchar2_table(59) := '274D6F64616C2050616765202D2053746172742022726573697A652227297D7569772E5F726573697A654D6F64616C2862293B6966287569772E5F76616C7565732E6465627567297B617065782E646562756728274D6F64616C2050616765202D20456E';
wwv_flow_api.g_varchar2_table(60) := '642022726573697A652227297D7D7D297D2928617065782E6A5175657279293B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 761234808046595438 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_file_name => 'apex_modal_page.min.js'
 ,p_mime_type => 'application/javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F20436F6C6F72426F782076312E332E3139202D206A5175657279206C69676874626F7820706C7567696E0D0A2F2F202863292032303131204A61636B204D6F6F7265202D206A61636B6C6D6F6F72652E636F6D0D0A2F2F204C6963656E73653A2068';
wwv_flow_api.g_varchar2_table(2) := '7474703A2F2F7777772E6F70656E736F757263652E6F72672F6C6963656E7365732F6D69742D6C6963656E73652E7068700D0A2866756E6374696F6E28612C622C63297B66756E6374696F6E205A28632C642C65297B76617220673D622E637265617465';
wwv_flow_api.g_varchar2_table(3) := '456C656D656E742863293B72657475726E2064262628672E69643D662B64292C65262628672E7374796C652E637373546578743D65292C612867297D66756E6374696F6E20242861297B76617220623D792E6C656E6774682C633D28512B612925623B72';
wwv_flow_api.g_varchar2_table(4) := '657475726E20633C303F622B633A637D66756E6374696F6E205F28612C62297B72657475726E204D6174682E726F756E6428282F252F2E746573742861293F28623D3D3D2278223F7A2E776964746828293A7A2E6865696768742829292F3130303A3129';
wwv_flow_api.g_varchar2_table(5) := '2A7061727365496E7428612C313029297D66756E6374696F6E2062612861297B72657475726E204B2E70686F746F7C7C2F5C2E286769667C706E677C6A70653F677C626D707C69636F292828237C5C3F292E2A293F242F692E746573742861297D66756E';
wwv_flow_api.g_varchar2_table(6) := '6374696F6E20626228297B76617220623B4B3D612E657874656E64287B7D2C612E6461746128502C6529293B666F72286220696E204B29612E697346756E6374696F6E284B5B625D292626622E736C69636528302C3229213D3D226F6E222626284B5B62';
wwv_flow_api.g_varchar2_table(7) := '5D3D4B5B625D2E63616C6C285029293B4B2E72656C3D4B2E72656C7C7C502E72656C7C7C226E6F666F6C6C6F77222C4B2E687265663D4B2E687265667C7C612850292E6174747228226872656622292C4B2E7469746C653D4B2E7469746C657C7C502E74';
wwv_flow_api.g_varchar2_table(8) := '69746C652C747970656F66204B2E687265663D3D22737472696E67222626284B2E687265663D612E7472696D284B2E6872656629297D66756E6374696F6E20626328622C63297B612E6576656E742E747269676765722862292C632626632E63616C6C28';
wwv_flow_api.g_varchar2_table(9) := '50297D66756E6374696F6E20626428297B76617220612C623D662B22536C69646573686F775F222C633D22636C69636B2E222B662C642C652C673B4B2E736C69646573686F772626795B315D3F28643D66756E6374696F6E28297B462E74657874284B2E';
wwv_flow_api.g_varchar2_table(10) := '736C69646573686F7753746F70292E756E62696E642863292E62696E64286A2C66756E6374696F6E28297B6966284B2E6C6F6F707C7C795B512B315D29613D73657454696D656F757428572E6E6578742C4B2E736C69646573686F775370656564297D29';
wwv_flow_api.g_varchar2_table(11) := '2E62696E6428692C66756E6374696F6E28297B636C65617254696D656F75742861297D292E6F6E6528632B2220222B6B2C65292C722E72656D6F7665436C61737328622B226F666622292E616464436C61737328622B226F6E22292C613D73657454696D';
wwv_flow_api.g_varchar2_table(12) := '656F757428572E6E6578742C4B2E736C69646573686F775370656564297D2C653D66756E6374696F6E28297B636C65617254696D656F75742861292C462E74657874284B2E736C69646573686F775374617274292E756E62696E64285B6A2C692C6B2C63';
wwv_flow_api.g_varchar2_table(13) := '5D2E6A6F696E2822202229292E6F6E6528632C66756E6374696F6E28297B572E6E65787428292C6428297D292C722E72656D6F7665436C61737328622B226F6E22292E616464436C61737328622B226F666622297D2C4B2E736C69646573686F77417574';
wwv_flow_api.g_varchar2_table(14) := '6F3F6428293A652829293A722E72656D6F7665436C61737328622B226F666620222B622B226F6E22297D66756E6374696F6E2062652862297B557C7C28503D622C626228292C793D612850292C513D302C4B2E72656C213D3D226E6F666F6C6C6F772226';
wwv_flow_api.g_varchar2_table(15) := '2628793D6128222E222B67292E66696C7465722866756E6374696F6E28297B76617220623D612E6461746128746869732C65292E72656C7C7C746869732E72656C3B72657475726E20623D3D3D4B2E72656C7D292C513D792E696E6465782850292C513D';
wwv_flow_api.g_varchar2_table(16) := '3D3D2D31262628793D792E6164642850292C513D792E6C656E6774682D3129292C537C7C28533D543D21302C722E73686F7728292C4B2E72657475726E466F6375732626612850292E626C757228292E6F6E65286C2C66756E6374696F6E28297B612874';
wwv_flow_api.g_varchar2_table(17) := '686973292E666F63757328297D292C712E637373287B6F7061636974793A2B4B2E6F7061636974792C637572736F723A4B2E6F7665726C6179436C6F73653F22706F696E746572223A226175746F227D292E73686F7728292C4B2E773D5F284B2E696E69';
wwv_flow_api.g_varchar2_table(18) := '7469616C57696474682C227822292C4B2E683D5F284B2E696E697469616C4865696768742C227922292C572E706F736974696F6E28292C6F26267A2E62696E642822726573697A652E222B702B22207363726F6C6C2E222B702C66756E6374696F6E2829';
wwv_flow_api.g_varchar2_table(19) := '7B712E637373287B77696474683A7A2E776964746828292C6865696768743A7A2E68656967687428292C746F703A7A2E7363726F6C6C546F7028292C6C6566743A7A2E7363726F6C6C4C65667428297D297D292E747269676765722822726573697A652E';
wwv_flow_api.g_varchar2_table(20) := '222B70292C626328682C4B2E6F6E4F70656E292C4A2E6164642844292E6869646528292C492E68746D6C284B2E636C6F7365292E73686F772829292C572E6C6F616428213029297D66756E6374696F6E20626628297B21722626622E626F647926262859';
wwv_flow_api.g_varchar2_table(21) := '3D21312C7A3D612863292C723D5A2858292E61747472287B69643A652C22636C617373223A6E3F662B286F3F22494536223A22494522293A22227D292E6869646528292C713D5A28582C224F7665726C6179222C6F3F22706F736974696F6E3A6162736F';
wwv_flow_api.g_varchar2_table(22) := '6C757465223A2222292E6869646528292C733D5A28582C225772617070657222292C743D5A28582C22436F6E74656E7422292E617070656E6428413D5A28582C224C6F61646564436F6E74656E74222C2277696474683A303B206865696768743A303B20';
wwv_flow_api.g_varchar2_table(23) := '6F766572666C6F773A68696464656E22292C433D5A28582C224C6F6164696E674F7665726C617922292E616464285A28582C224C6F6164696E67477261706869632229292C443D5A28582C225469746C6522292C453D5A28582C2243757272656E742229';
wwv_flow_api.g_varchar2_table(24) := '2C473D5A28582C224E65787422292C483D5A28582C2250726576696F757322292C463D5A28582C22536C69646573686F7722292E62696E6428682C6264292C493D5A28582C22436C6F73652229292C732E617070656E64285A2858292E617070656E6428';
wwv_flow_api.g_varchar2_table(25) := '5A28582C22546F704C65667422292C753D5A28582C22546F7043656E74657222292C5A28582C22546F7052696768742229292C5A28582C21312C22636C6561723A6C65667422292E617070656E6428763D5A28582C224D6964646C654C65667422292C74';
wwv_flow_api.g_varchar2_table(26) := '2C773D5A28582C224D6964646C6552696768742229292C5A28582C21312C22636C6561723A6C65667422292E617070656E64285A28582C22426F74746F6D4C65667422292C783D5A28582C22426F74746F6D43656E74657222292C5A28582C22426F7474';
wwv_flow_api.g_varchar2_table(27) := '6F6D5269676874222929292E66696E6428226469762064697622292E637373287B22666C6F6174223A226C656674227D292C423D5A28582C21312C22706F736974696F6E3A6162736F6C7574653B2077696474683A3939393970783B207669736962696C';
wwv_flow_api.g_varchar2_table(28) := '6974793A68696464656E3B20646973706C61793A6E6F6E6522292C4A3D472E6164642848292E6164642845292E6164642846292C6128622E626F6479292E617070656E6428712C722E617070656E6428732C422929297D66756E6374696F6E2062672829';
wwv_flow_api.g_varchar2_table(29) := '7B72657475726E20723F28597C7C28593D21302C4C3D752E68656967687428292B782E68656967687428292B742E6F75746572486569676874282130292D742E68656967687428292C4D3D762E776964746828292B772E776964746828292B742E6F7574';
wwv_flow_api.g_varchar2_table(30) := '65725769647468282130292D742E776964746828292C4E3D412E6F75746572486569676874282130292C4F3D412E6F757465725769647468282130292C722E637373287B2270616464696E672D626F74746F6D223A4C2C2270616464696E672D72696768';
wwv_flow_api.g_varchar2_table(31) := '74223A4D7D292C472E636C69636B2866756E6374696F6E28297B572E6E65787428297D292C482E636C69636B2866756E6374696F6E28297B572E7072657628297D292C492E636C69636B2866756E6374696F6E28297B572E636C6F736528297D292C712E';
wwv_flow_api.g_varchar2_table(32) := '636C69636B2866756E6374696F6E28297B4B2E6F7665726C6179436C6F73652626572E636C6F736528297D292C612862292E62696E6428226B6579646F776E2E222B662C66756E6374696F6E2861297B76617220623D612E6B6579436F64653B5326264B';
wwv_flow_api.g_varchar2_table(33) := '2E6573634B65792626623D3D3D3237262628612E70726576656E7444656661756C7428292C572E636C6F73652829292C5326264B2E6172726F774B65792626795B315D262628623D3D3D33373F28612E70726576656E7444656661756C7428292C482E63';
wwv_flow_api.g_varchar2_table(34) := '6C69636B2829293A623D3D3D3339262628612E70726576656E7444656661756C7428292C472E636C69636B282929297D292C6128222E222B672C62292E6C6976652822636C69636B222C66756E6374696F6E2861297B612E77686963683E317C7C612E73';
wwv_flow_api.g_varchar2_table(35) := '686966744B65797C7C612E616C744B65797C7C612E6D6574614B65797C7C28612E70726576656E7444656661756C7428292C6265287468697329297D29292C2130293A21317D76617220643D7B7472616E736974696F6E3A22656C6173746963222C7370';
wwv_flow_api.g_varchar2_table(36) := '6565643A3330302C77696474683A21312C696E697469616C57696474683A22363030222C696E6E657257696474683A21312C6D617857696474683A21312C6865696768743A21312C696E697469616C4865696768743A22343530222C696E6E6572486569';
wwv_flow_api.g_varchar2_table(37) := '6768743A21312C6D61784865696768743A21312C7363616C6550686F746F733A21302C7363726F6C6C696E673A21302C696E6C696E653A21312C68746D6C3A21312C696672616D653A21312C66617374496672616D653A21302C70686F746F3A21312C68';
wwv_flow_api.g_varchar2_table(38) := '7265663A21312C7469746C653A21312C72656C3A21312C6F7061636974793A2E392C7072656C6F6164696E673A21302C63757272656E743A22696D616765207B63757272656E747D206F66207B746F74616C7D222C70726576696F75733A227072657669';
wwv_flow_api.g_varchar2_table(39) := '6F7573222C6E6578743A226E657874222C636C6F73653A22636C6F7365222C6F70656E3A21312C72657475726E466F6375733A21302C7265706F736974696F6E3A21302C6C6F6F703A21302C736C69646573686F773A21312C736C69646573686F774175';
wwv_flow_api.g_varchar2_table(40) := '746F3A21302C736C69646573686F7753706565643A323530302C736C69646573686F7753746172743A22737461727420736C69646573686F77222C736C69646573686F7753746F703A2273746F7020736C69646573686F77222C6F6E4F70656E3A21312C';
wwv_flow_api.g_varchar2_table(41) := '6F6E4C6F61643A21312C6F6E436F6D706C6574653A21312C6F6E436C65616E75703A21312C6F6E436C6F7365643A21312C6F7665726C6179436C6F73653A21302C6573634B65793A21302C6172726F774B65793A21302C746F703A21312C626F74746F6D';
wwv_flow_api.g_varchar2_table(42) := '3A21312C6C6566743A21312C72696768743A21312C66697865643A21312C646174613A756E646566696E65647D2C653D22636F6C6F72626F78222C663D2263626F78222C673D662B22456C656D656E74222C683D662B225F6F70656E222C693D662B225F';
wwv_flow_api.g_varchar2_table(43) := '6C6F6164222C6A3D662B225F636F6D706C657465222C6B3D662B225F636C65616E7570222C6C3D662B225F636C6F736564222C6D3D662B225F7075726765222C6E3D21612E737570706F72742E6F706163697479262621612E737570706F72742E737479';
wwv_flow_api.g_varchar2_table(44) := '6C652C6F3D6E262621632E584D4C48747470526571756573742C703D662B225F494536222C712C722C732C742C752C762C772C782C792C7A2C412C422C432C442C452C462C472C482C492C4A2C4B2C4C2C4D2C4E2C4F2C502C512C522C532C542C552C56';
wwv_flow_api.g_varchar2_table(45) := '2C572C583D22646976222C593B696628612E636F6C6F72626F782972657475726E3B61286266292C573D612E666E5B655D3D615B655D3D66756E6374696F6E28622C63297B76617220663D746869733B623D627C7C7B7D2C626628293B69662862672829';
wwv_flow_api.g_varchar2_table(46) := '297B69662821665B305D297B696628662E73656C6563746F722972657475726E20663B663D6128223C612F3E22292C622E6F70656E3D21307D63262628622E6F6E436F6D706C6574653D63292C662E656163682866756E6374696F6E28297B612E646174';
wwv_flow_api.g_varchar2_table(47) := '6128746869732C652C612E657874656E64287B7D2C612E6461746128746869732C65297C7C642C6229297D292E616464436C6173732867292C28612E697346756E6374696F6E28622E6F70656E292626622E6F70656E2E63616C6C2866297C7C622E6F70';
wwv_flow_api.g_varchar2_table(48) := '656E292626626528665B305D297D72657475726E20667D2C572E706F736974696F6E3D66756E6374696F6E28612C62297B66756E6374696F6E20692861297B755B305D2E7374796C652E77696474683D785B305D2E7374796C652E77696474683D745B30';
wwv_flow_api.g_varchar2_table(49) := '5D2E7374796C652E77696474683D612E7374796C652E77696474682C745B305D2E7374796C652E6865696768743D765B305D2E7374796C652E6865696768743D775B305D2E7374796C652E6865696768743D612E7374796C652E6865696768747D766172';
wwv_flow_api.g_varchar2_table(50) := '20633D302C643D302C653D722E6F666673657428292C673D7A2E7363726F6C6C546F7028292C683D7A2E7363726F6C6C4C65667428293B7A2E756E62696E642822726573697A652E222B66292C722E637373287B746F703A2D3965342C6C6566743A2D39';
wwv_flow_api.g_varchar2_table(51) := '65347D292C4B2E66697865642626216F3F28652E746F702D3D672C652E6C6566742D3D682C722E637373287B706F736974696F6E3A226669786564227D29293A28633D672C643D682C722E637373287B706F736974696F6E3A226162736F6C757465227D';
wwv_flow_api.g_varchar2_table(52) := '29292C4B2E7269676874213D3D21313F642B3D4D6174682E6D6178287A2E776964746828292D4B2E772D4F2D4D2D5F284B2E72696768742C227822292C30293A4B2E6C656674213D3D21313F642B3D5F284B2E6C6566742C227822293A642B3D4D617468';
wwv_flow_api.g_varchar2_table(53) := '2E726F756E64284D6174682E6D6178287A2E776964746828292D4B2E772D4F2D4D2C30292F32292C4B2E626F74746F6D213D3D21313F632B3D4D6174682E6D6178287A2E68656967687428292D4B2E682D4E2D4C2D5F284B2E626F74746F6D2C22792229';
wwv_flow_api.g_varchar2_table(54) := '2C30293A4B2E746F70213D3D21313F632B3D5F284B2E746F702C227922293A632B3D4D6174682E726F756E64284D6174682E6D6178287A2E68656967687428292D4B2E682D4E2D4C2C30292F32292C722E637373287B746F703A652E746F702C6C656674';
wwv_flow_api.g_varchar2_table(55) := '3A652E6C6566747D292C613D722E776964746828293D3D3D4B2E772B4F2626722E68656967687428293D3D3D4B2E682B4E3F303A617C7C302C735B305D2E7374796C652E77696474683D735B305D2E7374796C652E6865696768743D2239393939707822';
wwv_flow_api.g_varchar2_table(56) := '2C722E6465717565756528292E616E696D617465287B77696474683A4B2E772B4F2C6865696768743A4B2E682B4E2C746F703A632C6C6566743A647D2C7B6475726174696F6E3A612C636F6D706C6574653A66756E6374696F6E28297B69287468697329';
wwv_flow_api.g_varchar2_table(57) := '2C543D21312C735B305D2E7374796C652E77696474683D4B2E772B4F2B4D2B227078222C735B305D2E7374796C652E6865696768743D4B2E682B4E2B4C2B227078222C4B2E7265706F736974696F6E262673657454696D656F75742866756E6374696F6E';
wwv_flow_api.g_varchar2_table(58) := '28297B7A2E62696E642822726573697A652E222B662C572E706F736974696F6E297D2C31292C6226266228297D2C737465703A66756E6374696F6E28297B692874686973297D7D297D2C572E726573697A653D66756E6374696F6E2861297B5326262861';
wwv_flow_api.g_varchar2_table(59) := '3D617C7C7B7D2C612E77696474682626284B2E773D5F28612E77696474682C227822292D4F2D4D292C612E696E6E657257696474682626284B2E773D5F28612E696E6E657257696474682C22782229292C412E637373287B77696474683A4B2E777D292C';
wwv_flow_api.g_varchar2_table(60) := '612E6865696768742626284B2E683D5F28612E6865696768742C227922292D4E2D4C292C612E696E6E65724865696768742626284B2E683D5F28612E696E6E65724865696768742C22792229292C21612E696E6E6572486569676874262621612E686569';
wwv_flow_api.g_varchar2_table(61) := '676874262628412E637373287B6865696768743A226175746F227D292C4B2E683D412E6865696768742829292C412E637373287B6865696768743A4B2E687D292C572E706F736974696F6E284B2E7472616E736974696F6E3D3D3D226E6F6E65223F303A';
wwv_flow_api.g_varchar2_table(62) := '4B2E737065656429297D2C572E707265703D66756E6374696F6E2862297B66756E6374696F6E206728297B72657475726E204B2E773D4B2E777C7C412E776964746828292C4B2E773D4B2E6D7726264B2E6D773C4B2E773F4B2E6D773A4B2E772C4B2E77';
wwv_flow_api.g_varchar2_table(63) := '7D66756E6374696F6E206828297B72657475726E204B2E683D4B2E687C7C412E68656967687428292C4B2E683D4B2E6D6826264B2E6D683C4B2E683F4B2E6D683A4B2E682C4B2E687D69662821532972657475726E3B76617220632C643D4B2E7472616E';
wwv_flow_api.g_varchar2_table(64) := '736974696F6E3D3D3D226E6F6E65223F303A4B2E73706565643B412E72656D6F766528292C413D5A28582C224C6F61646564436F6E74656E7422292E617070656E642862292C412E6869646528292E617070656E64546F28422E73686F772829292E6373';
wwv_flow_api.g_varchar2_table(65) := '73287B77696474683A6728292C6F766572666C6F773A4B2E7363726F6C6C696E673F226175746F223A2268696464656E227D292E637373287B6865696768743A6828297D292E70726570656E64546F2874292C422E6869646528292C612852292E637373';
wwv_flow_api.g_varchar2_table(66) := '287B22666C6F6174223A226E6F6E65227D292C6F262661282273656C65637422292E6E6F7428722E66696E64282273656C6563742229292E66696C7465722866756E6374696F6E28297B72657475726E20746869732E7374796C652E7669736962696C69';
wwv_flow_api.g_varchar2_table(67) := '7479213D3D2268696464656E227D292E637373287B7669736962696C6974793A2268696464656E227D292E6F6E65286B2C66756E6374696F6E28297B746869732E7374796C652E7669736962696C6974793D22696E6865726974227D292C633D66756E63';
wwv_flow_api.g_varchar2_table(68) := '74696F6E28297B66756E6374696F6E207128297B6E2626725B305D2E7374796C652E72656D6F7665417474726962757465282266696C74657222297D76617220622C632C673D792E6C656E6774682C682C693D226672616D65426F72646572222C6B3D22';
wwv_flow_api.g_varchar2_table(69) := '616C6C6F775472616E73706172656E6379222C6C2C6F2C703B69662821532972657475726E3B6C3D66756E6374696F6E28297B636C65617254696D656F75742856292C432E6869646528292C6263286A2C4B2E6F6E436F6D706C657465297D2C6E262652';
wwv_flow_api.g_varchar2_table(70) := '2626412E66616465496E28313030292C442E68746D6C284B2E7469746C65292E6164642841292E73686F7728293B696628673E31297B747970656F66204B2E63757272656E743D3D22737472696E67222626452E68746D6C284B2E63757272656E742E72';
wwv_flow_api.g_varchar2_table(71) := '65706C61636528227B63757272656E747D222C512B31292E7265706C61636528227B746F74616C7D222C6729292E73686F7728292C475B4B2E6C6F6F707C7C513C672D313F2273686F77223A2268696465225D28292E68746D6C284B2E6E657874292C48';
wwv_flow_api.g_varchar2_table(72) := '5B4B2E6C6F6F707C7C513F2273686F77223A2268696465225D28292E68746D6C284B2E70726576696F7573292C4B2E736C69646573686F772626462E73686F7728293B6966284B2E7072656C6F6164696E67297B623D5B24282D31292C242831295D3B77';
wwv_flow_api.g_varchar2_table(73) := '68696C6528633D795B622E706F7028295D296F3D612E6461746128632C65292E687265667C7C632E687265662C612E697346756E6374696F6E286F292626286F3D6F2E63616C6C286329292C6261286F29262628703D6E657720496D6167652C702E7372';
wwv_flow_api.g_varchar2_table(74) := '633D6F297D7D656C7365204A2E6869646528293B4B2E696672616D653F28683D5A2822696672616D6522295B305D2C6920696E2068262628685B695D3D30292C6B20696E2068262628685B6B5D3D227472756522292C682E6E616D653D662B202B286E65';
wwv_flow_api.g_varchar2_table(75) := '772044617465292C4B2E66617374496672616D653F6C28293A612868292E6F6E6528226C6F6164222C6C292C682E7372633D4B2E687265662C4B2E7363726F6C6C696E677C7C28682E7363726F6C6C696E673D226E6F22292C612868292E616464436C61';
wwv_flow_api.g_varchar2_table(76) := '737328662B22496672616D6522292E617070656E64546F2841292E6F6E65286D2C66756E6374696F6E28297B682E7372633D222F2F61626F75743A626C616E6B227D29293A6C28292C4B2E7472616E736974696F6E3D3D3D2266616465223F722E666164';
wwv_flow_api.g_varchar2_table(77) := '65546F28642C312C71293A7128297D2C4B2E7472616E736974696F6E3D3D3D2266616465223F722E66616465546F28642C302C66756E6374696F6E28297B572E706F736974696F6E28302C63297D293A572E706F736974696F6E28642C63297D2C572E6C';
wwv_flow_api.g_varchar2_table(78) := '6F61643D66756E6374696F6E2862297B76617220632C642C653D572E707265703B543D21302C523D21312C503D795B515D2C627C7C626228292C6263286D292C626328692C4B2E6F6E4C6F6164292C4B2E683D4B2E6865696768743F5F284B2E68656967';
wwv_flow_api.g_varchar2_table(79) := '68742C227922292D4E2D4C3A4B2E696E6E657248656967687426265F284B2E696E6E65724865696768742C227922292C4B2E773D4B2E77696474683F5F284B2E77696474682C227822292D4F2D4D3A4B2E696E6E6572576964746826265F284B2E696E6E';
wwv_flow_api.g_varchar2_table(80) := '657257696474682C227822292C4B2E6D773D4B2E772C4B2E6D683D4B2E682C4B2E6D617857696474682626284B2E6D773D5F284B2E6D617857696474682C227822292D4F2D4D2C4B2E6D773D4B2E7726264B2E773C4B2E6D773F4B2E773A4B2E6D77292C';
wwv_flow_api.g_varchar2_table(81) := '4B2E6D61784865696768742626284B2E6D683D5F284B2E6D61784865696768742C227922292D4E2D4C2C4B2E6D683D4B2E6826264B2E683C4B2E6D683F4B2E683A4B2E6D68292C633D4B2E687265662C563D73657454696D656F75742866756E6374696F';
wwv_flow_api.g_varchar2_table(82) := '6E28297B432E73686F7728297D2C313030292C4B2E696E6C696E653F285A2858292E6869646528292E696E736572744265666F726528612863295B305D292E6F6E65286D2C66756E6374696F6E28297B612874686973292E7265706C6163655769746828';
wwv_flow_api.g_varchar2_table(83) := '412E6368696C6472656E2829297D292C65286128632929293A4B2E696672616D653F6528222022293A4B2E68746D6C3F65284B2E68746D6C293A62612863293F286128523D6E657720496D616765292E616464436C61737328662B2250686F746F22292E';
wwv_flow_api.g_varchar2_table(84) := '6572726F722866756E6374696F6E28297B4B2E7469746C653D21312C65285A28582C224572726F7222292E7465787428225468697320696D61676520636F756C64206E6F74206265206C6F616465642229297D292E6C6F61642866756E6374696F6E2829';
wwv_flow_api.g_varchar2_table(85) := '7B76617220613B522E6F6E6C6F61643D6E756C6C2C4B2E7363616C6550686F746F73262628643D66756E6374696F6E28297B522E6865696768742D3D522E6865696768742A612C522E77696474682D3D522E77696474682A617D2C4B2E6D772626522E77';
wwv_flow_api.g_varchar2_table(86) := '696474683E4B2E6D77262628613D28522E77696474682D4B2E6D77292F522E77696474682C642829292C4B2E6D682626522E6865696768743E4B2E6D68262628613D28522E6865696768742D4B2E6D68292F522E6865696768742C64282929292C4B2E68';
wwv_flow_api.g_varchar2_table(87) := '262628522E7374796C652E6D617267696E546F703D4D6174682E6D6178284B2E682D522E6865696768742C30292F322B22707822292C795B315D2626284B2E6C6F6F707C7C795B512B315D29262628522E7374796C652E637572736F723D22706F696E74';
wwv_flow_api.g_varchar2_table(88) := '6572222C522E6F6E636C69636B3D66756E6374696F6E28297B572E6E65787428297D292C6E262628522E7374796C652E6D73496E746572706F6C6174696F6E4D6F64653D226269637562696322292C73657454696D656F75742866756E6374696F6E2829';
wwv_flow_api.g_varchar2_table(89) := '7B652852297D2C31297D292C73657454696D656F75742866756E6374696F6E28297B522E7372633D637D2C3129293A632626422E6C6F616428632C4B2E646174612C66756E6374696F6E28622C632C64297B6528633D3D3D226572726F72223F5A28582C';
wwv_flow_api.g_varchar2_table(90) := '224572726F7222292E7465787428225265717565737420756E7375636365737366756C3A20222B642E73746174757354657874293A612874686973292E636F6E74656E74732829297D297D2C572E6E6578743D66756E6374696F6E28297B21542626795B';
wwv_flow_api.g_varchar2_table(91) := '315D2626284B2E6C6F6F707C7C795B512B315D29262628513D242831292C572E6C6F61642829297D2C572E707265763D66756E6374696F6E28297B21542626795B315D2626284B2E6C6F6F707C7C5129262628513D24282D31292C572E6C6F6164282929';
wwv_flow_api.g_varchar2_table(92) := '7D2C572E636C6F73653D66756E6374696F6E28297B5326262155262628553D21302C533D21312C6263286B2C4B2E6F6E436C65616E7570292C7A2E756E62696E6428222E222B662B22202E222B70292C712E66616465546F283230302C30292C722E7374';
wwv_flow_api.g_varchar2_table(93) := '6F7028292E66616465546F283330302C302C66756E6374696F6E28297B722E6164642871292E637373287B6F7061636974793A312C637572736F723A226175746F227D292E6869646528292C6263286D292C412E72656D6F766528292C73657454696D65';
wwv_flow_api.g_varchar2_table(94) := '6F75742866756E6374696F6E28297B553D21312C6263286C2C4B2E6F6E436C6F736564297D2C31297D29297D2C572E72656D6F76653D66756E6374696F6E28297B61285B5D292E6164642872292E6164642871292E72656D6F766528292C723D6E756C6C';
wwv_flow_api.g_varchar2_table(95) := '2C6128222E222B67292E72656D6F7665446174612865292E72656D6F7665436C6173732867292E64696528297D2C572E656C656D656E743D66756E6374696F6E28297B72657475726E20612850297D2C572E73657474696E67733D647D29286A51756572';
wwv_flow_api.g_varchar2_table(96) := '792C646F63756D656E742C74686973293B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 761235504811596924 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_file_name => 'jquery.colorbox-min.js'
 ,p_mime_type => 'application/javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D0D000003F0694343504943432050726F66696C65000028918D55DD6FDB54143F896F5CA4163FA0B18E0E158BAF55535BB91B1AADC6064993A5E9421AB9CDD82AA4C9756E';
wwv_flow_api.g_varchar2_table(2) := '1A53D736B6D36D559FF6026F0CF80380B2071E9078421A0CC4F6B2ED01B449534115D524A43D74DA406893F682AA70AEAF53BB5DC6B891AF7F39E7773EEFD13540C7579AE398491960DEF25D359F918F9F98963B562109CF4127F440A7A67B4EBA5C2E02';
wwv_flow_api.g_varchar2_table(3) := '2EC68547D6C35F21C1DE3707DAEBFF737556A9A703249E426C573D7D1EF1698094A93BAE0F20DE46F9F029DF41DCF13CE21D2E268858617896E32CC3331C1F0F3853EA2862968BA4D7B52AE225C4FD3331F96C0CF31C82B5234F2DEA1ABACC7A5176ED9A';
wwv_flow_api.g_varchar2_table(4) := '61D258BA4F50FFCF356F365AF17AF1E9F2E6268FE2BB8FD55E77C7D4107FAE6BB949C42F23BEE6F819267F15F1BDC65C258D782F40F2999A7BA4C2F9C93716EB53EF20DE89B86AF885A950BE68CD9426B86D7279CE3EAA869C6BBA378A3D831711DFAAD3';
wwv_flow_api.g_varchar2_table(5) := '4291E72340956673AC5F887BEB8DB1D0BF30EE2D4CE65A7E16EBA325EE4770DFD3C6CB887B107FE8DAEA04CF5958A6665EE5FE852B8E5F0E7310D62DB354E43E8944BDA0C640EED7A7C6B82D39E0E321725B325D338E1442FE926306B388B991F36E43AD';
wwv_flow_api.g_varchar2_table(6) := '849C1B9A9BCB733FE43EB52AA1CFD4AEAA9665BD1D447C188E2534A060C30CEE3A58B00132A890870CBE1D70515303034C9450D452941889A7610E65ED79E580C371C4980DACD799354669CFE111EE841C9B741385ECC7E72029924364988C804CDE246F';
wwv_flow_api.g_varchar2_table(7) := '91C3248BD2117270D3B61C8BCF62DDD9F4F33E34D02BE31D83CCB99E465F14EFAC7BD2D0AF7FF4F7166BFB919C692B9F7807C0C30EB49803F1FAAF2EFDB02BF2B1422EBC7BB3EBEA124C3CA9BFA9DBA9F5D40AEEABA9B58891FA3DB586BF5548636E6690';
wwv_flow_api.g_varchar2_table(8) := 'D13C3E46908717CB205EC3657C7CD070FF0379768CB72562CD3AD713695827E807A5872538DB1F4995DF943F9515E50BE5BC72775B97DB7649F854F856F851F84EF85EF81964E1927059F849B8227C235C8C9DD5E3E763F3EC837A5BD5324DBB5E5330A5';
wwv_flow_api.g_varchar2_table(9) := '8CB45B7A49CA4A2F48AF48C5C89FD42D0D4963D21ED4ECDE3CB778BC782D069CC0BDD5D5F6B138AF825A034E05157841872D38B36DFE436BD24B864861DBD40EB3596E31C49C9815D3208B7BC51171481C67B8959FB8077523B8E7B64C9DFE980A688C15';
wwv_flow_api.g_varchar2_table(10) := 'AF7320983A36ABCC7A21D079407D7ADA6717EDA8ED9C718DD9BA2FEF5394D7E5347EAAA85CB0F4C17E59334D395079B24B3DEA2ED0EA20B0EF20BFA21FA8C1F72DB1F37A24F3DF0638F417DE593722D97403E06B0FA0FBB548D68777E2B39F015C38A037';
wwv_flow_api.g_varchar2_table(11) := 'DC85F0CE4F247E01F06AFBF7F17F5D19BC9B6E359B0FF0BEEAF80460E3E366F39FE56673E34BF4BF0670C9FC1759007178C428C240000000097048597300000B1300000B1301009A9C180000016469545874584D4C3A636F6D2E61646F62652E786D7000';
wwv_flow_api.g_varchar2_table(12) := '000000003C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D22584D5020436F726520342E342E30223E0A2020203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E';
wwv_flow_api.g_varchar2_table(13) := '77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E0A2020202020203C7264663A4465736372697074696F6E207264663A61626F75743D22220A202020202020202020202020786D6C6E733A786D703D22687474703A2F';
wwv_flow_api.g_varchar2_table(14) := '2F6E732E61646F62652E636F6D2F7861702F312E302F223E0A2020202020202020203C786D703A43726561746F72546F6F6C3E41646F626520496D61676552656164793C2F786D703A43726561746F72546F6F6C3E0A2020202020203C2F7264663A4465';
wwv_flow_api.g_varchar2_table(15) := '736372697074696F6E3E0A2020203C2F7264663A5244463E0A3C2F783A786D706D6574613E0A1BE57A0E0000041249444154388D9D945F68935718C67FE74B1A30B625DA322C58CD54EC6A275AD2DAC19CCA3A52AFBCFB7A6104A16382DEF46695160A32';
wwv_flow_api.g_varchar2_table(16) := '76A1179579234261CC0BC1BB8E5141292D8858D1D122E22A98C66FAD6DF3A7C5B449F33569F27DDFBB8B2631BA8DC11E389C3F9CF39CF73DE77D1E252214A18ACD01C866B38DDBB66DDB0BF80013580022BC8702848F212288882AF68848404486456456';
wwv_flow_api.g_varchar2_table(17) := '442C798F05111929140AA72BF66A15634404252295375D02AE0135894482A5C54552E9B42D22AEFABA3AF6EDDF4F757535C04DA554AF88D88056CA0A40894869E1127073757595172F5ED8D1A525B5B6B6A632A6A96C6B2B50A594747474B8BEEEECC4B6';
wwv_flow_api.g_varchar2_table(18) := 'ED9FDD6EF745112954A6EF2E921D05AE269349262727AD3F0DC3BDBCB282A669D8B68D65592A93C928CBB2F8E3E54B279E48A8B367CF7EFBF6EDDB49E0974A42AD18E97740EDEFCF9ED9E1D7AFDD2EB78BAF8E1F2797CB914AA54824129C3A758A93274E';
wwv_flow_api.g_varchar2_table(19) := 'E08076EBD62D67666686C6C6C68B4A299F52AAFC391AF0097072616101C3308846A3D4EDACA3EBF469BA759D742A45301844D7753E3F7C985C2E87699ADAE8BD5132994CF383070FBE90AD525125423FF0E9ECEC2CF1E565CD761C262626B8373ACAD1D6';
wwv_flow_api.g_varchar2_table(20) := '56060606D0759D4824C2F5EBD7D9304DB67BBD4C8C4F90C964AA9B9A9A5A95525A295B0DA806BCF1789CE4BB776C9826B9CD4D7EBA7183A9A9299A0F1D627D7D9DC1C1419E3F7F8EED38647339353737271E8F07AFD75B0F78A6A7A7CB843920BFB9B949';
wwv_flow_api.g_varchar2_table(21) := '3A9D66239B25168B110A85686B6B231A8BE2F57AE9E9E9414448A7D364B3595C2E97CAE7F3A4D3E9025065184639E539C0D8B3670FC96452969797D1759D9E9E1E0CC3E05CE81C77EEDC21180C72F5DA55E6E7E779F5EA95747575E1F178B24F9E3C8900';
wwv_flow_api.g_varchar2_table(22) := '55ABABABE5B28902D3EDEDED9F598582934C26B5582CC6E3C78F191A1A22129EE5F2E53E4404D334711C07C0E9EEEE76D5D4D4C4CF9F3FFF1250E3E3E3CE850B17B6A497CFE7DB44646D64644400EBC08103D2DCDC2C2D2D2DD2DADA2A2D2D2DE2F57AA5';
wwv_flow_api.g_varchar2_table(23) := '586B4E5F5F9F5896256363633F00FB42A1506D512454EAF17B1191DBB76F0B6001F6AE5DBB9C868606D9B96387531480DDDFDF2FB66D8B6118BF01EDF5F5F50DBAAE7B4A5A2E1B432010A82A140A3F3A8E938D4422323434249D9D9DE2F7FBE5D8B163D2';
wwv_flow_api.g_varchar2_table(24) := 'DFDF2F4F9F3E957C3E2F6FDE447E05BEF4F97C7B83C1E0F6527425C20FDC261C0E7F2322A3A669C6979696EC4422218B8B8B4E32994C653299A9FBF7EF0F02019FCFB7B7A3A3A316F8C071D4477E08204A29F7DDBB7703478E1C09D4D6D636ACACAC6C3C';
wwv_flow_api.g_varchar2_table(25) := '7AF468BEB7B7770648F9FDFEDCC18307D7C7C6C6B22252761ACA0F5931AF10BA28A51450057880AADDBB77AB3367CEE42DCBDA1C1E1EB6E4A3C3FF44F837F2870F1F6AE17058C56231019C2B57AE38FF76E0BF08FF17FE024E9C8958E5AFF3A000000000';
wwv_flow_api.g_varchar2_table(26) := '49454E44AE426082';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 761749690725176520 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_file_name => 'CLOSE.png'
 ,p_mime_type => 'image/png'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A20202020436F6C6F72426F7820436F7265205374796C653A0A2020202054686520666F6C6C6F77696E672043535320697320636F6E73697374656E74206265747765656E206578616D706C65207468656D657320616E642073686F756C64206E6F';
wwv_flow_api.g_varchar2_table(2) := '7420626520616C74657265642E0A2A2F0A0A23636F6C6F72626F782C202363626F784F7665726C61792C202363626F7857726170706572207B0A09706F736974696F6E3A206162736F6C7574653B0A09746F703A20303B0A096C6566743A20303B0A097A';
wwv_flow_api.g_varchar2_table(3) := '2D696E6465783A20393939393B0A096F766572666C6F773A2068696464656E3B0A7D0A0A2363626F784F7665726C6179207B0A09706F736974696F6E3A2066697865643B0A0977696474683A20313030253B0A096865696768743A20313030253B0A096F';
wwv_flow_api.g_varchar2_table(4) := '766572666C6F773A206175746F3B0A7D0A0A2363626F784D6964646C654C6566742C202363626F78426F74746F6D4C656674207B0A09636C6561723A206C6566743B0A7D0A0A2363626F78436F6E74656E74207B0A09706F736974696F6E3A2072656C61';
wwv_flow_api.g_varchar2_table(5) := '746976653B0A7D0A0A2363626F784C6F61646564436F6E74656E74207B0A096F766572666C6F773A206175746F3B0A7D0A0A2363626F785469746C65207B0A096D617267696E3A20303B0A7D0A0A2363626F784C6F6164696E674F7665726C61792C2023';
wwv_flow_api.g_varchar2_table(6) := '63626F784C6F6164696E6747726170686963207B0A09706F736974696F6E3A206162736F6C7574653B0A09746F703A20303B0A096C6566743A20303B0A0977696474683A20313030253B0A096865696768743A20313030253B0A7D0A0A2363626F785072';
wwv_flow_api.g_varchar2_table(7) := '6576696F75732C202363626F784E6578742C202363626F78436C6F73652C202363626F78536C69646573686F77207B0A09637572736F723A20706F696E7465723B0A7D0A0A2E63626F7850686F746F207B0A09666C6F61743A206C6566743B0A096D6172';
wwv_flow_api.g_varchar2_table(8) := '67696E3A206175746F3B0A09626F726465723A20303B0A09646973706C61793A20626C6F636B3B0A7D0A0A2E63626F78496672616D65207B0A0977696474683A20313030253B0A096865696768743A20313030253B0A09646973706C61793A20626C6F63';
wwv_flow_api.g_varchar2_table(9) := '6B3B0A09626F726465723A20303B0A09626F726465722D7261646975733A203670782036707820367078203670783B0A7D0A0A2F2A200A2020202055736572205374796C653A0A202020204368616E67652074686520666F6C6C6F77696E67207374796C';
wwv_flow_api.g_varchar2_table(10) := '657320746F206D6F646966792074686520617070656172616E6365206F6620436F6C6F72426F782E202054686579206172650A202020206F72646572656420262074616262656420696E206120776179207468617420726570726573656E747320746865';
wwv_flow_api.g_varchar2_table(11) := '206E657374696E67206F66207468652067656E6572617465642048544D4C2E0A2A2F0A0A2363626F784F7665726C6179207B0A096261636B67726F756E643A20233030303B0A7D0A0A23636F6C6F72626F78207B0A090A7D0A0A2363626F78436F6E7465';
wwv_flow_api.g_varchar2_table(12) := '6E74207B0A096D617267696E2D746F703A20323070783B0A7D0A0A2E63626F78496672616D65207B0A096261636B67726F756E643A20236565653B0A7D0A0A2363626F784572726F72207B0A0970616464696E673A20353070783B0A09626F726465723A';
wwv_flow_api.g_varchar2_table(13) := '2031707820736F6C696420236363633B0A7D0A0A2363626F784C6F61646564436F6E74656E74207B0A09626F726465723A2030707820736F6C696420233030303B0A096261636B67726F756E643A206E6F6E653B090A7D0A0A2363626F785469746C6520';
wwv_flow_api.g_varchar2_table(14) := '7B0A09706F736974696F6E3A206162736F6C7574653B0A09746F703A202D323070783B0A096C6566743A20303B0A09636F6C6F723A20236363633B0A7D0A0A2363626F7843757272656E74207B0A09706F736974696F6E3A206162736F6C7574653B0A09';
wwv_flow_api.g_varchar2_table(15) := '746F703A202D323070783B0A0972696768743A203070783B0A09636F6C6F723A20236363633B0A7D0A0A0A2363626F784C6F6164696E674F7665726C6179207B0A096261636B67726F756E643A20233030303B0A7D0A0A2363626F78436C6F7365207B0A';
wwv_flow_api.g_varchar2_table(16) := '20202020202020706F736974696F6E3A206162736F6C7574653B0A20202020202020746F703A203570783B0A2020202020202072696768743A203570783B0A20202020202020646973706C61793A20626C6F636B3B0A202020202020206261636B67726F';
wwv_flow_api.g_varchar2_table(17) := '756E643A2075726C2823504C5547494E5F50524546495823434C4F53452E706E6729206E6F2D72657065617420746F702063656E7465723B0A2020202020202077696474683A20323570783B0A202020202020206865696768743A20323570783B0A2020';
wwv_flow_api.g_varchar2_table(18) := '2020202020746578742D696E64656E743A202D3939393970783B0A7D';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 761953894390463294 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_file_name => 'sumneva_theme.css'
 ,p_mime_type => 'text/css'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A20202020436F6C6F72426F7820436F7265205374796C653A0A2020202054686520666F6C6C6F77696E672043535320697320636F6E73697374656E74206265747765656E206578616D706C65207468656D657320616E642073686F756C64206E6F';
wwv_flow_api.g_varchar2_table(2) := '7420626520616C74657265642E0A2A2F0A0A23636F6C6F72626F782C202363626F784F7665726C61792C202363626F7857726170706572207B0A09706F736974696F6E3A206162736F6C7574653B0A09746F703A20303B0A096C6566743A20303B0A097A';
wwv_flow_api.g_varchar2_table(3) := '2D696E6465783A20393939393B0A096F766572666C6F773A2068696464656E3B0A7D0A0A2363626F784F7665726C6179207B0A09706F736974696F6E3A2066697865643B0A0977696474683A20313030253B0A096865696768743A20313030253B0A096F';
wwv_flow_api.g_varchar2_table(4) := '766572666C6F773A206175746F3B0A7D0A0A2363626F784D6964646C654C6566742C202363626F78426F74746F6D4C656674207B0A09636C6561723A206C6566743B0A7D0A0A2363626F78436F6E74656E74207B0A09706F736974696F6E3A2072656C61';
wwv_flow_api.g_varchar2_table(5) := '746976653B0A7D0A0A2363626F784C6F61646564436F6E74656E74207B0A096F766572666C6F773A206175746F3B0A7D0A0A2363626F785469746C65207B0A096D617267696E3A20303B0A7D0A0A2363626F784C6F6164696E674F7665726C61792C2023';
wwv_flow_api.g_varchar2_table(6) := '63626F784C6F6164696E6747726170686963207B0A09706F736974696F6E3A206162736F6C7574653B0A09746F703A20303B0A096C6566743A20303B0A0977696474683A20313030253B0A096865696768743A20313030253B0A7D0A0A2363626F785072';
wwv_flow_api.g_varchar2_table(7) := '6576696F75732C202363626F784E6578742C202363626F78436C6F73652C202363626F78536C69646573686F77207B0A09637572736F723A20706F696E7465723B0A7D0A0A2E63626F7850686F746F207B0A09666C6F61743A206C6566743B0A096D6172';
wwv_flow_api.g_varchar2_table(8) := '67696E3A206175746F3B0A09626F726465723A20303B0A09646973706C61793A20626C6F636B3B0A7D0A0A2E63626F78496672616D65207B0A0977696474683A20313030253B0A096865696768743A20313030253B0A09646973706C61793A20626C6F63';
wwv_flow_api.g_varchar2_table(9) := '6B3B0A09626F726465723A20303B0A09626F726465722D7261646975733A203670782036707820367078203670783B0A7D0A0A2F2A200A2020202055736572205374796C653A0A202020204368616E67652074686520666F6C6C6F77696E67207374796C';
wwv_flow_api.g_varchar2_table(10) := '657320746F206D6F646966792074686520617070656172616E6365206F6620436F6C6F72426F782E202054686579206172650A202020206F72646572656420262074616262656420696E206120776179207468617420726570726573656E747320746865';
wwv_flow_api.g_varchar2_table(11) := '206E657374696E67206F66207468652067656E6572617465642048544D4C2E0A2A2F0A0A2363626F784F7665726C6179207B0A096261636B67726F756E643A20233030303B0A7D0A0A23636F6C6F72626F78207B0A090A7D0A0A2363626F78436F6E7465';
wwv_flow_api.g_varchar2_table(12) := '6E74207B0A096D617267696E2D746F703A20323070783B0A7D0A0A2E63626F78496672616D65207B0A096261636B67726F756E643A20236565653B0A7D0A0A2363626F784572726F72207B0A0970616464696E673A20353070783B0A09626F726465723A';
wwv_flow_api.g_varchar2_table(13) := '2031707820736F6C696420236363633B0A7D0A0A2363626F784C6F61646564436F6E74656E74207B0A09626F726465723A2030707820736F6C696420233030303B0A096261636B67726F756E643A206E6F6E653B090A7D0A0A2363626F785469746C6520';
wwv_flow_api.g_varchar2_table(14) := '7B0A09706F736974696F6E3A206162736F6C7574653B0A09746F703A202D323070783B0A096C6566743A20303B0A09636F6C6F723A20236363633B0A7D0A0A2363626F7843757272656E74207B0A09706F736974696F6E3A206162736F6C7574653B0A09';
wwv_flow_api.g_varchar2_table(15) := '746F703A202D323070783B0A0972696768743A203070783B0A09636F6C6F723A20236363633B0A7D0A0A0A2363626F784C6F6164696E674F7665726C6179207B0A096261636B67726F756E643A20233030303B0A7D0A0A2363626F78436C6F7365207B0A';
wwv_flow_api.g_varchar2_table(16) := '20202020202020706F736974696F6E3A206162736F6C7574653B0A20202020202020746F703A203570783B0A2020202020202072696768743A203570783B0A20202020202020646973706C61793A20626C6F636B3B0A202020202020206261636B67726F';
wwv_flow_api.g_varchar2_table(17) := '756E643A2075726C2823504C5547494E5F50524546495823434C4F53452E706E6729206E6F2D72657065617420746F702063656E7465723B0A2020202020202077696474683A20323570783B0A202020202020206865696768743A20323570783B0A2020';
wwv_flow_api.g_varchar2_table(18) := '2020202020746578742D696E64656E743A202D3939393970783B0A7D';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 761957788788724152 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 35174187306087027953 + wwv_flow_api.g_id_offset
 ,p_file_name => 'sumneva_theme_ie.css'
 ,p_mime_type => 'text/css'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

prompt  ...data loading
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 218693102184272050 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
