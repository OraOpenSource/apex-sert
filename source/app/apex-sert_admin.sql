set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.2.00.07'
,p_default_workspace_id=>33530162989655026
,p_default_application_id=>160
,p_default_owner=>'SV_SERT_APEX'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 160 - APEX-SERT Administration
--
-- Application Export:
--   Application:     160
--   Name:            APEX-SERT Administration
--   Date and Time:   18:05 Tuesday June 21, 2016
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.2.00.07
--   Instance ID:     69403355430565
--

-- Application Statistics:
--   Pages:                     21
--     Items:                   27
--     Computations:             1
--     Validations:              9
--     Processes:               32
--     Regions:                 26
--     Buttons:                 18
--     Dynamic Actions:         23
--   Shared Components:
--     Logic:
--       Items:                  2
--       Computations:           1
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:             18
--       NavBar Entries:         3
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 2
--       Templates:
--         Page:                15
--         Region:              30
--         Label:                8
--         List:                15
--         Popup LOV:            2
--         Calendar:             2
--         Breadcrumb:           2
--         Button:              11
--         Report:              14
--       Shortcuts:             11
--       Plug-ins:               2
--     Globalization:
--     Reports:
--   Supporting Objects:  Included

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,160)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'SV_SERT_APEX')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'APEX-SERT Administration')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'SERT_ADMIN')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20160621180512'
,p_bookmark_checksum_function=>'MD5'
,p_max_session_length_sec=>9999
,p_max_session_idle_sec=>1999
,p_compatibility_mode=>'4.2'
,p_html_escaping_mode=>'B'
,p_flow_language=>'en-us'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(539825107719258899)
,p_logout_url=>'f?p=&APP_ID.:102:&SESSION.'
,p_application_tab_set=>0
,p_logo_image=>'TEXT:<i class="fa fa-gears"></i> APEX-SERT Admin'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'000000'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_restrict_to_user_list=>'SV_DEV'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'S'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T:O:W'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160621180512'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(33687950038767669)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33688095500767669)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33688375564767670)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Admin Users'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'300,310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33688653214767670)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Roles'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&APP_SESSION.::&DEBUG.:'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'200,210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33688433686767670)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Preferences'
,p_list_item_link_target=>'f?p=&APP_ID.:400:&APP_SESSION.::&DEBUG.:'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'400,410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33688541385767670)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Scheduled Evaluations'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'500,540,510,520,530,525,535'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33706064006802716)
,p_list_item_display_sequence=>41
,p_list_item_link_text=>'Individual Evaluations'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(33688541385767670)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33706346590803988)
,p_list_item_display_sequence=>42
,p_list_item_link_text=>'Group Evaluations'
,p_list_item_link_target=>'f?p=&APP_ID.:510:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(33688541385767670)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33706670354804942)
,p_list_item_display_sequence=>43
,p_list_item_link_text=>'Schedule Groups'
,p_list_item_link_target=>'f?p=&APP_ID.:520:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(33688541385767670)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33706999746806349)
,p_list_item_display_sequence=>44
,p_list_item_link_text=>'Notification Lists'
,p_list_item_link_target=>'f?p=&APP_ID.:530:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(33688541385767670)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33707433999808410)
,p_list_item_display_sequence=>45
,p_list_item_link_text=>'Job Runs'
,p_list_item_link_target=>'f?p=&APP_ID.:540:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(33688541385767670)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(77395551419680906)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Logs'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33688137295767670)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Error Logs'
,p_list_item_link_target=>'f?p=&APP_ID.:1500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(77395551419680906)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1500,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33688220662767670)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Mail Queue'
,p_list_item_link_target=>'f?p=&APP_ID.:1600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(77395551419680906)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1600,,1610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(77377495987565511)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Mail Queue Log'
,p_list_item_link_target=>'f?p=&APP_ID.:1610:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(77395551419680906)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(288601209885203211)
,p_name=>'Scheduling'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(288601581619204524)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Individual Evaluations'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(288602378634213120)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Group Evaluations'
,p_list_item_link_target=>'f?p=&APP_ID.:510:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(288602588330215863)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Schedule Groups'
,p_list_item_link_target=>'f?p=&APP_ID.:520:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'520,525'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(288602896988218416)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Notification Lists'
,p_list_item_link_target=>'f?p=&APP_ID.:530:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'530,535'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(288603104260220501)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Job Runs'
,p_list_item_link_target=>'f?p=&APP_ID.:540:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(33588132781662666)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(33588293056662666)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(251796496202435494)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(251801195984436034)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'PLUGIN_COM_SKILLBUILDERS_MODAL_PAGE'
,p_attribute_01=>'1'
,p_attribute_02=>'.5'
,p_attribute_03=>'N'
,p_attribute_04=>'none'
,p_attribute_05=>'100'
,p_attribute_06=>'300'
,p_attribute_07=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(286811709925376306)
,p_icon_sequence=>10
,p_icon_subtext=>'Reset Password'
,p_icon_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_nav_entry_is_feedback_yn=>'N'
,p_icon_bar_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(799867687180524927)
,p_icon_sequence=>10
,p_icon_subtext=>'APEX Builder'
,p_icon_target=>'f?p=4000:1500:&G_APEX_BUILDER_SESSION_ID.'
,p_nav_entry_is_feedback_yn=>'N'
,p_icon_bar_disp_cond=>'G_APEX_BUILDER_SESSION_ID'
,p_icon_bar_disp_cond_type=>'ITEM_IS_NOT_NULL'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(832947518225358754)
,p_icon_sequence=>99
,p_icon_subtext=>'Logout'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Logout'
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_icon_bar_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
,p_reference_id=>9848027047569055
);
end;
/
prompt --application/shared_components/logic/application_processes
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(818824561659821694)
,p_name=>'G_LOGO'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(286819687003540012)
,p_name=>'G_RESULT'
,p_protection_level=>'I'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(286834394443554488)
,p_computation_sequence=>10
,p_computation_item=>'G_LOGO'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'RETURN sv_sec_util.logo;'
,p_compute_when_type=>'NEVER'
);
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(797230193274859034)
,p_group_name=>'SQLi : Processes'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(832938918759265190)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(77376272438559832)
,p_short_name=>'Mail Queue Log'
,p_link=>'f?p=&APP_ID.:1610:&SESSION.'
,p_page_id=>1610
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(286792878675831918)
,p_parent_id=>0
,p_short_name=>'Admin Users'
,p_link=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::'
,p_page_id=>300
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(286815194521441498)
,p_parent_id=>wwv_flow_api.id(286792878675831918)
,p_short_name=>'Manage Admin User'
,p_link=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:::'
,p_page_id=>310
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288245599399721851)
,p_parent_id=>0
,p_short_name=>'Preferences'
,p_link=>'f?p=&FLOW_ID.:400:&SESSION.'
,p_page_id=>400
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288250390327803308)
,p_parent_id=>wwv_flow_api.id(288245599399721851)
,p_short_name=>'Manage Preference'
,p_link=>'f?p=&FLOW_ID.:410:&SESSION.'
,p_page_id=>410
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288572799835636945)
,p_parent_id=>0
,p_short_name=>'Scheduled Individual Evaluations'
,p_link=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::'
,p_page_id=>500
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288603800774223545)
,p_parent_id=>0
,p_short_name=>'Job Runs'
,p_link=>'f?p=&FLOW_ID.:540:&SESSION.'
,p_page_id=>540
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288608209637267785)
,p_parent_id=>0
,p_short_name=>'Scheduled Group Evaluations'
,p_link=>'f?p=&APP_ID.:510:&SESSION.'
,p_page_id=>510
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288611107971307945)
,p_parent_id=>0
,p_short_name=>'Schedule Groups'
,p_link=>'f?p=&APP_ID.:520:&SESSION.'
,p_page_id=>520
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288613283892315090)
,p_parent_id=>0
,p_short_name=>'Notification Lists'
,p_link=>'f?p=&APP_ID.:530:&SESSION.'
,p_page_id=>530
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288625503627638817)
,p_parent_id=>wwv_flow_api.id(288611107971307945)
,p_short_name=>'Manage Schedule Groups'
,p_link=>'f?p=&FLOW_ID.:525:&SESSION.'
,p_page_id=>525
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(288632779301735245)
,p_parent_id=>wwv_flow_api.id(288613283892315090)
,p_short_name=>'Manage Notification Lists'
,p_link=>'f?p=&FLOW_ID.:535:&SESSION.'
,p_page_id=>535
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(289037378941485993)
,p_parent_id=>0
,p_short_name=>'Mail Queue'
,p_link=>'f?p=&APP_ID.:1600:&SESSION.'
,p_page_id=>1600
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(539873603360366035)
,p_short_name=>'Page Zero'
,p_link=>'f?p=&FLOW_ID.:0:&SESSION.'
,p_page_id=>0
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(539955507035983493)
,p_parent_id=>0
,p_short_name=>'Roles'
,p_link=>'f?p=&FLOW_ID.:200:&SESSION.'
,p_page_id=>200
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(539965120680067137)
,p_parent_id=>wwv_flow_api.id(539955507035983493)
,p_short_name=>'Manage Roles'
,p_link=>'f?p=&FLOW_ID.:210:&SESSION.'
,p_page_id=>210
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(813910931849705274)
,p_parent_id=>0
,p_short_name=>'Error Logs'
,p_link=>'f?p=&APP_ID.:1500:&SESSION.::&DEBUG.:::'
,p_page_id=>1500
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(832939421276265238)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33596222420756480)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33596533727756483)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33596808401756483)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33597120197756486)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33597487344756486)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33597740838756486)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33598066960756486)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33598391150756486)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33598636315756486)
,p_page_template_id=>wwv_flow_api.id(33596222420756480)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33598839963756493)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33599122309756493)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33599467342756493)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33599757391756493)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33600066476756493)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33600340322756494)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33600654182756494)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33600949491756494)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33601248011756497)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33601568212756497)
,p_page_template_id=>wwv_flow_api.id(33598839963756493)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33601777985756497)
,p_theme_id=>42
,p_name=>'Login'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="html-login no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="html-login no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="html-login no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container">',
'      #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33602011112756497)
,p_page_template_id=>wwv_flow_api.id(33601777985756497)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33602313429756497)
,p_page_template_id=>wwv_flow_api.id(33601777985756497)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33602572935756497)
,p_theme_id=>42
,p_name=>'Master Detail'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-info" id="t_Body_info">',
'        #REGION_POSITION_02#',
'      </div>',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33602831029756498)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33603152386756498)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33603420706756498)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33603767351756498)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33604097172756498)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33604342978756498)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33604600623756499)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33604985311756499)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33605264964756499)
,p_page_template_id=>wwv_flow_api.id(33602572935756497)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33605482774756502)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33605737386756502)
,p_page_template_id=>wwv_flow_api.id(33605482774756502)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33606048869756502)
,p_page_template_id=>wwv_flow_api.id(33605482774756502)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33606323596756503)
,p_page_template_id=>wwv_flow_api.id(33605482774756502)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33606615659756503)
,p_page_template_id=>wwv_flow_api.id(33605482774756502)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33606917919756503)
,p_page_template_id=>wwv_flow_api.id(33605482774756502)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33607253866756503)
,p_page_template_id=>wwv_flow_api.id(33605482774756502)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33607577920756503)
,p_page_template_id=>wwv_flow_api.id(33605482774756502)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33607776164756503)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-wrapper">',
'    <div class="t-Dialog-header">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'500'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--standard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33608078793756503)
,p_page_template_id=>wwv_flow_api.id(33607776164756503)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33608321384756503)
,p_page_template_id=>wwv_flow_api.id(33607776164756503)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33608612927756503)
,p_page_template_id=>wwv_flow_api.id(33607776164756503)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33608836917756503)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33609147287756504)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33609424678756504)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33609794758756504)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33610078779756504)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33610359125756504)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33610694084756504)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33610988939756505)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33611262937756505)
,p_page_template_id=>wwv_flow_api.id(33608836917756503)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33611445942756505)
,p_theme_id=>42
,p_name=>'Standard'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33611742986756505)
,p_page_template_id=>wwv_flow_api.id(33611445942756505)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33612052119756509)
,p_page_template_id=>wwv_flow_api.id(33611445942756505)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33612374838756509)
,p_page_template_id=>wwv_flow_api.id(33611445942756505)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33612604023756509)
,p_page_template_id=>wwv_flow_api.id(33611445942756505)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33612909952756509)
,p_page_template_id=>wwv_flow_api.id(33611445942756505)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33613290969756509)
,p_page_template_id=>wwv_flow_api.id(33611445942756505)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33613535151756509)
,p_page_template_id=>wwv_flow_api.id(33611445942756505)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(33613778960756509)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Wizard t-Wizard--modal">',
'    <div class=" t-Wizard-steps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Wizard-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Wizard-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--wizard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33614045313756510)
,p_page_template_id=>wwv_flow_api.id(33613778960756509)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33614354410756510)
,p_page_template_id=>wwv_flow_api.id(33613778960756509)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(33614640116756510)
,p_page_template_id=>wwv_flow_api.id(33613778960756509)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(797556275011843683)
,p_theme_id=>101
,p_name=>'Error Page'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<head>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'',
'<script src="#WORKSPACE_IMAGES#sv_sert_000000.js" type="text/javascript"></script>',
'',
'<!--[if gte IE 7]>',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_000000.css" type="text/css" /> ',
'<![endif]-->',
'',
'<!--[if !IE]> -->',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_000000.css" type="text/css" /> ',
'<!-- <![endif]-->',
'',
'<script src="#IMAGE_PREFIX#libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>',
'',
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="body">',
' <div id="two-col-sb-left">',
'  <div id="left-sidebar">',
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>',
'   </div>',
'  <div id="main">',
'   <div id="main-sb-left">',
'    <div id="menu">',
'     <div id="navbar">#NAVIGATION_BAR#<span class="app-user">&USER.</span></div>',
'   </div>',
'  </div>',
'  <div id="box-body">',
'   <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'   <div class="notification" id="notification-message" style="text-align:center;">',
'An error has occurred and has been logged.</div>',
'<div class="formRegion">',
'  <div class="formRegionHeader">',
'    <div class="formRegionTitleNoHelp">Error</div>',
'  </div>',
'  <div class="formRegionContent">',
'  <span style="font-size:12px;">',
'  Complete error details, including the stack trace, are available in the <a href="f?p=&APP_ID.:1500:&APP_SESSION.">Error Log</a>.</span>',
'  #BODY#',
'  </div>',
'</div>',
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>',
'  </div>',
'  </div>',
'  <div id="right-sidebar"></div>',
'  </div>',
' </div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'<a name="END"></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_non_curr_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a class="pageHelp" href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" width=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_reference_id=>10510441759767050
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(809844885352417942)
,p_theme_id=>101
,p_name=>'Login'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<head>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'',
'<script src="#WORKSPACE_IMAGES#sv_sert_000000.js" type="text/javascript"></script>',
'',
'<!--[if gte IE 7]>',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_000000.css" type="text/css" /> ',
'<![endif]-->',
'',
'<!--[if !IE]> -->',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_000000.css" type="text/css" /> ',
'<!-- <![endif]-->',
'',
'<script src="/i/libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>',
'',
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="body">',
' <div id="two-col-sb-left">',
'  <div id="left-sidebar">',
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>',
'      #REGION_POSITION_02##REGION_POSITION_08#',
'  </div>',
'  <div id="main-sb-left">',
'   <div id="menu">',
'    <div id="navbar">&nbsp;</div>',
'    <div id="breadcrumbs">#REGION_POSITION_01#</div>',
'   </div>',
'  </div>',
'  <div id="box-body">',
'   <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'      #BODY#',
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>',
'  </div>',
'  <div id="right-sidebar"></div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'<a name="END"></a>',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_non_curr_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" width=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_grid_type=>'TABLE'
,p_reference_id=>10510441759767050
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(812633261326832673)
,p_theme_id=>101
,p_name=>'Two Level Tabs'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<head>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'',
'<script src="#WORKSPACE_IMAGES#sv_sert_000000.js" type="text/javascript"></script>',
'',
'<!--[if gte IE 7]>',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_000000.css" type="text/css" /> ',
'<![endif]-->',
'',
'<!--[if !IE]> -->',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_000000.css" type="text/css" /> ',
'<!-- <![endif]-->',
'',
'<style type="text/css">',
'#breadcrumbs{height:33px;}',
'</style>',
'',
'<script src="#IMAGE_PREFIX#libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>',
'',
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="body">',
' <div id="two-col-sb-left">',
'  <div id="left-sidebar">',
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>',
'      #REGION_POSITION_02##REGION_POSITION_08#',
'   </div>',
'  <div id="main">',
'   <div id="main-sb-left">',
'    <div id="menu">',
'     <div id="navbar">#NAVIGATION_BAR#<span class="app-user">&USER. (&G_WORKSPACE_NAME.)</span></div>',
'     <div id="tab-holder"><ul id="tabs">#PARENT_TAB_CELLS#</ul></div>',
'     <div id="breadcrumbs">#REGION_POSITION_01#</div>',
'     <div id="list-tabs">#REGION_POSITION_03#</div>',
'   </div>',
'  </div>',
'  <div id="box-body">',
'   <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'      #BODY#',
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>',
'  </div>',
'  </div>',
'  <div id="right-sidebar"></div>',
'  </div>',
' </div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="current">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_non_curr_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a class="pageHelp" href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_grid_type=>'TABLE'
,p_reference_id=>10510441759767050
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(832296336501114286)
,p_theme_id=>101
,p_name=>'Popup'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'',
'<!--[if gte IE 7]>',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_000000.css" type="text/css" /> ',
'<![endif]-->',
'',
'<!--[if !IE]> -->',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_000000.css" type="text/css" /> ',
'<!-- <![endif]-->',
'',
'<script src="#WORKSPACE_IMAGES#sv_sert_000000.js" type="text/javascript"></script>',
'',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD# style="background-color: #eee;"><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div>',
' <div>#SUCCESS_MESSAGE#</div>',
' <div>#BODY#</div>',
'</div>',
''))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE##DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div id="success-message">#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div class="t13notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavigationBar">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>4
,p_grid_type=>'TABLE'
,p_reference_id=>244412628968574478
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(832296616452114286)
,p_theme_id=>101
,p_name=>'Printer Friendly'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'',
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#><noscript>&MSG_JSCRIPT.</noscript>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td valign="top">#LOGO##REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#REGION_POSITION_08#</td>',
'</table>',
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td width="100%" valign="top">',
'<div style="border:1px solid black;">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>',
'#BODY##REGION_POSITION_04#</td>',
'<td valign="top">#REGION_POSITION_03#<br /></td>',
'</tr>',
'</table>',
'#REGION_POSITION_05#'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE##DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t13success">#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div class="t13notification">#MESSAGE#</div>'
,p_navigation_bar=>'<div id="t13NavBar">#BAR_BODY#</div>'
,p_navbar_entry=>'<a href="#LINK#" class="t13NavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>5
,p_grid_type=>'TABLE'
,p_reference_id=>244412953876574478
,p_translate_this_template=>'N'
,p_template_comment=>'3'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(832297512950114286)
,p_theme_id=>101
,p_name=>'One Level Tabs'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<head>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'',
'<script src="#WORKSPACE_IMAGES#sv_sert_000000.js" type="text/javascript"></script>',
'',
'<!--[if gte IE 7]>',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_ie_000000.css" type="text/css" /> ',
'<![endif]-->',
'',
'<!--[if !IE]> -->',
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#sv_sert_000000.css" type="text/css" /> ',
'<!-- <![endif]-->',
'',
'<script src="#IMAGE_PREFIX#libraries/jquery-ui/1.8/ui/jquery.ui.progressbar.js" type="text/javascript"></script>',
'',
'<title>#TITLE#</title>',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#<a name="PAGETOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="body">',
' <div id="two-col-sb-left">',
'  <div id="left-sidebar">',
'   <div id="logo"><a href="#HOME_LINK#">#LOGO#</a></div>',
'      #REGION_POSITION_02##REGION_POSITION_08#',
'   </div>',
'  <div id="main">',
'   <div id="main-sb-left">',
'    <div id="menu">',
'     <div id="navbar">#NAVIGATION_BAR#<span class="app-user">&USER.</span></div>',
'     <div id="tab-holder"><ul id="tabs">#PARENT_TAB_CELLS#</ul></div>',
'     <div id="breadcrumbs">#REGION_POSITION_01#</div>',
'     <div id="list-tabs">#REGION_POSITION_03#</div>',
'   </div>',
'  </div>',
'  <div id="box-body">',
'   <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'      #BODY##REGION_POSITION_06#',
'   <div id="footer"><span class="content">&G_COPYRIGHT.</span></div>',
'  </div>',
'  </div>',
'  <div id="right-sidebar"></div>',
'  </div>',
' </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="sub#TAB_STATUS#">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="current">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_non_curr_tab=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a class="pageHelp" href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" width=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_reference_id=>10510441759767050
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(33589378214662784)
,p_template_name=>'HTML button (legacy - APEX 5 migration)'
,p_template=>' <input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_hot_template=>' <input type="button" value="#LABEL#" onclick="#JAVASCRIPT#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#/>'
,p_translate_this_template=>'N'
,p_theme_class_id=>13
,p_theme_id=>101
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(33676899027756605)
,p_template_name=>'Icon'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(33676969712756605)
,p_template_name=>'Text'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(33677019339756606)
,p_template_name=>'Text with Icon'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(795500082229221121)
,p_template_name=>'Button - Page Popup'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" class="button-default" type="button" #BUTTON_ATTRIBUTES#>',
'  <span>#LABEL#</span>',
'</button>'))
,p_reference_id=>244427238837574489
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(796104572898172928)
,p_template_name=>'View Scorecard Button'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" id="showScorecard" class="button-default button-recalc" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_reference_id=>244427238837574489
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(798944779677876137)
,p_template_name=>'Import Button'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="javascript:importFile();" class="button-default" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>6
,p_theme_id=>101
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(807261912719965717)
,p_template_name=>'Recalculate Page Button'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="javascript:svScan(&P200_APPLICATION_ID.,$v(''P0_ATTRIBUTE_SET_ID''),&APP_PAGE_ID.,''PAGE_SCORE'');" class="button-default button-recalc" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_reference_id=>244427238837574489
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(812618557592287362)
,p_template_name=>'Recalculate Button'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="javascript:svScan(&P200_APPLICATION_ID.,$v(''P0_ATTRIBUTE_SET_ID''),&APP_PAGE_ID.,''SCORE'');" class="button-default button-recalc" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_reference_id=>244427238837574489
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(813604370545974266)
,p_template_name=>'Button - Evaluate'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="javascript:svScan($v(''P1_APPLICATION_ID''),$v(''P1_EVAL_ATTRIBUTE_SET_ID''),800,''SCORE'');" class="button-default" type="button" #BUTTON_ATTRIBUTES#>',
'  <span>#LABEL#</span>',
'</button>'))
,p_reference_id=>244427238837574489
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(832298120325114286)
,p_template_name=>'Button'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-default" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">',
'  <span>#LABEL#</span>',
'</button>'))
,p_reference_id=>244427238837574489
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33614896539756510)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #BODY#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33615124901756515)
,p_plug_template_id=>wwv_flow_api.id(33614896539756510)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33617953531756523)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33618198219756523)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33618419310756523)
,p_plug_template_id=>wwv_flow_api.id(33618198219756523)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33618779871756523)
,p_plug_template_id=>wwv_flow_api.id(33618198219756523)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33620132178756525)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33620481170756525)
,p_plug_template_id=>wwv_flow_api.id(33620132178756525)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33620754252756525)
,p_plug_template_id=>wwv_flow_api.id(33620132178756525)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33627194128756536)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls">',
'    <button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33627459084756536)
,p_plug_template_id=>wwv_flow_api.id(33627194128756536)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33627716996756536)
,p_plug_template_id=>wwv_flow_api.id(33627194128756536)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33631545989756541)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h2 class="t-HeroRegion-title">#TITLE#</h2>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33631844730756541)
,p_plug_template_id=>wwv_flow_api.id(33631545989756541)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33632010365756541)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-body js-regionDialog-body">',
'#BODY#',
'  </div>',
'  <div class="t-DialogRegion-buttons js-regionDialog-buttons">',
'     <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'       <div class="t-ButtonRegion-wrap">',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'       </div>',
'     </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33632347155756541)
,p_plug_template_id=>wwv_flow_api.id(33632010365756541)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33633992723756542)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33634512678756543)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33634866173756543)
,p_plug_template_id=>wwv_flow_api.id(33634512678756543)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33635078329756543)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33635374067756543)
,p_plug_template_id=>wwv_flow_api.id(33635078329756543)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33635653287756547)
,p_plug_template_id=>wwv_flow_api.id(33635078329756543)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33639405632756549)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33639795780756549)
,p_plug_template_id=>wwv_flow_api.id(33639405632756549)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33640016927756549)
,p_plug_template_id=>wwv_flow_api.id(33639405632756549)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33642023811756553)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(33643073550756553)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(33643328315756555)
,p_plug_template_id=>wwv_flow_api.id(33643073550756553)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(794764882954529145)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" style="padding: none;">#BODY#</div>'
,p_page_plug_template_name=>'Application Name and Score'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(794944459357544305)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegionPopup" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="formRegionHeader">',
'    <div class="formRegionTitleNoHelp">#TITLE#</div>',
'    <div class="formRegionPopupButtons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Popup'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(797313281673462699)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="formRegionContent">#BODY#</div>',
'  <div class="formRegionDashboardButtons">#CREATE#</div>',
'</div>'))
,p_page_plug_template_name=>'Dashboard Region'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>101
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>11075013368112103
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table class="wideContentRegion" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#">',
' <tbody>',
'  <tr>',
'   <td colspan="2" class="contentRegionBody">#BODY#</td>',
'  </tr>',
' </tbody>',
'</table>'))
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(797376592746341139)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="formRegionHeader">',
'    <div class="formRegionTitleNoHelp">#TITLE#</div>',
'    <div class="formRegionButtons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Wide'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(798204075346382146)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegionDashboard" style="width:800px;" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="formRegionHeaderDashboard">',
'    <div class="formRegionTitleDashboard">#TITLE#</div>',
'    <div class="formRegionButtonsDashboard"></div>',
'  </div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Subform, Wide'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>11462331722353385
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(798485590700052755)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'',
'<div class="&G_HELP_CLASS."><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a></div>',
'',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Report Region - Wide, No Title, Summary'
,p_theme_id=>101
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(798524392450204623)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<div>',
'  <div class="dashboardTableTitle" style="padding:5px;">#TITLE#</div>',
'<div style="float:right;margin-top:-25px;padding-right:10px;"><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a></div>',
'</div>',
'',
'',
'  <div class="formRegionContent">#BODY#</div>',
'    <div class="formRegionDashboardButtons">#CREATE#</div>',
'</div>'))
,p_page_plug_template_name=>'Dashboard Region w/Help'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(799155381171089529)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<div>',
'  <div class="dashboardTableTitle" style="padding:5px;">#TITLE#</div>',
'<div style="float:right;margin-top:-25px;padding-right:10px;"><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a>&nbsp;&nbsp;<a href=""RPT_CAT"" ><img src="#WORKSPACE_IMAGES#PRINT.gif"/></a></div>',
'</div>',
'',
'',
'  <div class="formRegionContent">#BODY#</div>',
'    <div class="formRegionDashboardButtons">#CREATE#</div>',
'</div>'))
,p_page_plug_template_name=>'Dashboard Region w/Help and Print'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(800452373182722786)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegionDashboard2Up"  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# style="min-height:195px;">',
'  <div class="formRegionHeaderDashboard">',
'    <div class="formRegionTitleDashboard">',
'      <div style="float:left;">#TITLE#</div>',
'      <div style="float:right;">#CREATE#<a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"></a></div>',
'     </div>',
'    <div class="formRegionButtonsDashboard"></div>',
'  </div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Dashboard, 2 Up'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>11462331722353385
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(800545868807232036)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegionDashboard23"  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# style="min-height:195px;">',
'  <div class="formRegionHeaderDashboard">',
'    <div class="formRegionTitleDashboard">',
'      <div style="float:left;">#TITLE#</div>',
'      <div style="float:right;">#CREATE#<a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"></a></div>',
'     </div>',
'  </div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Dashboard, 2/3'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>11462331722353385
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(809524375400985814)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="tipTabs" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Wide jQuery Tab'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>244415943492574480
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(812010233504410740)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><table class="sidebarRegion">',
' <tbody>',
'  <tr>',
'   <td style="text-align:center;">#BODY#</td>',
'  </tr>',
' </tbody>',
'</table>',
'</div>'))
,p_page_plug_template_name=>'Sidebar Region - No Title'
,p_theme_id=>101
,p_theme_class_id=>2
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>10523728904379071
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(812065392727080197)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegionDashboard"  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# style="min-height:195px;">',
'  <div class="formRegionHeaderDashboard">',
'    <div class="formRegionTitleDashboard">',
'      <div style="float:left;">#TITLE#</div>',
'      <div style="float:right;">#CREATE#<a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"></a></div>',
'     </div>',
'    <div class="formRegionButtonsDashboard"></div>',
'  </div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Dashboard'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>11462331722353385
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(812310986169636453)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegionDashboard" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="formRegionHeaderDashboard">',
'    <div class="formRegionTitleDashboard">#TITLE#</div>',
'    <div class="formRegionButtonsDashboard"></div>',
'  </div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Subform'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>11462331722353385
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(832299514954114287)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_ID#">#BODY#</div>'
,p_page_plug_template_name=>'Breadcrumb Region'
,p_theme_id=>101
,p_theme_class_id=>6
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>244414428813574479
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(832300716761114287)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="formRegionHeader">',
'  <div class="formRegionTitle">',
'   <div style="float:left;padding:5px;">#TITLE#</div>',
'   <div style="float:right;">',
'    <div class="formRegionButtons" style="float:left;">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'    <div style="float:right;padding-top:7px;padding-right:5px;" class="formRegionHelpIcon"><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP.gif"></a></div>',
'   </div>',
'  </div>',
' </div>',
' <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Form Region - Wide w/Help Icon'
,p_theme_id=>101
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>244415943492574480
,p_translate_this_template=>'N'
,p_template_comment=>'Form Region is shimed out a minimum of 600px'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(832303711914114290)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="formRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="&G_HELP_CLASS."><a href="#" class="regionHelp" id="#REGION_ID#"><img src="#WORKSPACE_IMAGES#HELP_DB.gif"/></a></div>',
'  <div class="formRegionContent">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Report Region - Wide, No TItle'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>101
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>11075013368112103
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33659948785756579)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_theme_id=>42
,p_theme_class_id=>3
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_list_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33663352471756582)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2885322685880632508
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33667578123756587)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item#A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#<'
||'/span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33669150354756589)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2066548068783481421
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33670947374756592)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33671950691756593)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({ slide: e.hasClass("js-slide")});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33672143708756593)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33672321218756597)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'$(''body'').addClass(''t-PageBody--leftNav'');',
''))
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33672592814756597)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_theme_id=>42
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33674323860756599)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(33675326722756599)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(812058469009761216)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="rt-current">',
'<a href="#LINK#"><span></span>#TEXT#</a>',
'</li>',
'',
'',
'',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="rt-non-current">',
'<a href="#LINK#"><span></span>#TEXT#</a>',
'</li>'))
,p_list_template_name=>'Region Tabs'
,p_theme_id=>101
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="region-tab-holder">',
'<ul id="region-tabs">'))
,p_list_template_after_rows=>'</ul></div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(812386135048090054)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="rt-current">',
'<a href="#LINK#"><span></span>#TEXT#</a>',
'</li>',
'',
'',
'',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="rt-non-current">',
'<a href="#LINK#"><span></span>#TEXT#</a>',
'</li>'))
,p_list_template_name=>'Region Sub Tabs'
,p_theme_id=>101
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="region-subtab-holder">',
'<ul id="region-tabs">'))
,p_list_template_after_rows=>'</ul></div>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(812627042485742089)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li id="tab"><a href="#LINK#" class="currentTab">#TEXT#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li id="tab""><a href="#LINK#">#TEXT#</a></li>',
''))
,p_list_template_name=>'Main Sub Tabs'
,p_theme_id=>101
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!--[if !IE]> -->',
'<style type="text/css">',
'#box-body { margin-top: 145px; }',
'#breadcrumbs { border: none; box-shadow: none; height: 8px; }',
'#list-tabs {',
'        padding: 6 12 12 12;',
'	height: 90px;',
'	border-bottom: 1px solid #ccc;',
'        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.1);',
'        -moz-box-shadow: 0 1px 1px rgba(0,0,0,.1);',
'}',
'</style>',
'<!-- <![endif]-->',
'',
'<!--[if gte IE 7]>',
'<style type="text/css">',
'#box-body { padding-top: 160px; }',
'#breadcrumbs { border: none; box-shadow: none; height: 8px; }',
'#list-tabs {',
'        padding: 6px 12px 12px 12px;',
'	height: 90px;',
'	border-bottom: 1px solid #ccc;',
'        z-index: 9999;',
'}',
'</style>',
'<!-- <![endif]-->',
'',
'<ul id="nav_tab" class="dropdown dropdown-horizontal">'))
,p_list_template_after_rows=>'  </li></ul>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'  <li><a href="#LINK#" class="currentSubTab">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'  <li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'  <li id="tab"><a href="#LINK#" class="currentTab">#TEXT#&#9660;</a>'
,p_item_templ_noncurr_w_child=>'  <li id="tab"><a href="#LINK#">#TEXT# &#9660;</a>'
,p_sub_templ_curr_w_child=>'  <li><a href="#LINK#" class="currentSubTab">#TEXT# &#9654;</a>'
,p_sub_templ_noncurr_w_child=>'  <li><a href="#LINK#">#TEXT# &#9654;</a>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(832310012753114293)
,p_list_template_current=>'<li class="currentListItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List with Bullets'
,p_theme_id=>101
,p_theme_class_id=>1
,p_list_template_before_rows=>'<ul class="unorderedList">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<br />'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="currentListItem"><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li class="currentListItem"><a href="#LINK#">#TEXT#</a></li><ul>'
,p_item_templ_noncurr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li><ul>'
,p_reference_id=>244426133351574489
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33644301075756555)
,p_row_template_name=>'Alerts'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33644508810756558)
,p_row_template_name=>'Badge List'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33647920985756563)
,p_row_template_name=>'Cards'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33652178649756565)
,p_row_template_name=>'Comments'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon a-MediaBlock-graphic">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body a-MediaBlock-content">',
'        <div class="t-Comments-info">',
'            #USER_NAME# &middot; <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33652939192756566)
,p_row_template_name=>'Search Results'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33653104255756570)
,p_row_template_name=>'Standard'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(33653104255756570)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33655722946756573)
,p_row_template_name=>'Timeline'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline">',
''))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33656126750756573)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(33658152930756573)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(794770868025572203)
,p_row_template_name=>'Application Name and Score Report'
,p_row_template1=>'#COLUMN_VALUE#'
,p_row_template_before_rows=>'<div id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>'</div>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>101
,p_theme_class_id=>4
,p_reference_id=>244421041606574485
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(797146873931521999)
,p_row_template_name=>'Sidebar Events'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <tr>',
'  <th style="width:15px;">#ICON#</th>',
'  <th style="font-weight:bold;">#CREATED_BY#<br /><span style="font-weight:normal;font-size:8px;">#CREATED_BY_WS#</span></th>',
' </tr>',
' <tr>',
'  <th colspan="2">#MESSAGE#</th>',
' </tr>',
' <tr>',
'  <td colspan="2">',
'   <span style="float:right;color:#666;font-weight:normal;font-size:9px;">#CREATED_ON#</span>',
'  </td>',
' </tr>'))
,p_row_template_before_rows=>'<table class="sidebarReport">'
,p_row_template_after_rows=>'</table>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>101
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(798903676153890592)
,p_row_template_name=>'Narrow Report'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>'
,p_row_template2=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="dataAlt">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" class="wideReport" style="width:360px;min-width:350px;" border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <tfoot>#PAGINATION#</tfoot>',
'  </table>',
'#EXTERNAL_LINK##CSV_LINK#'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th#ALIGNMENT# class="reportHeader" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_after_column_heading=>'</thead>'
,p_row_template_display_cond1=>'EVEN_ROW_NUMBERS'
,p_row_template_display_cond2=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'EVEN_ROW_NUMBERS'
,p_pagination_template=>'<div class="pagination" id="pagination#REGION_ID#">#TEXT#</div>'
,p_next_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#NEXT.gif"></a>'
,p_previous_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#PREV.gif"></a>'
,p_next_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#LAST.gif"></a>'
,p_previous_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#FIRST.gif"></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>101
,p_theme_class_id=>4
,p_reference_id=>244421041606574485
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(798903676153890592)
,p_row_template_before_first=>'   <tr>'
,p_row_template_after_last=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tr>',
''))
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(812572484243445716)
,p_row_template_name=>'Wide Report for SubRegions'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>'
,p_row_template2=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="dataAlt">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" class="wideReport"  style="width:730px;min-width:730px;" border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <tfoot>#PAGINATION#</tfoot>',
'  </table>',
'#EXTERNAL_LINK##CSV_LINK#'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th#ALIGNMENT# class="reportHeader" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_after_column_heading=>'</thead>'
,p_row_template_display_cond1=>'EVEN_ROW_NUMBERS'
,p_row_template_display_cond2=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'EVEN_ROW_NUMBERS'
,p_pagination_template=>'<div class="pagination" id="pagination#REGION_ID#">#TEXT#</div>'
,p_next_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#NEXT.gif"></a>'
,p_previous_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#PREV.gif"></a>'
,p_next_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#LAST.gif"></a>'
,p_previous_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#FIRST.gif"></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>101
,p_theme_class_id=>4
,p_reference_id=>244421041606574485
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(812572484243445716)
,p_row_template_before_first=>'   <tr>'
,p_row_template_after_last=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tr>',
''))
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(832312142916114295)
,p_row_template_name=>'Wide Report'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>'
,p_row_template2=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="dataAlt">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" class="wideReport"  border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" width="100%">',
''))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <tfoot>#PAGINATION#</tfoot>',
'  </table>',
'#EXTERNAL_LINK##CSV_LINK#'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th#ALIGNMENT# class="reportHeader" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_after_column_heading=>'</thead>'
,p_row_template_display_cond1=>'EVEN_ROW_NUMBERS'
,p_row_template_display_cond2=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'EVEN_ROW_NUMBERS'
,p_pagination_template=>'<div class="pagination" id="pagination#REGION_ID#">#TEXT#</div>'
,p_next_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#NEXT.gif"></a>'
,p_previous_page_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#PREV.gif"></a>'
,p_next_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#LAST.gif"></a>'
,p_previous_set_template=>'<a href="#LINK#"><img src="#WORKSPACE_IMAGES#FIRST.gif"></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>101
,p_theme_class_id=>4
,p_reference_id=>244421041606574485
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(832312142916114295)
,p_row_template_before_first=>'   <tr>'
,p_row_template_after_last=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tr>',
''))
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(33676394556756600)
,p_template_name=>'Hidden'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(33676462099756601)
,p_template_name=>'Optional'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(33676573251756601)
,p_template_name=>'Optional - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(33676623549756601)
,p_template_name=>'Required'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(33676795613756605)
,p_template_name=>'Required - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(832314142436114297)
,p_template_name=>'No Label'
,p_template_body1=>'<span style="display:none;">'
,p_template_body2=>'</span>'
,p_on_error_before_label=>'<div class="t13InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>101
,p_theme_class_id=>13
,p_reference_id=>244426737444574489
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(832314327190114297)
,p_template_name=>'Optional Label with Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999"><a class="itemHelp" href="#" title="#CURRENT_ITEM_NAME#" tabindex="999">'
,p_template_body2=>':</a></label>'
,p_theme_id=>101
,p_theme_class_id=>1
,p_reference_id=>244426937131574489
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(832314543957114297)
,p_template_name=>'Required Label with Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999"><a class="itemHelp" href="#" title="#CURRENT_ITEM_NAME#" tabindex="999">*'
,p_template_body2=>':</a></label>'
,p_theme_id=>101
,p_theme_class_id=>2
,p_reference_id=>244427141770574489
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(33677755056756606)
,p_name=>'Breadcrumb'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><span class="t-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(832314639405114297)
,p_name=>'Breadcrumb Menu'
,p_before_first=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="breadcrumb_container">',
'	<ul>'))
,p_current_page_option=>'		<li class="active"><a href="#LINK#">#NAME#</a></li>'
,p_non_current_page_option=>'		<li><a href="#LINK#">#NAME#</a></li>'
,p_between_levels=>'<li class="sep">&gt;</li>'
,p_after_last=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'	</ul>',
'</div>'))
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>101
,p_theme_class_id=>1
,p_reference_id=>244428037569574490
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(33677918785756613)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="t-Form-field t-Form-searchField"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(832315432435114300)
,p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif'
,p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#APEX_JAVASCRIPT#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_13/theme_V22.css" type="text/css">',
'',
'',
'</head>'))
,p_page_body_attr=>'onload="first_field()" style="background-color:#FFFFFF;margin:0;"'
,p_before_field_text=>'<div class="t13PopupHead">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next >'
,p_prev_button_text=>'< Previous'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>'<div class="t13PopupBody">'
,p_theme_id=>101
,p_theme_class_id=>1
,p_reference_id=>244428541002574491
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(33677821462756607)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal">',
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>'))
,p_cust_day_of_week_format=>'<th scope="col" class="uCalDayCol" id="#DY#">#IDAY#</th>'
,p_cust_month_open_format=>'<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>',
''))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="uDay today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="uDay nonday" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="uDayTitle weekendday">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="uDay" headers="#DY#">'
,p_cust_weekend_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uDayData">#DATA#</span>',
'</td>'))
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="uCalHour" id="#TIME#">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly">',
'<h1 class="uMonth">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="uCalDayCol" id="#DY#">',
'  <span class="visible-desktop">#DD# #IDAY#</span>',
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">'
,p_cust_wk_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_wk_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="uDay today" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_open_format=>'<td class="uDay weekend" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_close_format=>'</div></td>'
,p_agenda_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(832314835905114297)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>'<th class="t13DayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t13CalendarHolder"> ',
' <tr>',
'   <td class="t13MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t13Calendar">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="t13DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="t13Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="t13Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="t13WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="t13WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="t13NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="t13NonDay" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t13WeekCalendarHolder">',
'<tr>',
'<td class="t13MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th class="t13DayOfWeek"><a href="#">#IDAY#</a><br>#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t13WeekCalendar">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="t13Day" valign="top">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="t13Today" valign="top">'
,p_weekly_weekend_open_format=>'<td valign="top" class="t13NonDay">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th class="t13Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th class="t13DayOfWeek">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t13DayCalendarHolder"> <tr> <td class="t13MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t13DayCalendar">'
,p_daily_month_close_format=>'</table></td> </tr> </table>'
,p_daily_day_open_format=>'<td valign="top" class="t13Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="t13Today">'
,p_daily_time_open_format=>'<th class="t13Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>101
,p_theme_class_id=>1
,p_reference_id=>244428235927574490
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(33678736015756623)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(33611445942756505)
,p_default_dialog_template=>wwv_flow_api.id(33607776164756503)
,p_error_template=>wwv_flow_api.id(33601777985756497)
,p_printer_friendly_template=>wwv_flow_api.id(33611445942756505)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(33601777985756497)
,p_default_button_template=>wwv_flow_api.id(33676969712756605)
,p_default_region_template=>wwv_flow_api.id(33635078329756543)
,p_default_chart_template=>wwv_flow_api.id(33635078329756543)
,p_default_form_template=>wwv_flow_api.id(33635078329756543)
,p_default_reportr_template=>wwv_flow_api.id(33635078329756543)
,p_default_tabform_template=>wwv_flow_api.id(33635078329756543)
,p_default_wizard_template=>wwv_flow_api.id(33635078329756543)
,p_default_menur_template=>wwv_flow_api.id(33642023811756553)
,p_default_listr_template=>wwv_flow_api.id(33635078329756543)
,p_default_irr_template=>wwv_flow_api.id(33633992723756542)
,p_default_report_template=>wwv_flow_api.id(33653104255756570)
,p_default_label_template=>wwv_flow_api.id(33676462099756601)
,p_default_menu_template=>wwv_flow_api.id(33677755056756606)
,p_default_calendar_template=>wwv_flow_api.id(33677821462756607)
,p_default_list_template=>wwv_flow_api.id(33667578123756587)
,p_default_nav_list_template=>wwv_flow_api.id(33674323860756599)
,p_default_top_nav_list_temp=>wwv_flow_api.id(33674323860756599)
,p_default_side_nav_list_temp=>wwv_flow_api.id(33672321218756597)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(33618198219756523)
,p_default_dialogr_template=>wwv_flow_api.id(33617953531756523)
,p_default_option_label=>wwv_flow_api.id(33676462099756601)
,p_default_required_label=>wwv_flow_api.id(33676623549756601)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(33672143708756593)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>64
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.regionDisplaySelector#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/hammer/2.0.3/hammer#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(832315633891114300)
,p_theme_id=>101
,p_theme_name=>'SERT Theme'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(832297512950114286)
,p_error_template=>wwv_flow_api.id(797556275011843683)
,p_printer_friendly_template=>wwv_flow_api.id(832296616452114286)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_login_template=>wwv_flow_api.id(832293737531114282)
,p_default_button_template=>wwv_flow_api.id(832298120325114286)
,p_default_label_template=>wwv_flow_api.id(832314327190114297)
,p_default_menu_template=>wwv_flow_api.id(832314639405114297)
,p_default_list_template=>wwv_flow_api.id(832310012753114293)
,p_default_option_label=>wwv_flow_api.id(832314327190114297)
,p_default_required_label=>wwv_flow_api.id(832314543957114297)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(101),'')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(38189099462330158)
,p_theme_id=>42
,p_name=>'Cuse'
,p_is_current=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":"body {\n    font-family: ''Noto Sans'', sans-serif;\n    font-weight: 300;\n\tline-height: 25px;\n\tfont-size: 14px;\n}\n.t-Timeline-user { display: none; }\n.t-Timeline--compact .t-Timeline-typeWrap { display: none; }\n.t-Timeline-desc {'
||' white-space: normal; }","vars":{"@g_Nav-BG":"#dfad6c","@g_Accent-BG":"#2045db"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#38189099462330158.css'
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A200A202A20437573650A202A20202020284F7261636C65204170706C69636174696F6E2045787072657373205468656D65205374796C65290A202A200A202A2054686973204353532066696C65207761732067656E657261746564207573696E6720';
wwv_flow_api.g_varchar2_table(2) := '746865204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C65722E200A202A200A202A2F0A0A2E742D4156504C6973742D76616C7565207B0A2020636F6C6F723A20233566356635663B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(3) := '2D426F64792D696E666F202E742D4156504C6973742D76616C7565207B0A2020636F6C6F723A20233634363436343B0A7D0A2E742D526567696F6E202E742D4156504C6973742D76616C7565207B0A2020636F6C6F723A20233636363636363B0A7D0A2E';
wwv_flow_api.g_varchar2_table(4) := '742D4156504C6973742D6C6162656C207B0A2020636F6C6F723A20233436343634363B0A7D0A2E742D426F64792D696E666F202E742D4156504C6973742D6C6162656C207B0A2020636F6C6F723A20233462346234623B0A7D0A2E742D526567696F6E20';
wwv_flow_api.g_varchar2_table(5) := '2E742D4156504C6973742D6C6162656C207B0A2020636F6C6F723A20233464346434643B0A7D0A0A2E742D416C6572742D2D77697A617264207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D416C6572742D2D636F6C6F724247';
wwv_flow_api.g_varchar2_table(6) := '2E742D416C6572742D2D7761726E696E672C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F77207B0A20206261636B67726F756E642D636F6C6F723A20236666666165353B0A7D0A2E742D416C6572742D2D636F6C6F';
wwv_flow_api.g_varchar2_table(7) := '7242472E742D416C6572742D2D7761726E696E672068322C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F772068322C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7761726E696E67206833';
wwv_flow_api.g_varchar2_table(8) := '2C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F77206833207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7761726E696E67202E742D41';
wwv_flow_api.g_varchar2_table(9) := '6C6572742D626F64792C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F77202E742D416C6572742D626F6479207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D416C6572742D2D636F6C6F7242472E74';
wwv_flow_api.g_varchar2_table(10) := '2D416C6572742D2D73756363657373207B0A20206261636B67726F756E642D636F6C6F723A20236563666265653B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D737563636573732068322C0A2E742D416C6572742D2D636F';
wwv_flow_api.g_varchar2_table(11) := '6C6F7242472E742D416C6572742D2D73756363657373206833207B0A2020636F6C6F723A20233334333433343B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D73756363657373202E742D416C6572742D626F6479207B0A20';
wwv_flow_api.g_varchar2_table(12) := '20636F6C6F723A20233734373437343B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D64616E6765722C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D726564207B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(13) := '636F6C6F723A20236666656165393B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D64616E6765722068322C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7265642068322C0A2E742D416C6572742D';
wwv_flow_api.g_varchar2_table(14) := '2D636F6C6F7242472E742D416C6572742D2D64616E6765722068332C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D726564206833207B0A2020636F6C6F723A20233335333533353B0A7D0A2E742D416C6572742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(15) := '42472E742D416C6572742D2D64616E676572202E742D416C6572742D626F64792C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D726564202E742D416C6572742D626F6479207B0A2020636F6C6F723A20233734373437343B0A7D';
wwv_flow_api.g_varchar2_table(16) := '0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F207B0A20206261636B67726F756E642D636F6C6F723A20236433653566373B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F206832';
wwv_flow_api.g_varchar2_table(17) := '2C0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F206833207B0A2020636F6C6F723A20233236323632363B0A7D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F202E742D416C6572742D';
wwv_flow_api.g_varchar2_table(18) := '626F6479207B0A2020636F6C6F723A20233636363636363B0A7D0A0A2E742D416C6572742D2D7761726E696E67202E742D416C6572742D69636F6E2C0A2E742D416C6572742D2D79656C6C6F77202E742D416C6572742D69636F6E207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(19) := '723A20236666636330303B0A7D0A0A2E742D416C6572742D2D73756363657373202E742D416C6572742D69636F6E207B0A2020636F6C6F723A20233463643936343B0A7D0A0A2E742D416C6572742D2D696E666F202E742D416C6572742D69636F6E207B';
wwv_flow_api.g_varchar2_table(20) := '0A2020636F6C6F723A20233235373863663B0A7D0A0A2E742D416C6572742D2D64616E676572202E742D416C6572742D69636F6E2C0A2E742D416C6572742D2D726564202E742D416C6572742D69636F6E207B0A2020636F6C6F723A2023653930633030';
wwv_flow_api.g_varchar2_table(21) := '3B0A7D0A2E742D416C6572742D2D77697A617264202E742D416C6572742D696E736574207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D416C6572742D2D686F72697A6F6E74616C2C0A2E742D416C6572742D2D77697A617264';
wwv_flow_api.g_varchar2_table(22) := '207B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D616C657274202E742D416C6572742D2D7061';
wwv_flow_api.g_varchar2_table(23) := '6765207B0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E312920696E7365743B0A7D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373207B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(24) := '6E642D636F6C6F723A20726762612837342C203137302C2034342C20302E39293B0A7D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373202E742D49636F6E2C0A2E742D416C6572742D2D706167652E742D416C6572742D';
wwv_flow_api.g_varchar2_table(25) := '2D73756363657373202E742D416C6572742D7469746C65207B0A2020636F6C6F723A20234646463B0A7D0A2E742D416C6572742D2D70616765202E742D427574746F6E2D2D636C6F7365416C657274207B0A2020636F6C6F723A207267626128302C2030';
wwv_flow_api.g_varchar2_table(26) := '2C20302C20302E35293B0A7D0A0A2E742D42616467654C6973742D2D6461736820612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365366536653620696E7365743B0A';
wwv_flow_api.g_varchar2_table(27) := '7D0A2E742D42616467654C6973742061207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D6974656D3A686F766572202E742D42616467654C6973742D76';
wwv_flow_api.g_varchar2_table(28) := '616C7565207B0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C7565207B0A2020636F6C6F723A20233733373337333B0A';
wwv_flow_api.g_varchar2_table(29) := '2020626F782D736861646F773A2030203020302031707820726762612836342C2036342C2036342C20302E312920696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D42616467654C6973742D2D6369';
wwv_flow_api.g_varchar2_table(30) := '7263756C6172202E742D42616467654C6973742D76616C75652061207B0A2020626F782D736861646F773A20302030203020317078202332303435646220696E7365743B0A2020636F6C6F723A20233165343163653B0A7D0A2E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(31) := '742D2D63697263756C6172202E742D42616467654C6973742D76616C756520613A686F766572207B0A2020626F782D736861646F773A20302030203020347078202332303435646220696E7365743B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(32) := '233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C756520613A666F637573207B0A2020626F782D736861646F773A203020302030';
wwv_flow_api.g_varchar2_table(33) := '2032707820726762612833322C2036392C203231392C20302E3235292C20302030203020317078202332303435646220696E7365743B0A7D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D6C6162656C207B';
wwv_flow_api.g_varchar2_table(34) := '0A2020636F6C6F723A20233733373337333B0A7D0A2E742D42616467654C6973742D2D63697263756C617220612E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(35) := '233230343564623B0A20207472616E736974696F6E3A20626F782D736861646F7720302E31732C20636F6C6F7220302E31732C206261636B67726F756E642D636F6C6F7220302E33733B0A7D0A2E742D42616467654C6973742D2D63697263756C617220';
wwv_flow_api.g_varchar2_table(36) := '612E742D42616467654C6973742D777261703A686F766572202E742D42616467654C6973742D76616C7565207B0A2020626F782D736861646F773A20302030203020347078202332303435646220696E7365743B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(37) := '6C6F723A20233230343564623B0A2020636F6C6F723A20234646463B0A7D0A2E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F726564424720612E742D42616467654C6973742D777261703A686F7665';
wwv_flow_api.g_varchar2_table(38) := '72202E742D42616467654C6973742D76616C7565207B0A2020626F782D736861646F773A20302030203020387078207267626128302C20302C20302C20302E312920696E7365743B0A7D0A0A2E742D42616467654C6973742D2D666C6F6174202E742D42';
wwv_flow_api.g_varchar2_table(39) := '616467654C6973742D6974656D3A61667465722C0A2E742D42616467654C6973742D2D666C6578202E742D42616467654C6973742D6974656D3A61667465722C0A2E742D42616467654C6973742D2D636F6C73202E742D42616467654C6973742D697465';
wwv_flow_api.g_varchar2_table(40) := '6D3A61667465722C0A2E742D42616467654C6973742D2D6669786564202E742D42616467654C6973742D6974656D3A61667465722C0A2E742D42616467654C6973742D2D737461636B6564202E742D42616467654C6973742D6974656D3A616674657220';
wwv_flow_api.g_varchar2_table(41) := '7B0A20206261636B67726F756E643A20236536653665363B0A7D0A2E742D42616467654C6973742D2D666C6F6174202E742D42616467654C6973742D6974656D3A6265666F72652C0A2E742D42616467654C6973742D2D666C6578202E742D4261646765';
wwv_flow_api.g_varchar2_table(42) := '4C6973742D6974656D3A6265666F72652C0A2E742D42616467654C6973742D2D636F6C73202E742D42616467654C6973742D6974656D3A6265666F72652C0A2E742D42616467654C6973742D2D6669786564202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(43) := '3A6265666F72652C0A2E742D42616467654C6973742D2D737461636B6564202E742D42616467654C6973742D6974656D3A6265666F7265207B0A20206261636B67726F756E643A20236536653665363B0A7D0A2E742D42616467654C6973742D2D626F74';
wwv_flow_api.g_varchar2_table(44) := '746F6D426F72646572207B0A2020626F726465722D626F74746F6D2D636F6C6F723A20236638663866383B0A7D0A0A2E612D4261724368617274202E612D42617243686172742D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(45) := '6F723A20236632663266323B0A7D0A2E742D426F6479202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0A2020636F6C6F723A20233739373937393B0A7D0A2E742D426F64792D';
wwv_flow_api.g_varchar2_table(46) := '7469746C65202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0A2020636F6C6F723A20233765376537653B0A7D0A2E742D426F64792D696E666F202E612D426172436861727420';
wwv_flow_api.g_varchar2_table(47) := '2E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0A2020636F6C6F723A20233765376537653B0A7D0A2E742D526567696F6E202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42';
wwv_flow_api.g_varchar2_table(48) := '617243686172742D76616C75652C0A2E742D427574746F6E526567696F6E202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0A2020636F6C6F723A20233830383038303B0A7D0A';
wwv_flow_api.g_varchar2_table(49) := '2E612D4261724368617274202E612D42617243686172742D6974656D20696D67207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E612D4261724368617274202E612D42617243686172742D626172207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(50) := '642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0A7D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6261722C0A2E612D42617243686172742D2D636C6173736963202E612D4261724368';
wwv_flow_api.g_varchar2_table(51) := '6172742D66696C6C6564207B0A2020626F726465722D7261646975733A203170783B0A7D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6974656D3A686F766572202E612D42617243686172742D626172207B0A20';
wwv_flow_api.g_varchar2_table(52) := '206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0A7D0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D6261722C0A2E612D42617243686172742D2D6D6F6465726E202E';
wwv_flow_api.g_varchar2_table(53) := '612D42617243686172742D66696C6C6564207B0A2020626F726465722D7261646975733A203170783B0A7D0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D6974656D3A686F766572202E612D42617243686172742D62';
wwv_flow_api.g_varchar2_table(54) := '6172207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0A7D0A2E612D42617243686172742D66696C6C6564207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A7D0A';
wwv_flow_api.g_varchar2_table(55) := '0A626F64792C0A2E742D426F6479207B0A20206261636B67726F756E643A20236638663866383B0A2020636F6C6F723A20233339333933393B0A7D0A61207B0A2020636F6C6F723A20233165343163653B0A7D0A2E742D426F64792D7469746C6520612C';
wwv_flow_api.g_varchar2_table(56) := '0A2E742D426F64792D696E666F2061207B0A2020636F6C6F723A20233162336162373B0A7D0A2E742D426F64792D616374696F6E73207B0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0A7D0A2E742D426F64792D7469746C65';
wwv_flow_api.g_varchar2_table(57) := '207B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A2020636F6C6F723A20233365336533653B0A7D0A2E75692D7769646765742D636F6E74656E74207B0A20206261636B67726F756E642D636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(58) := '3B0A7D0A2E742D426F6479202E75692D7769646765742D636F6E74656E74207B0A2020636F6C6F723A20233339333933393B0A7D0A2E742D426F64792D7469746C65202E75692D7769646765742D636F6E74656E74207B0A2020636F6C6F723A20233365';
wwv_flow_api.g_varchar2_table(59) := '336533653B0A7D0A2E742D426F64792D696E666F202E75692D7769646765742D636F6E74656E74207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D526567696F6E202E75692D7769646765742D636F6E74656E742C0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(60) := '6E526567696F6E202E75692D7769646765742D636F6E74656E74207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D73696465207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(61) := '3A20233339333933393B0A7D0A2E617065782D7264732D636F6E7461696E6572207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F64792D696E666F202E617065782D7264732D636F6E7461696E';
wwv_flow_api.g_varchar2_table(62) := '6572207B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A7D0A2E742D426F64792D696E666F207B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A7D0A2E742D426F64792D7469746C652E6A732D68';
wwv_flow_api.g_varchar2_table(63) := '69646542726561646372756D6273207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3935293B0A7D0A2E742D426F64792D746F70427574746F6E207B0A2020626F726465722D7261646975733A20313030';
wwv_flow_api.g_varchar2_table(64) := '253B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D426F64792D746F70427574746F6E3A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D426F64792D';
wwv_flow_api.g_varchar2_table(65) := '746F70427574746F6E3A616374697665202E612D49636F6E207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D426F64792D746F70427574746F6E202E612D49636F6E207B0A2020636F6C6F723A20236536653665363B0A7D0A0A2E617065';
wwv_flow_api.g_varchar2_table(66) := '782D736964652D6E6176202E742D426F64792D6E61762C0A2E617065782D736964652D6E6176202E742D426F64792D616374696F6E732C0A2E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0A2020746F703A20343070783B0A';
wwv_flow_api.g_varchar2_table(67) := '7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0A202020206C6566743A2032303070783B0A20207D0A';
wwv_flow_api.g_varchar2_table(68) := '7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E617065782D736964652D6E6176202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A203230';
wwv_flow_api.g_varchar2_table(69) := '3070783B0A20207D0A7D0A2E617065782D736964652D6E6176202E742D426F64792D6D61696E207B0A20206D617267696E2D6C6566743A20303B0A7D0A0A2E617065782D746F702D6E6176202E742D426F64792D616374696F6E73207B0A2020746F703A';
wwv_flow_api.g_varchar2_table(70) := '20383070783B0A7D0A2E617065782D746F702D6E6176202E742D426F64792D7469746C65207B0A2020746F703A20383070783B0A7D0A0A2E742D426F64792D6E6176207B0A202077696474683A2032303070783B0A7D0A0A2E742D426F64792D61637469';
wwv_flow_api.g_varchar2_table(71) := '6F6E73207B0A202077696474683A2032303070783B0A7D0A2E742D426F64792D616374696F6E73202E742D427574746F6E2D2D686561646572207B0A20202D7765626B69742D7472616E73666F726D3A207472616E736C6174653364282D343070782C20';
wwv_flow_api.g_varchar2_table(72) := '302C2030293B0A20202D6D732D7472616E73666F726D3A207472616E736C617465282D34307078293B0A20207472616E73666F726D3A207472616E736C6174653364282D343070782C20302C2030293B0A7D0A0A406D65646961206F6E6C792073637265';
wwv_flow_api.g_varchar2_table(73) := '656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E742D426F64792D73696465207B0A2020202077696474683A2032343070783B0A202020206C6566743A20343070783B0A20207D0A7D0A0A2E617065782D736964652D6E6176';
wwv_flow_api.g_varchar2_table(74) := '2E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0A20206D617267696E2D6C6566743A20343070783B0A20202D7765626B69742D7472616E73666F726D3A207472616E736C61746533642831363070782C20302C2030293B0A20';
wwv_flow_api.g_varchar2_table(75) := '202D6D732D7472616E73666F726D3A207472616E736C617465283136307078293B0A20207472616E73666F726D3A207472616E736C61746533642831363070782C20302C2030293B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D';
wwv_flow_api.g_varchar2_table(76) := '61782D77696474683A20343830707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C652C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E74';
wwv_flow_api.g_varchar2_table(77) := '2D426F64792D736964652C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A20303B0A20207D0A20202E617065782D736964652D6E';
wwv_flow_api.g_varchar2_table(78) := '61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0A202020206D617267696E2D6C6566743A20303B0A202020202D7765626B69742D7472616E73666F726D3A207472616E736C61746533642832303070782C20302C203029';
wwv_flow_api.g_varchar2_table(79) := '3B0A202020202D6D732D7472616E73666F726D3A207472616E736C617465283230307078293B0A202020207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0A20207D0A7D0A406D65646961206F6E6C79207363';
wwv_flow_api.g_varchar2_table(80) := '7265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C652C0A2020';
wwv_flow_api.g_varchar2_table(81) := '2E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E742C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E';
wwv_flow_api.g_varchar2_table(82) := '742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E7366';
wwv_flow_api.g_varchar2_table(83) := '6F726D3A206E6F6E653B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0A202020206C6566743A2032303070783B';
wwv_flow_api.g_varchar2_table(84) := '0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2032303070783B0A';
wwv_flow_api.g_varchar2_table(85) := '20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0A202020206D617267696E2D6C6566743A203070783B0A20207D0A2020';
wwv_flow_api.g_varchar2_table(86) := '2E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C652C0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D736964652C0A20202E617065782D73';
wwv_flow_api.g_varchar2_table(87) := '6964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0A202020202D7765626B69742D7472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0A202020202D6D732D7472';
wwv_flow_api.g_varchar2_table(88) := '616E73666F726D3A207472616E736C617465283230307078293B0A202020207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E';
wwv_flow_api.g_varchar2_table(89) := '6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A202020206D617267696E2D6C6566743A20303B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D747261';
wwv_flow_api.g_varchar2_table(90) := '6E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D';
wwv_flow_api.g_varchar2_table(91) := '73696465207B0A202020206C6566743A20303B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0A202020206D';
wwv_flow_api.g_varchar2_table(92) := '617267696E2D6C6566743A2032383070783B0A202020202D7765626B69742D7472616E73666F726D3A207472616E736C61746533642831363070782C20302C2030293B0A202020202D6D732D7472616E73666F726D3A207472616E736C61746528313630';
wwv_flow_api.g_varchar2_table(93) := '7078293B0A202020207472616E73666F726D3A207472616E736C61746533642831363070782C20302C2030293B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0A20202E61';
wwv_flow_api.g_varchar2_table(94) := '7065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A202020206D617267696E2D6C6566743A20303B0A202020202D7765626B69742D7472616E';
wwv_flow_api.g_varchar2_table(95) := '73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D506167';
wwv_flow_api.g_varchar2_table(96) := '65426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(97) := '206E6F6E653B0A202020206D617267696E2D6C6566743A2032303070783B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74';
wwv_flow_api.g_varchar2_table(98) := '656E74207B0A202020206D617267696E2D6C6566743A2034343070783B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E';
wwv_flow_api.g_varchar2_table(99) := '6F6E653B0A20207D0A7D0A0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E61762C0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176202E';
wwv_flow_api.g_varchar2_table(100) := '742D547265654E6176207B0A202077696474683A20343070783B0A7D0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E742C0A2E617065782D736964652D6E61762E6A732D6E6176436F';
wwv_flow_api.g_varchar2_table(101) := '6C6C6170736564202E742D426F64792D7469746C652C0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0A20206D617267696E2D6C6566743A20343070783B0A7D0A406D65646961206F';
wwv_flow_api.g_varchar2_table(102) := '6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176207B0A202020202D7765626B69742D7472616E73';
wwv_flow_api.g_varchar2_table(103) := '666F726D3A207472616E736C61746558282D34307078293B0A202020202D6D732D7472616E73666F726D3A207472616E736C61746558282D34307078293B0A202020207472616E73666F726D3A207472616E736C61746558282D34307078293B0A20207D';
wwv_flow_api.g_varchar2_table(104) := '0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652C0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D736964652C0A20202E61';
wwv_flow_api.g_varchar2_table(105) := '7065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A20303B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E';
wwv_flow_api.g_varchar2_table(106) := '2D77696474683A20363431707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B0A202020206D617267696E2D6C6566743A20303B0A202020206C6566743A2034307078';
wwv_flow_api.g_varchar2_table(107) := '3B0A20207D0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0A202020206D617267696E2D6C6566743A20303B0A20207D0A20';
wwv_flow_api.g_varchar2_table(108) := '202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2032383070783B0A20207D0A7D';
wwv_flow_api.g_varchar2_table(109) := '0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0A202020206C6566';
wwv_flow_api.g_varchar2_table(110) := '743A20343070783B0A20207D0A7D0A0A2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E207B0A20206D617267696E2D72696768743A20303B0A7D0A2E742D50616765426F64792E6A732D72696768';
wwv_flow_api.g_varchar2_table(111) := '74457870616E646564202E742D426F64792D6D61696E2C0A2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6E6176207B0A20202D7765626B69742D7472616E73666F726D3A207472616E736C617465336428';
wwv_flow_api.g_varchar2_table(112) := '2D32303070782C20302C2030293B0A20202D6D732D7472616E73666F726D3A207472616E736C617465282D3230307078293B0A20207472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0A7D0A406D6564696120';
wwv_flow_api.g_varchar2_table(113) := '6F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D6169';
wwv_flow_api.g_varchar2_table(114) := '6E2C0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6E6176207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A2020';
wwv_flow_api.g_varchar2_table(115) := '20202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C65667420';
wwv_flow_api.g_varchar2_table(116) := '2E742D426F64792D6D61696E207B0A202020206D617267696E2D72696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D42';
wwv_flow_api.g_varchar2_table(117) := '6F64792D7469746C65207B0A2020202072696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C6520';
wwv_flow_api.g_varchar2_table(118) := '7B0A2020202072696768743A20303B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465';
wwv_flow_api.g_varchar2_table(119) := '207B0A202020206D617267696E2D6C6566743A20303B0A202020206C6566743A20303B0A20207D0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0A20202E742D50616765426F64792E';
wwv_flow_api.g_varchar2_table(120) := '6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A202020206D617267696E2D72696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D72';
wwv_flow_api.g_varchar2_table(121) := '69676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E2C0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C65667420';
wwv_flow_api.g_varchar2_table(122) := '2E742D426F64792D6E6176207B0A202020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E742D5061';
wwv_flow_api.g_varchar2_table(123) := '6765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0A2020202072696768743A2032303070783B0A20207D0A20202E742D50616765426F64792E6A732D';
wwv_flow_api.g_varchar2_table(124) := '7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0A202020206C6566743A20343070783B0A20207D0A7D0A406D65646961206F6E6C7920';
wwv_flow_api.g_varchar2_table(125) := '73637265656E20616E6420286D61782D77696474683A20393932707829207B0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0A20';
wwv_flow_api.g_varchar2_table(126) := '2020202D7765626B69742D7472616E73666F726D3A206E6F6E653B0A202020202D6D732D7472616E73666F726D3A206E6F6E653B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A20202E742D50616765426F64792E6A732D7269676874';
wwv_flow_api.g_varchar2_table(127) := '457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C652C0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D';
wwv_flow_api.g_varchar2_table(128) := '426F64792D736964652C0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0A202020202D7765626B69742D7472616E73666F';
wwv_flow_api.g_varchar2_table(129) := '726D3A207472616E736C6174653364282D32303070782C20302C2030293B0A202020202D6D732D7472616E73666F726D3A207472616E736C617465282D3230307078293B0A202020207472616E73666F726D3A207472616E736C6174653364282D323030';
wwv_flow_api.g_varchar2_table(130) := '70782C20302C2030293B0A20207D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0A202020206D617267696E2D6C6566743A2034';
wwv_flow_api.g_varchar2_table(131) := '3070782021696D706F7274616E743B0A20207D0A7D0A0A2E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D6D61696E207B0A20206D617267696E2D72696768743A203070783B0A7D0A2E742D50616765426F';
wwv_flow_api.g_varchar2_table(132) := '64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D7469746C65207B0A202072696768743A203070783B0A7D0A2E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D616374696F6E73207B';
wwv_flow_api.g_varchar2_table(133) := '0A20202D7765626B69742D7472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0A20202D6D732D7472616E73666F726D3A207472616E736C617465283230307078293B0A20207472616E73666F726D3A207472616E';
wwv_flow_api.g_varchar2_table(134) := '736C61746533642832303070782C20302C2030293B0A7D0A0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0A20202E742D50616765426F64792D2D73686F774C656674202E742D426F6479';
wwv_flow_api.g_varchar2_table(135) := '2D636F6E74656E74207B0A202020206D617267696E2D6C6566743A2032343070783B0A20207D0A7D0A0A2E742D426F64792D636F6E74656E74496E6E6572207B0A20206D617267696E3A206175746F3B0A20206D61782D77696474683A206175746F3B0A';
wwv_flow_api.g_varchar2_table(136) := '7D0A0A2E742D42726561646372756D622D6974656D3A6166746572207B0A2020636F6C6F723A20726762612836322C2036322C2036322C20302E39393335293B0A7D0A2E742D42726561646372756D622D6974656D202E742D49636F6E3A686F76657220';
wwv_flow_api.g_varchar2_table(137) := '7B0A2020636F6C6F723A20233230343564623B0A7D0A2E742D42726561646372756D62526567696F6E2D2D75736542726561646372756D625469746C65202E742D42726561646372756D622D6974656D3A6C6173742D6368696C64202E742D4272656164';
wwv_flow_api.g_varchar2_table(138) := '6372756D622D6C6162656C207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D42726561646372756D62526567696F6E2D7469746C6554657874207B0A2020636F6C6F723A20233365336533653B0A7D0A0A2E742D427574746F6E2C0A2E61';
wwv_flow_api.g_varchar2_table(139) := '2D427574746F6E207B0A2020626F726465723A206E6F6E653B0A2020636F6C6F723A20233338333833383B0A20206261636B67726F756E642D636C69703A2070616464696E672D626F783B0A20206261636B67726F756E642D636F6C6F723A2023663866';
wwv_flow_api.g_varchar2_table(140) := '3866383B0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0A2020626F726465722D7261646975733A203270783B0A2020746578742D736861646F773A206E6F6E653B0A';
wwv_flow_api.g_varchar2_table(141) := '7D0A2E742D427574746F6E3A686F7665722C0A2E612D427574746F6E3A686F766572207B0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E3035292C20302030203020317078207267626128302C20';
wwv_flow_api.g_varchar2_table(142) := '302C20302C20302E3132352920696E7365743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C652C0A2E612D427574746F6E2E742D427574746F6E2D2D73696D706C65207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(143) := '6666666666663B0A2020636F6C6F723A20233430343034303B0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0A2020746578742D736861646F773A206E6F6E653B0A7D';
wwv_flow_api.g_varchar2_table(144) := '0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E612D427574746F6E2E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C653A666F6375';
wwv_flow_api.g_varchar2_table(145) := '732C0A2E612D427574746F6E2E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C653A6163746976652C0A2E612D427574746F6E2E742D427574746F6E2D2D73696D706C653A61';
wwv_flow_api.g_varchar2_table(146) := '6374697665207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A2020626F782D736861646F773A20302030203020317078202365366536653620696E7365743B0A7D0A406D656469612073637265656E20616E6420282D6D73';
wwv_flow_api.g_varchar2_table(147) := '2D686967682D636F6E74726173743A2061637469766529207B0A20202E742D427574746F6E2C0A20202E612D427574746F6E207B0A20202020626F726465723A2031707820736F6C69643B0A20207D0A7D0A0A2E742D427574746F6E2D2D7072696D6172';
wwv_flow_api.g_varchar2_table(148) := '792C0A2E742D427574746F6E2D2D686F742C0A2E742D427574746F6E2D2D64616E6765722C0A2E742D427574746F6E2D2D7761726E696E672C0A2E742D427574746F6E2D2D73756363657373207B0A2020626F782D736861646F773A2030203020327078';
wwv_flow_api.g_varchar2_table(149) := '207267626128302C20302C20302C20302E30352920696E7365743B0A7D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C652C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0A';
wwv_flow_api.g_varchar2_table(150) := '2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C652C0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C652C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E';
wwv_flow_api.g_varchar2_table(151) := '2D2D73696D706C65207B0A2020626F782D736861646F773A2030203020302031707820696E7365743B0A7D0A2E742D427574746F6E2D2D7072696D6172793A686F7665722C0A2E742D427574746F6E2D2D7761726E696E673A686F766572207B0A202062';
wwv_flow_api.g_varchar2_table(152) := '6F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E3035292C20302030203020317078207267626128302C20302C20302C20302E3037352920696E7365743B0A7D0A2E742D427574746F6E2D2D686F743A686F76';
wwv_flow_api.g_varchar2_table(153) := '65722C0A2E742D427574746F6E2D2D64616E6765723A686F7665722C0A2E742D427574746F6E2D2D737563636573733A686F766572207B0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E31292C20';
wwv_flow_api.g_varchar2_table(154) := '302030203020317078207267626128302C20302C20302C20302E3037352920696E7365743B0A7D0A2E742D427574746F6E3A686F7665722C0A2E612D427574746F6E3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(155) := '66663B0A20207A2D696E6465783A203130303B0A7D0A2E742D427574746F6E3A666F6375732C0A2E612D427574746F6E3A666F637573207B0A20206F75746C696E653A206E6F6E653B0A20207A2D696E6465783A203131303B0A7D0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(156) := '6E3A666F6375732C0A2E612D427574746F6E3A666F6375732C0A2E742D427574746F6E3A6163746976653A666F6375732C0A2E612D427574746F6E3A6163746976653A666F637573207B0A2020626F782D736861646F773A203020302030203170782023';
wwv_flow_api.g_varchar2_table(157) := '32303435646220696E7365742C20302030203170782032707820726762612833322C2036392C203231392C20302E3235292021696D706F7274616E743B0A7D0A2E742D427574746F6E3A616374697665207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(158) := '723A20236465646564653B0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E322920696E7365742C20302031707820327078207267626128302C20302C20302C20302E32352920696E7365743B0A20';
wwv_flow_api.g_varchar2_table(159) := '207A2D696E6465783A203130303B0A7D0A2E742D427574746F6E3A6163746976653A666F637573207B0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E322920696E7365742C203020317078203270';
wwv_flow_api.g_varchar2_table(160) := '78207267626128302C20302C20302C20302E32352920696E7365742021696D706F7274616E743B0A7D0A2E742D427574746F6E2E69732D6163746976652C0A2E742D427574746F6E2E69732D6163746976653A6163746976652C0A2E742D4D656E754275';
wwv_flow_api.g_varchar2_table(161) := '74746F6E2E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0A2020636F6C6F723A20233338333833383B0A2020666F6E742D7765696768743A206E6F726D616C3B0A2020746578742D736861646F77';
wwv_flow_api.g_varchar2_table(162) := '3A206E6F6E653B0A20207A2D696E6465783A203130303B0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E322920696E7365742C20302031707820327078207267626128302C20302C20302C20302E';
wwv_flow_api.g_varchar2_table(163) := '32352920696E7365743B0A7D0A2E742D427574746F6E2E69732D64697361626C65642C0A2E742D427574746F6E2E69732D64697361626C65643A6163746976652C0A2E742D427574746F6E3A64697361626C6564207B0A20206F7061636974793A202E35';
wwv_flow_api.g_varchar2_table(164) := '3B0A2020706F696E7465722D6576656E74733A206E6F6E653B0A7D0A0A2E742D427574746F6E2D2D686F742C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742C0A626F64792062';
wwv_flow_api.g_varchar2_table(165) := '7574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D617279207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A2020746578742D73';
wwv_flow_api.g_varchar2_table(166) := '6861646F773A2030202D3170782030207267626128302C20302C20302C20302E31293B0A7D0A2E742D427574746F6E2D2D686F743A686F7665722C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D62757474';
wwv_flow_api.g_varchar2_table(167) := '6F6E2D2D686F743A686F7665722C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233461363865343B';
wwv_flow_api.g_varchar2_table(168) := '0A7D0A2E742D427574746F6E2D2D686F743A6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F743A6163746976652C0A626F647920627574746F6E2E75692D737461';
wwv_flow_api.g_varchar2_table(169) := '74652D64656661756C742E75692D7072696F726974792D7072696D6172793A6163746976652C0A2E742D427574746F6E2D2D686F742E69732D6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E7569';
wwv_flow_api.g_varchar2_table(170) := '2D627574746F6E2D2D686F742E69732D6163746976652C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E69732D6163746976652C0A2E742D427574746F6E2D2D686F742E74';
wwv_flow_api.g_varchar2_table(171) := '2D4D656E75427574746F6E2E69732D6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D4D656E75427574746F6E2E69732D6163746976652C0A626F647920';
wwv_flow_api.g_varchar2_table(172) := '627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D4D656E75427574746F6E2E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20233139333761663B0A7D0A';
wwv_flow_api.g_varchar2_table(173) := '2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0A62';
wwv_flow_api.g_varchar2_table(174) := '6F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A2030203020302031707820233230343564622069';
wwv_flow_api.g_varchar2_table(175) := '6E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233330343238643B0A7D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C65202E742D49636F6E2C0A626F6479';
wwv_flow_api.g_varchar2_table(176) := '202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C65202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75';
wwv_flow_api.g_varchar2_table(177) := '692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A20233330343238643B0A7D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A686F';
wwv_flow_api.g_varchar2_table(178) := '7665722C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A686F7665722C0A626F647920627574746F6E2E75692D73746174652D6465';
wwv_flow_api.g_varchar2_table(179) := '6661756C742E75692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D706C653A686F7665722C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F6375732C0A626F6479202E75692D7374';
wwv_flow_api.g_varchar2_table(180) := '6174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F6375732C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974';
wwv_flow_api.g_varchar2_table(181) := '792D7072696D6172792E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A6163746976652C0A626F6479202E75692D73746174652D64656661756C742E75692D';
wwv_flow_api.g_varchar2_table(182) := '627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A6163746976652C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D4275';
wwv_flow_api.g_varchar2_table(183) := '74746F6E2D2D73696D706C653A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A2020626F782D736861646F773A203020302030203170782023323034356462';
wwv_flow_api.g_varchar2_table(184) := '20696E7365743B0A7D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E75692D627574746F6E2D';
wwv_flow_api.g_varchar2_table(185) := '2D686F742E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D427574746F6E2D2D73696D70';
wwv_flow_api.g_varchar2_table(186) := '6C653A686F766572202E742D49636F6E2C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A626F6479202E75692D73746174652D64656661756C742E75692D627574746F6E2E7569';
wwv_flow_api.g_varchar2_table(187) := '2D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E742D42757474';
wwv_flow_api.g_varchar2_table(188) := '6F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E2C0A626F6479202E75692D73746174652D64656661756C742E75692D';
wwv_flow_api.g_varchar2_table(189) := '627574746F6E2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E2C0A626F647920627574746F6E2E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D';
wwv_flow_api.g_varchar2_table(190) := '6172792E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020636F6C6F723A20236666666666663B0A7D0A0A2E742D427574746F6E2D2D7072696D617279207B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(191) := '236239633566353B0A2020636F6C6F723A20233036306432393B0A7D0A2E742D427574746F6E2D2D7072696D6172793A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236535656166623B0A7D0A2E742D427574746F6E2D2D7072';
wwv_flow_api.g_varchar2_table(192) := '696D6172793A6163746976652C0A2E742D427574746F6E2D2D7072696D6172792E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20233863613065653B0A7D0A2E742D427574746F6E2D2D7072696D6172792E742D427574';
wwv_flow_api.g_varchar2_table(193) := '746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A20302030203020317078202362396335663520696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233639366638373B0A';
wwv_flow_api.g_varchar2_table(194) := '7D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A20233639366638373B0A7D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D';
wwv_flow_api.g_varchar2_table(195) := '706C653A686F7665722C0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A616374697665207B0A20';
wwv_flow_api.g_varchar2_table(196) := '206261636B67726F756E642D636F6C6F723A20236239633566353B0A2020636F6C6F723A20233036306432393B0A2020626F782D736861646F773A20302030203020317078202362396335663520696E7365743B0A7D0A2E742D427574746F6E2D2D7072';
wwv_flow_api.g_varchar2_table(197) := '696D6172792E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(198) := '7072696D6172792E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020636F6C6F723A20233036306432393B0A7D0A0A2E742D427574746F6E2D2D64616E676572207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(199) := '723A20236539306330303B0A2020636F6C6F723A20236666656165393B0A7D0A2E742D427574746F6E2D2D64616E6765723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666323931643B0A7D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(200) := '64616E6765723A6163746976652C0A2E742D427574746F6E2D2D64616E6765722E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236236303930303B0A7D0A2E742D427574746F6E2D2D64616E6765722E742D42757474';
wwv_flow_api.g_varchar2_table(201) := '6F6E2D2D73696D706C65207B0A2020626F782D736861646F773A20302030203020317078202365393063303020696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233934323632303B0A7D';
wwv_flow_api.g_varchar2_table(202) := '0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A20233934323632303B0A7D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C65';
wwv_flow_api.g_varchar2_table(203) := '3A686F7665722C0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A616374697665207B0A20206261636B';
wwv_flow_api.g_varchar2_table(204) := '67726F756E642D636F6C6F723A20236539306330303B0A2020636F6C6F723A20236666656165393B0A2020626F782D736861646F773A20302030203020317078202365393063303020696E7365743B0A7D0A2E742D427574746F6E2D2D64616E6765722E';
wwv_flow_api.g_varchar2_table(205) := '742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D64616E6765722E';
wwv_flow_api.g_varchar2_table(206) := '742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020636F6C6F723A20236666656165393B0A7D0A0A2E742D427574746F6E2D2D7761726E696E67207B0A20206261636B67726F756E642D636F6C6F723A2023666663';
wwv_flow_api.g_varchar2_table(207) := '6330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D427574746F6E2D2D7761726E696E673A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666643633333B0A7D0A2E742D427574746F6E2D2D7761726E696E';
wwv_flow_api.g_varchar2_table(208) := '673A6163746976652C0A2E742D427574746F6E2D2D7761726E696E672E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236363613330303B0A7D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(209) := '2D73696D706C65207B0A2020626F782D736861646F773A20302030203020317078202366666363303020696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233863373330643B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(210) := '2D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A20233863373330643B0A7D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A';
wwv_flow_api.g_varchar2_table(211) := '686F7665722C0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A616374697665207B0A2020626163';
wwv_flow_api.g_varchar2_table(212) := '6B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A2020626F782D736861646F773A20302030203020317078202366666363303020696E7365743B0A7D0A2E742D427574746F6E2D2D7761726E696E';
wwv_flow_api.g_varchar2_table(213) := '672E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D7761726E';
wwv_flow_api.g_varchar2_table(214) := '696E672E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020636F6C6F723A20233030303030303B0A7D0A0A2E742D427574746F6E2D2D73756363657373207B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(215) := '233463643936343B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D427574746F6E2D2D737563636573733A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233736653238383B0A7D0A2E742D427574746F6E2D2D7375';
wwv_flow_api.g_varchar2_table(216) := '63636573733A6163746976652C0A2E742D427574746F6E2D2D737563636573732E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20233261633834353B0A7D0A2E742D427574746F6E2D2D737563636573732E742D427574';
wwv_flow_api.g_varchar2_table(217) := '746F6E2D2D73696D706C65207B0A2020626F782D736861646F773A20302030203020317078202334636439363420696E7365743B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233333373933663B0A';
wwv_flow_api.g_varchar2_table(218) := '7D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A20233333373933663B0A7D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D';
wwv_flow_api.g_varchar2_table(219) := '706C653A686F7665722C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A666F6375732C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A616374697665207B0A20';
wwv_flow_api.g_varchar2_table(220) := '206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020636F6C6F723A20233037316630623B0A2020626F782D736861646F773A20302030203020317078202334636439363420696E7365743B0A7D0A2E742D427574746F6E2D2D7375';
wwv_flow_api.g_varchar2_table(221) := '63636573732E742D427574746F6E2D2D73696D706C653A686F766572202E742D49636F6E2C0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C653A666F637573202E742D49636F6E2C0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(222) := '737563636573732E742D427574746F6E2D2D73696D706C653A616374697665202E742D49636F6E207B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D427574746F6E2D2D70696C6C5374617274207B0A2020626F726465722D746F702D7269';
wwv_flow_api.g_varchar2_table(223) := '6768742D7261646975733A20302021696D706F7274616E743B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D70696C6C456E64207B0A2020626F726465';
wwv_flow_api.g_varchar2_table(224) := '722D746F702D6C6566742D7261646975733A20302021696D706F7274616E743B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D70696C6C207B0A2020626F';
wwv_flow_api.g_varchar2_table(225) := '726465722D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6869646553686F772E742D427574746F6E207B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D4865616465722D6272616E64';
wwv_flow_api.g_varchar2_table(226) := '696E67202E742D427574746F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D686561646572207B0A20207472616E736974';
wwv_flow_api.g_varchar2_table(227) := '696F6E3A206E6F6E653B0A2020626F726465722D7261646975733A20303B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375732C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A616374697665';
wwv_flow_api.g_varchar2_table(228) := '3A666F637573207B0A2020626F782D736861646F773A20302030203020317078202336303762653820696E7365742C20302030203170782032707820726762612839362C203132332C203233322C20302E3235292021696D706F7274616E743B0A7D0A2E';
wwv_flow_api.g_varchar2_table(229) := '742D427574746F6E2E742D427574746F6E2D2D6865616465723A686F7665722C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375732C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A616374697665';
wwv_flow_api.g_varchar2_table(230) := '207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C';
wwv_flow_api.g_varchar2_table(231) := '20302C20302C20302E31293B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A6163746976652C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A616374697665207B0A20206261636B6772';
wwv_flow_api.g_varchar2_table(232) := '6F756E642D636F6C6F723A207267626128302C20302C20302C20302E34293B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C';
wwv_flow_api.g_varchar2_table(233) := '20302C20302C20302E3235293B0A2020626F782D736861646F773A206E6F6E653B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D68656164657254726565207B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(234) := '6F6C6F723A207267626128302C20302C20302C20302E33293B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D686561646572547265653A6265666F7265207B0A2020636F6E74656E743A2027273B0A';
wwv_flow_api.g_varchar2_table(235) := '2020706F736974696F6E3A206162736F6C7574653B0A2020746F703A20303B0A2020626F74746F6D3A20303B0A202072696768743A20303B0A202077696474683A203170783B0A20206261636B67726F756E642D636F6C6F723A207267626128302C2030';
wwv_flow_api.g_varchar2_table(236) := '2C20302C20302E31293B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D686561646572547265652E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A207472616E737061';
wwv_flow_api.g_varchar2_table(237) := '72656E743B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D686561646572547265653A686F7665722C0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(238) := '686561646572547265653A666F6375733A686F766572207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E33293B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D42757474';
wwv_flow_api.g_varchar2_table(239) := '6F6E2D2D6865616465725269676874207B0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D68656164657252696768743A686F';
wwv_flow_api.g_varchar2_table(240) := '766572207B0A20206261636B67726F756E642D636F6C6F723A20236432643264323B0A7D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D68656164657252696768743A6163746976652C0A2E742D427574';
wwv_flow_api.g_varchar2_table(241) := '746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D68656164657252696768742E69732D616374697665207B0A2020636F6C6F723A20233263326332633B0A7D0A2E742D427574746F6E2D2D6E6176426172202E742D42757474';
wwv_flow_api.g_varchar2_table(242) := '6F6E2D6261646765207B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3335293B0A7D0A2E742D427574746F6E2D2D68656C70427574746F6E202E61';
wwv_flow_api.g_varchar2_table(243) := '2D49636F6E207B0A20206F7061636974793A202E353B0A7D0A2E612D43616C656E6461722D627574746F6E207B0A2020626F726465722D7261646975733A203270783B0A2020636F6C6F723A20233730373037303B0A7D0A0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(244) := '6E6F5549207B0A2020636F6C6F723A20233338333833383B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7072696D617279207B0A2020636F6C6F723A20233639366638372021696D706F7274616E743B0A7D0A2E742D427574';
wwv_flow_api.g_varchar2_table(245) := '746F6E2D2D6E6F55492E742D427574746F6E2D2D7072696D617279202E742D49636F6E207B0A2020636F6C6F723A20236239633566352021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7761726E69';
wwv_flow_api.g_varchar2_table(246) := '6E67207B0A2020636F6C6F723A20233863373330642021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7761726E696E67202E742D49636F6E207B0A2020636F6C6F723A20236666636330302021696D';
wwv_flow_api.g_varchar2_table(247) := '706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D64616E676572207B0A2020636F6C6F723A20233831313330642021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F';
wwv_flow_api.g_varchar2_table(248) := '6E2D2D64616E676572202E742D49636F6E207B0A2020636F6C6F723A20236539306330302021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D73756363657373207B0A2020636F6C6F723A2023333337';
wwv_flow_api.g_varchar2_table(249) := '3933662021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D73756363657373202E742D49636F6E207B0A2020636F6C6F723A20233463643936342021696D706F7274616E743B0A7D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(250) := '6F6E2D2D6E6F55492E742D427574746F6E2D2D686F74207B0A2020636F6C6F723A20233164326637612021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D686F74202E742D49636F6E207B0A2020636F';
wwv_flow_api.g_varchar2_table(251) := '6C6F723A20233230343564622021696D706F7274616E743B0A7D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7072696D6172792C0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7761726E696E672C0A2E742D';
wwv_flow_api.g_varchar2_table(252) := '427574746F6E2D2D6E6F55492E742D427574746F6E2D2D64616E6765722C0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D737563636573732C0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D686F74207B0A2020';
wwv_flow_api.g_varchar2_table(253) := '626F782D736861646F773A206E6F6E653B0A7D0A0A2E742D427574746F6E526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A2020626F726465722D7261646975';
wwv_flow_api.g_varchar2_table(254) := '733A203270783B0A7D0A2E742D427574746F6E526567696F6E2D2D6E6F5549207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D427574746F6E526567696F6E2D2D77697A6172642C0A2E742D427574';
wwv_flow_api.g_varchar2_table(255) := '746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0A2020626F726465722D7261646975733A2030203020327078203270783B0A7D0A2E742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(256) := '6E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F6479202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0A2020636F6C6F723A2023333933393339';
wwv_flow_api.g_varchar2_table(257) := '3B0A7D0A2E742D426F64792D7469746C65202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E66';
wwv_flow_api.g_varchar2_table(258) := '6F202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D526567696F6E202E742D427574746F6E526567696F6E2D2D';
wwv_flow_api.g_varchar2_table(259) := '73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C652C0A2E742D427574746F6E526567696F6E202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0A';
wwv_flow_api.g_varchar2_table(260) := '2020636F6C6F723A20233430343034303B0A7D0A2E742D426F64792D616374696F6E73202E742D427574746F6E526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020626F726465722D72616469';
wwv_flow_api.g_varchar2_table(261) := '75733A20303B0A7D0A0A2E66632D746F6F6C626172207B0A2020626F726465722D636F6C6F723A20236562656265623B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D7261646975733A203270782032';
wwv_flow_api.g_varchar2_table(262) := '7078203020303B0A7D0A2E66632D746F6F6C6261722068322C0A2E6663202E66632D62617369632D766965772074642E66632D6461792D6E756D6265722C0A2E6663202E66632D6461792D6E756D626572207B0A2020636F6C6F723A2023343034303430';
wwv_flow_api.g_varchar2_table(263) := '3B0A7D0A2E66632D6461792D6865616465722E75692D7769646765742D6865616465722C0A2E66632D76696577202E75692D7769646765742D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20236566656665663B0A2020636F6C';
wwv_flow_api.g_varchar2_table(264) := '6F723A20233364336433643B0A2020626F726465722D636F6C6F723A20236532653265323B0A7D0A6469762E66632D6167656E64614C697374207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(265) := '6C6F723A20236562656265623B0A2020636F6C6F723A20233430343034303B0A7D0A2E6663202E66632D6167656E64614C6973742D646179486561646572207B0A20206261636B67726F756E642D636F6C6F723A20236436643664363B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(266) := '723A20233364336433643B0A2020626F726465722D636F6C6F723A20236661666166613B0A7D0A2E6663202E66632D6167656E64614C6973742D646179207B0A2020636F6C6F723A20233364336433643B0A7D0A2E6663202E66632D6167656E64614C69';
wwv_flow_api.g_varchar2_table(267) := '73742D64617465207B0A2020636F6C6F723A20233633363336333B0A7D0A2E6663202E66632D6167656E64614C697374202E66632D6576656E742D73746172742D74696D652C0A2E6663202E66632D6167656E64614C697374202E66632D6576656E742D';
wwv_flow_api.g_varchar2_table(268) := '616C6C2D646179207B0A2020636F6C6F723A20233636363636363B0A7D0A626F6479202E66632074642E66632D746F6461792C0A626F6479202E6663202E75692D7769646765742D636F6E74656E74207B0A2020626F726465722D636F6C6F723A202365';
wwv_flow_api.g_varchar2_table(269) := '36653665363B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E75692D7769646765742D636F6E74656E742E66632D746F6461792E75692D73746174652D686967686C69676874207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(270) := '20236632663266323B0A7D0A2E6663202E66632D6167656E64614C6973742D6974656D207B0A2020626F726465722D636F6C6F723A20236661666166613B0A7D0A0A2E742D436172642D77726170207B0A2020626F726465722D7261646975733A203270';
wwv_flow_api.g_varchar2_table(271) := '783B0A7D0A2E742D436172642D777261703A666F637573207B0A2020626F726465722D636F6C6F723A20233230343564623B0A7D0A2E742D436172642D69636F6E202E742D49636F6E207B0A2020636F6C6F723A20234646463B0A7D0A2E742D43617264';
wwv_flow_api.g_varchar2_table(272) := '2D64657363207B0A2020636F6C6F723A20233364336433643B0A7D0A2E742D43617264732D2D636F6D70616374202E742D436172642D77726170207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D4361726473';
wwv_flow_api.g_varchar2_table(273) := '2D2D636F6D70616374202E742D436172642D64657363207B0A2020636F6C6F723A20233633363336333B0A7D0A2E742D436172642D696E666F207B0A2020636F6C6F723A20233633363336333B0A7D0A2E742D436172642D7469746C65207B0A2020636F';
wwv_flow_api.g_varchar2_table(274) := '6C6F723A20233364336433643B0A7D0A2E742D43617264732D2D6261736963202E742D43617264202E742D436172642D777261702C0A2E742D436172642D2D6261736963202E742D436172642D77726170207B0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(275) := '6F723A20236663666366633B0A7D0A2E742D43617264732D2D6261736963202E742D43617264202E742D436172642D69636F6E202E742D49636F6E2C0A2E742D436172642D2D6261736963202E742D436172642D69636F6E202E742D49636F6E207B0A20';
wwv_flow_api.g_varchar2_table(276) := '20626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0A7D0A2E742D43617264732D2D6261736963202E742D43617264202E742D436172642D7469746C65577261702C0A2E742D4361';
wwv_flow_api.g_varchar2_table(277) := '72642D2D6261736963202E742D436172642D7469746C6557726170207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D43617264732D2D6665617475726564202E742D43617264202E742D436172642D77726170';
wwv_flow_api.g_varchar2_table(278) := '2C0A2E742D436172642D2D6665617475726564202E742D436172642D77726170207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D43617264732D2D6665617475726564202E742D43617264202E742D43617264';
wwv_flow_api.g_varchar2_table(279) := '2D69636F6E202E742D49636F6E2C0A2E742D436172642D2D6665617475726564202E742D436172642D69636F6E202E742D49636F6E207B0A2020626F726465722D7261646975733A2031303070783B0A2020636F6C6F723A20234646463B0A2020626163';
wwv_flow_api.g_varchar2_table(280) := '6B67726F756E642D636F6C6F723A20234130413041303B0A7D0A2E742D43617264732D2D6665617475726564202E742D43617264202E742D436172642D626F64792C0A2E742D436172642D2D6665617475726564202E742D436172642D626F6479207B0A';
wwv_flow_api.g_varchar2_table(281) := '20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A0A2E742D436C617373696343616C656E6461722D6D6F6E74685469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D436C61737369634361';
wwv_flow_api.g_varchar2_table(282) := '6C656E6461722D646179436F6C756D6E207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A2020766572746963616C2D616C69676E3A20746F703B0A2020626F726465722D636F6C6F723A20236632663266323B0A2020636F';
wwv_flow_api.g_varchar2_table(283) := '6C6F723A20233636363636363B0A7D0A2E742D436C617373696343616C656E6461722D646179207B0A2020626F726465722D636F6C6F723A20236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6461792E69732D696E61637469';
wwv_flow_api.g_varchar2_table(284) := '7665202E742D436C617373696343616C656E6461722D64617465207B0A20206F7061636974793A202E353B0A7D0A2E742D436C617373696343616C656E6461722D6461792E69732D7765656B656E642C0A2E742D436C617373696343616C656E6461722D';
wwv_flow_api.g_varchar2_table(285) := '6461792E69732D696E616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D436C617373696343616C656E6461722D6461792E69732D746F646179202E742D436C617373696343616C656E6461722D';
wwv_flow_api.g_varchar2_table(286) := '64617465207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D436C617373696343616C656E6461722D64617465207B0A2020636F6C6F723A20233830383038303B0A';
wwv_flow_api.g_varchar2_table(287) := '7D0A2E742D436C617373696343616C656E6461722D6576656E74207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6576656E74207B0A2020636F6C6F723A2023343034';
wwv_flow_api.g_varchar2_table(288) := '3034303B0A7D0A2E742D436C617373696343616C656E6461722D6576656E742061207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D436C617373696343616C656E';
wwv_flow_api.g_varchar2_table(289) := '6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D74696D65436F6C2C0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D74696D65436F6C207B0A2020626163';
wwv_flow_api.g_varchar2_table(290) := '6B67726F756E642D636F6C6F723A20236661666166613B0A7D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461794576656E74732C0A2E742D436C617373696343616C656E6461';
wwv_flow_api.g_varchar2_table(291) := '722D2D6461696C79202E742D436C617373696343616C656E6461722D6461794576656E7473207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C';
wwv_flow_api.g_varchar2_table(292) := '656E6461722D6461794576656E747320612C0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D6461794576656E74732061207B0A20206261636B67726F756E642D636F6C6F723A202332';
wwv_flow_api.g_varchar2_table(293) := '30343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461792E69732D746F6461792C0A2E742D436C617373696343616C';
wwv_flow_api.g_varchar2_table(294) := '656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D6461792E69732D746F646179207B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A7D0A2E742D436C617373696343616C656E6461722D6C6973';
wwv_flow_api.g_varchar2_table(295) := '74207B0A2020626F726465722D636F6C6F723A20236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6C6973745469746C652C0A2E742D436C617373696343616C656E6461722D6C6973744576656E74207B0A2020626F72646572';
wwv_flow_api.g_varchar2_table(296) := '2D636F6C6F723A20236632663266323B0A7D0A2E742D436C617373696343616C656E6461722D6C6973745469746C65207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A2020636F6C6F723A20233636363636363B0A7D0A2E';
wwv_flow_api.g_varchar2_table(297) := '742D436C617373696343616C656E6461722D6C6973744576656E74207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D436F6D6D656E74732D7573657249636F6E2C0A2E742D436F6D6D656E74732D75736572496D67207B0A2020626F7264';
wwv_flow_api.g_varchar2_table(298) := '65722D7261646975733A20313030253B0A7D0A2E742D436F6D6D656E74732D7573657249636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D436F6D6D656E74732D696E666F207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(299) := '20233636363636363B0A7D0A2E742D436F6D6D656E74732D636F6D6D656E74207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D696E666F207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(300) := '756E642D636F6C6F723A20236666666666663B0A2020626F726465722D7261646975733A2032707820327078203020303B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D436F6D6D656E74732D2D63686174202E742D436F';
wwv_flow_api.g_varchar2_table(301) := '6D6D656E74732D696E666F3A6166746572207B0A2020626F726465722D636F6C6F723A2072676261283234382C203234382C203234382C2030293B0A2020626F726465722D72696768742D636F6C6F723A20236666666666663B0A7D0A2E742D436F6D6D';
wwv_flow_api.g_varchar2_table(302) := '656E74732D2D63686174202E742D436F6D6D656E74732D696E666F3A6265666F7265207B0A2020626F726465722D636F6C6F723A2072676261283233322C203233322C203233322C2030293B0A2020626F726465722D72696768742D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(303) := '6536653665363B0A7D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D636F6D6D656E74207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D7261646975733A2030203020';
wwv_flow_api.g_varchar2_table(304) := '327078203270783B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D436F6E66696750616E656C2D61626F7574207B0A20206261636B67726F756E642D636F6C6F723A20236666663765303B0A2020636F6C6F723A20233536';
wwv_flow_api.g_varchar2_table(305) := '353635363B0A7D0A2E742D436F6E66696750616E656C2D69636F6E207B0A2020626F726465722D7261646975733A20313030253B0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0A2020636F6C6F723A20234646463B0A7D0A2E';
wwv_flow_api.g_varchar2_table(306) := '742D436F6E66696750616E656C2D69636F6E2E69732D656E61626C6564207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E742D436F6E66696750616E656C2D69636F6E2E69732D64697361626C6564207B0A202062';
wwv_flow_api.g_varchar2_table(307) := '61636B67726F756E642D636F6C6F723A20236539306330303B0A7D0A2E742D436F6E66696750616E656C2D73657474696E672C0A2E742D436F6E66696750616E656C2D737461747573207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D43';
wwv_flow_api.g_varchar2_table(308) := '6F6E66696750616E656C2D737461747573207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D436F6E66696750616E656C2D617474724C696E6B207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D436F6E66696750616E656C';
wwv_flow_api.g_varchar2_table(309) := '2D617474724C696E6B3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0A7D0A2E742D436F6E66696750616E656C2D6174747256616C7565207B0A2020636F6C6F723A20233165';
wwv_flow_api.g_varchar2_table(310) := '343163653B0A7D0A0A2E742D4469616C6F67526567696F6E2D626F6479207B0A20206261636B67726F756E643A202D7765626B69742D6C696E6561722D6772616469656E742823666666666666203330252C2023666666666666292C202D7765626B6974';
wwv_flow_api.g_varchar2_table(311) := '2D6C696E6561722D6772616469656E7428236666666666662C20236666666666662037302529203020313030252C202D7765626B69742D6C696E6561722D6772616469656E74287267626128302C20302C20302C20302E3035292C207267626128302C20';
wwv_flow_api.g_varchar2_table(312) := '302C20302C203029292C202D7765626B69742D6C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E303529293B0A20206261636B67726F756E643A202D6F2D6C696E6561722D67';
wwv_flow_api.g_varchar2_table(313) := '72616469656E742823666666666666203330252C2023666666666666292C202D6F2D6C696E6561722D6772616469656E7428236666666666662C20236666666666662037302529203020313030252C202D6F2D6C696E6561722D6772616469656E742872';
wwv_flow_api.g_varchar2_table(314) := '67626128302C20302C20302C20302E3035292C207267626128302C20302C20302C203029292C202D6F2D6C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E303529293B0A2020';
wwv_flow_api.g_varchar2_table(315) := '6261636B67726F756E643A206C696E6561722D6772616469656E742823666666666666203330252C2023666666666666292C206C696E6561722D6772616469656E7428236666666666662C20236666666666662037302529203020313030252C206C696E';
wwv_flow_api.g_varchar2_table(316) := '6561722D6772616469656E74287267626128302C20302C20302C20302E3035292C207267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C';
wwv_flow_api.g_varchar2_table(317) := '20302E30352929203020313030253B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A0A2E742D466F6F7465722C0A2E742D466F6F7465722061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D466F726D';
wwv_flow_api.g_varchar2_table(318) := '2D696E707574436F6E7461696E65723A6265666F7265207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D466F726D2D6669656C642C0A2E742D466F726D2D73656C6563742C0A2E742D466F726D2D696E707574436F6E7461696E65722069';
wwv_flow_api.g_varchar2_table(319) := '6E7075745B747970653D2274657874225D2C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E73656C6563746C6973742C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F2C0A2E';
wwv_flow_api.g_varchar2_table(320) := '742D466F726D2D696E707574436F6E7461696E657220696E7075742E746578745F6669656C642C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E70617373776F72642C0A2E742D466F726D2D696E707574436F6E7461696E65';
wwv_flow_api.g_varchar2_table(321) := '722074657874617265612E74657874617265612C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E646174657069636B65722C0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E';
wwv_flow_api.g_varchar2_table(322) := '6C792C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F762C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D2C0A2E742D466F726D2D74657874617265';
wwv_flow_api.g_varchar2_table(323) := '612C0A2E752D54462D6974656D2D2D746578742C0A2E752D54462D6974656D2D2D74657874617265612C0A2E752D54462D6974656D2D2D646174657069636B65722C0A2E752D54462D6974656D2D2D73656C656374207B0A2020626F726465722D726164';
wwv_flow_api.g_varchar2_table(324) := '6975733A203270783B0A2020636F6C6F723A20233333333333333B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020626F726465722D636F6C6F723A20236439643964393B0A7D0A2E742D466F726D2D6669656C643A666F';
wwv_flow_api.g_varchar2_table(325) := '6375732C0A2E742D466F726D2D73656C6563743A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075745B747970653D2274657874225D3A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722073';
wwv_flow_api.g_varchar2_table(326) := '656C6563742E73656C6563746C6973743A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F3A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E746578';
wwv_flow_api.g_varchar2_table(327) := '745F6669656C643A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E70617373776F72643A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722074657874617265612E7465787461726561';
wwv_flow_api.g_varchar2_table(328) := '3A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E646174657069636B65723A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E6C793A666F6375';
wwv_flow_api.g_varchar2_table(329) := '732C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F763A666F6375732C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D3A666F6375732C0A2E742D46';
wwv_flow_api.g_varchar2_table(330) := '6F726D2D74657874617265613A666F6375732C0A2E752D54462D6974656D2D2D746578743A666F6375732C0A2E752D54462D6974656D2D2D74657874617265613A666F6375732C0A2E752D54462D6974656D2D2D646174657069636B65723A666F637573';
wwv_flow_api.g_varchar2_table(331) := '2C0A2E752D54462D6974656D2D2D73656C6563743A666F637573207B0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0A2020626F726465722D636F6C6F723A20233230343564622021696D706F7274';
wwv_flow_api.g_varchar2_table(332) := '616E743B0A7D0A2E742D466F726D2D6669656C643A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D73656C6563743A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E707574';
wwv_flow_api.g_varchar2_table(333) := '5B747970653D2274657874225D3A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E73656C6563746C6973743A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D69';
wwv_flow_api.g_varchar2_table(334) := '6E707574436F6E7461696E65722073656C6563742E7965735F6E6F3A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E746578745F6669656C643A666F6375733A3A2D6D732D76616C';
wwv_flow_api.g_varchar2_table(335) := '75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E70617373776F72643A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E65722074657874617265612E7465787461726561';
wwv_flow_api.g_varchar2_table(336) := '3A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E646174657069636B65723A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220';
wwv_flow_api.g_varchar2_table(337) := '7370616E2E646973706C61795F6F6E6C793A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F763A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D';
wwv_flow_api.g_varchar2_table(338) := '2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D3A666F6375733A3A2D6D732D76616C75652C0A2E742D466F726D2D74657874617265613A666F6375733A3A2D6D732D76616C75652C0A2E752D54462D6974656D2D2D7465';
wwv_flow_api.g_varchar2_table(339) := '78743A666F6375733A3A2D6D732D76616C75652C0A2E752D54462D6974656D2D2D74657874617265613A666F6375733A3A2D6D732D76616C75652C0A2E752D54462D6974656D2D2D646174657069636B65723A666F6375733A3A2D6D732D76616C75652C';
wwv_flow_api.g_varchar2_table(340) := '0A2E752D54462D6974656D2D2D73656C6563743A666F6375733A3A2D6D732D76616C7565207B0A2020636F6C6F723A20233333333333333B0A20200A7D0A2E742D466F726D2D6669656C643A686F7665722C0A2E742D466F726D2D73656C6563743A686F';
wwv_flow_api.g_varchar2_table(341) := '7665722C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075745B747970653D2274657874225D3A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E73656C6563746C6973743A686F766572';
wwv_flow_api.g_varchar2_table(342) := '2C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F3A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E746578745F6669656C643A686F7665722C0A2E742D466F726D';
wwv_flow_api.g_varchar2_table(343) := '2D696E707574436F6E7461696E657220696E7075742E70617373776F72643A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E65722074657874617265612E74657874617265613A686F7665722C0A2E742D466F726D2D696E70757443';
wwv_flow_api.g_varchar2_table(344) := '6F6E7461696E657220696E7075742E646174657069636B65723A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E6C793A686F7665722C0A2E742D466F726D2D696E707574436F6E746169';
wwv_flow_api.g_varchar2_table(345) := '6E657220696E7075742E706F7075705F6C6F763A686F7665722C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563745B6D756C7469706C655D3A686F7665722C0A2E742D466F726D2D74657874617265613A686F7665722C0A2E75';
wwv_flow_api.g_varchar2_table(346) := '2D54462D6974656D2D2D746578743A686F7665722C0A2E752D54462D6974656D2D2D74657874617265613A686F7665722C0A2E752D54462D6974656D2D2D646174657069636B65723A686F7665722C0A2E752D54462D6974656D2D2D73656C6563743A68';
wwv_flow_api.g_varchar2_table(347) := '6F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D7765626B69742D696E7075742D706C616365686F6C646572207B0A2020636F';
wwv_flow_api.g_varchar2_table(348) := '6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D6D6F7A2D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A20';
wwv_flow_api.g_varchar2_table(349) := '206F7061636974793A202E35353B0A7D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A2D6D732D696E7075742D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E';
wwv_flow_api.g_varchar2_table(350) := '35353B0A7D0A2E742D466F726D20696E7075742E66696C65207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E646973706C61795F6F6E6C79207B0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(351) := '6F6C6F723A207472616E73706172656E743B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D466F726D2D73656C6563742C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E';
wwv_flow_api.g_varchar2_table(352) := '73656C6563746C6973742C0A2E742D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D466F726D2D6669656C642D2D726561644F6E6C79207B0A202062';
wwv_flow_api.g_varchar2_table(353) := '61636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D466F726D2D726164696F4C6162656C2C0A2E742D466F726D2D696E707574436F6E7461696E6572202E726164696F5F67726F7570206C6162656C2C0A2E742D466F';
wwv_flow_api.g_varchar2_table(354) := '726D2D636865636B626F784C6162656C2C0A2E742D466F726D2D696E707574436F6E7461696E6572202E636865636B626F785F67726F7570206C6162656C2C0A2E742D466F726D2D6C6162656C207B0A2020636F6C6F723A20233464346434643B0A7D0A';
wwv_flow_api.g_varchar2_table(355) := '2E742D466F726D2D6572726F72207B0A2020636F6C6F723A20234539323032303B0A7D0A2E742D466F726D2D706F737454657874207B0A2020636F6C6F723A20236363636363633B0A7D0A2E742D466F726D2D2D73656172636820696E7075742E742D46';
wwv_flow_api.g_varchar2_table(356) := '6F726D2D7365617263684669656C64207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D4865726F526567696F6E2D666F726D20696E7075745B747970653D746578';
wwv_flow_api.g_varchar2_table(357) := '745D2E742D466F726D2D7365617263684669656C64207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D636F6C6F723A20236366643766383B0A7D0A2E742D4865726F526567696F6E2D666F726D2069';
wwv_flow_api.g_varchar2_table(358) := '6E7075745B747970653D746578745D2E742D466F726D2D7365617263684669656C643A666F637573207B0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0A2020626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(359) := '3230343564622021696D706F7274616E743B0A7D0A2E742D4865726F526567696F6E2D666F726D20696E7075745B747970653D746578745D2E742D466F726D2D7365617263684669656C643A3A2D7765626B69742D696E7075742D706C616365686F6C64';
wwv_flow_api.g_varchar2_table(360) := '6572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D4865726F526567696F6E2D666F726D20696E7075745B747970653D746578745D2E742D466F726D2D7365617263684669656C643A3A2D6D6F';
wwv_flow_api.g_varchar2_table(361) := '7A2D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D4865726F526567696F6E2D666F726D20696E7075745B747970653D746578745D2E742D466F726D2D7365617263';
wwv_flow_api.g_varchar2_table(362) := '684669656C643A2D6D732D696E7075742D706C616365686F6C646572207B0A2020636F6C6F723A20233030303030303B0A20206F7061636974793A202E35353B0A7D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E68617344';
wwv_flow_api.g_varchar2_table(363) := '6174657069636B65722C0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F76207B0A2020626F726465722D746F702D72696768742D7261646975733A20303B0A2020626F726465722D626F74746F6D2D7269';
wwv_flow_api.g_varchar2_table(364) := '6768742D7261646975733A20303B0A7D0A2E612D427574746F6E2E612D427574746F6E2D2D63616C656E6461722C0A2E612D427574746F6E2E612D427574746F6E2D2D706F7075704C4F56207B0A2020626F726465722D746F702D6C6566742D72616469';
wwv_flow_api.g_varchar2_table(365) := '75733A20303B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20303B0A2020626F726465722D746F702D72696768742D7261646975733A203270783B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A';
wwv_flow_api.g_varchar2_table(366) := '203270783B0A7D0A0A2E742D4865616465722D6272616E64696E67207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A7D0A2E742D4865616465722D6C6F676F2D6C696E6B2C0A2E742D486561646572202E742D427574746F';
wwv_flow_api.g_varchar2_table(367) := '6E2E742D427574746F6E2D2D6865616465722E69732D6163746976652C0A2E742D486561646572202E742D427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D686561646572207B0A2020636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(368) := '66663B0A7D0A2E742D4865616465722D6C6F676F2D6C696E6B3A686F7665722C0A2E742D486561646572202E742D427574746F6E2E742D427574746F6E2D2D6865616465722E69732D6163746976653A686F7665722C0A2E742D486561646572202E742D';
wwv_flow_api.g_varchar2_table(369) := '427574746F6E2E742D427574746F6E2D2D6865616465722E742D427574746F6E2D2D6865616465723A686F766572207B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A7D0A2E742D4865616465722D6C6F676F2D6C696E6B3A666F6375';
wwv_flow_api.g_varchar2_table(370) := '732C0A2E742D4865616465722D6C6F676F2D6C696E6B3A6163746976653A666F637573207B0A20206F75746C696E653A206E6F6E653B0A2020626F782D736861646F773A20302030203020317078202336303762653820696E7365742C20302030203170';
wwv_flow_api.g_varchar2_table(371) := '782032707820726762612839362C203132332C203233322C20302E3235292021696D706F7274616E743B0A7D0A2E742D4865616465722D6E6176207B0A20206261636B67726F756E642D636F6C6F723A20236466616436633B0A7D0A2E742D4865616465';
wwv_flow_api.g_varchar2_table(372) := '72202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D203E202E612D4D656E752D737562';
wwv_flow_api.g_varchar2_table(373) := '4D656E75436F6C202E612D49636F6E207B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D486561646572202E612D4D656E752E612D4D656E752D2D746F70203E202E612D4D656E752D636F6E74656E74207B0A2020626F726465';
wwv_flow_api.g_varchar2_table(374) := '722D746F702D77696474683A20303B0A7D0A2E742D486561646572202E612D4D656E752D636F6E74656E74207B0A2020626F782D736861646F773A20302032707820367078207267626128302C20302C20302C20302E3135293B0A7D0A2E742D48656164';
wwv_flow_api.g_varchar2_table(375) := '65722D6E61762D6C697374207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D4865726F526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(376) := '723A20233130323236633B0A7D0A2E742D4865726F526567696F6E2D7469746C65207B0A2020636F6C6F723A20233130323236633B0A7D0A2E742D4865726F526567696F6E2D69636F6E207B0A2020626F726465722D7261646975733A203470783B0A20';
wwv_flow_api.g_varchar2_table(377) := '206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D4865726F526567696F6E2D2D6665617475726564207B0A20206261636B67726F756E642D636F6C6F723A207472616E7370';
wwv_flow_api.g_varchar2_table(378) := '6172656E743B0A7D0A2E742D4865726F526567696F6E2D2D66656174757265642C0A2E742D4865726F526567696F6E2D2D6665617475726564202E742D4865726F526567696F6E2D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A';
wwv_flow_api.g_varchar2_table(379) := '0A2E612D495252207B0A2020626F726465722D7261646975733A203270783B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E612D495252202E612D4952522D706167696E6174696F6E2D6C6162656C207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(380) := '20233733373337333B0A7D0A2E612D4952522D7265706F727453756D6D6172792D76616C7565207B0A2020636F6C6F723A20233430343034303B0A7D0A2E612D4952522D636F6E74726F6C73436F6E7461696E6572207B0A2020626F726465722D746F70';
wwv_flow_api.g_varchar2_table(381) := '2D636F6C6F723A20236635663566353B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A7D0A2E612D4952522D66756C6C56696577207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E612D';
wwv_flow_api.g_varchar2_table(382) := '4952522D627574746F6E2E612D4952522D627574746F6E2D2D636F6E74726F6C73207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E612D4952522D736F7274576964676574207B0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(383) := '646F773A20302032707820347078207267626128302C20302C20302C20302E31293B0A7D0A2E612D4952522D746F6F6C626172207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428236666666666662C2023666366636663';
wwv_flow_api.g_varchar2_table(384) := '293B0A2020626F726465722D636F6C6F723A20236532653265323B0A7D0A2E612D5265706F72742D70657263656E7443686172742D66696C6C207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A7D0A2E612D5265706F7274';
wwv_flow_api.g_varchar2_table(385) := '2D70657263656E744368617274207B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A7D0A2E612D4952522D627574746F6E2D2D636F6C536561726368207B0A20202D7765626B69742D626F726465722D746F702D7269676874';
wwv_flow_api.g_varchar2_table(386) := '2D7261646975733A203070782021696D706F7274616E743B0A20202D7765626B69742D626F726465722D626F74746F6D2D72696768742D7261646975733A203070782021696D706F7274616E743B0A20202D6D6F7A2D626F726465722D7261646975732D';
wwv_flow_api.g_varchar2_table(387) := '746F7072696768743A20307078202021696D706F7274616E743B0A20202D6D6F7A2D626F726465722D7261646975732D626F74746F6D72696768743A203070782021696D706F7274616E743B0A2020626F726465722D746F702D72696768742D72616469';
wwv_flow_api.g_varchar2_table(388) := '75733A203070782021696D706F7274616E743B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203070782021696D706F7274616E743B0A7D0A2E612D4952522D69636F6E566965775461626C652C0A2E612D4952522D636861';
wwv_flow_api.g_varchar2_table(389) := '7274566965772C0A2E612D4952522D7069766F74566965772C0A2E612D4952522D67726F75704279566965772C0A2E612D4952522D64657461696C56696577207B0A2020626F726465722D746F702D636F6C6F723A20236635663566353B0A7D0A2E612D';
wwv_flow_api.g_varchar2_table(390) := '4952522D746F6F6C6261722D2D73696E676C65526F77207B0A2020626F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0A7D0A2E612D4952522D686561646572207B0A20206261636B67726F756E642D636F6C6F723A202366616661';
wwv_flow_api.g_varchar2_table(391) := '66613B0A2020626F726465722D746F703A2031707820736F6C696420236536653665363B0A2020626F782D736861646F773A20696E7365742031707820302030203020236536653665363B0A7D0A2E612D4952522D6865616465723A686F766572207B0A';
wwv_flow_api.g_varchar2_table(392) := '20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E612D4952522D6865616465722E69732D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20233136333039383B0A2020626F726465722D626F74746F';
wwv_flow_api.g_varchar2_table(393) := '6D3A206E6F6E653B0A7D0A2E612D4952522D6865616465722E69732D6163746976652061207B0A2020636F6C6F723A20236663666366653B0A7D0A2E612D4952522D6865616465722E69732D616374697665202E612D4952522D686561646572536F7274';
wwv_flow_api.g_varchar2_table(394) := '207B0A2020636F6C6F723A20236663666366653B0A7D0A2E612D4952522D6865616465722D2D67726F7570207B0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0A7D0A2E612D4952522D7461626C65207472207464207B0A2020';
wwv_flow_api.g_varchar2_table(395) := '6261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E612D4952522D7461626C65207B0A2020626F726465722D636F6C6C617073653A2073657061726174653B0A7D0A2E612D4952522D';
wwv_flow_api.g_varchar2_table(396) := '7461626C652074723A686F766572207464207B0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0A7D0A2E742D4952522D726567696F6E2D2D6E6F426F7264657273202E612D495252207B0A2020626F726465722D726164697573';
wwv_flow_api.g_varchar2_table(397) := '3A203270783B0A7D0A626F6479202E612D4952522D736F72745769646765742D726F7773207B0A2020636F6C6F723A20236666666666663B0A2020626F726465722D746F703A2031707820736F6C696420233136333039383B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(398) := '6E643A20233164336563353B0A7D0A626F6479202E612D4952522D736F72745769646765742D726F77207B0A2020636F6C6F723A20236666666666663B0A2020626F782D736861646F773A2030202D3170782030202331363330393820696E7365743B0A';
wwv_flow_api.g_varchar2_table(399) := '7D0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C642C0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769';
wwv_flow_api.g_varchar2_table(400) := '646765742D7365617263684669656C645B747970653D2274657874225D207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E643A20233136333039383B0A7D0A2E612D4952522D736F72745769646765742D726F773A686F76';
wwv_flow_api.g_varchar2_table(401) := '6572207B0A20206261636B67726F756E642D636F6C6F723A20233136333039383B0A7D0A626F6479202E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E2C0A626F6479202E612D4952522D627574746F6E2E61';
wwv_flow_api.g_varchar2_table(402) := '2D4952522D736F72745769646765742D627574746F6E3A6163746976653A666F637573207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E39293B0A20206261636B67726F756E642D636F6C6F723A2023313633303938';
wwv_flow_api.g_varchar2_table(403) := '3B0A7D0A626F6479202E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A686F7665722C0A626F6479202E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A616374';
wwv_flow_api.g_varchar2_table(404) := '6976653A666F6375733A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233164336563353B0A7D0A2E612D4952522D736F72745769646765742D616374696F6E73207B0A2020626F726465722D626F74746F6D3A2031707820736F';
wwv_flow_api.g_varchar2_table(405) := '6C696420233136333039383B0A7D0A2E612D4952522D736F72745769646765742D616374696F6E732D6974656D207B0A2020626F726465722D72696768743A206E6F6E653B0A7D0A2E612D4952522D736F7274576964676574207B0A2020626F72646572';
wwv_flow_api.g_varchar2_table(406) := '3A206E6F6E653B0A7D0A2E612D4952522D7461626C65207464207B0A2020626F726465722D6C6566743A2031707820736F6C696420236632663266323B0A2020626F726465722D746F703A2031707820736F6C696420236632663266323B0A7D0A2E612D';
wwv_flow_api.g_varchar2_table(407) := '4952522D736F72745769646765742D7365617263684C6162656C207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E39293B0A7D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C3A6265666F';
wwv_flow_api.g_varchar2_table(408) := '7265207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0A7D0A2E612D4952522D6865616465724C696E6B3A666F637573207B0A2020626F782D736861646F773A20302030203020327078202332303435646220';
wwv_flow_api.g_varchar2_table(409) := '696E7365743B0A7D0A2E612D4952522D7365617263682D6669656C643A666F637573207B0A2020626F726465722D636F6C6F723A20233230343564623B0A2020626F782D736861646F773A20302030203020317078202332303435646220696E7365742C';
wwv_flow_api.g_varchar2_table(410) := '202D32707820302030202332303435646220696E7365742C2032707820302030202332303435646220696E7365742C2030203020327078203020726762612833322C2036392C203231392C20302E35293B0A7D0A2E612D4952522D73696E676C65526F77';
wwv_flow_api.g_varchar2_table(411) := '2D6E616D652C0A2E612D4952522D73696E676C65526F772D76616C7565207B0A2020626F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0A2020636F6C6F723A20233430343034303B0A7D0A2E612D4952522D73696E676C65526F77';
wwv_flow_api.g_varchar2_table(412) := '2D76616C7565207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E612D4952522D73696E676C65526F772D726F773A686F766572202E612D4952522D73696E676C65526F772D76616C7565207B0A20206261636B6772';
wwv_flow_api.g_varchar2_table(413) := '6F756E642D636F6C6F723A20236637663766373B0A7D0A2E612D4952522D73696E676C65526F772D6E616D65207B0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0A7D0A2E612D4952522D73696E676C65526F772D726F773A68';
wwv_flow_api.g_varchar2_table(414) := '6F766572202E612D4952522D73696E676C65526F772D6E616D65207B0A20206261636B67726F756E642D636F6C6F723A20236630663066303B0A7D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E3A68';
wwv_flow_api.g_varchar2_table(415) := '6F766572207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A7D0A2E612D4952522D7265706F727453756D6D6172792D6C6162656C2C0A2E612D4952522D636F6E74726F6C734C6162656C207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(416) := '642D636F6C6F723A20236666666666663B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20373639707829207B0A20202E69732D6D6178696D697A65642E742D4952522D726567696F6E202E742D6668742D';
wwv_flow_api.g_varchar2_table(417) := '7468656164202E612D4952522D686561646572207B0A20202020626F726465722D626F74746F6D3A2031707820736F6C696420236536653665363B0A20207D0A7D0A0A2E742D4C696E6B734C6973742D6974656D2C0A2E742D4C696E6B734C6973742D6C';
wwv_flow_api.g_varchar2_table(418) := '696E6B207B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D4C696E6B734C6973742D69636F6E207B0A2020636F6C6F723A20236439643964393B0A7D0A2E742D4C696E6B734C6973742D6C696E6B3A686F766572207B0A20';
wwv_flow_api.g_varchar2_table(419) := '206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A2E742D4C696E6B734C6973742D6C696E6B3A666F637573207B0A2020626F782D736861646F773A20302030203020317078202332303435646220696E7365743B0A7D0A0A2E74';
wwv_flow_api.g_varchar2_table(420) := '2D4C696E6B734C6973742D2D73686F774172726F77202E742D4C696E6B734C6973742D6C696E6B3A6265666F7265207B0A2020636F6C6F723A20236439643964393B0A7D0A0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E';
wwv_flow_api.g_varchar2_table(421) := '6B734C6973742D6261646765207B0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C697374';
wwv_flow_api.g_varchar2_table(422) := '2D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6261646765207B0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0A7D0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C697374';
wwv_flow_api.g_varchar2_table(423) := '2D6974656D2E69732D657870616E646564203E202E742D4C696E6B734C6973742D6C696E6B202E742D4C696E6B734C6973742D6261646765207B0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0A7D0A0A2E742D4C696E6B734C';
wwv_flow_api.g_varchar2_table(424) := '6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C696E6B3A686F7665723A6265666F7265207B0A2020636F6C6F723A2072676261283235352C2032';
wwv_flow_api.g_varchar2_table(425) := '35352C203235352C20302E35293B0A7D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6C696E6B3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020';
wwv_flow_api.g_varchar2_table(426) := '636F6C6F723A20236666666666663B0A7D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D69636F6E207B0A2020636F6C6F723A20726762';
wwv_flow_api.g_varchar2_table(427) := '61283235352C203235352C203235352C20302E3735293B0A7D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20234643464346433B0A20206261636B67726F756E643A';
wwv_flow_api.g_varchar2_table(428) := '206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E303135292C207267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20';
wwv_flow_api.g_varchar2_table(429) := '302C20302C20302E30313529293B0A7D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C696E6B3A686F7665723A6265666F7265207B0A2020636F6C6F723A20233230343564623B0A7D0A';
wwv_flow_api.g_varchar2_table(430) := '2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C696E6B3A6265666F7265207B0A2020636F6C6F723A207267626128302C20302C20302C20302E3235293B0A7D0A2E742D4C696E6B734C6973';
wwv_flow_api.g_varchar2_table(431) := '742D2D73686F774261646765202E742D4C696E6B734C6973742D6261646765207B0A2020626F726465722D7261646975733A203470783B0A7D0A2E742D4C696E6B734C6973742D2D69636F6E4F6E6C79202E742D4C696E6B734C6973742D69636F6E207B';
wwv_flow_api.g_varchar2_table(432) := '0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C6162656C207B0A2020636F6C6F723A20233263326332633B0A7D0A2E742D4C696E6B734C6973';
wwv_flow_api.g_varchar2_table(433) := '742D2D616374696F6E73202E742D4C696E6B734C6973742D69636F6E207B0A2020636F6C6F723A20233263326332633B0A7D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D';
wwv_flow_api.g_varchar2_table(434) := '4C696E6B734C6973742D69636F6E2C0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6C6162656C2C0A2E742D4C696E6B734C6973742D2D61637469';
wwv_flow_api.g_varchar2_table(435) := '6F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6261646765207B0A2020636F6C6F723A20233339333933393B0A7D0A0A2E742D4C6F67696E2D69636F6E56616C69646174696F6E207B0A20206261';
wwv_flow_api.g_varchar2_table(436) := '636B67726F756E643A20233463643936343B0A2020636F6C6F723A2077686974653B0A7D0A626F6479202E742D4C6F67696E2D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D4C6F67696E2D726567696F6E207B0A202062';
wwv_flow_api.g_varchar2_table(437) := '61636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D4C6F67696E2D6C6F676F2E6661207B0A2020636F6C6F723A20233230343564623B0A7D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D7769647468';
wwv_flow_api.g_varchar2_table(438) := '3A20343830707829207B0A20202E742D50616765426F64792D2D6C6F67696E2C0A20202E742D50616765426F64792D2D6C6F67696E202E742D426F6479207B0A202020206261636B67726F756E642D636F6C6F723A20236666666666663B0A20207D0A7D';
wwv_flow_api.g_varchar2_table(439) := '0A0A2E742D4D656469614C6973742D6974656D207B0A2020626F726465722D636F6C6F723A20236439643964393B0A7D0A2E742D4D656469614C6973742D2D686F72697A6F6E74616C202E742D4D656469614C6973742D6974656D207B0A2020626F7264';
wwv_flow_api.g_varchar2_table(440) := '65722D72696768743A2031707820736F6C696420236439643964393B0A7D0A0A612E742D4D656469614C6973742D6974656D57726170207B0A2020636F6C6F723A20233165343163653B0A7D0A612E742D4D656469614C6973742D6974656D577261703A';
wwv_flow_api.g_varchar2_table(441) := '686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0A2020636F6C6F723A20233165343163653B0A7D0A612E742D4D656469614C6973742D6974656D577261703A666F637573207B0A2020626F782D736861646F77';
wwv_flow_api.g_varchar2_table(442) := '3A20302030203020317078202332303435646220696E7365743B0A7D0A2E742D4D656469614C6973742D6974656D57726170207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D4D656469614C6973742D62616467652C0A2E742D4D656469';
wwv_flow_api.g_varchar2_table(443) := '614C6973742D64657363207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D4D656469614C6973742D69636F6E207B0A2020636F6C6F723A20236439643964393B0A7D0A2E742D4D656469614C6973742D2D636F6C73202E742D4D65646961';
wwv_flow_api.g_varchar2_table(444) := '4C6973742D6974656D3A6265666F72652C0A2E742D4D656469614C6973742D2D636F6C73202E742D4D656469614C6973742D6974656D3A6166746572207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E612D4D656E';
wwv_flow_api.g_varchar2_table(445) := '754261722D6C6162656C207B0A2020636F6C6F723A20236666666666663B0A20206C696E652D6865696768743A20323070783B0A7D0A2E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C207B0A2020646973706C';
wwv_flow_api.g_varchar2_table(446) := '61793A20696E6C696E652D626C6F636B3B0A202070616464696E673A2038707820303B0A2020766572746963616C2D616C69676E3A20746F703B0A20206D617267696E2D72696768743A203870783B0A20206D617267696E2D6C6566743A202D3470783B';
wwv_flow_api.g_varchar2_table(447) := '0A7D0A2E612D4D656E754261722D6974656D207B0A20206261636B67726F756E643A20236461613135373B0A2020626F726465722D72696768743A2031707820736F6C696420236534623938313B0A2020626F726465722D6C6566743A2031707820736F';
wwv_flow_api.g_varchar2_table(448) := '6C696420236534623938313B0A20206D617267696E2D6C6566743A202D3170783B0A7D0A2E612D4D656E754261722D6974656D3A66697273742D6368696C64207B0A20206D617267696E2D6C6566743A20303B0A7D0A2E612D4D656E754261722D697465';
wwv_flow_api.g_varchar2_table(449) := '6D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C2C0A2E612D4D656E754261722E752D72746C202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D65';
wwv_flow_api.g_varchar2_table(450) := '6E75436F6C207B0A2020626F726465723A206E6F6E653B0A20206D617267696E2D72696768743A20303B0A202070616464696E673A203870782038707820387078203470783B0A7D0A2E612D4D656E754261722D6974656D2E69732D64697361626C6564';
wwv_flow_api.g_varchar2_table(451) := '202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20234130413041303B0A7D0A2E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236534623938313B0A7D0A2E612D4D65';
wwv_flow_api.g_varchar2_table(452) := '6E754261722D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20236534623938313B0A7D0A0A2E612D4D656E752D636F6E74656E74207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E';
wwv_flow_api.g_varchar2_table(453) := '612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20233339333933393B0A7D0A2E612D4D656E752D6974656D536570202E612D4D656E752D68536570617261746F72207B0A2020626F726465722D636F6C6F723A202364666466';
wwv_flow_api.g_varchar2_table(454) := '64663B0A7D0A2E612D4D656E752D2D63757272656E74207B0A20206261636B67726F756E642D636F6C6F723A20236564643061623B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F637573656420';
wwv_flow_api.g_varchar2_table(455) := '7B0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E75';
wwv_flow_api.g_varchar2_table(456) := '2D7375624D656E75436F6C207B0A2020636F6C6F723A20233339333933393B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E';
wwv_flow_api.g_varchar2_table(457) := '752D616363656C207B0A2020636F6C6F723A20233739373937393B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A2020';
wwv_flow_api.g_varchar2_table(458) := '6261636B67726F756E642D636F6C6F723A20236461613135373B0A2020636F6C6F723A20236666666666663B0A7D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D65';
wwv_flow_api.g_varchar2_table(459) := '6E752D737461747573436F6C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D737461747573436F6C2C0A2E612D4D656E75202E612D4D656E752D6974';
wwv_flow_api.g_varchar2_table(460) := '656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F6C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E';
wwv_flow_api.g_varchar2_table(461) := '612D4D656E752D7375624D656E75436F6C2C0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C2C0A2E612D4D656E75202E612D4D656E752D6974';
wwv_flow_api.g_varchar2_table(462) := '656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0A2020636F6C6F723A20236666666666663B0A7D0A2E612D4D656E75202E612D4D656E752D616363656C207B0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(463) := '726762612835372C2035372C2035372C20302E3735293B0A7D0A2E612D4D656E752D636F6E74656E74207B0A20206261636B67726F756E642D636F6C6F723A2072676261283234382C203234382C203234382C20302E3935293B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(464) := '636F6C6F723A20236466646664663B0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C20302E3035293B0A7D0A2E612D4D656E75426172207B0A20206261636B67726F756E642D636F6C6F723A207472616E';
wwv_flow_api.g_varchar2_table(465) := '73706172656E743B0A7D0A2E742D486561646572202E612D4D656E75426172207B0A20206261636B67726F756E642D636F6C6F723A20236461613135373B0A7D0A2E742D526567696F6E207B0A20200A7D0A2E742D526567696F6E202E612D4D656E7542';
wwv_flow_api.g_varchar2_table(466) := '61722D6C6162656C207B0A2020636F6C6F723A20233333333333333B0A20206C696E652D6865696768743A20323070783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C207B';
wwv_flow_api.g_varchar2_table(467) := '0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A202070616464696E673A2038707820303B0A2020766572746963616C2D616C69676E3A20746F703B0A20206D617267696E2D72696768743A203870783B0A20206D617267696E2D6C6566';
wwv_flow_api.g_varchar2_table(468) := '743A202D3470783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D207B0A20206261636B67726F756E643A20236632663266323B0A2020626F726465722D72696768743A2031707820736F6C696420236439643964393B0A202062';
wwv_flow_api.g_varchar2_table(469) := '6F726465722D6C6566743A2031707820736F6C696420236439643964393B0A20206D617267696E2D6C6566743A202D3170783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D3A66697273742D6368696C64207B0A20206D617267';
wwv_flow_api.g_varchar2_table(470) := '696E2D6C6566743A20303B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C2C0A2E742D526567696F6E202E612D4D656E754261722E752D72';
wwv_flow_api.g_varchar2_table(471) := '746C202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C207B0A2020626F726465723A206E6F6E653B0A20206D617267696E2D72696768743A20303B0A202070616464696E67';
wwv_flow_api.g_varchar2_table(472) := '3A203870782038707820387078203470783B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D64697361626C6564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20234130413041303B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(473) := '2D526567696F6E202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236439643964393B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D657870616E646564';
wwv_flow_api.g_varchar2_table(474) := '207B0A20206261636B67726F756E642D636F6C6F723A20236439643964393B0A7D0A2E742D526567696F6E202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D526567696F6E202E612D4D';
wwv_flow_api.g_varchar2_table(475) := '656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20233364336433643B0A7D0A2E742D526567696F6E202E612D4D656E752D6974656D536570202E612D4D656E752D68536570617261746F72207B0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(476) := '3A20236532653265323B0A7D0A2E742D526567696F6E202E612D4D656E752D2D63757272656E74207B0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D69';
wwv_flow_api.g_varchar2_table(477) := '74656D2E69732D64697361626C65642E69732D666F6375736564207B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C';
wwv_flow_api.g_varchar2_table(478) := '65642E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F6C207B0A2020636F6C6F723A20233364336433643B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D697465';
wwv_flow_api.g_varchar2_table(479) := '6D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0A2020636F6C6F723A20233763376337633B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D65';
wwv_flow_api.g_varchar2_table(480) := '6E752D6974656D2E69732D666F63757365642C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(481) := '723A20233333333333333B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D737461747573436F6C2C0A2E742D526567696F6E';
wwv_flow_api.g_varchar2_table(482) := '202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D737461747573436F6C2C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E';
wwv_flow_api.g_varchar2_table(483) := '69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D7375624D656E75436F6C2C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D';
wwv_flow_api.g_varchar2_table(484) := '696E6E6572202E612D4D656E752D7375624D656E75436F6C2C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C2C0A2E';
wwv_flow_api.g_varchar2_table(485) := '742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0A2020636F6C6F723A20233333333333333B0A7D0A2E742D526567';
wwv_flow_api.g_varchar2_table(486) := '696F6E202E612D4D656E75202E612D4D656E752D616363656C207B0A2020636F6C6F723A20726762612836312C2036312C2036312C20302E3735293B0A7D0A2E742D526567696F6E202E612D4D656E752D636F6E74656E74207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(487) := '756E642D636F6C6F723A2072676261283235322C203235322C203235322C20302E3935293B0A2020626F726465722D636F6C6F723A20236532653265323B0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C';
wwv_flow_api.g_varchar2_table(488) := '20302E3035293B0A7D0A0A2E742D486561646572207B0A20200A20200A20200A20200A20200A20200A7D0A2E742D486561646572202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20236666666666663B0A2020766572746963616C';
wwv_flow_api.g_varchar2_table(489) := '2D616C69676E3A20746F703B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D207B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E69732D666F63';
wwv_flow_api.g_varchar2_table(490) := '757365642C0A2E742D486561646572202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236436393634322021696D706F7274616E743B0A7D0A2E742D486561646572202E612D4D656E7542';
wwv_flow_api.g_varchar2_table(491) := '61722D6974656D2E612D4D656E752D2D63757272656E742C0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564207B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(492) := '236436393634322021696D706F7274616E743B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C6162656C2C0A2E742D486561646572202E612D4D656E7542';
wwv_flow_api.g_varchar2_table(493) := '61722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A2020666F6E742D7765696768743A20626F';
wwv_flow_api.g_varchar2_table(494) := '6C643B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564207B';
wwv_flow_api.g_varchar2_table(495) := '0A20206261636B67726F756E642D636F6C6F723A20236436393634322021696D706F7274616E743B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A';
wwv_flow_api.g_varchar2_table(496) := '2020636F6C6F723A2072676261283235352C203235352C203235352C20302E38293B0A2020626F726465722D636F6C6F723A20236564643061623B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D486561646572202E612D4D65';
wwv_flow_api.g_varchar2_table(497) := '6E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0A2E742D486561646572202E612D4D656E754261722D6974656D203E202E612D4D';
wwv_flow_api.g_varchar2_table(498) := '656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236137366532343B0A2020626F726465722D636F6C6F723A20236137366532343B0A2020636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(499) := '663B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A2020636F6C6F723A20236661663365613B0A2020626F';
wwv_flow_api.g_varchar2_table(500) := '726465722D636F6C6F723A20236661663365613B0A7D0A2E742D486561646572202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E61';
wwv_flow_api.g_varchar2_table(501) := '2D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D486561646572202E612D4D656E7542';
wwv_flow_api.g_varchar2_table(502) := '61722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D636F6C6F723A2023666666';
wwv_flow_api.g_varchar2_table(503) := '6666663B0A2020636F6C6F723A20236436393634323B0A7D0A2E742D486561646572202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D77696474683A20303B0A20206261636B67726F756E642D636F6C6F723A20236436393634323B';
wwv_flow_api.g_varchar2_table(504) := '0A7D0A2E742D486561646572202E612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D486561646572202E612D4D656E752D616363656C207B0A2020636F6C6F723A2072676261283235352C';
wwv_flow_api.g_varchar2_table(505) := '203235352C203235352C20302E3735293B0A7D0A2E742D486561646572202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D486561646572202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870';
wwv_flow_api.g_varchar2_table(506) := '616E646564207B0A20206261636B67726F756E642D636F6C6F723A20236461613135372021696D706F7274616E743B0A7D0A2E742D426F6479207B0A20200A20200A20200A20200A20200A20200A7D0A2E742D426F6479202E612D4D656E754261722D6C';
wwv_flow_api.g_varchar2_table(507) := '6162656C207B0A2020636F6C6F723A20233339333933393B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D207B0A2020766572746963616C2D616C69676E3A20746F703B0A7D';
wwv_flow_api.g_varchar2_table(508) := '0A2E742D426F6479202E612D4D656E754261722D6974656D2E69732D666F63757365642C0A2E742D426F6479202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236466646664662021696D';
wwv_flow_api.g_varchar2_table(509) := '706F7274616E743B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742C0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F637573';
wwv_flow_api.g_varchar2_table(510) := '6564207B0A20206261636B67726F756E642D636F6C6F723A20236466646664662021696D706F7274616E743B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C61';
wwv_flow_api.g_varchar2_table(511) := '62656C2C0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20233339333933392021696D706F727461';
wwv_flow_api.g_varchar2_table(512) := '6E743B0A2020666F6E742D7765696768743A20626F6C643B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272';
wwv_flow_api.g_varchar2_table(513) := '656E742E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20236466646664662021696D706F7274616E743B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E';
wwv_flow_api.g_varchar2_table(514) := '75436F6C202E612D49636F6E207B0A2020636F6C6F723A20726762612835372C2035372C2035372C20302E38293B0A2020626F726465722D636F6C6F723A20236666666666663B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D';
wwv_flow_api.g_varchar2_table(515) := '426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0A2E742D426F6479202E612D4D656E754261722D697465';
wwv_flow_api.g_varchar2_table(516) := '6D203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236238623862383B0A2020626F726465722D636F6C6F723A20236238623862383B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(517) := '3A20233030303030303B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A2020636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(518) := '3B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F';
wwv_flow_api.g_varchar2_table(519) := '6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20233339333933393B0A2020626F726465722D636F6C6F723A20233339333933393B0A2020636F6C6F723A20236638663866383B0A7D0A2E742D426F6479202E612D4D656E';
wwv_flow_api.g_varchar2_table(520) := '754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(521) := '66666666663B0A2020636F6C6F723A20236466646664663B0A7D0A2E742D426F6479202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D77696474683A20303B0A20206261636B67726F756E642D636F6C6F723A20236466646664663B';
wwv_flow_api.g_varchar2_table(522) := '0A7D0A2E742D426F6479202E612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20233339333933393B0A7D0A2E742D426F6479202E612D4D656E752D616363656C207B0A2020636F6C6F723A20726762612835372C2035372C20';
wwv_flow_api.g_varchar2_table(523) := '35372C20302E3735293B0A7D0A2E742D426F6479202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D426F6479202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A202062';
wwv_flow_api.g_varchar2_table(524) := '61636B67726F756E642D636F6C6F723A20236562656265622021696D706F7274616E743B0A7D0A2E742D426F6479202E612D4D656E75426172203E20756C207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E742D42';
wwv_flow_api.g_varchar2_table(525) := '6F6479202E612D4D656E754261722D6974656D207B0A2020626F726465722D636F6C6F723A20236466646664663B0A7D0A2E742D426F6479202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0A2020626F782D736861646F773A20';
wwv_flow_api.g_varchar2_table(526) := '6E6F6E653B0A7D0A2E742D526567696F6E207B0A20200A20200A20200A20200A20200A20200A7D0A2E742D526567696F6E202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20233430343034303B0A2020766572746963616C2D616C';
wwv_flow_api.g_varchar2_table(527) := '69676E3A20746F703B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D207B0A2020766572746963616C2D616C69676E3A20746F703B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D666F63757365';
wwv_flow_api.g_varchar2_table(528) := '642C0A2E742D526567696F6E202E612D4D656E754261722D6974656D3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236536653665362021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E754261722D';
wwv_flow_api.g_varchar2_table(529) := '6974656D2E612D4D656E752D2D63757272656E742C0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564207B0A20206261636B67726F756E642D636F6C6F723A20236536';
wwv_flow_api.g_varchar2_table(530) := '653665362021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C6162656C2C0A2E742D526567696F6E202E612D4D656E754261722D';
wwv_flow_api.g_varchar2_table(531) := '6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C207B0A2020636F6C6F723A20233430343034302021696D706F7274616E743B0A2020666F6E742D7765696768743A20626F6C643B';
wwv_flow_api.g_varchar2_table(532) := '0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564207B0A2020';
wwv_flow_api.g_varchar2_table(533) := '6261636B67726F756E642D636F6C6F723A20236536653665362021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A202063';
wwv_flow_api.g_varchar2_table(534) := '6F6C6F723A20726762612836342C2036342C2036342C20302E38293B0A2020626F726465722D636F6C6F723A20236666666666663B0A2020626F726465722D7261646975733A20313030253B0A7D0A2E742D526567696F6E202E612D4D656E754261722D';
wwv_flow_api.g_varchar2_table(535) := '6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0A2E742D526567696F6E202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375';
wwv_flow_api.g_varchar2_table(536) := '624D656E75436F6C3A686F766572202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0A2020626F726465722D636F6C6F723A20236266626662663B0A2020636F6C6F723A20233030303030303B0A7D0A2E';
wwv_flow_api.g_varchar2_table(537) := '742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A2020636F6C6F723A20236666666666663B0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(538) := '6F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E20';
wwv_flow_api.g_varchar2_table(539) := '7B0A20206261636B67726F756E642D636F6C6F723A20233430343034303B0A2020626F726465722D636F6C6F723A20233430343034303B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E202E612D4D656E754261722D697465';
wwv_flow_api.g_varchar2_table(540) := '6D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A20';
wwv_flow_api.g_varchar2_table(541) := '20636F6C6F723A20236536653665363B0A7D0A2E742D526567696F6E202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D77696474683A20303B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E742D';
wwv_flow_api.g_varchar2_table(542) := '526567696F6E202E612D4D656E75202E612D4D656E752D6974656D207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E202E612D4D656E752D616363656C207B0A2020636F6C6F723A20726762612836342C2036342C203634';
wwv_flow_api.g_varchar2_table(543) := '2C20302E3735293B0A7D0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D526567696F6E202E612D4D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20';
wwv_flow_api.g_varchar2_table(544) := '206261636B67726F756E642D636F6C6F723A20236632663266322021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D4D656E75426172203E20756C207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A';
wwv_flow_api.g_varchar2_table(545) := '2E742D526567696F6E202E612D4D656E754261722D6974656D207B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D526567696F6E202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0A2020626F782D';
wwv_flow_api.g_varchar2_table(546) := '736861646F773A206E6F6E653B0A7D0A2E742D4865616465722D757365724D656E75202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D77696474683A20303B0A20206261636B67726F756E642D636F6C6F723A20236436393634323B';
wwv_flow_api.g_varchar2_table(547) := '0A7D0A2E742D4865616465722D757365724D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0A2E742D4865616465722D757365724D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(548) := '726F756E642D636F6C6F723A20236461613135372021696D706F7274616E743B0A7D0A2E742D4865616465722D757365724D656E752E612D4D656E75202E612D4D656E752D6974656D202E612D4D656E752D6C6162656C207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(549) := '6666666666663B0A20202D7765626B69742D666F6E742D736D6F6F7468696E673A20616E7469616C69617365643B0A7D0A0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D636F6E74656E74207B0A2020626F726465722D72';
wwv_flow_api.g_varchar2_table(550) := '61646975733A2030203020327078203270783B0A20206261636B67726F756E642D636F6C6F723A20233133323938323B0A2020626F726465722D77696474683A20303B0A7D0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D';
wwv_flow_api.g_varchar2_table(551) := '6974656D2E69732D666F63757365642C0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D6974656D2E69732D657870616E646564207B0A20206261636B67726F756E642D636F6C6F723A20233139333761662021696D706F72';
wwv_flow_api.g_varchar2_table(552) := '74616E743B0A7D0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D6974656D2E69732D666F6375736564203E202E612D4D656E752D6C6162656C2C0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E75';
wwv_flow_api.g_varchar2_table(553) := '2D6974656D2E69732D657870616E646564203E202E612D4D656E752D6C6162656C207B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A7D0A2E742D4E617669676174696F6E4261722D6D656E75202E612D4D656E752D697465';
wwv_flow_api.g_varchar2_table(554) := '6D202E612D4D656E752D6C6162656C2C0A2E742D4E617669676174696F6E4261722D6D656E752E612D4D656E75202E612D4D656E752D6974656D2061207B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A7D0A0A2E742D506F';
wwv_flow_api.g_varchar2_table(555) := '7075704C4F562D6C696E6B7320613A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233165343163653B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D506F7075704C4F562D726573756C74735365742074723A686F';
wwv_flow_api.g_varchar2_table(556) := '766572207464207B0A20206261636B67726F756E642D636F6C6F723A20234543463246422021696D706F7274616E743B0A7D0A2E742D506F7075704C4F562D726573756C74735365742074723A6E74682D6368696C6428326E29207464207B0A20206261';
wwv_flow_api.g_varchar2_table(557) := '636B67726F756E642D636F6C6F723A20234641464146413B0A7D0A2E742D506F7075704C4F562D726573756C74735365742D6C696E6B2C0A2E75692D7769646765742D636F6E74656E7420612E742D506F7075704C4F562D726573756C74735365742D6C';
wwv_flow_api.g_varchar2_table(558) := '696E6B207B0A2020636F6C6F723A20233165343163653B0A7D0A2E742D506167652D2D706F7075704C4F56207B0A20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D506F7075704C4F562D616374696F6E73207B0A20206261';
wwv_flow_api.g_varchar2_table(559) := '636B67726F756E642D636F6C6F723A20236638663866383B0A7D0A2E742D426F6479202E742D506F7075704C4F562D6C696E6B732061207B0A2020636F6C6F723A20233339333933393B0A7D0A2E742D426F64792D7469746C65202E742D506F7075704C';
wwv_flow_api.g_varchar2_table(560) := '4F562D6C696E6B732061207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E666F202E742D506F7075704C4F562D6C696E6B732061207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D526567696F6E202E74';
wwv_flow_api.g_varchar2_table(561) := '2D506F7075704C4F562D6C696E6B7320612C0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F562D6C696E6B732061207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D506F7075704C4F562D6C696E6B7320613A686F76';
wwv_flow_api.g_varchar2_table(562) := '6572207B0A20206261636B67726F756E642D636F6C6F723A20233363356465333B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E742D506F7075704C4F562D706167696E6174696F6E207B0A2020636F6C6F723A2023373937';
wwv_flow_api.g_varchar2_table(563) := '3937393B0A7D0A2E742D426F64792D7469746C65202E742D506F7075704C4F562D706167696E6174696F6E207B0A2020636F6C6F723A20233765376537653B0A7D0A2E742D426F64792D696E666F202E742D506F7075704C4F562D706167696E6174696F';
wwv_flow_api.g_varchar2_table(564) := '6E207B0A2020636F6C6F723A20233765376537653B0A7D0A2E742D526567696F6E202E742D506F7075704C4F562D706167696E6174696F6E2C0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F562D706167696E6174696F6E207B0A20';
wwv_flow_api.g_varchar2_table(565) := '20636F6C6F723A20233830383038303B0A7D0A0A2E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E6669656C64646174612062207B0A2020636F6C6F723A202333393339';
wwv_flow_api.g_varchar2_table(566) := '33393B0A7D0A2E742D426F64792D7469746C65202E6669656C64646174612062207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E666F202E6669656C64646174612062207B0A2020636F6C6F723A20233365336533653B';
wwv_flow_api.g_varchar2_table(567) := '0A7D0A2E742D526567696F6E202E6669656C646461746120622C0A2E742D427574746F6E526567696F6E202E6669656C64646174612062207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E2D686561646572207B0A202062';
wwv_flow_api.g_varchar2_table(568) := '61636B67726F756E642D636F6C6F723A20236663666366633B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236532653265323B0A7D0A2E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E74';
wwv_flow_api.g_varchar2_table(569) := '2D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20233364336433643B0A7D0A2E742D426F64792D616374696F6E73202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(570) := '3A207472616E73706172656E743B0A7D0A2E742D526567696F6E2D2D737461636B6564207B0A2020626F726465722D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D526567696F6E2D2D737461636B6564203E202E742D526567696F';
wwv_flow_api.g_varchar2_table(571) := '6E2D686561646572207B0A2020626F726465722D7261646975733A20302021696D706F7274616E743B0A7D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(572) := '6C6F723A20236666666666663B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236536653665363B0A7D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E';
wwv_flow_api.g_varchar2_table(573) := '2D7469746C652C0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E2D2D61636365';
wwv_flow_api.g_varchar2_table(574) := '6E7431203E202E742D526567696F6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(575) := '723A20236666326435353B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236666363037653B0A7D0A2E742D526567696F6E2D2D616363656E7431203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469';
wwv_flow_api.g_varchar2_table(576) := '746C652C0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7431203E20';
wwv_flow_api.g_varchar2_table(577) := '2E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E';
wwv_flow_api.g_varchar2_table(578) := '2D2D6E6F5549207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74322E742D526567696F6E2D2D6E6F42';
wwv_flow_api.g_varchar2_table(579) := '6F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20233030376166663B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420233333393566663B0A7D0A2E742D526567';
wwv_flow_api.g_varchar2_table(580) := '696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E74322E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D68';
wwv_flow_api.g_varchar2_table(581) := '6561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74322E742D52';
wwv_flow_api.g_varchar2_table(582) := '6567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567';
wwv_flow_api.g_varchar2_table(583) := '696F6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74332E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20236666393530303B0A';
wwv_flow_api.g_varchar2_table(584) := '2020626F726465722D626F74746F6D3A2031707820736F6C696420236666616133333B0A7D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D52656769';
wwv_flow_api.g_varchar2_table(585) := '6F6E2D2D616363656E74332E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D6865';
wwv_flow_api.g_varchar2_table(586) := '61646572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74332E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A202063';
wwv_flow_api.g_varchar2_table(587) := '6F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D6865616465722C0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E2D2D6E6F426F72646572203E202E742D52';
wwv_flow_api.g_varchar2_table(588) := '6567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420233261633834353B0A7D0A2E742D526567696F6E2D2D616363656E7434';
wwv_flow_api.g_varchar2_table(589) := '203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567';
wwv_flow_api.g_varchar2_table(590) := '696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E2D2D6E6F426F72';
wwv_flow_api.g_varchar2_table(591) := '646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D6865616465722C0A';
wwv_flow_api.g_varchar2_table(592) := '2E742D526567696F6E2D2D616363656E74352E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A2020626F726465722D626F74';
wwv_flow_api.g_varchar2_table(593) := '746F6D3A2031707820736F6C696420236138613861633B0A7D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E74352E';
wwv_flow_api.g_varchar2_table(594) := '742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D526567696F6E2D7469746C652C0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D42757474';
wwv_flow_api.g_varchar2_table(595) := '6F6E2D2D6E6F55492C0A2E742D526567696F6E2D2D616363656E74352E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F5549207B0A2020636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(596) := '663B0A7D0A2E742D526567696F6E2D686561646572207B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20302021696D706F7274616E743B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20302021';
wwv_flow_api.g_varchar2_table(597) := '696D706F7274616E743B0A7D0A2E742D526567696F6E2068322E742D526567696F6E2D7469746C65207B0A2020636F6C6F723A20233364336433643B0A7D0A2E742D526567696F6E2D626F6479207B0A2020636F6C6F723A20233430343034303B0A7D0A';
wwv_flow_api.g_varchar2_table(598) := '2E742D526567696F6E2D2D6869646553686F772E69732D636F6C6C6170736564207B0A2020626F726465722D626F74746F6D2D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D526567696F6E2D2D7363726F6C6C426F6479203E202E742D';
wwv_flow_api.g_varchar2_table(599) := '526567696F6E2D626F647957726170203E202E742D526567696F6E2D626F6479207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E742823666666666666203330252C2072676261283235352C203235352C203235352C203029';
wwv_flow_api.g_varchar2_table(600) := '292C206C696E6561722D6772616469656E742872676261283235352C203235352C203235352C2030292C20236666666666662037302529203020313030252C206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E30323529';
wwv_flow_api.g_varchar2_table(601) := '2C207267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E3032352929203020313030253B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(602) := '6C6F723A20236666666666663B0A7D0A2E742D426F64792D616374696F6E73202E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F64792D616374696F6E73202E742D5265';
wwv_flow_api.g_varchar2_table(603) := '67696F6E2D686561646572207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D426F64792D73696465202E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E7370';
wwv_flow_api.g_varchar2_table(604) := '6172656E743B0A7D0A2E742D526567696F6E2C0A2E742D526567696F6E2D686561646572207B0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D526567696F6E2D2D6E6F4247207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(605) := '207472616E73706172656E743B0A7D0A2E742D426F64792D616374696F6E73202E742D526567696F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E';
wwv_flow_api.g_varchar2_table(606) := '617065782D7264732D627574746F6E207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A207267626128302C';
wwv_flow_api.g_varchar2_table(607) := '20302C20302C20302E3235293B0A2020636F6C6F723A20234646463B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D627574746F6E3A686F766572207B0A20206261636B67726F756E642D636F6C6F723A2072676261';
wwv_flow_api.g_varchar2_table(608) := '28302C20302C20302C20302E35293B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D627574746F6E3A6163746976652C0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D627574746F6E3A';
wwv_flow_api.g_varchar2_table(609) := '6163746976653A666F637573207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3735293B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D6E6578742D726567696F6E20';
wwv_flow_api.g_varchar2_table(610) := '7B0A2020626F726465722D7261646975733A2032707820302030203270783B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E617065782D7264732D70726576696F75732D726567696F6E207B0A2020626F726465722D7261646975733A2030';
wwv_flow_api.g_varchar2_table(611) := '203270782032707820303B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974656D2E617065782D7264732D73656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B';
wwv_flow_api.g_varchar2_table(612) := '207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3435293B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974656D2E617065782D726473';
wwv_flow_api.g_varchar2_table(613) := '2D73656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B3A666F637573207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A7D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F';
wwv_flow_api.g_varchar2_table(614) := '6E2D6361726F7573656C4C696E6B207B0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135293B0A2020626F726465722D7261646975733A20313030253B0A7D0A0A2E742D5265706F72742D63656C6C2C0A';
wwv_flow_api.g_varchar2_table(615) := '2E742D5265706F72742D636F6C48656164207B0A2020626F726465722D6C6566743A2031707820736F6C696420236536653665363B0A2020626F726465722D746F703A2031707820736F6C696420236536653665363B0A7D0A2E742D5265706F72742D72';
wwv_flow_api.g_varchar2_table(616) := '65706F7274207472202E742D5265706F72742D63656C6C3A6C6173742D6368696C642C0A2E742D5265706F72742D7265706F7274207472202E742D5265706F72742D636F6C486561643A6C6173742D6368696C64207B0A2020626F726465722D72696768';
wwv_flow_api.g_varchar2_table(617) := '743A2031707820736F6C696420236536653665363B0A7D0A2E742D5265706F72742D7265706F72742074723A6C6173742D6368696C64202E742D5265706F72742D63656C6C207B0A2020626F726465722D626F74746F6D3A2031707820736F6C69642023';
wwv_flow_api.g_varchar2_table(618) := '6536653665363B0A7D0A2E742D5265706F7274202E69732D737475636B202E742D5265706F72742D636F6C48656164207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A2020626F726465722D626F74746F6D3A2031707820';
wwv_flow_api.g_varchar2_table(619) := '736F6C696420236536653665363B0A7D0A2E742D5265706F72742D2D726F77486967686C69676874202E742D5265706F72742D7265706F72742074723A686F766572202E742D5265706F72742D63656C6C2C0A2E742D5265706F72742D2D726F77486967';
wwv_flow_api.g_varchar2_table(620) := '686C69676874202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F6464293A686F766572202E742D5265706F72742D63656C6C207B0A20206261636B67726F756E642D636F6C6F723A20236661666166612021696D706F7274';
wwv_flow_api.g_varchar2_table(621) := '616E743B0A7D0A2E742D5265706F72742D2D737461746963526F77436F6C6F7273202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F646429202E742D5265706F72742D63656C6C207B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(622) := '6F6C6F723A207472616E73706172656E743B0A7D0A0A2E742D5265706F72742D2D616C74526F777344656661756C74202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F646429202E742D5265706F72742D63656C6C207B0A';
wwv_flow_api.g_varchar2_table(623) := '20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D536F6369616C466F6F746572207B0A202070616464696E672D746F703A20343870783B0A202070616464696E672D626F74746F6D3A20323470783B0A7D0A2E742D53';
wwv_flow_api.g_varchar2_table(624) := '6F6369616C466F6F746572202E726F77207B0A202070616464696E672D746F703A203870783B0A7D0A2E742D536F6369616C466F6F746572202E636F6C207B0A202070616464696E672D626F74746F6D3A203870783B0A2020746578742D616C69676E3A';
wwv_flow_api.g_varchar2_table(625) := '2063656E7465723B0A20207472616E736974696F6E3A20616C6C202E32733B0A7D0A2E742D536F6369616C466F6F746572202E636F6C3A686F766572207B0A20202D7765626B69742D7472616E73666F726D3A207472616E736C61746559282D38707829';
wwv_flow_api.g_varchar2_table(626) := '3B0A20202D6D6F7A2D7472616E73666F726D3A207472616E736C61746559282D387078293B0A20202D6D732D7472616E73666F726D3A207472616E736C61746559282D387078293B0A20202D6F2D7472616E73666F726D3A207472616E736C6174655928';
wwv_flow_api.g_varchar2_table(627) := '2D387078293B0A20207472616E73666F726D3A207472616E736C61746559282D387078293B0A2020626F782D736861646F773A203070782038707820347078202D347078207267626128302C20302C20302C20302E3035293B0A7D0A2E742D536F636961';
wwv_flow_api.g_varchar2_table(628) := '6C466F6F7465722061207B0A20207472616E736974696F6E3A20616C6C202E32733B0A2020646973706C61793A20626C6F636B3B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A2020746578742D616C69676E3A2063656E7465723B0A';
wwv_flow_api.g_varchar2_table(629) := '2020636F6C6F723A20726762612835372C2035372C2035372C20302E38293B0A7D0A2E742D536F6369616C466F6F7465722061202E742D49636F6E207B0A2020646973706C61793A20626C6F636B3B0A20206D617267696E3A2030206175746F3B0A2020';
wwv_flow_api.g_varchar2_table(630) := '636F6C6F723A20726762612835372C2035372C2035372C20302E34293B0A7D0A2E742D536F6369616C466F6F7465722061202E6661207B0A2020666F6E742D73697A653A20323870783B0A202077696474683A20333270783B0A20206865696768743A20';
wwv_flow_api.g_varchar2_table(631) := '333270783B0A20206C696E652D6865696768743A20333270783B0A2020746578742D616C69676E3A2063656E7465723B0A7D0A2E742D536F6369616C466F6F7465722061202E612D49636F6E207B0A202077696474683A20333270783B0A202068656967';
wwv_flow_api.g_varchar2_table(632) := '68743A20333270783B0A20206C696E652D6865696768743A20333270783B0A7D0A2E742D536F6369616C466F6F7465722061202E612D49636F6E3A6265666F7265207B0A2020666F6E742D73697A653A20333270783B0A7D0A2E742D536F6369616C466F';
wwv_flow_api.g_varchar2_table(633) := '6F74657220613A686F7665722C0A2E742D536F6369616C466F6F74657220613A686F766572202E742D49636F6E207B0A2020636F6C6F723A20233165343163653B0A7D0A2E742D536561726368526573756C74732D64657363207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(634) := '20233339333933393B0A7D0A2E742D536561726368526573756C74732D64617465207B0A2020636F6C6F723A20233663366336633B0A7D0A2E742D536561726368526573756C74732D6D697363207B0A2020636F6C6F723A20233663366336633B0A7D0A';
wwv_flow_api.g_varchar2_table(635) := '2E742D526567696F6E202E742D536561726368526573756C74732D64657363207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E202E742D536561726368526573756C74732D64617465207B0A2020636F6C6F723A20233733';
wwv_flow_api.g_varchar2_table(636) := '373337333B0A7D0A2E742D526567696F6E202E742D536561726368526573756C74732D6D697363207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D5374617475734C6973742D626C6F636B486561646572207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(637) := '3430343034303B0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0A7D0A2E742D5374617475734C6973742D68656164657254657874416C742C0A2E742D5374617475734C6973742D617474722C0A2E742D5374617475734C6973';
wwv_flow_api.g_varchar2_table(638) := '742D7465787444657363207B0A2020636F6C6F723A20233733373337333B0A7D0A2E742D5374617475734C6973742D6974656D5469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D5374617475734C6973742D2D646174657320';
wwv_flow_api.g_varchar2_table(639) := '2E742D5374617475734C6973742D6D61726B6572207B0A2020636F6C6F723A20233730373037303B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D537461747573';
wwv_flow_api.g_varchar2_table(640) := '4C6973742D2D6461746573202E742D5374617475734C6973742D6D61726B65723A6166746572207B0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0A2020626F726465722D7261646975733A2032707820327078203020303B0A';
wwv_flow_api.g_varchar2_table(641) := '7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6D61726B6572207B0A2020626F726465722D7261646975733A20323470783B0A20206261636B67726F756E642D636F6C6F723A20236666663B0A202063';
wwv_flow_api.g_varchar2_table(642) := '6F6C6F723A20233430343034303B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D636F6D706C657465202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B';
wwv_flow_api.g_varchar2_table(643) := '67726F756E642D636F6C6F723A20233730373037303B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D64616E676572202E742D5374617475734C6973742D6D61726B65722C0A2E';
wwv_flow_api.g_varchar2_table(644) := '742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6572726F72202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A2023666633623330';
wwv_flow_api.g_varchar2_table(645) := '3B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6F70656E202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20233463';
wwv_flow_api.g_varchar2_table(646) := '643936343B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D7761726E696E67202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(647) := '6F723A20236666636330303B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(648) := '2D636F6C6F723A20234630463046303B0A7D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(649) := '20234130413041303B0A7D0A0A2E742D546162732D2D73696D706C65202E742D546162732D6974656D2E69732D616374697665202E742D546162732D6C696E6B2C0A2E617065782D726473202E617065782D7264732D73656C65637465642061207B0A20';
wwv_flow_api.g_varchar2_table(650) := '20626F782D736861646F773A2030202D3270782030202337363864656220696E7365743B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A666F6375732C0A2E617065782D72647320613A666F637573207B0A2020626F78';
wwv_flow_api.g_varchar2_table(651) := '2D736861646F773A20302030203020327078202337363864656220696E7365743B0A7D0A2E742D546162732D2D70696C6C207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428236638663866382C2023663466346634293B';
wwv_flow_api.g_varchar2_table(652) := '0A2020626F726465722D7261646975733A203270783B0A7D0A2E742D426F6479202E742D546162732D2D70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233739373937393B0A7D0A2E742D426F64792D7469746C65202E742D546162732D2D';
wwv_flow_api.g_varchar2_table(653) := '70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233765376537653B0A7D0A2E742D426F64792D696E666F202E742D546162732D2D70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233765376537653B0A7D0A2E742D526567696F';
wwv_flow_api.g_varchar2_table(654) := '6E202E742D546162732D2D70696C6C202E742D49636F6E2C0A2E742D427574746F6E526567696F6E202E742D546162732D2D70696C6C202E742D49636F6E207B0A2020636F6C6F723A20233830383038303B0A7D0A2E742D426F6479202E742D54616273';
wwv_flow_api.g_varchar2_table(655) := '2D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A20233339333933393B0A7D0A2E742D426F64792D7469746C65202E742D546162732D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A20233365336533';
wwv_flow_api.g_varchar2_table(656) := '653B0A7D0A2E742D426F64792D696E666F202E742D546162732D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D526567696F6E202E742D546162732D2D70696C6C202E742D546162732D6C';
wwv_flow_api.g_varchar2_table(657) := '696E6B2C0A2E742D427574746F6E526567696F6E202E742D546162732D2D70696C6C202E742D546162732D6C696E6B207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A686F76';
wwv_flow_api.g_varchar2_table(658) := '6572207B0A20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A666F637573207B0A2020626F726465722D636F6C6F723A20233436393646433B0A7D0A2E742D5461';
wwv_flow_api.g_varchar2_table(659) := '62732D2D70696C6C202E742D546162732D6C696E6B3A616374697665207B0A20206261636B67726F756E642D636F6C6F723A20234630463046303B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D3A66697273742D6368696C64';
wwv_flow_api.g_varchar2_table(660) := '202E742D546162732D6C696E6B207B0A2020626F726465722D7261646975733A2032707820302030203270783B0A7D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D2E69732D616374697665202E742D546162732D6C696E6B207B0A';
wwv_flow_api.g_varchar2_table(661) := '20206261636B67726F756E642D636F6C6F723A20234646463B0A7D0A2E742D546162732D2D73696D706C65202E742D49636F6E207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C69';
wwv_flow_api.g_varchar2_table(662) := '6E6B2C0A2E617065782D7264732061207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A686F7665722C0A2E617065782D72647320613A686F766572207B0A20206261636B';
wwv_flow_api.g_varchar2_table(663) := '67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0A7D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A6163746976652C0A2E617065782D72647320613A616374697665207B0A20206261';
wwv_flow_api.g_varchar2_table(664) := '636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135293B0A7D0A2E742D426F6479202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B2C0A2E742D426F6479202E617065782D7264732061207B0A20';
wwv_flow_api.g_varchar2_table(665) := '20636F6C6F723A20233339333933393B0A7D0A2E742D426F64792D7469746C65202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B2C0A2E742D426F64792D7469746C65202E617065782D72647320612C0A2E742D426F64792D696E';
wwv_flow_api.g_varchar2_table(666) := '666F202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B2C0A2E742D426F64792D696E666F202E617065782D7264732061207B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D526567696F6E202E742D546162732D2D73';
wwv_flow_api.g_varchar2_table(667) := '696D706C65202E742D546162732D6C696E6B2C0A2E742D526567696F6E202E617065782D7264732061207B0A2020636F6C6F723A20233430343034303B0A7D0A2E617065782D7264732D686F7665722E6C6566742061207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(668) := '643A202D7765626B69742D6C696E6561722D6772616469656E74286C6566742C2023666366636665203530252C2072676261283235352C203235352C203235352C2030292031303025293B0A20200A20206261636B67726F756E643A206C696E6561722D';
wwv_flow_api.g_varchar2_table(669) := '6772616469656E7428746F2072696768742C2023666366636665203530252C2072676261283235352C203235352C203235352C2030292031303025293B0A20200A7D0A2E617065782D7264732D686F7665722E72696768742061207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(670) := '726F756E643A202D7765626B69742D6C696E6561722D6772616469656E74286C6566742C20236663666366652030252C2072676261283235352C203235352C203235352C2030292031252C202366636663666520353025293B0A20200A20206261636B67';
wwv_flow_api.g_varchar2_table(671) := '726F756E643A206C696E6561722D6772616469656E7428746F2072696768742C20236663666366652030252C2072676261283235352C203235352C203235352C2030292031252C202366636663666520353025293B0A20200A7D0A0A2E612D546167436C';
wwv_flow_api.g_varchar2_table(672) := '6F75642D6C696E6B207B0A2020626F726465722D636F6C6F723A20236632663266323B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E643A20236661666166613B0A20207472616E736974696F6E3A206261636B67';
wwv_flow_api.g_varchar2_table(673) := '726F756E642D636F6C6F7220302E32732C20626F726465722D636F6C6F7220302E32732C20626F782D736861646F7720302E32732C20636F6C6F7220302E32733B0A2020636F6C6F723A20233164336663393B0A7D0A2E612D546167436C6F75642D6C69';
wwv_flow_api.g_varchar2_table(674) := '6E6B207370616E207B0A20207472616E736974696F6E3A20636F6C6F72202E32733B0A7D0A2E612D546167436C6F75642D6C696E6B3A686F766572207B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(675) := '636F6C6F723A20233230343564623B0A2020626F726465722D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A2020626F782D736861646F773A20302030203020327078202332303435646220696E7365743B0A7D0A';
wwv_flow_api.g_varchar2_table(676) := '2E612D546167436C6F75642D6C696E6B3A686F766572207370616E207B0A2020636F6C6F723A20236666666666663B0A7D0A2E612D546167436C6F75642D636F756E74207B0A2020636F6C6F723A20233636363636363B0A2020666F6E742D7765696768';
wwv_flow_api.g_varchar2_table(677) := '743A203230303B0A7D0A2E742D50616765426F64792D2D6C6566744E6176202E742D426F64792D6E6176207B0A20206261636B67726F756E642D636F6C6F723A20236466616436633B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F';
wwv_flow_api.g_varchar2_table(678) := '64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D666F6375736564207B0A2020626F782D736861646F773A20302030203020317078202365386538653820696E7365743B0A7D0A2E742D526567696F6E202E612D54726565';
wwv_flow_api.g_varchar2_table(679) := '566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F77';
wwv_flow_api.g_varchar2_table(680) := '2E69732D73656C65637465642C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0A202062';
wwv_flow_api.g_varchar2_table(681) := '61636B67726F756E642D636F6C6F723A20236637663766373B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0A2E74';
wwv_flow_api.g_varchar2_table(682) := '2D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F70';
wwv_flow_api.g_varchar2_table(683) := '4C6576656C20756C207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F';
wwv_flow_api.g_varchar2_table(684) := '766572207B0A20206261636B67726F756E642D636F6C6F723A20236630663066302021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F77';
wwv_flow_api.g_varchar2_table(685) := '2E69732D686F766572202B202E612D54726565566965772D746F67676C652C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F6767';
wwv_flow_api.g_varchar2_table(686) := '6C65207B0A2020636F6C6F723A20726762612836342C2036342C2036342C20302E3735293B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F7665';
wwv_flow_api.g_varchar2_table(687) := '72202B202E612D54726565566965772D746F67676C653A686F7665722C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65';
wwv_flow_api.g_varchar2_table(688) := '3A686F766572207B0A2020636F6C6F723A20233430343034302021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D';
wwv_flow_api.g_varchar2_table(689) := '686F766572207B0A2020636F6C6F723A20233430343034302021696D706F7274616E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74207B0A2020';
wwv_flow_api.g_varchar2_table(690) := '636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66612C0A2E742D526567696F6E202E612D54726565566965';
wwv_flow_api.g_varchar2_table(691) := '772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0A2020636F6C6F723A20726762612836342C2036342C2036342C20302E3935293B0A7D0A2E742D526567696F6E202E612D5472656556';
wwv_flow_api.g_varchar2_table(692) := '6965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E66612C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965';
wwv_flow_api.g_varchar2_table(693) := '772D636F6E74656E742E69732D63757272656E742D2D746F70202E66612C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E612D';
wwv_flow_api.g_varchar2_table(694) := '49636F6E2C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D49636F6E207B0A2020636F6C6F723A202334';
wwv_flow_api.g_varchar2_table(695) := '30343034303B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D6C6162656C207B0A2020636F6C6F723A20696E68657269743B0A7D0A2E742D526567696F6E202E612D54';
wwv_flow_api.g_varchar2_table(696) := '726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472656556';
wwv_flow_api.g_varchar2_table(697) := '6965772D636F6E74656E742E69732D73656C65637465642C0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0A';
wwv_flow_api.g_varchar2_table(698) := '2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C65207B0A2020636F6C6F723A20726762612836342C2036342C20';
wwv_flow_api.g_varchar2_table(699) := '36342C20302E3735293B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C653A686F766572207B0A2020636F6C6F723A20233430343034302021696D706F72';
wwv_flow_api.g_varchar2_table(700) := '74616E743B0A7D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F77207B0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E31733B0A';
wwv_flow_api.g_varchar2_table(701) := '7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D666F6375736564207B0A2020626F782D736861646F773A203020302030203170782023326635326531';
wwv_flow_api.g_varchar2_table(702) := '20696E7365743B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742C0A2E742D547265654E6176202E612D54726565566965772D6E';
wwv_flow_api.g_varchar2_table(703) := '6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D';
wwv_flow_api.g_varchar2_table(704) := '63757272656E742D2D746F702E69732D73656C6563746564207B0A20206261636B67726F756E642D636F6C6F723A20233166343264323B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54';
wwv_flow_api.g_varchar2_table(705) := '726565566965772D726F772E69732D63757272656E742D2D746F702C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772C';
wwv_flow_api.g_varchar2_table(706) := '0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0A20206261636B67726F756E642D636F6C6F723A20233164336563353B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F';
wwv_flow_api.g_varchar2_table(707) := '64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233231343764662021696D706F7274616E743B0A7D0A2E742D547265654E6176202E612D54726565';
wwv_flow_api.g_varchar2_table(708) := '566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C652C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C';
wwv_flow_api.g_varchar2_table(709) := '6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65207B0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3735293B0A7D0A2E742D547265654E6176202E612D54726565566965';
wwv_flow_api.g_varchar2_table(710) := '772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C653A686F7665722C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D74';
wwv_flow_api.g_varchar2_table(711) := '6F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C653A686F766572207B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A7D0A2E742D547265654E6176202E612D5472656556';
wwv_flow_api.g_varchar2_table(712) := '6965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572207B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A7D0A2E742D547265654E6176202E612D5472656556';
wwv_flow_api.g_varchar2_table(713) := '6965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E';
wwv_flow_api.g_varchar2_table(714) := '612D54726565566965772D636F6E74656E74202E66612C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(715) := '20233030303030303B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E66612C0A2E742D547265654E6176202E612D5472';
wwv_flow_api.g_varchar2_table(716) := '6565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E66612C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C';
wwv_flow_api.g_varchar2_table(717) := '202E612D54726565566965772D636F6E74656E742E69732D686F766572202E612D49636F6E2C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D';
wwv_flow_api.g_varchar2_table(718) := '63757272656E742D2D746F70202E612D49636F6E207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D6C6162656C207B';
wwv_flow_api.g_varchar2_table(719) := '0A2020636F6C6F723A20696E68657269743B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742C0A2E742D547265654E61';
wwv_flow_api.g_varchar2_table(720) := '76202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D73656C65637465642C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20';
wwv_flow_api.g_varchar2_table(721) := '2E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54';
wwv_flow_api.g_varchar2_table(722) := '726565566965772D746F67676C65207B0A2020636F6C6F723A207267626128302C20302C20302C20302E3735293B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D74';
wwv_flow_api.g_varchar2_table(723) := '6F67676C653A686F766572207B0A2020636F6C6F723A20233030303030302021696D706F7274616E743B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F77207B';
wwv_flow_api.g_varchar2_table(724) := '0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E31733B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565';
wwv_flow_api.g_varchar2_table(725) := '566965772D636F6E74656E74202E66612C0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B';
wwv_flow_api.g_varchar2_table(726) := '0A2020636F6C6F723A20236666666666663B0A7D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74207B0A2020636F';
wwv_flow_api.g_varchar2_table(727) := '6C6F723A20236666666666663B0A7D0A0A2E742D4469616C6F672D2D77697A617264207B0A2020626F726465723A20236536653665363B0A7D0A2E742D57697A617264207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A20';
wwv_flow_api.g_varchar2_table(728) := '20626F726465722D7261646975733A203270783B0A7D0A2E742D57697A617264202E742D57697A6172642D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E742D57697A6172642D2D6D6F64616C207B0A2020626163';
wwv_flow_api.g_varchar2_table(729) := '6B67726F756E643A20236666666666663B0A7D0A626F6479202E742D57697A6172642D2D6D6F64616C202E742D57697A6172642D626F6479207B0A20206261636B67726F756E643A206C696E6561722D6772616469656E74282366666666666620343025';
wwv_flow_api.g_varchar2_table(730) := '2C2072676261283235352C203235352C203235352C203029292C206C696E6561722D6772616469656E742872676261283235352C203235352C203235352C2030292C20236666666666662036302529203020313030252C206C696E6561722D6772616469';
wwv_flow_api.g_varchar2_table(731) := '656E74287267626128302C20302C20302C20302E303235292C207267626128302C20302C20302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E3032352929';
wwv_flow_api.g_varchar2_table(732) := '203020313030253B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A626F6479202E742D57697A6172642D2D6D6F64616C202E742D526567696F6E207B0A20206261636B67726F756E643A20236666666666663B0A7D0A2E';
wwv_flow_api.g_varchar2_table(733) := '742D57697A617264207B0A2020626F726465722D636F6C6F723A20236536653665363B0A7D0A2E742D57697A617264202E742D57697A6172642D686561646572207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A2020626F';
wwv_flow_api.g_varchar2_table(734) := '726465722D636F6C6F723A20236564656465643B0A7D0A2E742D57697A61726453746570732D777261703A6166746572207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E742D57697A61726453746570732D737465';
wwv_flow_api.g_varchar2_table(735) := '70202E742D57697A61726453746570732D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20236363636363633B0A7D0A2E742D57697A61726453746570732D737465702E69732D636F6D706C657465202E742D57697A6172645374';
wwv_flow_api.g_varchar2_table(736) := '6570732D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A2020636F6C6F723A20234646463B0A7D0A2E742D57697A61726453746570732D737465702E69732D616374697665202E742D57697A6172645374';
wwv_flow_api.g_varchar2_table(737) := '6570732D6D61726B6572207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A7D0A2E742D57697A61726453746570732D6C6162656C207B0A2020636F6C6F723A20233636363636363B0A7D0A2E742D57697A61726453746570';
wwv_flow_api.g_varchar2_table(738) := '732D737465702E69732D616374697665202E742D57697A61726453746570732D6C6162656C207B0A2020636F6C6F723A20233430343034303B0A7D0A0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65626172207B0A20';
wwv_flow_api.g_varchar2_table(739) := '20626F726465722D626F74746F6D2D72696768742D7261646975733A20303B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20303B0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0A7D0A626F647920';
wwv_flow_api.g_varchar2_table(740) := '2E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0A2020636F6C6F723A20233339333933393B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261722D636C6F7365207B0A2020626F7264';
wwv_flow_api.g_varchar2_table(741) := '65722D7261646975733A20313030253B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D627574746F6E70616E65207B0A2020626F726465722D746F702D636F6C6F723A20234630463046303B0A7D0A0A626F6479202E75692D';
wwv_flow_api.g_varchar2_table(742) := '7769646765742D636F6E74656E74207B0A2020626F726465722D636F6C6F723A20236562656265623B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E75692D';
wwv_flow_api.g_varchar2_table(743) := '7769646765742D636F6E74656E742061207B0A2020636F6C6F723A20233165343163653B0A7D0A626F6479202E75692D7769646765742D686561646572207B0A2020626F726465722D636F6C6F723A20236562656265623B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(744) := '642D636F6C6F723A20236663666366633B0A2020636F6C6F723A20233364336433643B0A7D0A626F6479202E75692D7769646765742D6865616465722061207B0A2020636F6C6F723A20233364336433643B0A7D0A0A626F6479202E75692D7374617465';
wwv_flow_api.g_varchar2_table(745) := '2D64656661756C742C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D64656661756C742C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D64656661756C74207B0A20206261';
wwv_flow_api.g_varchar2_table(746) := '636B67726F756E642D636F6C6F723A20236638663866383B0A2020636F6C6F723A20233338333833383B0A7D0A626F6479202E75692D73746174652D64656661756C7420612C0A626F6479202E75692D73746174652D64656661756C7420613A6C696E6B';
wwv_flow_api.g_varchar2_table(747) := '2C0A626F6479202E75692D73746174652D64656661756C7420613A766973697465642C0A626F6479202E75692D73746174652D61637469766520612C0A626F6479202E75692D73746174652D61637469766520613A6C696E6B2C0A626F6479202E75692D';
wwv_flow_api.g_varchar2_table(748) := '73746174652D61637469766520613A76697369746564207B0A2020636F6C6F723A20233165343163653B0A7D0A626F6479202E75692D73746174652D686F7665722C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D7374617465';
wwv_flow_api.g_varchar2_table(749) := '2D686F7665722C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233338333833383B0A7D0A626F';
wwv_flow_api.g_varchar2_table(750) := '6479202E75692D73746174652D666F6375732C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D666F6375732C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D666F63757320';
wwv_flow_api.g_varchar2_table(751) := '7B0A2020626F782D736861646F773A20302030203020317078202332303435646220696E7365742C20302030203170782032707820726762612833322C2036392C203231392C20302E3235292021696D706F7274616E743B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(752) := '642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233338333833383B0A7D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D627574746F6E70616E6520627574746F6E3A666F637573207B0A20';
wwv_flow_api.g_varchar2_table(753) := '206F75746C696E653A206E6F6E653B0A2020626F782D736861646F773A20302030203020317078202332303435646220696E7365742C20302030203170782032707820726762612833322C2036392C203231392C20302E3235292021696D706F7274616E';
wwv_flow_api.g_varchar2_table(754) := '743B0A7D0A626F6479202E75692D73746174652D686F76657220612C0A626F6479202E75692D73746174652D686F76657220613A686F7665722C0A626F6479202E75692D73746174652D686F76657220613A6C696E6B2C0A626F6479202E75692D737461';
wwv_flow_api.g_varchar2_table(755) := '74652D686F76657220613A766973697465642C0A626F6479202E75692D73746174652D666F63757320612C0A626F6479202E75692D73746174652D666F63757320613A686F7665722C0A626F6479202E75692D73746174652D666F63757320613A6C696E';
wwv_flow_api.g_varchar2_table(756) := '6B2C0A626F6479202E75692D73746174652D666F63757320613A76697369746564207B0A2020636F6C6F723A20233165343163653B0A7D0A626F6479202E75692D73746174652D6163746976652C0A626F6479202E75692D7769646765742D636F6E7465';
wwv_flow_api.g_varchar2_table(757) := '6E74202E75692D73746174652D6163746976652C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D616374697665207B0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(758) := '20233338333833383B0A7D0A0A626F6479202E75692D73746174652D686967686C696768742C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D686967686C696768742C0A626F6479202E75692D7769646765742D';
wwv_flow_api.g_varchar2_table(759) := '686561646572202E75692D73746174652D686967686C69676874207B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E75692D73746174652D686967686C6967';
wwv_flow_api.g_varchar2_table(760) := '687420612C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D686967686C6967687420612C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686967686C696768742061207B0A';
wwv_flow_api.g_varchar2_table(761) := '2020636F6C6F723A20233430343034303B0A7D0A626F6479202E75692D73746174652D6572726F722C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722C0A626F6479202E75692D7769646765742D68';
wwv_flow_api.g_varchar2_table(762) := '6561646572202E75692D73746174652D6572726F72207B0A20206261636B67726F756E642D636F6C6F723A20236539306330303B0A2020636F6C6F723A20236666656165393B0A7D0A626F6479202E75692D73746174652D6572726F7220612C0A626F64';
wwv_flow_api.g_varchar2_table(763) := '79202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F7220612C0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D6572726F722061207B0A2020636F6C6F723A20236666656165393B';
wwv_flow_api.g_varchar2_table(764) := '0A7D0A626F6479202E75692D73746174652D6572726F722D746578742C0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722D746578742C0A626F6479202E75692D7769646765742D686561646572202E';
wwv_flow_api.g_varchar2_table(765) := '75692D73746174652D6572726F722D74657874207B0A2020636F6C6F723A20236539306330303B0A7D0A0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742C0A626F6479202E75692D6461';
wwv_flow_api.g_varchar2_table(766) := '74657069636B657220746420612E75692D73746174652D64656661756C74207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E75692D6461746570';
wwv_flow_api.g_varchar2_table(767) := '69636B6572207464207370616E2E75692D73746174652D64656661756C742E75692D73746174652D6163746976652C0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D61';
wwv_flow_api.g_varchar2_table(768) := '6374697665207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A2020666F6E742D7765696768743A20626F6C643B0A7D0A626F6479202E75692D646174657069636B6572207464';
wwv_flow_api.g_varchar2_table(769) := '207370616E2E75692D73746174652D64656661756C742E75692D73746174652D6163746976652E75692D73746174652D686F7665722C0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D';
wwv_flow_api.g_varchar2_table(770) := '73746174652D6163746976652E75692D73746174652D686F766572207B0A20206261636B67726F756E642D636F6C6F723A20233230343564622021696D706F7274616E743B0A7D0A626F6479202E75692D646174657069636B6572207464207370616E2E';
wwv_flow_api.g_varchar2_table(771) := '75692D73746174652D64656661756C742E75692D73746174652D686F7665722C0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D686F766572207B0A20206261636B6772';
wwv_flow_api.g_varchar2_table(772) := '6F756E642D636F6C6F723A20236632663266322021696D706F7274616E743B0A7D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C743A666F6375732C0A626F6479202E75692D6461746570';
wwv_flow_api.g_varchar2_table(773) := '69636B657220746420612E75692D73746174652D64656661756C743A666F637573207B0A20206F75746C696E653A206E6F6E653B0A2020626F782D736861646F773A20302030203020317078202332303435646220696E7365742C203020302031707820';
wwv_flow_api.g_varchar2_table(774) := '32707820726762612833322C2036392C203231392C20302E3235292021696D706F7274616E743B0A7D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742E75692D73746174652D68696768';
wwv_flow_api.g_varchar2_table(775) := '6C696768742C0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D686967686C69676874207B0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0A7D';
wwv_flow_api.g_varchar2_table(776) := '0A626F6479202E75692D646174657069636B6572207468207B0A2020636F6C6F723A20233830383038303B0A7D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6865616465722C0A626F6479202E75692D6461';
wwv_flow_api.g_varchar2_table(777) := '74657069636B6572202E75692D646174657069636B65722D627574746F6E70616E6520627574746F6E2C0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6E6578742C0A626F6479202E75692D64617465706963';
wwv_flow_api.g_varchar2_table(778) := '6B6572202E75692D646174657069636B65722D70726576207B0A2020626F726465722D7261646975733A203270783B0A7D0A0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65626172207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(779) := '642D636F6C6F723A20236663666366633B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236532653265323B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(780) := '233364336433643B0A7D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E742C0A2E742D4469616C6F672D70616765207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(781) := '3A20233430343034303B0A7D0A0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F672C0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261722C0A2E742D4469616C6F';
wwv_flow_api.g_varchar2_table(782) := '672D2D77697A61726420626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E74207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D44';
wwv_flow_api.g_varchar2_table(783) := '69616C6F672D2D77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A0A626F6479202E75692D636F726E65722D616C6C207B0A2020626F726465722D7261646975';
wwv_flow_api.g_varchar2_table(784) := '733A203270783B0A7D0A626F6479202E75692D636F726E65722D746F702C0A626F6479202E75692D636F726E65722D6C6566742C0A626F6479202E75692D636F726E65722D746C207B0A2020626F726465722D746F702D6C6566742D7261646975733A20';
wwv_flow_api.g_varchar2_table(785) := '3270783B0A7D0A626F6479202E75692D636F726E65722D746F702C0A626F6479202E75692D636F726E65722D72696768742C0A626F6479202E75692D636F726E65722D7472207B0A2020626F726465722D746F702D72696768742D7261646975733A2032';
wwv_flow_api.g_varchar2_table(786) := '70783B0A7D0A626F6479202E75692D636F726E65722D626F74746F6D2C0A626F6479202E75692D636F726E65722D6C6566742C0A626F6479202E75692D636F726E65722D626C207B0A2020626F726465722D626F74746F6D2D6C6566742D726164697573';
wwv_flow_api.g_varchar2_table(787) := '3A203270783B0A7D0A626F6479202E75692D636F726E65722D626F74746F6D2C0A626F6479202E75692D636F726E65722D72696768742C0A626F6479202E75692D636F726E65722D6272207B0A2020626F726465722D626F74746F6D2D72696768742D72';
wwv_flow_api.g_varchar2_table(788) := '61646975733A203270783B0A7D0A0A626F6479202E75692D627574746F6E2E75692D636F726E65722D616C6C207B0A2020626F726465722D7261646975733A203270783B0A7D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746F70';
wwv_flow_api.g_varchar2_table(789) := '2C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6C6566742C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746C207B0A2020626F726465722D746F702D6C6566742D7261646975733A203270783B0A7D0A626F';
wwv_flow_api.g_varchar2_table(790) := '6479202E75692D627574746F6E2E75692D636F726E65722D746F702C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D72696768742C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D7472207B0A2020626F726465';
wwv_flow_api.g_varchar2_table(791) := '722D746F702D72696768742D7261646975733A203270783B0A7D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626F74746F6D2C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6C6566742C0A626F6479202E75';
wwv_flow_api.g_varchar2_table(792) := '692D627574746F6E2E75692D636F726E65722D626C207B0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A203270783B0A7D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626F74746F6D2C0A626F6479202E';
wwv_flow_api.g_varchar2_table(793) := '75692D627574746F6E2E75692D636F726E65722D72696768742C0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6272207B0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0A7D0A0A2E61635F';
wwv_flow_api.g_varchar2_table(794) := '726573756C7473207B0A2020626F726465723A2031707820736F6C696420236439643964393B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020636F6C6F723A20233430343034303B0A7D0A2E61635F6C6F6164696E6720';
wwv_flow_api.g_varchar2_table(795) := '7B0A20206261636B67726F756E643A20236666666666662075726C28272E2E2F2E2E2F2E2E2F617065785F75692F696D672F6C65676163792F6C6F6164696E6731367831362E67696627292072696768742063656E746572206E6F2D7265706561743B0A';
wwv_flow_api.g_varchar2_table(796) := '7D0A2E61635F6F6464207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A626F6479202E61635F6F766572207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666';
wwv_flow_api.g_varchar2_table(797) := '666666663B0A7D0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D617869732D7469746C652C0A626F6479202E612D44334261724368617274202E612D44334C696E6543686172742D617869732D7469746C6520';
wwv_flow_api.g_varchar2_table(798) := '7B0A202066696C6C3A20233430343034303B0A7D0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D61786973202E7469636B20746578742C0A626F6479202E612D44334261724368617274202E612D44334C696E';
wwv_flow_api.g_varchar2_table(799) := '6543686172742D61786973202E7469636B2074657874207B0A202066696C6C3A20233830383038303B0A7D0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D61786973206C696E652C0A626F6479202E612D4433';
wwv_flow_api.g_varchar2_table(800) := '4261724368617274202E612D44334C696E6543686172742D61786973206C696E652C0A626F6479202E612D44334C696E654368617274202E612D44334C696E6543686172742D6178697320706174682C0A626F6479202E612D4433426172436861727420';
wwv_flow_api.g_varchar2_table(801) := '2E612D44334C696E6543686172742D617869732070617468207B0A20207374726F6B653A20236536653665363B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D617869732D7469746C65207B0A202066696C6C';
wwv_flow_api.g_varchar2_table(802) := '3A20233430343034303B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D67726964206C696E652C0A626F6479202E612D44334261724368617274202E612D443342617243686172742D67726964207B0A202073';
wwv_flow_api.g_varchar2_table(803) := '74726F6B653A20236536653665363B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D61786973206C696E652C0A626F6479202E612D44334261724368617274202E612D443342617243686172742D6178697320';
wwv_flow_api.g_varchar2_table(804) := '70617468207B0A20207374726F6B653A20236363636363633B0A7D0A626F6479202E612D44334261724368617274202E612D443342617243686172742D61786973202E7469636B2074657874207B0A202066696C6C3A20233830383038303B0A7D0A626F';
wwv_flow_api.g_varchar2_table(805) := '6479202E612D4433546F6F6C746970207B0A20206261636B67726F756E642D636F6C6F723A20233830383038303B0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0A7D0A626F6479202E612D4433546F6F6C7469702D636F6E74';
wwv_flow_api.g_varchar2_table(806) := '656E74207B0A2020626F726465722D746F703A20233939393939393B0A7D0A626F6479202E612D443343686172744C6567656E642E612D443343686172744C6567656E642D2D65787465726E616C2D626F7264657273207B0A2020626F726465722D7769';
wwv_flow_api.g_varchar2_table(807) := '6474683A20303B0A7D0A626F6479202E612D443343686172744C6567656E642D6974656D2C0A626F6479202E612D443343686172744C6567656E642E612D443343686172744C6567656E642D2D6261636B67726F756E64202E612D443343686172744C65';
wwv_flow_api.g_varchar2_table(808) := '67656E642D6C61796F7574207B0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0A2020626F726465722D77696474683A20302021696D706F7274616E743B0A7D0A626F6479202E612D443343686172744C6567656E64';
wwv_flow_api.g_varchar2_table(809) := '2D6974656D2D76616C7565207B0A2020636F6C6F723A20233636363636363B0A7D0A626F6479202E612D443343686172744C6567656E642E612D443343686172744C6567656E642D2D7371756172652D636F6C6F72202E612D443343686172744C656765';
wwv_flow_api.g_varchar2_table(810) := '6E642D6974656D2D636F6C6F72207B0A2020626F726465722D7261646975733A20313030253B0A2020626F726465722D72696768742D77696474683A20303B0A7D0A2E742D426F6479207B0A20200A20200A20200A7D0A2E742D426F6479202E612D4D69';
wwv_flow_api.g_varchar2_table(811) := '6E6943616C207B0A2020626F726465723A2031707820736F6C696420236466646664663B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0A7D0A2E742D426F6479202E61';
wwv_flow_api.g_varchar2_table(812) := '2D4D696E6943616C2D7469746C65207B0A2020636F6C6F723A20233339333933393B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461794F665765656B207B0A2020636F6C6F723A20233739373937393B0A7D0A2E742D426F6479202E612D4D';
wwv_flow_api.g_varchar2_table(813) := '696E6943616C2D646179207B0A2020626F726465722D636F6C6F723A20236632663266323B0A2020636F6C6F723A20233339333933393B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C';
wwv_flow_api.g_varchar2_table(814) := '2D64617465207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C';
wwv_flow_api.g_varchar2_table(815) := '2D64617465207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(816) := '726F756E642D636F6C6F723A20236633663366333B0A7D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A20206261636B67726F756E642D636F6C6F723A20236565656565653B0A7D0A2E742D526567696F6E207B0A';
wwv_flow_api.g_varchar2_table(817) := '20200A20200A20200A7D0A2E742D526567696F6E202E612D4D696E6943616C207B0A2020626F726465723A2031707820736F6C696420236536653665363B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(818) := '6C6F723A20236666666666663B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D7469746C65207B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D6461794F665765656B207B0A2020';
wwv_flow_api.g_varchar2_table(819) := '636F6C6F723A20233830383038303B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D646179207B0A2020626F726465722D636F6C6F723A20236639663966393B0A2020636F6C6F723A20233430343034303B0A7D0A2E742D526567696F6E20';
wwv_flow_api.g_varchar2_table(820) := '2E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D526567696F6E';
wwv_flow_api.g_varchar2_table(821) := '202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D52656769';
wwv_flow_api.g_varchar2_table(822) := '6F6E202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0A7D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A202062';
wwv_flow_api.g_varchar2_table(823) := '61636B67726F756E642D636F6C6F723A20236635663566353B0A7D0A2E742D426F64792D616374696F6E73207B0A20200A20200A20200A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C207B0A2020626F726465723A2031707820';
wwv_flow_api.g_varchar2_table(824) := '736F6C696420236432643264323B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D7469746C65';
wwv_flow_api.g_varchar2_table(825) := '207B0A2020636F6C6F723A20233263326332633B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461794F665765656B207B0A2020636F6C6F723A20233663366336633B0A7D0A2E742D426F64792D616374696F6E73202E61';
wwv_flow_api.g_varchar2_table(826) := '2D4D696E6943616C2D646179207B0A2020626F726465722D636F6C6F723A20236535653565353B0A2020636F6C6F723A20233263326332633B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D746F64617920';
wwv_flow_api.g_varchar2_table(827) := '2E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E6973';
wwv_flow_api.g_varchar2_table(828) := '2D616374697665202E612D4D696E6943616C2D64617465207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E694361';
wwv_flow_api.g_varchar2_table(829) := '6C2D6461792E69732D7765656B656E64207B0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0A7D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(830) := '756E642D636F6C6F723A20236531653165313B0A7D0A2E742D426F64792D696E666F207B0A20200A20200A20200A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C207B0A2020626F726465723A2031707820736F6C696420236366643766';
wwv_flow_api.g_varchar2_table(831) := '383B0A2020626F726465722D7261646975733A203270783B0A20206261636B67726F756E642D636F6C6F723A20236663666366653B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D7469746C65207B0A2020636F6C6F723A20233365';
wwv_flow_api.g_varchar2_table(832) := '336533653B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461794F665765656B207B0A2020636F6C6F723A20233765376537653B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D646179207B0A2020626F7264';
wwv_flow_api.g_varchar2_table(833) := '65722D636F6C6F723A20236630663366643B0A2020636F6C6F723A20233365336533653B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0A20206261636B';
wwv_flow_api.g_varchar2_table(834) := '67726F756E642D636F6C6F723A20233230343564623B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0A20';
wwv_flow_api.g_varchar2_table(835) := '206261636B67726F756E642D636F6C6F723A20236666636330303B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(836) := '642D636F6C6F723A20236633663566643B0A7D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0A20206261636B67726F756E642D636F6C6F723A20236561656466633B0A7D0A0A2E742D426F6479202E61';
wwv_flow_api.g_varchar2_table(837) := '2D44657461696C6564436F6E74656E744C6973742D7469746C65207B0A2020636F6C6F723A20233339333933393B0A7D0A2E742D426F64792D696E666F202E612D44657461696C6564436F6E74656E744C6973742D7469746C65207B0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(838) := '3A20233365336533653B0A7D0A2E742D526567696F6E202E612D44657461696C6564436F6E74656E744C6973742D7469746C652C0A2E742D427574746F6E526567696F6E202E612D44657461696C6564436F6E74656E744C6973742D7469746C65207B0A';
wwv_flow_api.g_varchar2_table(839) := '2020636F6C6F723A20233430343034303B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6974656D3A666F637573202E612D44657461696C6564436F6E74656E744C6973742D686561646572207B0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(840) := '646F773A20302030203020317078202331393337616620696E7365743B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6974656D2E69732D657870616E646564202E612D44657461696C6564436F6E74656E744C6973742D';
wwv_flow_api.g_varchar2_table(841) := '74726967676572207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A2020626F782D736861646F773A20302030203020317078202332303435646220696E7365743B0A2020636F6C6F723A20233230343564623B0A7D0A626F';
wwv_flow_api.g_varchar2_table(842) := '6479202E612D44657461696C6564436F6E74656E744C6973742D6974656D2E69732D657870616E646564202E612D44657461696C6564436F6E74656E744C6973742D747269676765723A666F637573207B0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(843) := '3A20233139333761663B0A2020636F6C6F723A20236666666666663B0A2020626F782D736861646F773A20302030203020317078202331393337616620696E7365743B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6865';
wwv_flow_api.g_varchar2_table(844) := '616465723A686F766572207B0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D69636F6E207B0A2020636F6C6F723A20726762612836342C2036342C';
wwv_flow_api.g_varchar2_table(845) := '2036342C20302E35293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D6261646765207B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D747269';
wwv_flow_api.g_varchar2_table(846) := '67676572207B0A20206261636B67726F756E643A20236666666666663B0A2020636F6C6F723A20726762612836342C2036342C2036342C20302E3735293B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D74726967676572';
wwv_flow_api.g_varchar2_table(847) := '3A686F766572207B0A2020636F6C6F723A20233139333761663B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D747269676765723A666F637573207B0A2020636F6C6F723A20233139333761663B0A7D0A626F6479202E61';
wwv_flow_api.g_varchar2_table(848) := '2D44657461696C6564436F6E74656E744C6973742D626F6479207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A626F6479202E636F6E74656E742D746F6F6C746970202E612D44657461696C6564436F6E74656E744C';
wwv_flow_api.g_varchar2_table(849) := '6973742D626F6479207B0A20206261636B67726F756E642D636F6C6F723A20233133323938323B0A7D0A626F6479202E636F6E74656E742D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F64792D726F772D6C616265';
wwv_flow_api.g_varchar2_table(850) := '6C207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E636F6E74656E742D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F64792D726F772D636F6E74656E74207B0A2020636F6C6F723A20233736';
wwv_flow_api.g_varchar2_table(851) := '386465623B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D626F64792D686561646572207B0A20206261636B67726F756E643A20236666666666663B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C69';
wwv_flow_api.g_varchar2_table(852) := '73742D626F64792D726F772D6C6162656C207B0A2020636F6C6F723A20233430343034303B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742D626F64792D726F772D636F6E74656E74207B0A2020636F6C6F723A2023313332';
wwv_flow_api.g_varchar2_table(853) := '3938323B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742E612D44657461696C6564436F6E74656E744C6973742D2D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F64793A616674657220';
wwv_flow_api.g_varchar2_table(854) := '7B0A2020626F726465722D636F6C6F723A2023666666666666207472616E73706172656E743B0A7D0A626F6479202E612D44657461696C6564436F6E74656E744C6973742E612D44657461696C6564436F6E74656E744C6973742D2D746F6F6C74697020';
wwv_flow_api.g_varchar2_table(855) := '2E612D44657461696C6564436F6E74656E744C6973742D626F64793A6265666F7265207B0A2020626F726465722D636F6C6F723A2023666666666666207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E74';
wwv_flow_api.g_varchar2_table(856) := '2D746F6F6C746970207B0A20202D7765626B69742D626F726465722D7261646975733A203270783B0A20202D6D6F7A2D626F726465722D7261646975733A203270783B0A2020626F726465722D7261646975733A203270783B0A7D0A626F6479202E7569';
wwv_flow_api.g_varchar2_table(857) := '2D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E612D44657461696C6564436F6E74656E744C6973742D626F6479207B0A20202D7765626B69742D626F726465722D7261646975733A203270783B0A20202D6D6F7A2D626F726465722D72';
wwv_flow_api.g_varchar2_table(858) := '61646975733A203270783B0A2020626F726465722D7261646975733A203270783B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E626F74746F6D3A6265666F7265207B0A2020626F72646572';
wwv_flow_api.g_varchar2_table(859) := '2D636F6C6F723A2023313332393832207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E626F74746F6D3A6166746572207B0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(860) := '3A2023313332393832207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E626F74746F6D2E6C696768743A6166746572207B0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(861) := '3A2023656165616561207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E746F703A6265666F7265207B0A2020626F726465722D636F6C6F723A20233133323938';
wwv_flow_api.g_varchar2_table(862) := '32207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E746F703A6166746572207B0A2020626F726465722D636F6C6F723A2023313332393832207472616E737061';
wwv_flow_api.g_varchar2_table(863) := '72656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E6C6566743A6265666F7265207B0A2020626F726465722D636F6C6F723A207472616E73706172656E742023666666666666207472';
wwv_flow_api.g_varchar2_table(864) := '616E73706172656E74207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E6C6566743A6166746572207B0A2020626F726465722D636F6C6F723A207472616E7370';
wwv_flow_api.g_varchar2_table(865) := '6172656E742023313332393832207472616E73706172656E74207472616E73706172656E743B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F6F6C746970202E6172726F772E72696768743A6265666F7265207B0A2020626F';
wwv_flow_api.g_varchar2_table(866) := '726465722D636F6C6F723A207472616E73706172656E74207472616E73706172656E74207472616E73706172656E7420726762612836342C2036342C2036342C20302E35293B0A7D0A626F6479202E75692D746F6F6C7469702E636F6E74656E742D746F';
wwv_flow_api.g_varchar2_table(867) := '6F6C746970202E6172726F772E72696768743A6166746572207B0A2020626F726465722D636F6C6F723A207472616E73706172656E74207472616E73706172656E74207472616E73706172656E7420233133323938323B0A7D0A626F6479202E742D4261';
wwv_flow_api.g_varchar2_table(868) := '6467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203129207B0A20206261636B67726F756E642D636F6C6F723A20236666326435353B0A';
wwv_flow_api.g_varchar2_table(869) := '7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031292061207B0A2020636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(870) := '663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820312920612E742D42616467654C6973742D7772';
wwv_flow_api.g_varchar2_table(871) := '61703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663630376520696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F726564424720';
wwv_flow_api.g_varchar2_table(872) := '2E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203229207B0A20206261636B67726F756E642D636F6C6F723A20233030376166663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(873) := '2D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C';
wwv_flow_api.g_varchar2_table(874) := '6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D387078203020302023';
wwv_flow_api.g_varchar2_table(875) := '33333935666620696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329207B0A202062';
wwv_flow_api.g_varchar2_table(876) := '61636B67726F756E642D636F6C6F723A20236666393530303B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(877) := '6C64282033292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D';
wwv_flow_api.g_varchar2_table(878) := '6368696C642820332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666161333320696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D6461';
wwv_flow_api.g_varchar2_table(879) := '73682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A626F6479202E742D42';
wwv_flow_api.g_varchar2_table(880) := '616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282034292061207B0A2020636F6C6F723A20233037316630623B0A7D0A626F6479202E';
wwv_flow_api.g_varchar2_table(881) := '742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820342920612E742D42616467654C6973742D777261703A686F766572207B0A';
wwv_flow_api.g_varchar2_table(882) := '2020626F782D736861646F773A2030202D38707820302030202332616338343520696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(883) := '742D6974656D3A6E74682D6368696C6428203529207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(884) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282035292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265';
wwv_flow_api.g_varchar2_table(885) := '644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820352920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202361386138616320696E7365';
wwv_flow_api.g_varchar2_table(886) := '743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203629207B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(887) := '6F6C6F723A20233334616164633B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282036292061207B0A';
wwv_flow_api.g_varchar2_table(888) := '2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282036292061';
wwv_flow_api.g_varchar2_table(889) := '2E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202335666263653420696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C';
wwv_flow_api.g_varchar2_table(890) := '6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A7D0A626F6479202E742D42616467654C6973742D2D64';
wwv_flow_api.g_varchar2_table(891) := '6173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282037292061207B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(892) := '2D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F';
wwv_flow_api.g_varchar2_table(893) := '773A2030202D38707820302030202363636133303020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D';
wwv_flow_api.g_varchar2_table(894) := '6368696C6428203829207B0A20206261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(895) := '73742D6974656D3A6E74682D6368696C64282038292061207B0A2020636F6C6F723A20233032333935323B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467';
wwv_flow_api.g_varchar2_table(896) := '654C6973742D6974656D3A6E74682D6368696C642820382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202332386237663920696E7365743B0A7D0A626F6479202E';
wwv_flow_api.g_varchar2_table(897) := '742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203929207B0A20206261636B67726F756E642D636F6C6F723A202366663362';
wwv_flow_api.g_varchar2_table(898) := '33303B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282039292061207B0A2020636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(899) := '66666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820392920612E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(900) := '742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663662363320696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265';
wwv_flow_api.g_varchar2_table(901) := '644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313029207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467';
wwv_flow_api.g_varchar2_table(902) := '654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203130292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D';
wwv_flow_api.g_varchar2_table(903) := '42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031302920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870';
wwv_flow_api.g_varchar2_table(904) := '7820302030202338313766653020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031';
wwv_flow_api.g_varchar2_table(905) := '3129207B0A20206261636B67726F756E642D636F6C6F723A20236666353737373B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(906) := '3A6E74682D6368696C6428203131292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(907) := '6974656D3A6E74682D6368696C64282031312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663861613020696E7365743B0A7D0A626F6479202E742D426164';
wwv_flow_api.g_varchar2_table(908) := '67654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229207B0A20206261636B67726F756E642D636F6C6F723A20233333393566663B0A';
wwv_flow_api.g_varchar2_table(909) := '7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203132292061207B0A2020636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(910) := '66663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031322920612E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(911) := '777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202336366166666620696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F72656442';
wwv_flow_api.g_varchar2_table(912) := '47202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313329207B0A20206261636B67726F756E642D636F6C6F723A20236666616133333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C';
wwv_flow_api.g_varchar2_table(913) := '6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203133292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D4261';
wwv_flow_api.g_varchar2_table(914) := '6467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820';
wwv_flow_api.g_varchar2_table(915) := '302030202366663935303020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313429';
wwv_flow_api.g_varchar2_table(916) := '207B0A20206261636B67726F756E642D636F6C6F723A20233730653138333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E';
wwv_flow_api.g_varchar2_table(917) := '74682D6368696C6428203134292061207B0A2020636F6C6F723A20233338346333633B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974';
wwv_flow_api.g_varchar2_table(918) := '656D3A6E74682D6368696C64282031342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202334366438356620696E7365743B0A7D0A626F6479202E742D4261646765';
wwv_flow_api.g_varchar2_table(919) := '4C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313529207B0A20206261636B67726F756E642D636F6C6F723A20236135613561393B0A7D0A';
wwv_flow_api.g_varchar2_table(920) := '626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203135292061207B0A2020636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(921) := '3B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031352920612E742D42616467654C6973742D7772';
wwv_flow_api.g_varchar2_table(922) := '61703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202362666266633220696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F726564424720';
wwv_flow_api.g_varchar2_table(923) := '2E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313629207B0A20206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(924) := '742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203136292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467';
wwv_flow_api.g_varchar2_table(925) := '654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031362920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D387078203020';
wwv_flow_api.g_varchar2_table(926) := '30202333316139646220696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729207B';
wwv_flow_api.g_varchar2_table(927) := '0A20206261636B67726F756E642D636F6C6F723A20236666643633333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(928) := '2D6368696C6428203137292061207B0A2020636F6C6F723A20233333333333333B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(929) := '3A6E74682D6368696C64282031372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666363303020696E7365743B0A7D0A626F6479202E742D42616467654C69';
wwv_flow_api.g_varchar2_table(930) := '73742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829207B0A20206261636B67726F756E642D636F6C6F723A20233762643366623B0A7D0A626F';
wwv_flow_api.g_varchar2_table(931) := '6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203138292061207B0A2020636F6C6F723A20233335363137353B0A';
wwv_flow_api.g_varchar2_table(932) := '7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031382920612E742D42616467654C6973742D77726170';
wwv_flow_api.g_varchar2_table(933) := '3A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202334396332666120696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E74';
wwv_flow_api.g_varchar2_table(934) := '2D42616467654C6973742D6974656D3A6E74682D6368696C642820313929207B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(935) := '2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203139292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C';
wwv_flow_api.g_varchar2_table(936) := '6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031392920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870782030203020';
wwv_flow_api.g_varchar2_table(937) := '2366663932386320696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323029207B0A20';
wwv_flow_api.g_varchar2_table(938) := '206261636B67726F756E642D636F6C6F723A20233739373864653B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(939) := '68696C6428203230292061207B0A2020636F6C6F723A20236666666666663B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E';
wwv_flow_api.g_varchar2_table(940) := '74682D6368696C64282032302920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202361326131653820696E7365743B0A7D0A626F6479202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(941) := '2D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323129207B0A20206261636B67726F756E642D636F6C6F723A20236536323934643B0A7D0A626F6479';
wwv_flow_api.g_varchar2_table(942) := '202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203231292061207B0A2020636F6C6F723A20236536653665363B0A7D0A';
wwv_flow_api.g_varchar2_table(943) := '626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032312920612E742D42616467654C6973742D777261703A68';
wwv_flow_api.g_varchar2_table(944) := '6F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365623536373220696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42';
wwv_flow_api.g_varchar2_table(945) := '616467654C6973742D6974656D3A6E74682D6368696C642820323229207B0A20206261636B67726F756E642D636F6C6F723A20233030366565363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(946) := '6F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203232292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(947) := '742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202331';
wwv_flow_api.g_varchar2_table(948) := '613837666620696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329207B0A202062';
wwv_flow_api.g_varchar2_table(949) := '61636B67726F756E642D636F6C6F723A20236536383630303B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(950) := '6C6428203233292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(951) := '2D6368696C64282032332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666130316120696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D';
wwv_flow_api.g_varchar2_table(952) := '646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323429207B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A626F6479202E';
wwv_flow_api.g_varchar2_table(953) := '742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203234292061207B0A2020636F6C6F723A20233036316330613B0A7D0A626F';
wwv_flow_api.g_varchar2_table(954) := '6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032342920612E742D42616467654C6973742D777261703A686F76';
wwv_flow_api.g_varchar2_table(955) := '6572207B0A2020626F782D736861646F773A2030202D38707820302030202336626430376320696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D426164';
wwv_flow_api.g_varchar2_table(956) := '67654C6973742D6974656D3A6E74682D6368696C642820323529207B0A20206261636B67726F756E642D636F6C6F723A20233830383038343B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C';
wwv_flow_api.g_varchar2_table(957) := '6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203235292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(958) := '2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032352920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D387078203020302023396139';
wwv_flow_api.g_varchar2_table(959) := '61396420696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323629207B0A2020626163';
wwv_flow_api.g_varchar2_table(960) := '6B67726F756E642D636F6C6F723A20233266393963363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(961) := '28203236292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(962) := '68696C64282032362920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202335326166643620696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D6461';
wwv_flow_api.g_varchar2_table(963) := '73682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323729207B0A20206261636B67726F756E642D636F6C6F723A20236536623830303B0A7D0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(964) := '42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203237292061207B0A2020636F6C6F723A20233030303030303B0A7D0A626F6479';
wwv_flow_api.g_varchar2_table(965) := '202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032372920612E742D42616467654C6973742D777261703A686F766572';
wwv_flow_api.g_varchar2_table(966) := '207B0A2020626F782D736861646F773A2030202D38707820302030202362333866303020696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D4261646765';
wwv_flow_api.g_varchar2_table(967) := '4C6973742D6974656D3A6E74682D6368696C642820323829207B0A20206261636B67726F756E642D636F6C6F723A20233531623465313B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(968) := '65644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203238292061207B0A2020636F6C6F723A20233032333434613B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(969) := '6F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870782030203020233763633765';
wwv_flow_api.g_varchar2_table(970) := '3920696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(971) := '726F756E642D636F6C6F723A20236536333532623B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820';
wwv_flow_api.g_varchar2_table(972) := '3239292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(973) := '6C64282032392920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365623630353920696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D64617368';
wwv_flow_api.g_varchar2_table(974) := '2E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029207B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A626F6479202E742D4261';
wwv_flow_api.g_varchar2_table(975) := '6467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203330292061207B0A2020636F6C6F723A20236536653665363B0A7D0A626F6479202E';
wwv_flow_api.g_varchar2_table(976) := '742D42616467654C6973742D2D646173682E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282033302920612E742D42616467654C6973742D777261703A686F766572207B';
wwv_flow_api.g_varchar2_table(977) := '0A2020626F782D736861646F773A2030202D38707820302030202337353733636520696E7365743B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D426164';
wwv_flow_api.g_varchar2_table(978) := '67654C6973742D6974656D3A6E74682D6368696C6428203129202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666313434303B0A2020636F6C6F723A20236666313434303B0A7D0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(979) := '42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203129202E742D42616467654C6973742D77726170202E742D42616467';
wwv_flow_api.g_varchar2_table(980) := '654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203129202E742D42';
wwv_flow_api.g_varchar2_table(981) := '616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20236666326435353B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D4261';
wwv_flow_api.g_varchar2_table(982) := '6467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203229202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233030366565363B0A202063';
wwv_flow_api.g_varchar2_table(983) := '6F6C6F723A20233030366565363B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820322920';
wwv_flow_api.g_varchar2_table(984) := '2E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(985) := '742D6974656D3A6E74682D6368696C6428203229202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233030376166663B0A7D0A626F6479202E74';
wwv_flow_api.g_varchar2_table(986) := '2D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329202E742D42616467654C6973742D76616C7565207B0A202062';
wwv_flow_api.g_varchar2_table(987) := '6F726465722D636F6C6F723A20236536383630303B0A2020636F6C6F723A20236536383630303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467';
wwv_flow_api.g_varchar2_table(988) := '654C6973742D6974656D3A6E74682D6368696C6428203329202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C69';
wwv_flow_api.g_varchar2_table(989) := '73742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(990) := '636F6C6F723A20236666393530303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429';
wwv_flow_api.g_varchar2_table(991) := '202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233337643535323B0A2020636F6C6F723A20233337643535323B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D426164';
wwv_flow_api.g_varchar2_table(992) := '67654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(993) := '654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(994) := '723A20233037316630623B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D426164';
wwv_flow_api.g_varchar2_table(995) := '67654C6973742D6974656D3A6E74682D6368696C6428203529202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233831383138373B0A2020636F6C6F723A20233831383138373B0A7D0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(996) := '42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203529202E742D42616467654C6973742D77726170202E742D42616467';
wwv_flow_api.g_varchar2_table(997) := '654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203529202E742D42';
wwv_flow_api.g_varchar2_table(998) := '616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D4261';
wwv_flow_api.g_varchar2_table(999) := '6467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203629202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233234396564323B0A202063';
wwv_flow_api.g_varchar2_table(1000) := '6F6C6F723A20233234396564323B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820362920';
wwv_flow_api.g_varchar2_table(1001) := '2E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1002) := '742D6974656D3A6E74682D6368696C6428203629202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233334616164633B0A7D0A626F6479202E74';
wwv_flow_api.g_varchar2_table(1003) := '2D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729202E742D42616467654C6973742D76616C7565207B0A202062';
wwv_flow_api.g_varchar2_table(1004) := '6F726465722D636F6C6F723A20236536623830303B0A2020636F6C6F723A20236536623830303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467';
wwv_flow_api.g_varchar2_table(1005) := '654C6973742D6974656D3A6E74682D6368696C6428203729202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C69';
wwv_flow_api.g_varchar2_table(1006) := '73742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233030303030303B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(1007) := '636F6C6F723A20236666636330303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829';
wwv_flow_api.g_varchar2_table(1008) := '202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233431633066393B0A2020636F6C6F723A20233431633066393B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D426164';
wwv_flow_api.g_varchar2_table(1009) := '67654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(1010) := '654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1011) := '723A20233032333935323B0A20206261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D426164';
wwv_flow_api.g_varchar2_table(1012) := '67654C6973742D6974656D3A6E74682D6368696C6428203929202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666323331373B0A2020636F6C6F723A20236666323331373B0A7D0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(1013) := '42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203929202E742D42616467654C6973742D77726170202E742D42616467';
wwv_flow_api.g_varchar2_table(1014) := '654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203929202E742D42';
wwv_flow_api.g_varchar2_table(1015) := '616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D4261';
wwv_flow_api.g_varchar2_table(1016) := '6467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313029202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233434343164313B0A2020';
wwv_flow_api.g_varchar2_table(1017) := '636F6C6F723A20233434343164313B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203130';
wwv_flow_api.g_varchar2_table(1018) := '29202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1019) := '6973742D6974656D3A6E74682D6368696C642820313029202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A626F6479';
wwv_flow_api.g_varchar2_table(1020) := '202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313129202E742D42616467654C6973742D76616C7565207B';
wwv_flow_api.g_varchar2_table(1021) := '0A2020626F726465722D636F6C6F723A20236666336536323B0A2020636F6C6F723A20236666336536323B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D';
wwv_flow_api.g_varchar2_table(1022) := '42616467654C6973742D6974656D3A6E74682D6368696C642820313129202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D4261';
wwv_flow_api.g_varchar2_table(1023) := '6467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313129202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67';
wwv_flow_api.g_varchar2_table(1024) := '726F756E642D636F6C6F723A20236666353737373B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1025) := '6C642820313229202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233139383766663B0A2020636F6C6F723A20233139383766663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61';
wwv_flow_api.g_varchar2_table(1026) := '722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479';
wwv_flow_api.g_varchar2_table(1027) := '202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229202E742D42616467654C6973742D76616C75652061';
wwv_flow_api.g_varchar2_table(1028) := '207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233333393566663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F726564';
wwv_flow_api.g_varchar2_table(1029) := '4247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313329202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666613031393B0A2020636F6C6F723A20236666613031393B0A';
wwv_flow_api.g_varchar2_table(1030) := '7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313329202E742D42616467654C6973742D77';
wwv_flow_api.g_varchar2_table(1031) := '726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1032) := '6C642820313329202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20236666616133333B0A7D0A626F6479202E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(1033) := '697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313429202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1034) := '20233562646337313B0A2020636F6C6F723A20233562646337313B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E';
wwv_flow_api.g_varchar2_table(1035) := '74682D6368696C642820313429202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F726564';
wwv_flow_api.g_varchar2_table(1036) := '4247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313429202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233338346333633B0A20206261636B67726F756E642D636F6C6F723A20233730';
wwv_flow_api.g_varchar2_table(1037) := '653138333B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313529202E742D4261646765';
wwv_flow_api.g_varchar2_table(1038) := '4C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233938393839633B0A2020636F6C6F723A20233938393839633B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(1039) := '6F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313529202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63';
wwv_flow_api.g_varchar2_table(1040) := '697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313529202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A2023666666';
wwv_flow_api.g_varchar2_table(1041) := '6666663B0A20206261636B67726F756E642D636F6C6F723A20236135613561393B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1042) := '6974656D3A6E74682D6368696C642820313629202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233437623264663B0A2020636F6C6F723A20233437623264663B0A7D0A626F6479202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1043) := '6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313629202E742D42616467654C6973742D77726170202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(1044) := '2D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313629202E742D4261646765';
wwv_flow_api.g_varchar2_table(1045) := '4C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C';
wwv_flow_api.g_varchar2_table(1046) := '6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666643131393B0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1047) := '723A20236666643131393B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729202E74';
wwv_flow_api.g_varchar2_table(1048) := '2D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1049) := '6974656D3A6E74682D6368696C642820313729202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233333333333333B0A20206261636B67726F756E642D636F6C6F723A20236666643633333B0A7D0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(1050) := '42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829202E742D42616467654C6973742D76616C7565207B0A202062';
wwv_flow_api.g_varchar2_table(1051) := '6F726465722D636F6C6F723A20233632636266613B0A2020636F6C6F723A20233632636266613B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467';
wwv_flow_api.g_varchar2_table(1052) := '654C6973742D6974656D3A6E74682D6368696C642820313829202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C';
wwv_flow_api.g_varchar2_table(1053) := '6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233335363137353B0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1054) := '642D636F6C6F723A20233762643366623B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820';
wwv_flow_api.g_varchar2_table(1055) := '313929202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236666346134303B0A2020636F6C6F723A20236666346134303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D';
wwv_flow_api.g_varchar2_table(1056) := '42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313929202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D';
wwv_flow_api.g_varchar2_table(1057) := '42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313929202E742D42616467654C6973742D76616C75652061207B0A20';
wwv_flow_api.g_varchar2_table(1058) := '20636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E';
wwv_flow_api.g_varchar2_table(1059) := '742D42616467654C6973742D6974656D3A6E74682D6368696C642820323029202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233635363364393B0A2020636F6C6F723A20233635363364393B0A7D0A626F';
wwv_flow_api.g_varchar2_table(1060) := '6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323029202E742D42616467654C6973742D7772617020';
wwv_flow_api.g_varchar2_table(1061) := '2E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820';
wwv_flow_api.g_varchar2_table(1062) := '323029202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236666666666663B0A20206261636B67726F756E642D636F6C6F723A20233739373864653B0A7D0A626F6479202E742D42616467654C6973742D2D6369726375';
wwv_flow_api.g_varchar2_table(1063) := '6C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323129202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236462';
wwv_flow_api.g_varchar2_table(1064) := '316133663B0A2020636F6C6F723A20236462316133663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(1065) := '68696C642820323129202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E';
wwv_flow_api.g_varchar2_table(1066) := '742D42616467654C6973742D6974656D3A6E74682D6368696C642820323129202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A2023653632393464';
wwv_flow_api.g_varchar2_table(1067) := '3B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323229202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(1068) := '2D76616C7565207B0A2020626F726465722D636F6C6F723A20233030363263633B0A2020636F6C6F723A20233030363263633B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F72';
wwv_flow_api.g_varchar2_table(1069) := '65644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323229202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D6369726375';
wwv_flow_api.g_varchar2_table(1070) := '6C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323229202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B';
wwv_flow_api.g_varchar2_table(1071) := '0A20206261636B67726F756E642D636F6C6F723A20233030366565363B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(1072) := '3A6E74682D6368696C642820323329202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236363373730303B0A2020636F6C6F723A20236363373730303B0A7D0A626F6479202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1073) := '2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C';
wwv_flow_api.g_varchar2_table(1074) := '75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(1075) := '2D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A20236536383630303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1076) := '2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323429202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233361623434663B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1077) := '3361623434663B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323429202E742D426164';
wwv_flow_api.g_varchar2_table(1078) := '67654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(1079) := '3A6E74682D6368696C642820323429202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233036316330613B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(1080) := '654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323529202E742D42616467654C6973742D76616C7565207B0A2020626F726465';
wwv_flow_api.g_varchar2_table(1081) := '722D636F6C6F723A20233733373337373B0A2020636F6C6F723A20233733373337373B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973';
wwv_flow_api.g_varchar2_table(1082) := '742D6974656D3A6E74682D6368696C642820323529202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1083) := '2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323529202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(1084) := '6C6F723A20233830383038343B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032362920';
wwv_flow_api.g_varchar2_table(1085) := '2E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233261383962313B0A2020636F6C6F723A20233261383962313B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467';
wwv_flow_api.g_varchar2_table(1086) := '654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323629202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467';
wwv_flow_api.g_varchar2_table(1087) := '654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323629202E742D42616467654C6973742D76616C75652061207B0A2020636F6C';
wwv_flow_api.g_varchar2_table(1088) := '6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A20233266393963363B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D4261';
wwv_flow_api.g_varchar2_table(1089) := '6467654C6973742D6974656D3A6E74682D6368696C642820323729202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20236363613330303B0A2020636F6C6F723A20236363613330303B0A7D0A626F6479202E';
wwv_flow_api.g_varchar2_table(1090) := '742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323729202E742D42616467654C6973742D77726170202E742D42';
wwv_flow_api.g_varchar2_table(1091) := '616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032372920';
wwv_flow_api.g_varchar2_table(1092) := '2E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233030303030303B0A20206261636B67726F756E642D636F6C6F723A20236536623830303B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E';
wwv_flow_api.g_varchar2_table(1093) := '742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323829202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A2023336261626464';
wwv_flow_api.g_varchar2_table(1094) := '3B0A2020636F6C6F723A20233362616264643B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1095) := '2820323829202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D4261';
wwv_flow_api.g_varchar2_table(1096) := '6467654C6973742D6974656D3A6E74682D6368696C642820323829202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20233032333434613B0A20206261636B67726F756E642D636F6C6F723A20233531623465313B0A7D0A';
wwv_flow_api.g_varchar2_table(1097) := '626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929202E742D42616467654C6973742D76616C';
wwv_flow_api.g_varchar2_table(1098) := '7565207B0A2020626F726465722D636F6C6F723A20236464323531623B0A2020636F6C6F723A20236464323531623B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247';
wwv_flow_api.g_varchar2_table(1099) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A626F6479202E742D42616467654C6973742D2D63697263756C61722E';
wwv_flow_api.g_varchar2_table(1100) := '742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929202E742D42616467654C6973742D76616C75652061207B0A2020636F6C6F723A20236536653665363B0A202062';
wwv_flow_api.g_varchar2_table(1101) := '61636B67726F756E642D636F6C6F723A20236536333532623B0A7D0A626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E7468';
wwv_flow_api.g_varchar2_table(1102) := '2D6368696C642820333029202E742D42616467654C6973742D76616C7565207B0A2020626F726465722D636F6C6F723A20233431343062353B0A2020636F6C6F723A20233431343062353B0A7D0A626F6479202E742D42616467654C6973742D2D636972';
wwv_flow_api.g_varchar2_table(1103) := '63756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029202E742D42616467654C6973742D77726170202E742D42616467654C6973742D76616C75652C0A';
wwv_flow_api.g_varchar2_table(1104) := '626F6479202E742D42616467654C6973742D2D63697263756C61722E742D42616467654C6973742D2D636F6C6F7265644247202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029202E742D42616467654C6973742D76616C';
wwv_flow_api.g_varchar2_table(1105) := '75652061207B0A2020636F6C6F723A20236536653665363B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1106) := '6C6428203129207B0A20206261636B67726F756E642D636F6C6F723A20236666326435353B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031292061207B0A2020636F6C';
wwv_flow_api.g_varchar2_table(1107) := '6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D73';
wwv_flow_api.g_varchar2_table(1108) := '6861646F773A2030202D38707820302030202366663630376520696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203229207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1109) := '2D636F6C6F723A20233030376166663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D436172';
wwv_flow_api.g_varchar2_table(1110) := '64732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870782030203020233333';
wwv_flow_api.g_varchar2_table(1111) := '3935666620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203329207B0A20206261636B67726F756E642D636F6C6F723A20236666393530303B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(1112) := '2D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282033292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D4261646765';
wwv_flow_api.g_varchar2_table(1113) := '4C6973742D6974656D3A6E74682D6368696C642820332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366666161333320696E7365743B0A7D0A2E742D43617264';
wwv_flow_api.g_varchar2_table(1114) := '732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203429207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42';
wwv_flow_api.g_varchar2_table(1115) := '616467654C6973742D6974656D3A6E74682D6368696C64282034292061207B0A2020636F6C6F723A20233037316630623B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820';
wwv_flow_api.g_varchar2_table(1116) := '342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202332616338343520696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1117) := '6973742D6974656D3A6E74682D6368696C6428203529207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1118) := '6C64282035292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820352920612E742D42616467654C6973742D77726170';
wwv_flow_api.g_varchar2_table(1119) := '3A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202361386138616320696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282036';
wwv_flow_api.g_varchar2_table(1120) := '29207B0A20206261636B67726F756E642D636F6C6F723A20233334616164633B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282036292061207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1121) := '6666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820362920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F77';
wwv_flow_api.g_varchar2_table(1122) := '3A2030202D38707820302030202335666263653420696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203729207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1123) := '723A20236666636330303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282037292061207B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D43617264732D2D63';
wwv_flow_api.g_varchar2_table(1124) := '6F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202363636133303020';
wwv_flow_api.g_varchar2_table(1125) := '696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203829207B0A20206261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A2E742D43617264';
wwv_flow_api.g_varchar2_table(1126) := '732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282038292061207B0A2020636F6C6F723A20233032333935323B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1127) := '6974656D3A6E74682D6368696C642820382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202332386237663920696E7365743B0A7D0A2E742D43617264732D2D636F';
wwv_flow_api.g_varchar2_table(1128) := '6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203929207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1129) := '6973742D6974656D3A6E74682D6368696C64282039292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820392920612E';
wwv_flow_api.g_varchar2_table(1130) := '742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663662363320696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D69';
wwv_flow_api.g_varchar2_table(1131) := '74656D3A6E74682D6368696C642820313029207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820';
wwv_flow_api.g_varchar2_table(1132) := '3130292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031302920612E742D42616467654C6973742D777261703A68';
wwv_flow_api.g_varchar2_table(1133) := '6F766572207B0A2020626F782D736861646F773A2030202D38707820302030202338313766653020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313129';
wwv_flow_api.g_varchar2_table(1134) := '207B0A20206261636B67726F756E642D636F6C6F723A20236666353737373B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203131292061207B0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1135) := '6666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031312920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F';
wwv_flow_api.g_varchar2_table(1136) := '773A2030202D38707820302030202366663861613020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313229207B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(1137) := '6C6F723A20233333393566663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203132292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D4361726473';
wwv_flow_api.g_varchar2_table(1138) := '2D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D387078203020302023363661';
wwv_flow_api.g_varchar2_table(1139) := '66666620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313329207B0A20206261636B67726F756E642D636F6C6F723A20236666616133333B0A7D0A2E74';
wwv_flow_api.g_varchar2_table(1140) := '2D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203133292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467';
wwv_flow_api.g_varchar2_table(1141) := '654C6973742D6974656D3A6E74682D6368696C64282031332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663935303020696E7365743B0A7D0A2E742D4361';
wwv_flow_api.g_varchar2_table(1142) := '7264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313429207B0A20206261636B67726F756E642D636F6C6F723A20233730653138333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E';
wwv_flow_api.g_varchar2_table(1143) := '742D42616467654C6973742D6974656D3A6E74682D6368696C6428203134292061207B0A2020636F6C6F723A20233338346333633B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D636869';
wwv_flow_api.g_varchar2_table(1144) := '6C64282031342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202334366438356620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42';
wwv_flow_api.g_varchar2_table(1145) := '616467654C6973742D6974656D3A6E74682D6368696C642820313529207B0A20206261636B67726F756E642D636F6C6F723A20236135613561393B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E';
wwv_flow_api.g_varchar2_table(1146) := '74682D6368696C6428203135292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031352920612E742D42616467654C';
wwv_flow_api.g_varchar2_table(1147) := '6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202362666266633220696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D';
wwv_flow_api.g_varchar2_table(1148) := '6368696C642820313629207B0A20206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203136292061207B0A';
wwv_flow_api.g_varchar2_table(1149) := '2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031362920612E742D42616467654C6973742D777261703A686F766572207B0A20';
wwv_flow_api.g_varchar2_table(1150) := '20626F782D736861646F773A2030202D38707820302030202333316139646220696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313729207B0A2020626163';
wwv_flow_api.g_varchar2_table(1151) := '6B67726F756E642D636F6C6F723A20236666643633333B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203137292061207B0A2020636F6C6F723A20233333333333333B0A';
wwv_flow_api.g_varchar2_table(1152) := '7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031372920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D3870';
wwv_flow_api.g_varchar2_table(1153) := '7820302030202366666363303020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313829207B0A20206261636B67726F756E642D636F6C6F723A20233762';
wwv_flow_api.g_varchar2_table(1154) := '643366623B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203138292061207B0A2020636F6C6F723A20233335363137353B0A7D0A2E742D43617264732D2D636F6C6F7269';
wwv_flow_api.g_varchar2_table(1155) := '7A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282031382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202334396332666120696E7365';
wwv_flow_api.g_varchar2_table(1156) := '743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820313929207B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A2E742D43617264732D2D';
wwv_flow_api.g_varchar2_table(1157) := '636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203139292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974';
wwv_flow_api.g_varchar2_table(1158) := '656D3A6E74682D6368696C64282031392920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366663932386320696E7365743B0A7D0A2E742D43617264732D2D636F6C';
wwv_flow_api.g_varchar2_table(1159) := '6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323029207B0A20206261636B67726F756E642D636F6C6F723A20233739373864653B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C';
wwv_flow_api.g_varchar2_table(1160) := '6973742D6974656D3A6E74682D6368696C6428203230292061207B0A2020636F6C6F723A20236666666666663B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032302920';
wwv_flow_api.g_varchar2_table(1161) := '612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202361326131653820696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C697374';
wwv_flow_api.g_varchar2_table(1162) := '2D6974656D3A6E74682D6368696C642820323129207B0A20206261636B67726F756E642D636F6C6F723A20236536323934643B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1163) := '28203231292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032312920612E742D42616467654C6973742D77726170';
wwv_flow_api.g_varchar2_table(1164) := '3A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365623536373220696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032';
wwv_flow_api.g_varchar2_table(1165) := '3229207B0A20206261636B67726F756E642D636F6C6F723A20233030366565363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203232292061207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(1166) := '20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032322920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(1167) := '646F773A2030202D38707820302030202331613837666620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323329207B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(1168) := '636F6C6F723A20236536383630303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203233292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D436172';
wwv_flow_api.g_varchar2_table(1169) := '64732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032332920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202366';
wwv_flow_api.g_varchar2_table(1170) := '666130316120696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323429207B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A';
wwv_flow_api.g_varchar2_table(1171) := '2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203234292061207B0A2020636F6C6F723A20233036316330613B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D4261';
wwv_flow_api.g_varchar2_table(1172) := '6467654C6973742D6974656D3A6E74682D6368696C64282032342920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202336626430376320696E7365743B0A7D0A2E742D';
wwv_flow_api.g_varchar2_table(1173) := '43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323529207B0A20206261636B67726F756E642D636F6C6F723A20233830383038343B0A7D0A2E742D43617264732D2D636F6C6F72697A65';
wwv_flow_api.g_varchar2_table(1174) := '202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203235292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D63';
wwv_flow_api.g_varchar2_table(1175) := '68696C64282032352920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202339613961396420696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E74';
wwv_flow_api.g_varchar2_table(1176) := '2D42616467654C6973742D6974656D3A6E74682D6368696C642820323629207B0A20206261636B67726F756E642D636F6C6F723A20233266393963363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D';
wwv_flow_api.g_varchar2_table(1177) := '3A6E74682D6368696C6428203236292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032362920612E742D42616467';
wwv_flow_api.g_varchar2_table(1178) := '654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202335326166643620696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74';
wwv_flow_api.g_varchar2_table(1179) := '682D6368696C642820323729207B0A20206261636B67726F756E642D636F6C6F723A20236536623830303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323729206120';
wwv_flow_api.g_varchar2_table(1180) := '7B0A2020636F6C6F723A20233030303030303B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032372920612E742D42616467654C6973742D777261703A686F766572207B';
wwv_flow_api.g_varchar2_table(1181) := '0A2020626F782D736861646F773A2030202D38707820302030202362333866303020696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323829207B0A202062';
wwv_flow_api.g_varchar2_table(1182) := '61636B67726F756E642D636F6C6F723A20233531623465313B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203238292061207B0A2020636F6C6F723A2023303233343461';
wwv_flow_api.g_varchar2_table(1183) := '3B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032382920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D';
wwv_flow_api.g_varchar2_table(1184) := '38707820302030202337636337653920696E7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820323929207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1185) := '6536333532623B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203239292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F';
wwv_flow_api.g_varchar2_table(1186) := '72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C64282032392920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202365623630353920696E';
wwv_flow_api.g_varchar2_table(1187) := '7365743B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C642820333029207B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A2E742D4361726473';
wwv_flow_api.g_varchar2_table(1188) := '2D2D636F6C6F72697A65202E742D42616467654C6973742D6974656D3A6E74682D6368696C6428203330292061207B0A2020636F6C6F723A20236536653665363B0A7D0A2E742D43617264732D2D636F6C6F72697A65202E742D42616467654C6973742D';
wwv_flow_api.g_varchar2_table(1189) := '6974656D3A6E74682D6368696C64282033302920612E742D42616467654C6973742D777261703A686F766572207B0A2020626F782D736861646F773A2030202D38707820302030202337353733636520696E7365743B0A7D0A2E752D436F6C6F7242472D';
wwv_flow_api.g_varchar2_table(1190) := '2D31207B0A20206261636B67726F756E642D636F6C6F723A20236666326435353B0A7D0A2E752D436F6C6F7246472D2D31207B0A2020636F6C6F723A20236666326435353B0A7D0A2E752D436F6C6F7242472D2D32207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1191) := '2D636F6C6F723A20233030376166663B0A7D0A2E752D436F6C6F7246472D2D32207B0A2020636F6C6F723A20233030376166663B0A7D0A2E752D436F6C6F7242472D2D33207B0A20206261636B67726F756E642D636F6C6F723A20236666393530303B0A';
wwv_flow_api.g_varchar2_table(1192) := '7D0A2E752D436F6C6F7246472D2D33207B0A2020636F6C6F723A20236666393530303B0A7D0A2E752D436F6C6F7242472D2D34207B0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0A7D0A2E752D436F6C6F7246472D2D34207B';
wwv_flow_api.g_varchar2_table(1193) := '0A2020636F6C6F723A20233463643936343B0A7D0A2E752D436F6C6F7242472D2D35207B0A20206261636B67726F756E642D636F6C6F723A20233865386539333B0A7D0A2E752D436F6C6F7246472D2D35207B0A2020636F6C6F723A2023386538653933';
wwv_flow_api.g_varchar2_table(1194) := '3B0A7D0A2E752D436F6C6F7242472D2D36207B0A20206261636B67726F756E642D636F6C6F723A20233334616164633B0A7D0A2E752D436F6C6F7246472D2D36207B0A2020636F6C6F723A20233334616164633B0A7D0A2E752D436F6C6F7242472D2D37';
wwv_flow_api.g_varchar2_table(1195) := '207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A7D0A2E752D436F6C6F7246472D2D37207B0A2020636F6C6F723A20236666636330303B0A7D0A2E752D436F6C6F7242472D2D38207B0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(1196) := '6F6C6F723A20233561633866613B0A7D0A2E752D436F6C6F7246472D2D38207B0A2020636F6C6F723A20233561633866613B0A7D0A2E752D436F6C6F7242472D2D39207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A';
wwv_flow_api.g_varchar2_table(1197) := '2E752D436F6C6F7246472D2D39207B0A2020636F6C6F723A20236666336233303B0A7D0A2E752D436F6C6F7242472D2D3130207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A2E752D436F6C6F7246472D2D3130207B';
wwv_flow_api.g_varchar2_table(1198) := '0A2020636F6C6F723A20233538353664363B0A7D0A2E752D436F6C6F7242472D2D3131207B0A20206261636B67726F756E642D636F6C6F723A20236666353737373B0A7D0A2E752D436F6C6F7246472D2D3131207B0A2020636F6C6F723A202366663537';
wwv_flow_api.g_varchar2_table(1199) := '37373B0A7D0A2E752D436F6C6F7242472D2D3132207B0A20206261636B67726F756E642D636F6C6F723A20233333393566663B0A7D0A2E752D436F6C6F7246472D2D3132207B0A2020636F6C6F723A20233333393566663B0A7D0A2E752D436F6C6F7242';
wwv_flow_api.g_varchar2_table(1200) := '472D2D3133207B0A20206261636B67726F756E642D636F6C6F723A20236666616133333B0A7D0A2E752D436F6C6F7246472D2D3133207B0A2020636F6C6F723A20236666616133333B0A7D0A2E752D436F6C6F7242472D2D3134207B0A20206261636B67';
wwv_flow_api.g_varchar2_table(1201) := '726F756E642D636F6C6F723A20233730653138333B0A7D0A2E752D436F6C6F7246472D2D3134207B0A2020636F6C6F723A20233730653138333B0A7D0A2E752D436F6C6F7242472D2D3135207B0A20206261636B67726F756E642D636F6C6F723A202361';
wwv_flow_api.g_varchar2_table(1202) := '35613561393B0A7D0A2E752D436F6C6F7246472D2D3135207B0A2020636F6C6F723A20236135613561393B0A7D0A2E752D436F6C6F7242472D2D3136207B0A20206261636B67726F756E642D636F6C6F723A20233564626265333B0A7D0A2E752D436F6C';
wwv_flow_api.g_varchar2_table(1203) := '6F7246472D2D3136207B0A2020636F6C6F723A20233564626265333B0A7D0A2E752D436F6C6F7242472D2D3137207B0A20206261636B67726F756E642D636F6C6F723A20236666643633333B0A7D0A2E752D436F6C6F7246472D2D3137207B0A2020636F';
wwv_flow_api.g_varchar2_table(1204) := '6C6F723A20236666643633333B0A7D0A2E752D436F6C6F7242472D2D3138207B0A20206261636B67726F756E642D636F6C6F723A20233762643366623B0A7D0A2E752D436F6C6F7246472D2D3138207B0A2020636F6C6F723A20233762643366623B0A7D';
wwv_flow_api.g_varchar2_table(1205) := '0A2E752D436F6C6F7242472D2D3139207B0A20206261636B67726F756E642D636F6C6F723A20236666363235393B0A7D0A2E752D436F6C6F7246472D2D3139207B0A2020636F6C6F723A20236666363235393B0A7D0A2E752D436F6C6F7242472D2D3230';
wwv_flow_api.g_varchar2_table(1206) := '207B0A20206261636B67726F756E642D636F6C6F723A20233739373864653B0A7D0A2E752D436F6C6F7246472D2D3230207B0A2020636F6C6F723A20233739373864653B0A7D0A2E752D436F6C6F7242472D2D3231207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1207) := '2D636F6C6F723A20236536323934643B0A7D0A2E752D436F6C6F7246472D2D3231207B0A2020636F6C6F723A20236536323934643B0A7D0A2E752D436F6C6F7242472D2D3232207B0A20206261636B67726F756E642D636F6C6F723A2023303036656536';
wwv_flow_api.g_varchar2_table(1208) := '3B0A7D0A2E752D436F6C6F7246472D2D3232207B0A2020636F6C6F723A20233030366565363B0A7D0A2E752D436F6C6F7242472D2D3233207B0A20206261636B67726F756E642D636F6C6F723A20236536383630303B0A7D0A2E752D436F6C6F7246472D';
wwv_flow_api.g_varchar2_table(1209) := '2D3233207B0A2020636F6C6F723A20236536383630303B0A7D0A2E752D436F6C6F7242472D2D3234207B0A20206261636B67726F756E642D636F6C6F723A20233434633335613B0A7D0A2E752D436F6C6F7246472D2D3234207B0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1210) := '233434633335613B0A7D0A2E752D436F6C6F7242472D2D3235207B0A20206261636B67726F756E642D636F6C6F723A20233830383038343B0A7D0A2E752D436F6C6F7246472D2D3235207B0A2020636F6C6F723A20233830383038343B0A7D0A2E752D43';
wwv_flow_api.g_varchar2_table(1211) := '6F6C6F7242472D2D3236207B0A20206261636B67726F756E642D636F6C6F723A20233266393963363B0A7D0A2E752D436F6C6F7246472D2D3236207B0A2020636F6C6F723A20233266393963363B0A7D0A2E752D436F6C6F7242472D2D3237207B0A2020';
wwv_flow_api.g_varchar2_table(1212) := '6261636B67726F756E642D636F6C6F723A20236536623830303B0A7D0A2E752D436F6C6F7246472D2D3237207B0A2020636F6C6F723A20236536623830303B0A7D0A2E752D436F6C6F7242472D2D3238207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1213) := '723A20233531623465313B0A7D0A2E752D436F6C6F7246472D2D3238207B0A2020636F6C6F723A20233531623465313B0A7D0A2E752D436F6C6F7242472D2D3239207B0A20206261636B67726F756E642D636F6C6F723A20236536333532623B0A7D0A2E';
wwv_flow_api.g_varchar2_table(1214) := '752D436F6C6F7246472D2D3239207B0A2020636F6C6F723A20236536333532623B0A7D0A2E752D436F6C6F7242472D2D3330207B0A20206261636B67726F756E642D636F6C6F723A20233466346463313B0A7D0A2E752D436F6C6F7246472D2D3330207B';
wwv_flow_api.g_varchar2_table(1215) := '0A2020636F6C6F723A20233466346463313B0A7D0A0A2E752D436F6C6F722D312D42472D2D747874207B0A2020636F6C6F723A20236666326435353B0A7D0A2E752D436F6C6F722D312D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1216) := '723A20236666326435353B0A7D0A2E752D436F6C6F722D312D42472D2D66696C6C207B0A202066696C6C3A20236666326435353B0A7D0A2E752D436F6C6F722D312D42472D2D6272207B0A20207374726F6B653A20236666326435353B0A2020626F7264';
wwv_flow_api.g_varchar2_table(1217) := '65722D636F6C6F723A20236666326435353B0A7D0A2E752D436F6C6F722D312D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D312D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(1218) := '3A20236666666666663B0A7D0A2E752D436F6C6F722D312D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D312D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465';
wwv_flow_api.g_varchar2_table(1219) := '722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D322D42472D2D747874207B0A2020636F6C6F723A20233030376166663B0A7D0A2E752D436F6C6F722D322D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1220) := '20233030376166663B0A7D0A2E752D436F6C6F722D322D42472D2D66696C6C207B0A202066696C6C3A20233030376166663B0A7D0A2E752D436F6C6F722D322D42472D2D6272207B0A20207374726F6B653A20233030376166663B0A2020626F72646572';
wwv_flow_api.g_varchar2_table(1221) := '2D636F6C6F723A20233030376166663B0A7D0A2E752D436F6C6F722D322D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D322D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1222) := '236666666666663B0A7D0A2E752D436F6C6F722D322D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D322D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(1223) := '636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D332D42472D2D747874207B0A2020636F6C6F723A20236666393530303B0A7D0A2E752D436F6C6F722D332D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1224) := '6666393530303B0A7D0A2E752D436F6C6F722D332D42472D2D66696C6C207B0A202066696C6C3A20236666393530303B0A7D0A2E752D436F6C6F722D332D42472D2D6272207B0A20207374726F6B653A20236666393530303B0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(1225) := '6F6C6F723A20236666393530303B0A7D0A2E752D436F6C6F722D332D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D332D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1226) := '66666666663B0A7D0A2E752D436F6C6F722D332D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D332D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(1227) := '6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D342D42472D2D747874207B0A2020636F6C6F723A20233463643936343B0A7D0A2E752D436F6C6F722D342D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233463';
wwv_flow_api.g_varchar2_table(1228) := '643936343B0A7D0A2E752D436F6C6F722D342D42472D2D66696C6C207B0A202066696C6C3A20233463643936343B0A7D0A2E752D436F6C6F722D342D42472D2D6272207B0A20207374726F6B653A20233463643936343B0A2020626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(1229) := '6F723A20233463643936343B0A7D0A2E752D436F6C6F722D342D46472D2D747874207B0A2020636F6C6F723A20233037316630623B0A7D0A2E752D436F6C6F722D342D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023303731';
wwv_flow_api.g_varchar2_table(1230) := '6630623B0A7D0A2E752D436F6C6F722D342D46472D2D66696C6C207B0A202066696C6C3A20233037316630623B0A7D0A2E752D436F6C6F722D342D46472D2D6272207B0A20207374726F6B653A20233037316630623B0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(1231) := '723A20233037316630623B0A7D0A2E752D436F6C6F722D352D42472D2D747874207B0A2020636F6C6F723A20233865386539333B0A7D0A2E752D436F6C6F722D352D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A202338653865';
wwv_flow_api.g_varchar2_table(1232) := '39333B0A7D0A2E752D436F6C6F722D352D42472D2D66696C6C207B0A202066696C6C3A20233865386539333B0A7D0A2E752D436F6C6F722D352D42472D2D6272207B0A20207374726F6B653A20233865386539333B0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(1233) := '3A20233865386539333B0A7D0A2E752D436F6C6F722D352D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D352D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(1234) := '663B0A7D0A2E752D436F6C6F722D352D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D352D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1235) := '20236666666666663B0A7D0A2E752D436F6C6F722D362D42472D2D747874207B0A2020636F6C6F723A20233334616164633B0A7D0A2E752D436F6C6F722D362D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023333461616463';
wwv_flow_api.g_varchar2_table(1236) := '3B0A7D0A2E752D436F6C6F722D362D42472D2D66696C6C207B0A202066696C6C3A20233334616164633B0A7D0A2E752D436F6C6F722D362D42472D2D6272207B0A20207374726F6B653A20233334616164633B0A2020626F726465722D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1237) := '233334616164633B0A7D0A2E752D436F6C6F722D362D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D362D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(1238) := '0A7D0A2E752D436F6C6F722D362D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D362D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1239) := '6666666666663B0A7D0A2E752D436F6C6F722D372D42472D2D747874207B0A2020636F6C6F723A20236666636330303B0A7D0A2E752D436F6C6F722D372D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0A';
wwv_flow_api.g_varchar2_table(1240) := '7D0A2E752D436F6C6F722D372D42472D2D66696C6C207B0A202066696C6C3A20236666636330303B0A7D0A2E752D436F6C6F722D372D42472D2D6272207B0A20207374726F6B653A20236666636330303B0A2020626F726465722D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1241) := '66636330303B0A7D0A2E752D436F6C6F722D372D46472D2D747874207B0A2020636F6C6F723A20233030303030303B0A7D0A2E752D436F6C6F722D372D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233030303030303B0A7D';
wwv_flow_api.g_varchar2_table(1242) := '0A2E752D436F6C6F722D372D46472D2D66696C6C207B0A202066696C6C3A20233030303030303B0A7D0A2E752D436F6C6F722D372D46472D2D6272207B0A20207374726F6B653A20233030303030303B0A2020626F726465722D636F6C6F723A20233030';
wwv_flow_api.g_varchar2_table(1243) := '303030303B0A7D0A2E752D436F6C6F722D382D42472D2D747874207B0A2020636F6C6F723A20233561633866613B0A7D0A2E752D436F6C6F722D382D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233561633866613B0A7D0A';
wwv_flow_api.g_varchar2_table(1244) := '2E752D436F6C6F722D382D42472D2D66696C6C207B0A202066696C6C3A20233561633866613B0A7D0A2E752D436F6C6F722D382D42472D2D6272207B0A20207374726F6B653A20233561633866613B0A2020626F726465722D636F6C6F723A2023356163';
wwv_flow_api.g_varchar2_table(1245) := '3866613B0A7D0A2E752D436F6C6F722D382D46472D2D747874207B0A2020636F6C6F723A20233032333935323B0A7D0A2E752D436F6C6F722D382D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233032333935323B0A7D0A2E';
wwv_flow_api.g_varchar2_table(1246) := '752D436F6C6F722D382D46472D2D66696C6C207B0A202066696C6C3A20233032333935323B0A7D0A2E752D436F6C6F722D382D46472D2D6272207B0A20207374726F6B653A20233032333935323B0A2020626F726465722D636F6C6F723A202330323339';
wwv_flow_api.g_varchar2_table(1247) := '35323B0A7D0A2E752D436F6C6F722D392D42472D2D747874207B0A2020636F6C6F723A20236666336233303B0A7D0A2E752D436F6C6F722D392D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1248) := '2D436F6C6F722D392D42472D2D66696C6C207B0A202066696C6C3A20236666336233303B0A7D0A2E752D436F6C6F722D392D42472D2D6272207B0A20207374726F6B653A20236666336233303B0A2020626F726465722D636F6C6F723A20236666336233';
wwv_flow_api.g_varchar2_table(1249) := '303B0A7D0A2E752D436F6C6F722D392D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D392D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1250) := '436F6C6F722D392D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D392D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(1251) := '3B0A7D0A2E752D436F6C6F722D31302D42472D2D747874207B0A2020636F6C6F723A20233538353664363B0A7D0A2E752D436F6C6F722D31302D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233538353664363B0A7D0A2E75';
wwv_flow_api.g_varchar2_table(1252) := '2D436F6C6F722D31302D42472D2D66696C6C207B0A202066696C6C3A20233538353664363B0A7D0A2E752D436F6C6F722D31302D42472D2D6272207B0A20207374726F6B653A20233538353664363B0A2020626F726465722D636F6C6F723A2023353835';
wwv_flow_api.g_varchar2_table(1253) := '3664363B0A7D0A2E752D436F6C6F722D31302D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31302D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D';
wwv_flow_api.g_varchar2_table(1254) := '0A2E752D436F6C6F722D31302D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31302D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1255) := '6666666666663B0A7D0A2E752D436F6C6F722D31312D42472D2D747874207B0A2020636F6C6F723A20236639303032663B0A7D0A2E752D436F6C6F722D31312D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023663930303266';
wwv_flow_api.g_varchar2_table(1256) := '3B0A7D0A2E752D436F6C6F722D31312D42472D2D66696C6C207B0A202066696C6C3A20236639303032663B0A7D0A2E752D436F6C6F722D31312D42472D2D6272207B0A20207374726F6B653A20236639303032663B0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(1257) := '3A20236639303032663B0A7D0A2E752D436F6C6F722D31312D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31312D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023666666';
wwv_flow_api.g_varchar2_table(1258) := '6666663B0A7D0A2E752D436F6C6F722D31312D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31312D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(1259) := '6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31322D42472D2D747874207B0A2020636F6C6F723A20233030363263633B0A7D0A2E752D436F6C6F722D31322D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1260) := '3030363263633B0A7D0A2E752D436F6C6F722D31322D42472D2D66696C6C207B0A202066696C6C3A20233030363263633B0A7D0A2E752D436F6C6F722D31322D42472D2D6272207B0A20207374726F6B653A20233030363263633B0A2020626F72646572';
wwv_flow_api.g_varchar2_table(1261) := '2D636F6C6F723A20233030363263633B0A7D0A2E752D436F6C6F722D31322D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31322D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(1262) := '3A20236666666666663B0A7D0A2E752D436F6C6F722D31322D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31322D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F72';
wwv_flow_api.g_varchar2_table(1263) := '6465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31332D42472D2D747874207B0A2020636F6C6F723A20236363373730303B0A7D0A2E752D436F6C6F722D31332D42472D2D6267207B0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(1264) := '6C6F723A20236363373730303B0A7D0A2E752D436F6C6F722D31332D42472D2D66696C6C207B0A202066696C6C3A20236363373730303B0A7D0A2E752D436F6C6F722D31332D42472D2D6272207B0A20207374726F6B653A20236363373730303B0A2020';
wwv_flow_api.g_varchar2_table(1265) := '626F726465722D636F6C6F723A20236363373730303B0A7D0A2E752D436F6C6F722D31332D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31332D46472D2D6267207B0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1266) := '2D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31332D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31332D46472D2D6272207B0A20207374726F6B653A20236666666666663B';
wwv_flow_api.g_varchar2_table(1267) := '0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31342D42472D2D747874207B0A2020636F6C6F723A20233261633834353B0A7D0A2E752D436F6C6F722D31342D42472D2D6267207B0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1268) := '756E642D636F6C6F723A20233261633834353B0A7D0A2E752D436F6C6F722D31342D42472D2D66696C6C207B0A202066696C6C3A20233261633834353B0A7D0A2E752D436F6C6F722D31342D42472D2D6272207B0A20207374726F6B653A202332616338';
wwv_flow_api.g_varchar2_table(1269) := '34353B0A2020626F726465722D636F6C6F723A20233261633834353B0A7D0A2E752D436F6C6F722D31342D46472D2D747874207B0A2020636F6C6F723A20233130343931393B0A7D0A2E752D436F6C6F722D31342D46472D2D6267207B0A20206261636B';
wwv_flow_api.g_varchar2_table(1270) := '67726F756E642D636F6C6F723A20233130343931393B0A7D0A2E752D436F6C6F722D31342D46472D2D66696C6C207B0A202066696C6C3A20233130343931393B0A7D0A2E752D436F6C6F722D31342D46472D2D6272207B0A20207374726F6B653A202331';
wwv_flow_api.g_varchar2_table(1271) := '30343931393B0A2020626F726465722D636F6C6F723A20233130343931393B0A7D0A2E752D436F6C6F722D31352D42472D2D747874207B0A2020636F6C6F723A20233734373437613B0A7D0A2E752D436F6C6F722D31352D42472D2D6267207B0A202062';
wwv_flow_api.g_varchar2_table(1272) := '61636B67726F756E642D636F6C6F723A20233734373437613B0A7D0A2E752D436F6C6F722D31352D42472D2D66696C6C207B0A202066696C6C3A20233734373437613B0A7D0A2E752D436F6C6F722D31352D42472D2D6272207B0A20207374726F6B653A';
wwv_flow_api.g_varchar2_table(1273) := '20233734373437613B0A2020626F726465722D636F6C6F723A20233734373437613B0A7D0A2E752D436F6C6F722D31352D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31352D46472D2D6267207B0A';
wwv_flow_api.g_varchar2_table(1274) := '20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31352D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31352D46472D2D6272207B0A20207374726F';
wwv_flow_api.g_varchar2_table(1275) := '6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31362D42472D2D747874207B0A2020636F6C6F723A20233231386562643B0A7D0A2E752D436F6C6F722D31362D42472D2D6267';
wwv_flow_api.g_varchar2_table(1276) := '207B0A20206261636B67726F756E642D636F6C6F723A20233231386562643B0A7D0A2E752D436F6C6F722D31362D42472D2D66696C6C207B0A202066696C6C3A20233231386562643B0A7D0A2E752D436F6C6F722D31362D42472D2D6272207B0A202073';
wwv_flow_api.g_varchar2_table(1277) := '74726F6B653A20233231386562643B0A2020626F726465722D636F6C6F723A20233231386562643B0A7D0A2E752D436F6C6F722D31362D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31362D46472D';
wwv_flow_api.g_varchar2_table(1278) := '2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31362D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D31362D46472D2D6272207B0A';
wwv_flow_api.g_varchar2_table(1279) := '20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31372D42472D2D747874207B0A2020636F6C6F723A20236363613330303B0A7D0A2E752D436F6C6F722D31372D';
wwv_flow_api.g_varchar2_table(1280) := '42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236363613330303B0A7D0A2E752D436F6C6F722D31372D42472D2D66696C6C207B0A202066696C6C3A20236363613330303B0A7D0A2E752D436F6C6F722D31372D42472D2D6272';
wwv_flow_api.g_varchar2_table(1281) := '207B0A20207374726F6B653A20236363613330303B0A2020626F726465722D636F6C6F723A20236363613330303B0A7D0A2E752D436F6C6F722D31372D46472D2D747874207B0A2020636F6C6F723A20233161316131613B0A7D0A2E752D436F6C6F722D';
wwv_flow_api.g_varchar2_table(1282) := '31372D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233161316131613B0A7D0A2E752D436F6C6F722D31372D46472D2D66696C6C207B0A202066696C6C3A20233161316131613B0A7D0A2E752D436F6C6F722D31372D46472D';
wwv_flow_api.g_varchar2_table(1283) := '2D6272207B0A20207374726F6B653A20233161316131613B0A2020626F726465722D636F6C6F723A20233161316131613B0A7D0A2E752D436F6C6F722D31382D42472D2D747874207B0A2020636F6C6F723A20233238623766393B0A7D0A2E752D436F6C';
wwv_flow_api.g_varchar2_table(1284) := '6F722D31382D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233238623766393B0A7D0A2E752D436F6C6F722D31382D42472D2D66696C6C207B0A202066696C6C3A20233238623766393B0A7D0A2E752D436F6C6F722D31382D';
wwv_flow_api.g_varchar2_table(1285) := '42472D2D6272207B0A20207374726F6B653A20233238623766393B0A2020626F726465722D636F6C6F723A20233238623766393B0A7D0A2E752D436F6C6F722D31382D46472D2D747874207B0A2020636F6C6F723A20233034356338343B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1286) := '436F6C6F722D31382D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233034356338343B0A7D0A2E752D436F6C6F722D31382D46472D2D66696C6C207B0A202066696C6C3A20233034356338343B0A7D0A2E752D436F6C6F722D';
wwv_flow_api.g_varchar2_table(1287) := '31382D46472D2D6272207B0A20207374726F6B653A20233034356338343B0A2020626F726465722D636F6C6F723A20233034356338343B0A7D0A2E752D436F6C6F722D31392D42472D2D747874207B0A2020636F6C6F723A20236663306430303B0A7D0A';
wwv_flow_api.g_varchar2_table(1288) := '2E752D436F6C6F722D31392D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236663306430303B0A7D0A2E752D436F6C6F722D31392D42472D2D66696C6C207B0A202066696C6C3A20236663306430303B0A7D0A2E752D436F6C';
wwv_flow_api.g_varchar2_table(1289) := '6F722D31392D42472D2D6272207B0A20207374726F6B653A20236663306430303B0A2020626F726465722D636F6C6F723A20236663306430303B0A7D0A2E752D436F6C6F722D31392D46472D2D747874207B0A2020636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(1290) := '0A7D0A2E752D436F6C6F722D31392D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D31392D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1291) := '436F6C6F722D31392D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32302D42472D2D747874207B0A2020636F6C6F723A202333333331';
wwv_flow_api.g_varchar2_table(1292) := '63383B0A7D0A2E752D436F6C6F722D32302D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233333333163383B0A7D0A2E752D436F6C6F722D32302D42472D2D66696C6C207B0A202066696C6C3A20233333333163383B0A7D0A';
wwv_flow_api.g_varchar2_table(1293) := '2E752D436F6C6F722D32302D42472D2D6272207B0A20207374726F6B653A20233333333163383B0A2020626F726465722D636F6C6F723A20233333333163383B0A7D0A2E752D436F6C6F722D32302D46472D2D747874207B0A2020636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1294) := '66666666663B0A7D0A2E752D436F6C6F722D32302D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32302D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B';
wwv_flow_api.g_varchar2_table(1295) := '0A7D0A2E752D436F6C6F722D32302D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32312D42472D2D747874207B0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(1296) := '20236666393361383B0A7D0A2E752D436F6C6F722D32312D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666393361383B0A7D0A2E752D436F6C6F722D32312D42472D2D66696C6C207B0A202066696C6C3A202366663933';
wwv_flow_api.g_varchar2_table(1297) := '61383B0A7D0A2E752D436F6C6F722D32312D42472D2D6272207B0A20207374726F6B653A20236666393361383B0A2020626F726465722D636F6C6F723A20236666393361383B0A7D0A2E752D436F6C6F722D32312D46472D2D747874207B0A2020636F6C';
wwv_flow_api.g_varchar2_table(1298) := '6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32312D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32312D46472D2D66696C6C207B0A202066696C6C3A202366';
wwv_flow_api.g_varchar2_table(1299) := '66666666663B0A7D0A2E752D436F6C6F722D32312D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32322D42472D2D747874207B0A2020';
wwv_flow_api.g_varchar2_table(1300) := '636F6C6F723A20233636616666663B0A7D0A2E752D436F6C6F722D32322D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233636616666663B0A7D0A2E752D436F6C6F722D32322D42472D2D66696C6C207B0A202066696C6C3A';
wwv_flow_api.g_varchar2_table(1301) := '20233636616666663B0A7D0A2E752D436F6C6F722D32322D42472D2D6272207B0A20207374726F6B653A20233636616666663B0A2020626F726465722D636F6C6F723A20233636616666663B0A7D0A2E752D436F6C6F722D32322D46472D2D747874207B';
wwv_flow_api.g_varchar2_table(1302) := '0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32322D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32322D46472D2D66696C6C207B0A20206669';
wwv_flow_api.g_varchar2_table(1303) := '6C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32322D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32332D42472D2D7478';
wwv_flow_api.g_varchar2_table(1304) := '74207B0A2020636F6C6F723A20236666626636363B0A7D0A2E752D436F6C6F722D32332D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666626636363B0A7D0A2E752D436F6C6F722D32332D42472D2D66696C6C207B0A20';
wwv_flow_api.g_varchar2_table(1305) := '2066696C6C3A20236666626636363B0A7D0A2E752D436F6C6F722D32332D42472D2D6272207B0A20207374726F6B653A20236666626636363B0A2020626F726465722D636F6C6F723A20236666626636363B0A7D0A2E752D436F6C6F722D32332D46472D';
wwv_flow_api.g_varchar2_table(1306) := '2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32332D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32332D46472D2D66696C6C20';
wwv_flow_api.g_varchar2_table(1307) := '7B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32332D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32342D';
wwv_flow_api.g_varchar2_table(1308) := '42472D2D747874207B0A2020636F6C6F723A20236130656261643B0A7D0A2E752D436F6C6F722D32342D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236130656261643B0A7D0A2E752D436F6C6F722D32342D42472D2D6669';
wwv_flow_api.g_varchar2_table(1309) := '6C6C207B0A202066696C6C3A20236130656261643B0A7D0A2E752D436F6C6F722D32342D42472D2D6272207B0A20207374726F6B653A20236130656261643B0A2020626F726465722D636F6C6F723A20236130656261643B0A7D0A2E752D436F6C6F722D';
wwv_flow_api.g_varchar2_table(1310) := '32342D46472D2D747874207B0A2020636F6C6F723A20233139373332383B0A7D0A2E752D436F6C6F722D32342D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233139373332383B0A7D0A2E752D436F6C6F722D32342D46472D';
wwv_flow_api.g_varchar2_table(1311) := '2D66696C6C207B0A202066696C6C3A20233139373332383B0A7D0A2E752D436F6C6F722D32342D46472D2D6272207B0A20207374726F6B653A20233139373332383B0A2020626F726465722D636F6C6F723A20233139373332383B0A7D0A2E752D436F6C';
wwv_flow_api.g_varchar2_table(1312) := '6F722D32352D42472D2D747874207B0A2020636F6C6F723A20236332633263353B0A7D0A2E752D436F6C6F722D32352D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236332633263353B0A7D0A2E752D436F6C6F722D32352D';
wwv_flow_api.g_varchar2_table(1313) := '42472D2D66696C6C207B0A202066696C6C3A20236332633263353B0A7D0A2E752D436F6C6F722D32352D42472D2D6272207B0A20207374726F6B653A20236332633263353B0A2020626F726465722D636F6C6F723A20236332633263353B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1314) := '436F6C6F722D32352D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32352D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D';
wwv_flow_api.g_varchar2_table(1315) := '32352D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32352D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A';
wwv_flow_api.g_varchar2_table(1316) := '2E752D436F6C6F722D32362D42472D2D747874207B0A2020636F6C6F723A20233862636565623B0A7D0A2E752D436F6C6F722D32362D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233862636565623B0A7D0A2E752D436F6C';
wwv_flow_api.g_varchar2_table(1317) := '6F722D32362D42472D2D66696C6C207B0A202066696C6C3A20233862636565623B0A7D0A2E752D436F6C6F722D32362D42472D2D6272207B0A20207374726F6B653A20233862636565623B0A2020626F726465722D636F6C6F723A20233862636565623B';
wwv_flow_api.g_varchar2_table(1318) := '0A7D0A2E752D436F6C6F722D32362D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32362D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0A7D0A2E752D';
wwv_flow_api.g_varchar2_table(1319) := '436F6C6F722D32362D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32362D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A2020626F726465722D636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(1320) := '66663B0A7D0A2E752D436F6C6F722D32372D42472D2D747874207B0A2020636F6C6F723A20236666653036363B0A7D0A2E752D436F6C6F722D32372D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20236666653036363B0A7D0A';
wwv_flow_api.g_varchar2_table(1321) := '2E752D436F6C6F722D32372D42472D2D66696C6C207B0A202066696C6C3A20236666653036363B0A7D0A2E752D436F6C6F722D32372D42472D2D6272207B0A20207374726F6B653A20236666653036363B0A2020626F726465722D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1322) := '66653036363B0A7D0A2E752D436F6C6F722D32372D46472D2D747874207B0A2020636F6C6F723A20233333333333333B0A7D0A2E752D436F6C6F722D32372D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A20233333333333333B';
wwv_flow_api.g_varchar2_table(1323) := '0A7D0A2E752D436F6C6F722D32372D46472D2D66696C6C207B0A202066696C6C3A20233333333333333B0A7D0A2E752D436F6C6F722D32372D46472D2D6272207B0A20207374726F6B653A20233333333333333B0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1324) := '20233333333333333B0A7D0A2E752D436F6C6F722D32382D42472D2D747874207B0A2020636F6C6F723A20236264653966643B0A7D0A2E752D436F6C6F722D32382D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A202362646539';
wwv_flow_api.g_varchar2_table(1325) := '66643B0A7D0A2E752D436F6C6F722D32382D42472D2D66696C6C207B0A202066696C6C3A20236264653966643B0A7D0A2E752D436F6C6F722D32382D42472D2D6272207B0A20207374726F6B653A20236264653966643B0A2020626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(1326) := '6F723A20236264653966643B0A7D0A2E752D436F6C6F722D32382D46472D2D747874207B0A2020636F6C6F723A20233035376562363B0A7D0A2E752D436F6C6F722D32382D46472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A202330';
wwv_flow_api.g_varchar2_table(1327) := '35376562363B0A7D0A2E752D436F6C6F722D32382D46472D2D66696C6C207B0A202066696C6C3A20233035376562363B0A7D0A2E752D436F6C6F722D32382D46472D2D6272207B0A20207374726F6B653A20233035376562363B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(1328) := '636F6C6F723A20233035376562363B0A7D0A2E752D436F6C6F722D32392D42472D2D747874207B0A2020636F6C6F723A20236666396339363B0A7D0A2E752D436F6C6F722D32392D42472D2D6267207B0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1329) := '20236666396339363B0A7D0A2E752D436F6C6F722D32392D42472D2D66696C6C207B0A202066696C6C3A20236666396339363B0A7D0A2E752D436F6C6F722D32392D42472D2D6272207B0A20207374726F6B653A20236666396339363B0A2020626F7264';
wwv_flow_api.g_varchar2_table(1330) := '65722D636F6C6F723A20236666396339363B0A7D0A2E752D436F6C6F722D32392D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32392D46472D2D6267207B0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1331) := '6F723A20236666666666663B0A7D0A2E752D436F6C6F722D32392D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D32392D46472D2D6272207B0A20207374726F6B653A20236666666666663B0A202062';
wwv_flow_api.g_varchar2_table(1332) := '6F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D33302D42472D2D747874207B0A2020636F6C6F723A20236139613865613B0A7D0A2E752D436F6C6F722D33302D42472D2D6267207B0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(1333) := '636F6C6F723A20236139613865613B0A7D0A2E752D436F6C6F722D33302D42472D2D66696C6C207B0A202066696C6C3A20236139613865613B0A7D0A2E752D436F6C6F722D33302D42472D2D6272207B0A20207374726F6B653A20236139613865613B0A';
wwv_flow_api.g_varchar2_table(1334) := '2020626F726465722D636F6C6F723A20236139613865613B0A7D0A2E752D436F6C6F722D33302D46472D2D747874207B0A2020636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D33302D46472D2D6267207B0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(1335) := '6E642D636F6C6F723A20236666666666663B0A7D0A2E752D436F6C6F722D33302D46472D2D66696C6C207B0A202066696C6C3A20236666666666663B0A7D0A2E752D436F6C6F722D33302D46472D2D6272207B0A20207374726F6B653A20236666666666';
wwv_flow_api.g_varchar2_table(1336) := '663B0A2020626F726465722D636F6C6F723A20236666666666663B0A7D0A2E752D666F6375736564207B0A2020626F782D736861646F773A2030203020302031707820236666326435352C2030203020317078203070782072676261283235352C203435';
wwv_flow_api.g_varchar2_table(1337) := '2C2038352C20302E35292021696D706F7274616E743B0A20206F75746C696E653A206E6F6E653B0A7D0A0A2F2A200A202A204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C657220437573746F6D';
wwv_flow_api.g_varchar2_table(1338) := '20435353200A202A0A202A2F0A0A626F6479207B0A20202020666F6E742D66616D696C793A20274E6F746F2053616E73272C2073616E732D73657269663B0A20202020666F6E742D7765696768743A203330303B0A096C696E652D6865696768743A2032';
wwv_flow_api.g_varchar2_table(1339) := '3570783B0A09666F6E742D73697A653A20313470783B0A7D0A2E742D54696D656C696E652D75736572207B20646973706C61793A206E6F6E653B207D0A2E742D54696D656C696E652D2D636F6D70616374202E742D54696D656C696E652D747970655772';
wwv_flow_api.g_varchar2_table(1340) := '6170207B20646973706C61793A206E6F6E653B207D0A2E742D54696D656C696E652D64657363207B2077686974652D73706163653A206E6F726D616C3B207D';
null;
end;
/
begin
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(38189413700330166)
,p_theme_id=>42
,p_file_name=>'38189099462330158.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33615664563756518)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33616071302756521)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33616479707756521)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33619038990756523)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33619412096756524)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33621000446756525)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33621831229756529)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33623083629756529)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33624266935756531)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33624693199756531)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33626496735756534)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33629833946756537)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33632837424756542)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33640361649756549)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33640739210756551)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33641504077756553)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33642362274756553)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33643636652756555)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33644893152756559)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33645237919756559)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33648486298756564)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the amount of text to display for the Card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33649870938756565)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the style and design of the cards in the report.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33650457278756565)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33651804772756565)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33652471239756566)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33653423225756571)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33654050939756571)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33654463189756571)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33656404945756573)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33660232695756580)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33661862573756581)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33663859892756585)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33665249927756586)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33665864122756586)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33667247802756587)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33668675144756589)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33673464581756598)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33675604351756600)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33677244137756606)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33678960896756625)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33679370932756627)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33679729715756627)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33680179738756627)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33680518997756627)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33681344332756628)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33682725333756633)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33683581408756634)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33683954694756634)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33684302946756634)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33684767978756635)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33685325310756635)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(33685967647756635)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33615490552756517)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33615897852756521)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(33615664563756518)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33616299847756521)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(33616071302756521)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33616655354756522)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(33616479707756521)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33616856186756522)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(33615664563756518)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33617049026756522)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(33616071302756521)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33617205068756523)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(33615664563756518)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33617482514756523)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(33616071302756521)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33617663178756523)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(33615664563756518)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33617871508756523)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33614896539756510)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(33616479707756521)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33619252809756524)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(33618198219756523)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33619669851756524)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(33618198219756523)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(33619412096756524)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33619876614756524)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(33618198219756523)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33620085966756525)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(33618198219756523)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(33619412096756524)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33621201365756525)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(33621000446756525)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33621423733756525)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(33621000446756525)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33621613157756525)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(33621000446756525)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33622062871756529)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33622298924756529)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33622454682756529)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33622606037756529)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(33621000446756525)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33622886831756529)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33623297878756529)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33623448890756531)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33623679458756531)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33623849269756531)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33624077109756531)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33624417315756531)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(33624266935756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33624877580756531)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(33624693199756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33625095576756531)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(33624266935756531)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33625224017756534)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33625464917756534)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33625652085756534)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33625816681756534)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(33624693199756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33626026589756534)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33626212721756534)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33626670480756534)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(33626496735756534)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33626897782756534)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(33626496735756534)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33627059286756535)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33620132178756525)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33628018528756536)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33628229194756536)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33628419221756536)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33628691682756536)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33628898493756536)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33629080454756537)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33629250239756537)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33629414324756537)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33629643296756537)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33630040965756537)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(33629833946756537)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33630280048756537)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(33629833946756537)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33630431363756537)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(33624693199756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33630613218756537)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33630805340756540)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33631069679756540)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33631296375756541)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(33624693199756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33631458096756541)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33627194128756536)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33632621474756541)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33632010365756541)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33633095374756542)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33632010365756541)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(33632837424756542)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33633260196756542)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33632010365756541)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(33632837424756542)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33633442092756542)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33632010365756541)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33633636354756542)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33632010365756541)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33633889783756542)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33632010365756541)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(33632837424756542)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33634226981756542)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33633992723756542)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33634492642756543)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33633992723756542)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33635936868756547)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33636160552756547)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33636351157756547)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33636503845756547)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(33621831229756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33636760359756547)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33636949001756547)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33637194399756549)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33637321961756549)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33637586350756549)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(33623083629756529)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33637726722756549)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(33624266935756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33637941024756549)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(33624693199756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33638133770756549)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(33624266935756531)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33638380060756549)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33638552319756549)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33638711702756549)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33638902818756549)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(33624693199756531)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33639161958756549)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33639311980756549)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33635078329756543)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(33619038990756523)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33640514002756551)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33639405632756549)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(33640361649756549)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33640998831756551)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33639405632756549)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(33640739210756551)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33641149051756551)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33639405632756549)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33641344316756551)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33639405632756549)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(33640739210756551)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33641768986756553)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33639405632756549)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(33641504077756553)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33641984286756553)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33639405632756549)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(33641504077756553)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33642559251756553)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(33642023811756553)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(33642362274756553)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33642714283756553)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(33642023811756553)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33642908505756553)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(33642023811756553)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(33642362274756553)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33643890507756555)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(33643073550756553)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(33643636652756555)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33644093558756555)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33643073550756553)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(33643636652756555)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33644280932756555)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(33643073550756553)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33645067657756559)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(33644893152756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33645459660756559)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33645605072756559)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(33644893152756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33645889297756559)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33646030977756560)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(33644893152756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33646298255756560)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33646451427756560)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33646600241756560)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(33644893152756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33646827662756560)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(33644893152756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33647048308756560)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33647214621756560)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33647449417756560)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33647609341756560)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'REPORT'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33647839027756563)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33644508810756558)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33648243432756564)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33648678963756564)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(33648486298756564)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33648846340756564)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33649012580756564)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(33648486298756564)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33649234721756564)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33649409479756564)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(33648486298756564)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33649630992756564)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33650005535756565)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(33649870938756565)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33650298482756565)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(33649870938756565)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33650613844756565)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(33650457278756565)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33650850600756565)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(33650457278756565)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33651085269756565)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(33649870938756565)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33651241691756565)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33651414408756565)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(33648486298756564)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33651682151756565)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33652049358756565)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33647920985756563)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(33651804772756565)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33652696790756566)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33652178649756565)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(33652471239756566)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33652841979756566)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33652178649756565)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(33652471239756566)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33653631336756571)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(33653423225756571)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33653884445756571)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(33653423225756571)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33654214147756571)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(33654050939756571)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33654628000756571)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(33654463189756571)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33654826635756572)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(33654463189756571)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33655010359756572)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(33654463189756571)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33655299225756572)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(33654050939756571)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33655461926756572)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33655609522756573)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33653104255756570)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(33654463189756571)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33656020460756573)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(33655722946756573)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(33649870938756565)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact video of timeline with smaller font-sizes and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33656681158756573)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33656864827756573)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33657071995756573)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33657273823756573)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33657414221756573)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33657613703756573)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33657813203756573)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33658065054756573)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(33656126750756573)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33658499936756574)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33658649692756574)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33658812275756575)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33659018121756575)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33659207301756575)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(33645237919756559)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33659492136756575)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33659652249756575)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33659803068756575)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(33658152930756573)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(33656404945756573)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33660474561756580)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33660642867756580)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33660813426756581)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33661079952756581)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33661234724756581)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33661480708756581)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33661695113756581)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33662024006756581)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(33661862573756581)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33662222297756581)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(33661862573756581)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33662477948756581)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'LIST'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33662677336756582)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(33661862573756581)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33662811179756582)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33663068491756582)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'.t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(33661862573756581)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33663280874756582)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(33659948785756579)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(33661862573756581)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33663680100756585)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33664035964756585)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(33663859892756585)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33664226951756585)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33664404467756585)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(33663859892756585)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33664669039756585)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33664872530756585)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(33663859892756585)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33665030799756585)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33665470469756586)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(33665249927756586)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33665693292756586)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(33665249927756586)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33666098428756586)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(33665864122756586)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33666200260756586)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(33665864122756586)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33666415673756586)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(33665249927756586)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33666699708756586)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33666831494756586)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(33663859892756585)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33667015965756587)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33667428073756587)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33663352471756582)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(33667247802756587)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33667862179756589)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33667578123756587)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(33665249927756586)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33668071433756589)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33667578123756587)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33668213776756589)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33667578123756587)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33668495127756589)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33667578123756587)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33668877494756589)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33667578123756587)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(33668675144756589)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33669074735756589)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33667578123756587)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(33668675144756589)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33669424643756591)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33669618919756591)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33669872570756591)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33670006357756591)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33670231065756591)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33670404866756591)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33670648575756592)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Shows an icon for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33670872362756592)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(33669150354756589)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33671203425756592)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(33670947374756592)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33671423670756592)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33670947374756592)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33671624606756592)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33670947374756592)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33671876663756593)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33670947374756592)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33672872753756597)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33672592814756597)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(33665864122756586)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33673007649756598)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(33672592814756597)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(33660232695756580)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33673257375756598)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33672592814756597)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(33665864122756586)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33673693416756598)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33672592814756597)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(33673464581756598)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33673872044756598)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33672592814756597)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(33665249927756586)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33674018866756598)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33672592814756597)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(33665249927756586)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33674293420756598)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(33672592814756597)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(33673464581756598)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33674686060756599)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(33674323860756599)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33674892231756599)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(33674323860756599)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33675008049756599)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(33674323860756599)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33675223841756599)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(33674323860756599)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33675800147756600)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(33675326722756599)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(33675604351756600)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33676069667756600)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(33675326722756599)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(33675604351756600)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33676295151756600)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(33675326722756599)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(33675604351756600)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33677421454756606)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(33677019339756606)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(33677244137756606)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33677612064756606)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(33677019339756606)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(33677244137756606)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33679183549756627)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(33678960896756625)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33679580318756627)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large Left Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(33679370932756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33679933056756627)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large Right Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(33679729715756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33680391056756627)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(33680179738756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33680700172756627)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(33680518997756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33680997177756627)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small Left Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(33679370932756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33681156127756628)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small Right Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(33679729715756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33681517414756628)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(33681344332756628)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33681751198756629)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(33681344332756628)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33681963201756629)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(33681344332756628)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33682175992756633)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(33678960896756625)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33682389915756633)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(33680518997756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33682527259756633)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(33680179738756627)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33682992470756633)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(33682725333756633)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33683124566756633)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(33678960896756625)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33683327456756634)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(33678960896756625)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33683730330756634)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(33683581408756634)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33684184463756634)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(33683954694756634)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33684524709756635)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(33684302946756634)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33684979216756635)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(33684767978756635)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33685180276756635)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(33684767978756635)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33685513985756635)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(33685325310756635)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33685774151756635)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(33683954694756634)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33686188065756635)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(33685967647756635)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33686383639756636)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(33686566574756636)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(33685967647756635)
,p_template_types=>'FIELD'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789565542977096292)
,p_shortcut_name=>'RPT_P920'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_util.prepare_url(''f?p=&APP_ID.:920:&SESSION.:PRINT'');'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789566747142523409)
,p_shortcut_name=>'RPT_P905'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_util.prepare_url(''f?p=&APP_ID.:905:&SESSION.:PRINT'');'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789567246290636667)
,p_shortcut_name=>'RPT_P925'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_util.prepare_url(''f?p=&APP_ID.:925:&SESSION.:PRINT'');'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789567762913641495)
,p_shortcut_name=>'RPT_P930'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_util.prepare_url(''f?p=&APP_ID.:930:&SESSION.:PRINT'');'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789568253871686163)
,p_shortcut_name=>'RPT_P935'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_util.prepare_url(''f?p=&APP_ID.:935:&SESSION.:PRINT'');'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789568737033690758)
,p_shortcut_name=>'RPT_P940'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_util.prepare_url(''f?p=&APP_ID.:940:&SESSION.:PRINT'');'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789569460021706876)
,p_shortcut_name=>'RPT_P945'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_util.prepare_url(''f?p=&APP_ID.:945:&SESSION.:PRINT'');'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(789617255457820759)
,p_shortcut_name=>'RPT_CAT'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN apex_util.prepare_url(''f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.:PRINT_CATEGORY'');',
''))
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(810253487044549823)
,p_shortcut_name=>'INIT_IR_CONTROLS'
,p_shortcut_type=>'HTML_TEXT'
,p_shortcut=>'<!-- -->'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(811801383931092780)
,p_shortcut_name=>'BLACK_IR_LINKS'
,p_shortcut_type=>'HTML_TEXT'
,p_shortcut=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'div#apexir_DATA_PANEL .apexir_WORKSHEET_DATA td a {',
'    color: black;',
'}',
'</style>'))
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(831887144078058593)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(539825107719258899)
,p_name=>'APEX Users'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_group_selectlist
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2692057351715039378)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.GROUP_SELECTLIST'
,p_display_name=>'Group Select List'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.GROUP_SELECTLIST'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- The render procedure is responsible for the rendering of the actual HTML control',
'-- of the new widget. APEX still takes care of the table cell for the layout,',
'-- the label, pre- and post element text. Only the html code between the pre- and',
'-- post element text is rendered by the plug-in. The render procedure has a',
'-- defined interface which every plug-in has to implement. It''s designed in a way',
'-- that future enhancements to the interface will not break existing plug-ins.',
'function render_group_selectlist (',
'    p_item                in apex_plugin.t_page_item,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_value               in varchar2,',
'    p_is_readonly         in boolean,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_page_item_render_result',
'is',
'    -- constants for accessing our l_column_value_list array',
'    c_display_column constant number := 1;',
'    c_return_column  constant number := 2;',
'    c_group_column   constant number := 3;',
'    ',
'    -- value without the lov null value',
'    l_value             varchar2(32767) := case when p_value = p_item.lov_null_value then null else p_value end;',
'',
'    l_name              varchar2(30);',
'    l_display_value     varchar2(32767);',
'    l_is_selected       boolean := false;',
'    l_value_found       boolean := false;',
'    l_column_value_list wwv_flow_plugin_util.t_column_value_list;',
'    l_group_value       varchar2(4000);',
'    l_last_group_value  varchar2(4000);',
'    l_open_group        boolean := false;',
'    l_result            wwv_flow_plugin.t_page_item_render_result;',
'    ',
'    procedure print_option_local (',
'        p_display_value in varchar2,',
'        p_return_value  in varchar2,',
'        p_compare_value in varchar2 )',
'    is',
'        l_is_selected boolean := false;',
'    begin',
'        if not l_value_found and apex_plugin_util.is_equal(p_return_value, p_compare_value)',
'        then',
'            l_value_found := true;',
'            l_is_selected := true;',
'        end if;',
'        -- add list entry',
'        apex_plugin_util.print_option (',
'            p_display_value => p_display_value,',
'            p_return_value  => p_return_value,',
'            p_is_selected   => l_is_selected,',
'            p_attributes    => p_item.element_option_attributes );',
'    end print_option_local;',
'begin',
'    -- During plug-in development it''s very helpful to have some debug information',
'    if wwv_flow.g_debug then',
'        apex_plugin_util.debug_page_item (',
'            p_plugin              => p_plugin,',
'            p_page_item           => p_item,',
'            p_value               => p_value,',
'            p_is_readonly         => p_is_readonly,',
'            p_is_printer_friendly => p_is_printer_friendly );',
'    end if;',
'',
'    -- Based on the flags we normally generate different HTML code, but that',
'    -- depends on the plug-in.',
'    if p_is_readonly or p_is_printer_friendly then',
'        apex_plugin_util.print_hidden_if_readonly (',
'            p_item_name           => p_item.name,',
'            p_value               => p_value,',
'            p_is_readonly         => p_is_readonly,',
'            p_is_printer_friendly => p_is_printer_friendly );',
'',
'        -- get the display value',
'        l_display_value := apex_plugin_util.get_display_data (',
'                               p_sql_statement     => p_item.lov_definition,',
'                               p_min_columns       => 3, -- LOV requires 3 column',
'                               p_max_columns       => 3,',
'                               p_component_name    => p_item.name,',
'                               p_display_column_no => c_display_column,',
'                               p_search_column_no  => c_return_column,',
'                               p_search_string     => l_value,',
'                               p_display_extra     => p_item.lov_display_extra );',
'',
'        -- emit display span with the value',
'        apex_plugin_util.print_display_only (',
'            p_item_name        => p_item.name,',
'            p_display_value    => l_display_value,',
'            p_show_line_breaks => false,',
'            p_escape           => true,',
'            p_attributes       => p_item.element_attributes );',
'    else',
'        -- If a page item saves state, we have to call the get_input_name_for_page_item',
'        -- to render the internal hidden p_arg_names field. It will also return the',
'        -- HTML field name which we have to use when we render the HTML input field.',
'        l_name := apex_plugin.get_input_name_for_page_item(false);',
'        sys.htp.prn(''<select name="''||l_name||''" id="''||p_item.name||''" ''||',
'                  coalesce(p_item.element_attributes, ''class="group_selectlist"'')||''>'');',
'',
'        -- add display null entry',
'        if p_item.lov_display_null then',
'            wwv_flow_utilities.add_null_value_entry(''ITEM'', l_name, p_item.lov_null_value);',
'            -- add list entry',
'            print_option_local (',
'                    p_display_value => p_item.lov_null_text,',
'                    p_return_value  => p_item.lov_null_value,',
'                    p_compare_value => nvl(l_value, p_item.lov_null_value) );',
'        end if;',
'',
'        -- get all values',
'        l_column_value_list := apex_plugin_util.get_data (',
'                                   p_sql_statement      => p_item.lov_definition,',
'                                   p_min_columns        => 3,',
'                                   p_max_columns        => 3,',
'                                   p_component_name     => p_item.name );',
'',
'        -- loop through the result',
'        for i in 1 .. l_column_value_list(c_display_column).count',
'        loop',
'            l_group_value := l_column_value_list(c_group_column)(i);',
'            -- has the group changed?',
'            if (l_group_value <> l_last_group_value) or',
'               (l_group_value is     null and l_last_group_value is not null) or',
'               (l_group_value is not null and l_last_group_value is     null)',
'            then',
'                if l_open_group then',
'                    sys.htp.p(''</optgroup>'');',
'                    l_open_group := false;',
'                end if;',
'                if l_group_value is not null then',
'                    sys.htp.p (''<optgroup label="''||sys.htf.escape_sc(l_group_value)||''">'');',
'                    l_open_group := true;',
'                end if;',
'                l_last_group_value := l_group_value;',
'            end if;',
'            -- add list entry',
'            print_option_local (',
'                p_display_value => l_column_value_list(c_display_column)(i),',
'                p_return_value  => l_column_value_list(c_return_column )(i),',
'                p_compare_value => l_value );',
'        end loop;',
'',
'        if l_open_group then',
'            sys.htp.p(''</optgroup>'');',
'        end if;',
'        -- Show at least the value if it hasn''t been found in the database',
'        if not l_value_found and l_value is not null and p_item.lov_display_extra then',
'            print_option_local (',
'                p_display_value => l_value,',
'                p_return_value  => l_value,',
'                p_compare_value => l_value );',
'        end if;',
'        -- close our select list',
'        sys.htp.p(''</select>'');',
'        -- Tell APEX that this field is navigable',
'        l_result.is_navigable := true;',
'    end if;',
'    return l_result;',
'end render_group_selectlist;',
''))
,p_render_function=>'render_group_selectlist'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:QUICKPICK:SOURCE:ELEMENT:ELEMENT_OPTION:ENCRYPT:LOV:LOV_REQUIRED:LOV_DISPLAY_NULL'
,p_sql_min_column_count=>3
,p_sql_max_column_count=>3
,p_sql_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>',
'select e.ename as d,',
'       e.empno as r,',
'       d.dname as grp',
'  from emp e,',
'       dept d',
' where d.deptno = e.deptno',
' order by grp, d',
'</pre>'))
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'	<strong>Group Select List</strong> is a replacement for the built-in select list. It provides the possibility to group the entries of the select list.</p>',
'<p>',
'	This is done by adding a third column, the &quot;group column&quot; to the &quot;List of Values SQL Statement&quot;. Don&#39;t forget to order the result of your List of Values by the group column and then by the display column. For details have a l'
||'ook at the &quot;List of Values Examples&quot;.</p>',
''))
,p_version_identifier=>'1.0'
,p_about_url=>'http://www.oracleapex.info/'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_skillbuilders_modal_page
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(35207775183569690546)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM_SKILLBUILDERS_MODAL_PAGE'
,p_display_name=>'Enkitec Custom Modal Page (2.0.0)'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM_SKILLBUILDERS_MODAL_PAGE'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'FUNCTION apex_modal_page_render (',
'   p_dynamic_action IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'   p_plugin         IN APEX_PLUGIN.T_PLUGIN ',
')',
'',
'   RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT',
'   ',
'IS',
'',
'   l_result             APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'   l_dialog_title       VARCHAR2(4000) := p_dynamic_action.attribute_01;',
'   l_url_location       VARCHAR2(50) := NVL(p_dynamic_action.attribute_02, ''STATIC'');',
'   l_static_url         VARCHAR2(4000) := p_dynamic_action.attribute_03;',
'   l_attr_name          VARCHAR2(4000) := NVL(p_dynamic_action.attribute_05, ''data-url'');',
'   l_close_sel          VARCHAR2(4000) := NVL(p_dynamic_action.attribute_06, ''div#success-message'');',
'   l_hw_mode            VARCHAR2(4000) := NVL(p_dynamic_action.attribute_07, ''AUTO'');',
'   l_height             VARCHAR2(4000) := p_dynamic_action.attribute_08;',
'   l_width              VARCHAR2(4000) := p_dynamic_action.attribute_09;',
'   l_modal_page_id      VARCHAR2(4000) := p_dynamic_action.attribute_10;',
'   l_theme              NUMBER := NVL(p_plugin.attribute_01, 3);',
'   l_overlay_opacity    NUMBER := NVL(TO_NUMBER(p_plugin.attribute_02, ''999.99'', ''NLS_NUMERIC_CHARACTERS = ''''.,''''''), .5);',
'   l_scrolling          VARCHAR2(1) := NVL(p_plugin.attribute_03, ''N'');',
'   l_transition         VARCHAR2(50) := NVL(p_plugin.attribute_04, ''none'');',
'   l_initial_height     NUMBER := NVL(p_plugin.attribute_05, 100);',
'   l_initial_width      NUMBER := NVL(p_plugin.attribute_06, 100);',
'   l_draggable          VARCHAR2(1) := NVL(p_plugin.attribute_07, ''Y'');',
'   l_custom_css_path    VARCHAR2(4000) := p_plugin.attribute_08;',
'   l_custom_css_file    VARCHAR2(4000) := p_plugin.attribute_09;',
'   l_loading_image_src  VARCHAR2(32767);',
'   l_onload_code        VARCHAR2(32767);',
'   l_crlf               CHAR(2) := CHR(13)||CHR(10);',
'',
'BEGIN',
'',
'   IF apex_application.g_debug',
'   THEN',
'      apex_plugin_util.debug_dynamic_action(',
'         p_plugin         => p_plugin,',
'         p_dynamic_action => p_dynamic_action ',
'      );',
'   END IF;',
'   ',
'   IF l_theme = 2 --User selected custom theme',
'   THEN',
'',
'        apex_css.add_file(',
'           p_name      => RTRIM(RTRIM(l_custom_css_file,''.css''),''.CSS''),',
'           p_directory => wwv_flow.do_substitutions(l_custom_css_path),',
'           p_version   => NULL',
'        );',
'  ELSE ',
'',
'      IF (owa_util.get_cgi_env(''HTTP_USER_AGENT'')) LIKE ''%MSIE%'' THEN',
'        apex_css.add_file(',
'           p_name      => ''sumneva_theme_ie'',',
'           p_directory => p_plugin.file_prefix,',
'           p_version   => NULL',
'        );',
'      ELSE',
'        apex_css.add_file(',
'           p_name      => ''sumneva_theme'',',
'           p_directory => p_plugin.file_prefix,',
'           p_version   => NULL',
'        );',
'      END IF; ',
'',
'  END IF;',
'',
'   apex_javascript.add_library(',
'      p_name      => ''jquery.colorbox-min'',',
'      p_directory => p_plugin.file_prefix,',
'      p_version   => NULL',
'   );',
'   ',
'   apex_javascript.add_library(',
'      p_name      => ''apex_modal_page.min'',',
'      p_directory => p_plugin.file_prefix,',
'      p_version   => NULL ',
'   );',
'',
'   l_onload_code := ''apex.jQuery(document).apex_modal_page({'' || l_crlf',
'      || ''   '' || apex_javascript.add_attribute(''transition'',  l_transition) || l_crlf',
'      || ''   '' || apex_javascript.add_attribute(''draggable'',  ',
'         CASE l_draggable',
'            WHEN ''Y'' THEN TRUE',
'            ELSE FALSE',
'         END',
'      ) || l_crlf',
'      || ''   '' || apex_javascript.add_attribute(''initialHeight'',  l_initial_height) || l_crlf',
'      || ''   '' || apex_javascript.add_attribute(''initialWidth'',  l_initial_width) || l_crlf',
'      || ''   '' || apex_javascript.add_attribute(''overlayOpacity'',  l_overlay_opacity) || l_crlf',
'      || ''   '' || apex_javascript.add_attribute(''scrolling'',  ',
'         CASE l_scrolling',
'            WHEN ''Y'' THEN TRUE',
'            ELSE FALSE',
'         END',
'      ) || l_crlf',
'      || ''   '' || apex_javascript.add_attribute(''loadingImageSrc'', l_loading_image_src, FALSE, FALSE) || l_crlf',
'      || ''});'';',
'      ',
'   apex_javascript.add_onload_code(',
'      p_code => l_onload_code',
'   ); ',
'',
'   l_result.javascript_function := ',
'      ''function(){'' || l_crlf ||',
'      ''   if (this.browserEvent !== ''''load''''){'' || l_crlf ||',
'      ''      apex.jQuery(document).apex_modal_page(''''openPageFromApexThis'''', this);'' || l_crlf ||',
'      ''   }'' || l_crlf ||',
'      ''}'';',
'',
'   l_result.attribute_01 := l_dialog_title;',
'   l_result.attribute_02 := l_url_location;',
'   l_result.attribute_03 := l_static_url;',
'   l_result.attribute_05 := l_attr_name;',
'   l_result.attribute_06 := l_close_sel;',
'   l_result.attribute_07 := l_hw_mode;',
'   l_result.attribute_08 := l_height;',
'   l_result.attribute_09 := l_width;',
'   l_result.attribute_10 := l_modal_page_id;',
'',
'   RETURN l_result;',
'    ',
'END apex_modal_page_render;'))
,p_render_function=>'apex_modal_page_render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<br />',
''))
,p_version_identifier=>'2.0.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(795343480088872020)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Theme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The Theme setting is used to change the look and feel of the modal window. '
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(795344283897873100)
,p_plugin_attribute_id=>wwv_flow_api.id(795343480088872020)
,p_display_sequence=>10
,p_display_value=>'Sumneva Theme'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(795344654246873992)
,p_plugin_attribute_id=>wwv_flow_api.id(795343480088872020)
,p_display_sequence=>20
,p_display_value=>'Custom Theme'
,p_return_value=>'2'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(794810271791716670)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Overlay Opacity'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'.5'
,p_display_length=>3
,p_max_length=>3
,p_is_translatable=>false
,p_help_text=>'The Overlay Opacity setting is used to adjust the darkness of the overlay behind the modal dialog. Specify a number between 0 and 1 where 0 is transparent and 1 is completely obscured. The default value of .5 is in the middle and allows the users to '
||'see the screen behind but focuses their attention on the modal dialog.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(794810775170736529)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>17
,p_prompt=>'Scrolling'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'The Scrolling setting is used to specify whether or not the modal can include scroll bars across the top and bottom of the modal to allow users to see all of the content in the page. When set to No, any overflow cotent will be hidden from view.<br />'
||' ',
'<br />',
'This setting must be used in conjunction with the Height and Width settings in the component settings. A later version of this plug-in will move this setting to the component settings.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(794811296987742737)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>15
,p_prompt=>'Transition'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'none'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The Transition setting can be used to apply some effects to the opening and closing of the modal dialog. '
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(794811800450743749)
,p_plugin_attribute_id=>wwv_flow_api.id(794811296987742737)
,p_display_sequence=>10
,p_display_value=>'None'
,p_return_value=>'none'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(794812173700754860)
,p_plugin_attribute_id=>wwv_flow_api.id(794811296987742737)
,p_display_sequence=>20
,p_display_value=>'Elastic'
,p_return_value=>'elastic'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(794812578548756291)
,p_plugin_attribute_id=>wwv_flow_api.id(794811296987742737)
,p_display_sequence=>30
,p_display_value=>'Fade'
,p_return_value=>'fade'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(11090627473595637188)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Initial Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'100'
,p_display_length=>2
,p_max_length=>3
,p_is_translatable=>false
,p_help_text=>'The Initial Height setting is used to specify the initial height (in pixels) of the modal page when it opens but before the main content loads. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(11090628656064641613)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Initial Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'300'
,p_display_length=>2
,p_max_length=>3
,p_is_translatable=>false
,p_help_text=>'The Initial Width setting is used to specify the initial width (in pixels) of the modal page when it opens but before the main content loads.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(794814199111771612)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>18
,p_prompt=>'Draggable'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'The Draggable setting is used to specify whether or not the user should be able to move the modal dialog around on the screen.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(794815084136786082)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>8
,p_display_sequence=>12
,p_prompt=>'Custom CSS Path'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>50
,p_max_length=>500
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(795343480088872020)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'2'
,p_help_text=>'The Custom CSS Path setting is used to specify the path to a custom CSS file for the theme. This setting is only displayed when the Theme is set to custom. See Optional Performance Upgrade for additional information.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(794815592925798061)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>13
,p_prompt=>'Custom CSS Filename'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>50
,p_max_length=>500
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(795343480088872020)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'2'
,p_help_text=>'The Custom CSS Filename setting is used to specify the name of the file that contains custom CSS for the theme. Only the name of the file should be included with this setting as it is assumed the extension will be ¿¿¿¿¿¿¿¿¿¿¿¿.css¿¿¿¿¿¿¿¿¿¿¿¿. This s'
||'etting is only displayed when the Theme is set to custom.  See Optional Performance Upgrade for additional information.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(28487678466453408175)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Dialog Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>50
,p_is_translatable=>false
,p_help_text=>'Use this attribute to specify the title displayed in the modal page.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(28487671277273392365)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'URL Location'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'STATIC'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Use this attribute to specify whether the URL for the modal page is static or dynamic. '
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(28487673559396396605)
,p_plugin_attribute_id=>wwv_flow_api.id(28487671277273392365)
,p_display_sequence=>10
,p_display_value=>'Statically Defined'
,p_return_value=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(28487674671863400226)
,p_plugin_attribute_id=>wwv_flow_api.id(28487671277273392365)
,p_display_sequence=>20
,p_display_value=>'Attribute of Triggering Element'
,p_return_value=>'TRIG_ELEMENT_ATTR'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(28487665556841386432)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Static URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'f?p=&APP_ID.:1:&APP_SESSION.:::1:::'
,p_display_length=>50
,p_max_length=>500
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(28487671277273392365)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'STATIC'
,p_help_text=>'Use this attribute to specify a static URL for the modal page.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(36552374092979886710)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Attribute Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'href'
,p_display_length=>30
,p_max_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(28487671277273392365)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'TRIG_ELEMENT_ATTR'
,p_help_text=>'Use this attribute to specify which attribute of the triggering element contains the URL for the modal page. This is often the href attribute of anchor elements.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(36552504091445075480)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Auto-close On Element Selector'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'div#success-message'
,p_display_length=>30
,p_max_length=>500
,p_is_translatable=>false
,p_help_text=>'Use this attribute to specify a jQuery selector used to close the modal page automatically. The selector is executed when the modal page is loaded. If the selector selects anything, the modal page will close and the Auto Close event will be triggered'
||'. Typically this is only used for modal pages that are submitted for processing where the success message is used to auto-close the modal page.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13884244575742067138)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Dialog Height/Width Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'AUTO'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Use this attribute to control the size of the modal page. The default value of "Auto" will try to automatically determine the appropriate size of the page based on the content. However, if you need more control, this attribute allows you set the heig'
||'ht and width as a percentage of the total window size or by a fixed number of pixels.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13884283164791073430)
,p_plugin_attribute_id=>wwv_flow_api.id(13884244575742067138)
,p_display_sequence=>1
,p_display_value=>'Auto'
,p_return_value=>'AUTO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13884246380590068527)
,p_plugin_attribute_id=>wwv_flow_api.id(13884244575742067138)
,p_display_sequence=>10
,p_display_value=>'Static by percent of window'
,p_return_value=>'STATIC_%'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13884246950246069187)
,p_plugin_attribute_id=>wwv_flow_api.id(13884244575742067138)
,p_display_sequence=>20
,p_display_value=>'Static by pixels'
,p_return_value=>'STATIC_PX'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13884466452333145469)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_display_length=>2
,p_max_length=>3
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(13884244575742067138)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'STATIC_%,STATIC_PX'
,p_help_text=>'Use this attribute to set the height of the modal page. This value can be used to specify a percentage of the total screen or specific number of pixels which is determined by the Dialog Height/Width Mode attribute.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13884468765493149281)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_display_length=>2
,p_max_length=>3
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(13884244575742067138)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'STATIC_%,STATIC_PX'
,p_help_text=>'Use this attribute to set the width of the modal page. This value can be used to specify a percentage of the total screen or specific number of pixels which is determined by the Dialog Height/Width Mode attribute.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13884510456667184555)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Modal Page ID'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>50
,p_is_translatable=>false
,p_help_text=>'Use this attribute to associate an identifier, such as "create-customer-page", with the modal page that has been opened. When the modal page closes this identifier will be passed back with the event object so that the closing of one modal page can be'
||' differentiated from another. The value can be accessed from the data object of "this" in a Dynamic Action with: this.data.modalPageId'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(36489912977417423648)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_name=>'modalpageautoclose'
,p_display_name=>'Auto Close'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(11090196062468255582)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_name=>'modalpageclose'
,p_display_name=>'Close'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(794846571959333643)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_name=>'modalpageendopen'
,p_display_name=>'End Open'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(794846977154335174)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_name=>'modalpagemanualclose'
,p_display_name=>'Manual Close'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(794847282694336774)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_name=>'modalpagestartopen'
,p_display_name=>'Start Open'
);
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
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(794822685529258031)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_file_name=>'apex_modal_page.min.js'
,p_mime_type=>'application/javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
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
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(794823382294259517)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_file_name=>'jquery.colorbox-min.js'
,p_mime_type=>'application/javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
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
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(795337568207839113)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_file_name=>'CLOSE.png'
,p_mime_type=>'image/png'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
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
wwv_flow_api.g_varchar2_table(17) := '756E643A2075726C28434C4F53452E706E6729206E6F2D72657065617420746F702063656E7465723B0A2020202020202077696474683A20323570783B0A202020202020206865696768743A20323570783B0A20202020202020746578742D696E64656E';
wwv_flow_api.g_varchar2_table(18) := '743A202D3939393970783B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(795541771873125887)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_file_name=>'sumneva_theme.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
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
wwv_flow_api.g_varchar2_table(17) := '756E643A2075726C28434C4F53452E706E6729206E6F2D72657065617420746F702063656E7465723B0A2020202020202077696474683A20323570783B0A202020202020206865696768743A20323570783B0A20202020202020746578742D696E64656E';
wwv_flow_api.g_varchar2_table(18) := '743A202D3939393970783B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(795545666271386745)
,p_plugin_id=>wwv_flow_api.id(35207775183569690546)
,p_file_name=>'sumneva_theme_ie.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(251796396174435486)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'DESKTOP'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(33687950038767669)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_api.id(33674323860756599)
,p_nav_list_template_options=>'#DEFAULT#'
,p_css_file_urls=>'https://fonts.googleapis.com/css?family=Noto+Sans:400,700'
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'NAVBAR'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Page Zero'
,p_page_mode=>'NORMAL'
,p_step_title=>'Page Zero'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217055856'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67942362777565203)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33642023811756553)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(832938918759265190)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(33677755056756606)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'210,310,410'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(811802610698964854)
,p_branch_action=>'f?p=&APP_ID.:0:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(812618136346280767)
,p_branch_action=>'f?p=&FLOW_ID.:0:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(796836695670351822)
,p_name=>'Page Help'
,p_event_sequence=>0
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.pageHelp'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.innerHTML == ''Help'''
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(796836975479351846)
,p_event_id=>wwv_flow_api.id(796836695670351822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);',
'get.addParam(''x01'',&APP_PAGE_ID.);',
'get.addParam(''x02'',''PAGE'');',
's = get.get().split("^");',
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");',
'd.dialog({',
'    title: s[0],',
'    bgiframe: true,',
'    width: 750,',
'    height: 750,',
'    modal: true,',
'    draggable : false,',
'    buttons: {',
'      Close: function() { $( this ).dialog( "close" ); }',
'		  }',
'    })'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(796847782004161657)
,p_name=>'Region Help'
,p_event_sequence=>0
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.regionHelp'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(796848065766161673)
,p_event_id=>wwv_flow_api.id(796847782004161657)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);',
'get.addParam(''x01'',this.triggeringElement.id);',
'get.addParam(''x02'',''REGION'');',
'get.addParam(''x03'',&APP_PAGE_ID.);',
's = get.get().split("^");',
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");',
'd.dialog({',
'    title: s[0],',
'    bgiframe: true,',
'    width: 750,',
'    height: 750,',
'    modal: true,',
'    draggable : false,',
'    buttons: {',
'      Close: function() { $( this ).dialog( "close" ); }',
'		  }',
'    })'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(796849495903194096)
,p_name=>'Item Help'
,p_event_sequence=>0
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.itemHelp'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(796849794196194096)
,p_event_id=>wwv_flow_api.id(796849495903194096)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);',
'get.addParam(''x01'',this.triggeringElement.title);',
'get.addParam(''x02'',''ITEM'');',
's = get.get().split("^");',
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");',
'd.dialog({',
'    title: s[0],',
'    bgiframe: true,',
'    width: 500,',
'    height: 200,',
'    modal: true,',
'    draggable : false,',
'    buttons: {',
'      Close: function() { $( this ).dialog( "close" ); }',
'		  }',
'    })'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(797325192391864853)
,p_name=>'Embedded Page Help'
,p_event_sequence=>0
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.embeddedPageHelp'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(797325489338864853)
,p_event_id=>wwv_flow_api.id(797325192391864853)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);',
'get.addParam(''x01'',$v(pFlowStepId));',
'get.addParam(''x02'',''PAGE'');',
's = get.get().split("|");',
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");',
'd.dialog({',
'    title: s[0],',
'    bgiframe: true,',
'    width: 750,',
'    height: 750,',
'    modal: true,',
'    draggable : false,',
'    buttons: {',
'      Close: function() { $( this ).dialog( "close" ); }',
'		  }',
'    })'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(797504170426810941)
,p_name=>'Classification Help'
,p_event_sequence=>0
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.classificationHelp'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(797504480461810959)
,p_event_id=>wwv_flow_api.id(797504170426810941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);',
'get.addParam(''x01'',this.triggeringElement.id);',
'get.addParam(''x02'',''CLASSIFICATION'');',
's = get.get().split("^");',
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");',
'd.dialog({',
'    title: s[0],',
'    bgiframe: true,',
'    width: 750,',
'    height: 750,',
'    modal: true,',
'    draggable : false,',
'    buttons: {',
'      Close: function() { $( this ).dialog( "close" ); }',
'		  }',
'    })'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(798703182373525820)
,p_name=>'Category Help'
,p_event_sequence=>0
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.categoryHelp'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(798703471711525850)
,p_event_id=>wwv_flow_api.id(798703182373525820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var get = new htmldb_Get(null,$v(''pFlowId''),''APPLICATION_PROCESS=getHelp'',0);',
'get.addParam(''x01'',this.triggeringElement.id);',
'get.addParam(''x02'',''CATEGORY'');',
'get.addParam(''x03'',&APP_PAGE_ID.);',
's = get.get().split("^");',
'd = apex.jQuery(''<div id="apex_item_help_text">'' + s[1] + "</div>");',
'd.dialog({',
'    title: s[0],',
'    bgiframe: true,',
'    width: 750,',
'    height: 750,',
'    modal: true,',
'    draggable : false,',
'    buttons: {',
'      Close: function() { $( this ).dialog( "close" ); }',
'		  }',
'    })'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(811819277519403011)
,p_name=>'Hide IR Filters'
,p_event_sequence=>0
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'FUNCTION_BODY'
,p_display_when_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :REQUEST != ''EXPAND'' OR :APP_PAGE_ID < 999 THEN',
'  RETURN TRUE;',
'ELSE',
'  RETURN FALSE;',
'END IF;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(811819594881403017)
,p_event_id=>wwv_flow_api.id(811819277519403011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if( $(''#apexir_CONTROLS_IMAGE'').attr("src") == ''#IMAGE_PREFIX#minus.gif'') { ',
'gReport.toggle_controls($x(''apexir_CONTROL_PANEL_CONTROL'')); ',
'} '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(811852384697698386)
,p_name=>'Show IR Filters'
,p_event_sequence=>0
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_display_when_cond=>'EXPAND'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(811852680411698389)
,p_event_id=>wwv_flow_api.id(811852384697698386)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'if( $(''#apexir_CONTROLS_IMAGE'').attr("src") != ''#IMAGE_PREFIX#minus.gif'') { ',
'gReport.toggle_controls($x(''apexir_CONTROL_PANEL_CONTROL'')); ',
'} '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(812148691267238637)
,p_name=>'Init Sidebar'
,p_event_sequence=>0
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'G_SIDEBAR'
,p_display_when_cond2=>'HIDE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(812148994685238641)
,p_event_id=>wwv_flow_api.id(812148691267238637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#left-sidebar'
,p_attribute_01=>'hideSidebar(0);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(812125788367779034)
,p_name=>'Show Sidebar'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#showPanel'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(812126093668779039)
,p_event_id=>wwv_flow_api.id(812125788367779034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'showSidebar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(812148373128223935)
,p_event_id=>wwv_flow_api.id(812125788367779034)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':G_SIDEBAR := ''SHOW'';'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(812126377070785224)
,p_name=>'Hide Sidebar'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#hidePanel'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(812126680297785224)
,p_event_id=>wwv_flow_api.id(812126377070785224)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'hideSidebar(500);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(812148587326228039)
,p_event_id=>wwv_flow_api.id(812126377070785224)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':G_SIDEBAR := ''HIDE'';'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(793878961575484989)
,p_name=>'Open Modal Window'
,p_event_sequence=>640
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#openModalWindow'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
,p_display_when_cond=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :APP_PAGE_ID BETWEEN 200 AND 999 THEN',
'  RETURN TRUE;',
'ELSE',
'  RETURN FALSE;',
'END IF;'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(793892670223761829)
,p_event_id=>wwv_flow_api.id(793878961575484989)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM_SKILLBUILDERS_MODAL_PAGE'
,p_attribute_02=>'TRIG_ELEMENT_ATTR'
,p_attribute_03=>'f?p=&APP_ID.:1:&APP_SESSION.:::1:::'
,p_attribute_05=>'link'
,p_attribute_06=>'div#success-message'
,p_attribute_07=>'AUTO'
,p_attribute_10=>'createExceptionForm'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(811802223471964853)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Unable to reset pagination.'
,p_process_when=>'GO,P0_SEARCH,RESET'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(811802414446964853)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Reset report search'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P0_SEARCH,P0_ROWS'
,p_process_error_message=>'Unable to clear cache.'
,p_process_when_button_id=>wwv_flow_api.id(811802034387964846)
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_HOME'
,p_name=>'Home'
,p_alias=>'HOME'
,p_page_mode=>'NORMAL'
,p_step_title=>'Home'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'.formRegionContent {',
'        padding: 5px;',
'        width:  99%;',
'}',
'</style>'))
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160503224337'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(539970226138144123)
,p_plug_name=>'Most Recent Evaluation per Application'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  app.workspace,',
'  app.application_id,',
'  app.application_name,',
'  app.last_updated_on,',
'  ast.attribute_set_name,',
'  ae.app_user,',
'  ae.eval_date,',
'  ae.approved_score,',
'  ae.pending_score,',
'  ae.raw_score',
'FROM',
'  (',
'  SELECT',
'    max(app_eval_id) app_eval_id,',
'    application_id',
'  FROM',
'    sv_sec_app_evals',
'  GROUP BY',
'    application_id',
'  ) a,',
'  sv_sec_app_evals ae,',
'  apex_applications app,  ',
'  sv_sec_attribute_sets ast',
'WHERE',
'  a.app_eval_id = ae.app_eval_id',
'  AND ae.application_id = app.application_id',
'  AND ae.attribute_set_id = ast.attribute_set_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(539970329028144123)
,p_name=>'Recent Evaluations'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_csv_output_enclosed_by=>'/'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'SSPENDOL'
,p_internal_uid=>506382451545481530
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539970604449144130)
,p_db_column_name=>'WORKSPACE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Workspace'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'WORKSPACE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539970701895144130)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'App ID'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'APPLICATION_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539970813375144130)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'APPLICATION_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539970902397144130)
,p_db_column_name=>'LAST_UPDATED_ON'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Last Updated'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'LAST_UPDATED_ON'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539971022840144130)
,p_db_column_name=>'ATTRIBUTE_SET_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Attr&nbsp;Set'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'ATTRIBUTE_SET_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539971113746144131)
,p_db_column_name=>'APP_USER'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'User'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'APP_USER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539971202503144131)
,p_db_column_name=>'EVAL_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Date'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'EVAL_DATE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539971312304144131)
,p_db_column_name=>'APPROVED_SCORE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Approved'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'APPROVED_SCORE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539971425861144131)
,p_db_column_name=>'PENDING_SCORE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Pending'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'PENDING_SCORE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539971525489144131)
,p_db_column_name=>'RAW_SCORE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Raw'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'RAW_SCORE'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(539971626830144304)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2531867'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'RUN:WORKSPACE:APPLICATION_ID:APPLICATION_NAME:LAST_UPDATED_ON:ATTRIBUTE_SET_NAME:APP_USER:EVAL_DATE:APPROVED_SCORE:PENDING_SCORE:RAW_SCORE'
,p_sort_column_1=>'EVAL_DATE'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(809881035972029000)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(813469975869654426)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change Scoring Method'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sv_sec_util.populate_result',
'  (',
'  p_result       => :P1_RESULT,',
'  p_app_user     => :APP_USER,',
'  p_app_session  => :APP_SESSION',
'  );',
'  -- &ITEM. x'))
,p_process_when=>'P1_RESULT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Scoring Method Updated.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(813475983393949785)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Page'
,p_process_sql_clob=>':P1_SEARCH := '''';'
,p_process_when_button_id=>wwv_flow_api.id(813475877160947922)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(813476187549950941)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_when_button_id=>wwv_flow_api.id(813475877160947922)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(787670136642949887)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'dashboardXML'
,p_process_sql_clob=>'sv_sec_util.dashboard_xml(p_attribute_set_id => :P1_ATTRIBUTE_SET_ID);'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Reset Password'
,p_page_mode=>'MODAL'
,p_step_title=>'Reset Password'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Reset Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151023121419'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34378735740994345)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33618198219756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286825080461650455)
,p_plug_name=>'Reset Password'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33617953531756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(286825485411650456)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(34378735740994345)
,p_button_name=>'RESET_PASSWORD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset Password'
,p_button_position=>'REGION_TEMPLATE_EDIT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(286827587732650463)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(286825485411650456)
,p_branch_sequence=>10
,p_branch_comment=>'Created 13-JUN-2014 09:28 by SSPENDOL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286826101804650457)
,p_name=>'P10_VERIFY_PASSWORD'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(286825080461650455)
,p_prompt=>'Verify New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286826282237650457)
,p_name=>'P10_PASSWORD'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(286825080461650455)
,p_prompt=>'New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286828087883653788)
,p_name=>'P10_CURRENT_PASSWORD'
,p_is_required=>true
,p_item_sequence=>0
,p_item_plug_id=>wwv_flow_api.id(286825080461650455)
,p_prompt=>'Current Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286827009487650462)
,p_validation_name=>'Passwords Must Match'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :P10_PASSWORD != :P10_VERIFY_PASSWORD THEN',
'  RETURN FALSE;',
'ELSE',
'  RETURN TRUE;',
'END IF;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Passwords must match.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(286825485411650456)
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286827199163650462)
,p_validation_name=>'Password Strength'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
':G_RESULT := APEX_UTIL.STRONG_PASSWORD_VALIDATION',
'  (',
'  p_username       => :P10_USER_NAME,',
'  p_password       => :P10_PASSWORD,',
'  p_old_password   => :P10_CURRENT_PASSWORD,',
'  p_workspace_name => ''x''',
'  );',
'',
'IF :G_RESULT IS NOT NULL THEN',
'  RETURN FALSE;',
'ELSE',
'  RETURN TRUE;',
'END IF;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&G_RESULT.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(286825485411650456)
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286830589754739456)
,p_validation_name=>'Current Password is Correct'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN APEX_UTIL.IS_LOGIN_PASSWORD_VALID',
'  (',
'  p_username  => :APP_USER,',
'  p_password  => :P10_CURRENT_PASSWORD',
'  );'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Please enter your Current Password.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(286825485411650456)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(286828087883653788)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286827278531650462)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Password'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sv_sec_admin.reset_current_user_password',
'  (',
'  p_password => :P10_PASSWORD',
'  );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(286825485411650456)
,p_process_success_message=>'Password Reset.'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Login'
,p_alias=>'LOGIN'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(33601777985756497)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'SSPENDOL'
,p_last_upd_yyyymmddhh24miss=>'20160327083004'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(539859425599331024)
,p_plug_name=>'APEX-SERT Admin'
,p_icon_css_classes=>'fa-gears'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33634512678756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(539860028147331027)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(539859425599331024)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Login'
,p_button_position=>'BODY'
,p_request_source=>'LOGIN'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(539859631545331025)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(539859425599331024)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(33676394556756600)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(539859831231331027)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(539859425599331024)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(33676394556756600)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(539860409262331028)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(539860225377331027)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(539860821562331028)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(539860611093331028)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_api.create_page(
 p_id=>102
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Reset Password'
,p_page_mode=>'NORMAL'
,p_step_title=>'Reset Password'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'SSPENDOL'
,p_last_upd_yyyymmddhh24miss=>'20140717070639'
);
end;
/
prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_ROLES'
,p_name=>'Roles'
,p_page_mode=>'NORMAL'
,p_step_title=>'Roles'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160621180512'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(539957117245999589)
,p_plug_name=>'SERT User Roles'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  ur.user_role_id,',
'  ur.workspace_id,',
'  ur.created_on,',
'  ur.created_by,',
'  REPLACE(ur.role_name, ''SV_SERT_'', NULL) role_name,',
'  ur.user_workspace_id,',
'  ur.user_name,',
'  NVL(w1.workspace,''** All Workspaces **'') workspace,',
'  w2.workspace user_workspace,',
'  ur.user_name || '' ('' || w2.workspace || '')'' user_and_workspace',
'FROM',
'  sv_sec_user_roles ur,',
'  apex_workspaces w1,',
'  apex_workspaces w2',
'WHERE',
'  ur.workspace_id = w1.workspace_id(+)',
'  AND ur.user_workspace_id = w2.workspace_id(+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(539957312976999595)
,p_name=>'eSERT User Roles'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::P210_USER_ROLE_ID:#USER_ROLE_ID#'
,p_detail_link_text=>'<i class="fa fa-pencil"></i>'
,p_owner=>'SSPENDOL'
,p_internal_uid=>506369435494337002
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539957410954999599)
,p_db_column_name=>'USER_ROLE_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'User Role Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'USER_ROLE_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539957511189999599)
,p_db_column_name=>'WORKSPACE_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Workspace Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'WORKSPACE_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539957604194999599)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Created On'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_ON'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539957718699999599)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Created By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_BY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539957800592999599)
,p_db_column_name=>'ROLE_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Role Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'ROLE_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539957923645999600)
,p_db_column_name=>'USER_WORKSPACE_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'User Workspace Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'USER_WORKSPACE_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539958010828999600)
,p_db_column_name=>'USER_NAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'User Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'USER_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539958115165999600)
,p_db_column_name=>'WORKSPACE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Workspace'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'WORKSPACE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539958229491999600)
,p_db_column_name=>'USER_WORKSPACE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'User Workspace'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'USER_WORKSPACE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(539958328098999601)
,p_db_column_name=>'USER_AND_WORKSPACE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'User And Workspace'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'USER_AND_WORKSPACE'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(539958409827999601)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2531735'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'WORKSPACE:ROLE_NAME:USER_AND_WORKSPACE:CREATED_BY:CREATED_ON:'
,p_sort_column_1=>'ROLE_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CREATED_ON'
,p_sort_direction_2=>'DESC'
,p_break_on=>'WORKSPACE'
,p_break_enabled_on=>'WORKSPACE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(539979405424317883)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Assign Role'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:210::'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33378571865832620)
,p_name=>'Refresh Region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(539979405424317883)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33378631573832621)
,p_event_id=>wwv_flow_api.id(33378571865832620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(539957117245999589)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00210
begin
wwv_flow_api.create_page(
 p_id=>210
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Manage Roles'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage Roles'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151022090552'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33378417223832619)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33618198219756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(539961428706067112)
,p_plug_name=>'Manage Roles'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33617953531756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(539961802267067113)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(33378417223832619)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P210_USER_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(539961725457067113)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(33378417223832619)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P210_USER_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(539961618926067113)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(33378417223832619)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P210_USER_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(539962829766067120)
,p_name=>'P210_USER_ROLE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(539961428706067112)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(539963030000067130)
,p_name=>'P210_WORKSPACE_ID'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(539961428706067112)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Workspace'
,p_source=>'WORKSPACE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  workspace,',
'  workspace_id',
'FROM',
'  apex_workspaces',
'WHERE',
'  workspace NOT IN (''INTERNAL'',''COM.ORACLE.APEX.REPOSITORY'')',
'ORDER BY',
'  workspace'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(539963206723067132)
,p_name=>'P210_USER_NAME'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(539961428706067112)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User Name'
,p_source=>'USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  user_name || '' ('' ||',
'  CASE',
'    WHEN is_admin = ''Yes'' AND is_application_developer = ''No'' THEN ''Admin''',
'    WHEN is_admin = ''Yes'' AND is_application_developer = ''Yes'' THEN ''Admin''',
'    WHEN is_admin = ''No''  AND is_application_developer = ''No'' THEN ''User''',
'    WHEN is_admin = ''No''  AND is_application_developer = ''Yes'' THEN ''Developer''',
'    ELSE ''Other''',
'  END || '')'' a,',
'  user_name b',
'FROM',
'  apex_workspace_apex_users',
'WHERE',
'  workspace_id = :P210_USER_WORKSPACE_ID',
'ORDER BY',
'  user_name'))
,p_lov_cascade_parent_items=>'P210_USER_WORKSPACE_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(539963408912067132)
,p_name=>'P210_USER_WORKSPACE_ID'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(539961428706067112)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User Workspace'
,p_source=>'USER_WORKSPACE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  workspace,',
'  workspace_id',
'FROM',
'  apex_workspaces',
'WHERE',
'  workspace NOT IN (''INTERNAL'',''COM.ORACLE.APEX.REPOSITORY'')',
'ORDER BY',
'  workspace'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Workspace -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(539963631657067133)
,p_name=>'P210_ROLE_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(539961428706067112)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Role Name'
,p_source=>'ROLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Administrator;SV_SERT_ADMIN,Approve in a Specific Workspace;SV_SERT_APPROVER,Schedule in a Specific Workspace;SV_SERT_SCHEDULER,Evaluate in a Specific Workspace;SV_SERT_EVALUATOR,Evaluate & Schedule in All Workspaces;SV_SERT_EVALUATOR_SCHEDULE'
||'R_ALL,Approve in All Workspaces;SV_SERT_APPROVER_ALL'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select a Role -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(539979319492312417)
,p_computation_sequence=>10
,p_computation_item=>'P210_WORKSPACE_ID'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
,p_compute_when=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :P210_ROLE_NAME NOT IN (''SV_SERT_APPROVER'',''SV_SERT_SCHEDULER'',''SV_SERT_EVALUATOR'') THEN',
'  RETURN TRUE;',
'ELSE',
'  RETURN FALSE;',
'END IF;'))
,p_compute_when_type=>'FUNCTION_BODY'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(539976924116247580)
,p_name=>'Hide/Show Workspace'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P210_ROLE_NAME'
,p_triggering_condition_type=>'NOT_IN_LIST'
,p_triggering_expression=>'SV_SERT_APPROVER,SV_SERT_SCHEDULER,SV_SERT_EVALUATOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(539977202428247582)
,p_event_id=>wwv_flow_api.id(539976924116247580)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P210_WORKSPACE_ID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(539977421073247582)
,p_event_id=>wwv_flow_api.id(539976924116247580)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P210_WORKSPACE_ID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(539978411396300614)
,p_name=>'Hide/Show User'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P210_USER_WORKSPACE_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(539978718984300615)
,p_event_id=>wwv_flow_api.id(539978411396300614)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P210_USER_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(539978916250300615)
,p_event_id=>wwv_flow_api.id(539978411396300614)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P210_USER_NAME'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(539964426178067136)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SV_SEC_USER_ROLES'
,p_attribute_02=>'SV_SEC_USER_ROLES'
,p_attribute_03=>'P210_USER_ROLE_ID'
,p_attribute_04=>'USER_ROLE_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288591600145071744)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clean Up SV_SEC_USER_NOTIF_PREFS'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DELETE FROM ',
'  sv_sec_user_notif_prefs ',
'WHERE',
'  role_name = :P210_ROLE_NAME',
'  AND workspace_id = :P210_WORKSPACE_ID',
'  AND user_workspace_id = :P210_USER_WORKSPACE_ID',
'  AND user_name = :P210_USER_NAME;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(539961802267067113)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(539964608987067136)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SV_SEC_USER_ROLES'
,p_attribute_02=>'SV_SEC_USER_ROLES'
,p_attribute_03=>'P210_USER_ROLE_ID'
,p_attribute_04=>'USER_ROLE_ID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(539964822911067136)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(539961802267067113)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33378317935832618)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00300
begin
wwv_flow_api.create_page(
 p_id=>300
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Admin Users'
,p_page_mode=>'NORMAL'
,p_step_title=>'Admin Users'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160621175238'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286793587350840001)
,p_plug_name=>'SERT Admin Users'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  user_name,',
'  email,',
'  date_created, ',
'  CASE ',
'    WHEN locked = ''UNLOCK'' THEN ''<a title="Lock Account" href="#" id="'' || user_name ',
'      || ''" class="lockAccount" style="color:black;"><i style="color:#1E6DC5;" class="fa fa-lg fa-unlock"></i>'' ',
'    ELSE ''<a title="Unlock Account" href="#" id="'' || user_name ',
'      || ''" class="unlockAccount" style="color:black;"><i style="color:#1E6DC5;" class="fa fa-lg fa-lock"></i>'' ',
'  END lock_acct,',
'  user_name remove_user',
'FROM',
'  (',
'  SELECT',
'    user_name,',
'    email,',
'    date_created,',
'    CASE WHEN sv_sec_util.is_account_locked(p_user_name => user_name) = ''Y'' THEN ''LOCK'' ELSE ''UNLOCK'' END locked',
'  FROM',
'    apex_workspace_apex_users',
'  WHERE',
'    workspace_id = :WORKSPACE_ID',
'  )'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(286793702460840001)
,p_name=>'eSERT Admin Users'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.::P310_USER_NAME:#USER_NAME#'
,p_detail_link_text=>'<i class="fa fa-pencil"></i>'
,p_owner=>'SSPENDOL'
,p_internal_uid=>253205824978177408
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(286794279343840014)
,p_db_column_name=>'USER_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'User Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'USER_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(286794381271840015)
,p_db_column_name=>'EMAIL'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Email'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'EMAIL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(286794500001840015)
,p_db_column_name=>'DATE_CREATED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Date Created'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'DATE_CREATED'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(286813080798415237)
,p_db_column_name=>'REMOVE_USER'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'&nbsp;'
,p_column_link=>'#'
,p_column_linktext=>'<i class="fa fa-lg fa-trash"></i>'
,p_column_link_attr=>'id="#USER_NAME#" class="removeUser" title="Remove User"'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'REMOVE_USER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33378930093832624)
,p_db_column_name=>'LOCK_ACCT'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'&nbsp;'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(286794988042840256)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2532072'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'USER_NAME:EMAIL:DATE_CREATED:RESET_PASSWORD:REMOVE_USER::ID:LOCK_ACCT'
,p_sort_column_1=>'USER_NAME'
,p_sort_direction_1=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(286812607894404097)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create User'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:310::'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286800798928004187)
,p_name=>'P300_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(286793587350840001)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(286807996588334625)
,p_name=>'Lock Account'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.lockAccount'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286808909190334629)
,p_event_id=>wwv_flow_api.id(286807996588334625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to lock this account?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286808284166334628)
,p_event_id=>wwv_flow_api.id(286807996588334625)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P300_USER_NAME'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286808485573334628)
,p_event_id=>wwv_flow_api.id(286807996588334625)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_util.lock_account',
'  (',
'  p_user_name => :P300_USER_NAME',
'  );'))
,p_attribute_02=>'P300_USER_NAME'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286808684746334629)
,p_event_id=>wwv_flow_api.id(286807996588334625)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(286793587350840001)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(286809309532347883)
,p_name=>'Unlock Account'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.unlockAccount'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286810194852347885)
,p_event_id=>wwv_flow_api.id(286809309532347883)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to unlock this account?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286809588467347884)
,p_event_id=>wwv_flow_api.id(286809309532347883)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P300_USER_NAME'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286809808996347884)
,p_event_id=>wwv_flow_api.id(286809309532347883)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_util.unlock_account',
'  (',
'  p_user_name => :P300_USER_NAME',
'  );'))
,p_attribute_02=>'P300_USER_NAME'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286809989754347884)
,p_event_id=>wwv_flow_api.id(286809309532347883)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(286793587350840001)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(286813184392425742)
,p_name=>'Remove User'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.removeUser'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286814100846425743)
,p_event_id=>wwv_flow_api.id(286813184392425742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to remove this user?  This action cannot be undone.'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286813484307425743)
,p_event_id=>wwv_flow_api.id(286813184392425742)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P300_USER_NAME'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286813708462425743)
,p_event_id=>wwv_flow_api.id(286813184392425742)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :P300_USER_NAME != ''ADMIN'' THEN',
'  sv_sec_admin.delete_user',
'    (',
'    p_user_name => :P300_USER_NAME',
'    );',
'END IF;'))
,p_attribute_02=>'P300_USER_NAME'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286813884555425743)
,p_event_id=>wwv_flow_api.id(286813184392425742)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(286793587350840001)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33378716600832622)
,p_name=>'Refresh Region'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(286793587350840001)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33378809981832623)
,p_event_id=>wwv_flow_api.id(33378716600832622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(286793587350840001)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67944087159565220)
,p_name=>'Refresh Region (button)'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(286812607894404097)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67944125231565221)
,p_event_id=>wwv_flow_api.id(67944087159565220)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(286793587350840001)
);
end;
/
prompt --application/pages/page_00310
begin
wwv_flow_api.create_page(
 p_id=>310
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Manage User'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage User'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160621175246'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33378254154832617)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33618198219756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286815278421442903)
,p_plug_name=>'Manage SERT User'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33617953531756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(286816103008450029)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(33378254154832617)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P310_USER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(286868278745319154)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(33378254154832617)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :P310_USER_ID IS NULL OR :P310_USER_NAME = ''ADMIN'' THEN',
'  RETURN FALSE;',
'ELSE',
'  RETURN TRUE;',
'END IF;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(286859907995813926)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(33378254154832617)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P310_USER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(286869884417330281)
,p_branch_action=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP,310::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(286868278745319154)
,p_branch_sequence=>10
,p_branch_comment=>'Created 16-JUN-2014 12:06 by SSPENDOL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286815588464445791)
,p_name=>'P310_USER_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(286815278421442903)
,p_prompt=>'User Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_read_only_when=>'P310_USER_NAME'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286815793312447271)
,p_name=>'P310_EMAIL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(286815278421442903)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286816784916463751)
,p_name=>'P310_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(286815278421442903)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286818198469495985)
,p_name=>'P310_VERIFY_PASSWORD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(286815278421442903)
,p_prompt=>'Verify Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286858405178784635)
,p_name=>'P310_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(286815278421442903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(286860180908900711)
,p_name=>'P310_ACCOUNT_LOCKED'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(286815278421442903)
,p_prompt=>'Locked'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286817989465493402)
,p_validation_name=>'Check for Duplicate Username'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN APEX_UTIL.IS_USERNAME_UNIQUE',
'  (',
'  p_username => :P310_USER_NAME',
'  );'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'That user name is already in use.  Please choose another.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(286816103008450029)
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286818384055501341)
,p_validation_name=>'P310_EMAIL is valid'
,p_validation_sequence=>20
,p_validation=>'P310_EMAIL'
,p_validation2=>'^[a-zA-Z0-9][a-zA-Z0-9\.\-]{1,}@[a-zA-Z0-9]{1}[a-zA-Z0-9\.\-]{1,}\.{1}[a-zA-Z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Please enter a valid e-mail address.'
,p_always_execute=>'N'
,p_validation_condition=>'SAVE,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(286815793312447271)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286818607258508042)
,p_validation_name=>'Passwords Must Match'
,p_validation_sequence=>30
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :P310_PASSWORD != :P310_VERIFY_PASSWORD THEN',
'  RETURN FALSE;',
'ELSE',
'  RETURN TRUE;',
'END IF;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Passwords must match.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN sv_sec_admin.run_password_validation',
'  (',
'  p_password                 => :P310_PASSWORD,',
'  p_password_verify          => :P310_PASSWORD_VERIFY,',
'  p_request                  => :REQUEST',
'  );'))
,p_validation_condition_type=>'FUNCTION_BODY'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286819383194538909)
,p_validation_name=>'Password Strength'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN sv_sec_admin.password_strength',
'  (',
'  p_user_name => :P310_USER_NAME,',
'  p_password  => :P310_PASSWORD',
'  );'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&G_RESULT.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'IF :REQUEST = ''CREATE'' THEN',
'  RETURN TRUE;',
'ELSIF :REQUEST = ''SAVE'' AND :P310_PASSWORD IS NULL AND :P310_VERIFY_PASSWORD IS NULL THEN',
'  RETURN FALSE;',
'ELSE',
'  RETURN TRUE;',
'END IF;'))
,p_validation_condition_type=>'FUNCTION_BODY'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286863487628987774)
,p_validation_name=>'P310_PASSWORD is NOT NULL'
,p_validation_sequence=>50
,p_validation=>'P310_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN sv_sec_admin.run_password_validation',
'  (',
'  p_password                 => :P310_PASSWORD,',
'  p_password_verify          => :P310_PASSWORD_VERIFY,',
'  p_request                  => :REQUEST',
'  );'))
,p_validation_condition_type=>'FUNCTION_BODY'
,p_associated_item=>wwv_flow_api.id(286816784916463751)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(286864382004005039)
,p_validation_name=>'P310_VERIFY_PASSWORD is NOT NULL'
,p_validation_sequence=>60
,p_validation=>'P310_VERIFY_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN sv_sec_admin.run_password_validation',
'  (',
'  p_password                 => :P310_PASSWORD,',
'  p_password_verify          => :P310_PASSWORD_VERIFY,',
'  p_request                  => :REQUEST',
'  );'))
,p_validation_condition_type=>'FUNCTION_BODY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(286868591559322801)
,p_name=>'Confirm Delete'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(286868278745319154)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286868884122322804)
,p_event_id=>wwv_flow_api.id(286868591559322801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to delete this user?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(286869197792324644)
,p_event_id=>wwv_flow_api.id(286868591559322801)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286816305910460370)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create User'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sv_sec_admin.CREATE_USER(',
'  p_user_name      => :P310_USER_NAME,',
'  p_password       => :P310_PASSWORD,',
'  p_email          => :P310_EMAIL,',
'  p_account_locked => :P310_ACCOUNT_LOCKED',
'  );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(286816103008450029)
,p_process_success_message=>'User Created'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286860709090918238)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update User'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sv_sec_admin.update_user',
'  (',
'  p_user_name                => :P310_USER_NAME,',
'  p_password                 => :P310_PASSWORD,',
'  p_email                    => :P310_EMAIL,',
'  p_account_locked           => :P310_ACCOUNT_LOCKED,',
'  p_reset_password           => :P310_RESET_PASSWORD',
'  );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(286859907995813926)
,p_process_success_message=>'User Modified.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33377945900832614)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286859188817798884)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get User Name & ID'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sv_sec_admin.get_user',
'  (',
'  p_user_name => :P310_USER_NAME',
'  );'))
,p_process_when=>'P310_USER_NAME'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(286868382901320333)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete User'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'sv_sec_admin.delete_user',
'  (',
'  p_user_name => :P310_USER_NAME',
'  );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(286868278745319154)
,p_process_success_message=>'User Deleted.'
);
end;
/
prompt --application/pages/page_00400
begin
wwv_flow_api.create_page(
 p_id=>400
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_PREFERENCES'
,p_name=>'Preferences'
,p_page_mode=>'NORMAL'
,p_step_title=>'Preferences'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217055836'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288246391005734938)
,p_plug_name=>'Preferences'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  snippet_id,',
'  snippet_key,',
'  snippet',
'FROM',
'  sv_sec_snippets',
'WHERE',
'  editable = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288246483796734938)
,p_name=>'Preferences'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:410:&SESSION.::&DEBUG.::P410_SNIPPET_ID:#SNIPPET_ID#'
,p_detail_link_text=>'<i class="fa fa-pencil"></i>'
,p_owner=>'SSPENDOL'
,p_internal_uid=>254658606314072345
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288246685987734943)
,p_db_column_name=>'SNIPPET_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Snippet Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SNIPPET_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288246781530734944)
,p_db_column_name=>'SNIPPET_KEY'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Preference'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SNIPPET_KEY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288246888781734944)
,p_db_column_name=>'SNIPPET'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Value'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SNIPPET'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288247092043735244)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2546593'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SNIPPET_ID:SNIPPET_KEY:SNIPPET:SNIPPET_CLOB'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00410
begin
wwv_flow_api.create_page(
 p_id=>410
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Manage Preference'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage Preference'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160503224253'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33378180567832616)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33618198219756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288248092248803289)
,p_plug_name=>'Manage Preference'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33617953531756523)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(288248308436803289)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33378180567832616)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P410_SNIPPET_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288248892243803294)
,p_name=>'P410_SNIPPET_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(288248092248803289)
,p_use_cache_before_default=>'NO'
,p_source=>'SNIPPET_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288249108359803303)
,p_name=>'P410_SNIPPET_KEY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(288248092248803289)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Snippet Key'
,p_source=>'SNIPPET_KEY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when=>'P410_SNIPPET_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288249287032803305)
,p_name=>'P410_SNIPPET'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(288248092248803289)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Snippet'
,p_source=>'SNIPPET'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(33676573251756601)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288249682854803307)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SV_SEC_SNIPPETS'
,p_attribute_02=>'SV_SEC_SNIPPETS'
,p_attribute_03=>'P410_SNIPPET_ID'
,p_attribute_04=>'SNIPPET_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288249892269803308)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SV_SEC_SNIPPETS'
,p_attribute_02=>'SV_SEC_SNIPPETS'
,p_attribute_03=>'P410_SNIPPET_ID'
,p_attribute_04=>'SNIPPET_ID'
,p_attribute_11=>'U'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288250107760803308)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33378027603832615)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00500
begin
wwv_flow_api.create_page(
 p_id=>500
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_SCHEDULING'
,p_name=>'Scheduled Individual Evaluations'
,p_page_mode=>'NORMAL'
,p_step_title=>'Scheduled Individual Evaluations'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(33611445942756505)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160503224301'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288599409062193473)
,p_plug_name=>'Scheduled Individual Evaluations'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  se.sched_eval_id,',
'  se.scoring_method,',
'  se.application_id,',
'  se.eval_interval,',
'  TO_DATE(se.time_of_day,''HH24'') time,',
'  se.day_of_week,',
'  ats.attribute_set_name,',
'  a.application_name,',
'  se.scheduled_by || '' ('' || w.workspace || '')'' scheduled_by',
'FROM',
'  sv_sec_sched_evals se,',
'  sv_sec_attribute_sets ats,',
'  apex_applications a,',
'  apex_workspaces w',
'WHERE',
'  se.application_id = a.application_id',
'  AND se.attribute_set_id = ats.attribute_set_id',
'  AND se.scheduled_ws = w.workspace_id  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288599506482193474)
,p_name=>'Individual Scheduled Evaluations'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'SSPENDOL'
,p_internal_uid=>255011628999530881
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288599688408193483)
,p_db_column_name=>'SCORING_METHOD'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Scoring'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'SCORING_METHOD'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288599786413193487)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'ID'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'APPLICATION_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288599882231193487)
,p_db_column_name=>'EVAL_INTERVAL'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Interval'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'EVAL_INTERVAL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288600006136193487)
,p_db_column_name=>'TIME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Time'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FMHH PM'
,p_tz_dependent=>'N'
,p_static_id=>'TIME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288600092116193487)
,p_db_column_name=>'DAY_OF_WEEK'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Day'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'DAY_OF_WEEK'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288600188074193488)
,p_db_column_name=>'ATTRIBUTE_SET_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Attribute Set'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'ATTRIBUTE_SET_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288600280574193488)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Application'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'APPLICATION_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288600485651193488)
,p_db_column_name=>'SCHEDULED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Scheduled By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'SCHEDULED_BY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288618979616526220)
,p_db_column_name=>'SCHED_EVAL_ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'&nbsp;'
,p_column_link=>'#'
,p_column_linktext=>'<i class="fa fa-remove fa-lg" style="color:red;"></i>'
,p_column_link_attr=>'class="removeEval" id="#SCHED_EVAL_ID#"'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'SCHED_EVAL_ID'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288600709754193690)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2550129'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'APPLICATION_ID:APPLICATION_NAME:ATTRIBUTE_SET_NAME:SCORING_METHOD:EVAL_INTERVAL:TIME:DAY_OF_WEEK:SCHEDULED_BY:SCHED_EVAL_ID:'
,p_sort_column_1=>'APPLICATION_ID'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288619685634537439)
,p_name=>'P500_SCHED_EVAL_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(288599409062193473)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(288619108359534517)
,p_name=>'Remove App Evaluation'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.removeEval'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288619409704534521)
,p_event_id=>wwv_flow_api.id(288619108359534517)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to remove this scheduled evaluation?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288619999140541311)
,p_event_id=>wwv_flow_api.id(288619108359534517)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P500_SCHED_EVAL_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288620209875544401)
,p_event_id=>wwv_flow_api.id(288619108359534517)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DELETE FROM sv_sec_sched_evals',
'  WHERE sched_eval_id = :P500_SCHED_EVAL_ID;'))
,p_attribute_02=>'P500_SCHED_EVAL_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288620380570545495)
,p_event_id=>wwv_flow_api.id(288619108359534517)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(288599409062193473)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00510
begin
wwv_flow_api.create_page(
 p_id=>510
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_SCHEDULING'
,p_name=>'Scheduled Group Evaluations'
,p_page_mode=>'NORMAL'
,p_step_title=>'Scheduled Group Evaluations'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Scheduled Group Evaluations'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(33611445942756505)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217055926'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288608301073267785)
,p_plug_name=>'Scheduled Group Evaluations'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  TO_DATE(sge.time_of_day,''HH24'') time_of_day,',
'  sge.eval_interval,',
'  sge.day_of_week,',
'  sg.sched_grp_name,',
'  sl.sched_list_name,',
'  sl.sched_list_id,',
'  sg.sched_grp_id,',
'  sge.sched_grp_eval_id,',
'  sg.created_by || '' ('' || w.workspace || '')'' created_by',
'FROM',
'  sv_sec_sched_grp_evals sge,',
'  sv_sec_sched_grp sg,',
'  sv_sec_sched_lists sl,',
'  apex_workspaces w',
'WHERE',
'  sge.sched_grp_id = sg.sched_grp_id',
'  AND sg.sched_list_id = sl.sched_list_id',
'  AND sg.created_ws = w.workspace_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288608408728267785)
,p_name=>'Scheduled Group Evaluations'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'SSPENDOL'
,p_internal_uid=>255020531245605192
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288608578440267786)
,p_db_column_name=>'TIME_OF_DAY'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Time'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'FMHH PM'
,p_tz_dependent=>'N'
,p_static_id=>'TIME_OF_DAY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288608704236267786)
,p_db_column_name=>'EVAL_INTERVAL'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Interval'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'EVAL_INTERVAL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288608809671267786)
,p_db_column_name=>'DAY_OF_WEEK'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Day'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'DAY_OF_WEEK'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288608879235267786)
,p_db_column_name=>'SCHED_GRP_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Schedule Group'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_GRP_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288608998696267787)
,p_db_column_name=>'SCHED_LIST_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Distribution List'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_LIST_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288609100435267787)
,p_db_column_name=>'SCHED_LIST_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Sched List Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_LIST_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288609210210267787)
,p_db_column_name=>'SCHED_GRP_ID'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Sched Grp Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_GRP_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288609388399267788)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_BY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288614701471418432)
,p_db_column_name=>'SCHED_GRP_EVAL_ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'&nbsp;'
,p_column_link=>'#'
,p_column_linktext=>'<i class="fa fa-remove fa-lg" style="color:red;"></i>'
,p_column_link_attr=>'class="removeEval" id="#SCHED_GRP_EVAL_ID#"'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_static_id=>'SCHED_GRP_EVAL_ID'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288609604569267926)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2550218'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SCHED_GRP_NAME:SCHED_LIST_NAME:EVAL_INTERVAL:TIME_OF_DAY:DAY_OF_WEEK:CREATED_BY:SCHED_GRP_EVAL_ID:'
,p_sort_column_1=>'SCHED_GRP_NAME'
,p_sort_direction_1=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288622309491591612)
,p_name=>'P510_SCHED_GRP_EVAL_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(288608301073267785)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(288620705766571613)
,p_name=>'Remove App Evaluation'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.removeEval'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288620995230571620)
,p_event_id=>wwv_flow_api.id(288620705766571613)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure that you want to remove this scheduled group evaluation?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288621181890571620)
,p_event_id=>wwv_flow_api.id(288620705766571613)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P510_SCHED_GRP_EVAL_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id;'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288621379458571620)
,p_event_id=>wwv_flow_api.id(288620705766571613)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DELETE FROM sv_sec_sched_grp_evals',
'  WHERE sched_grp_eval_id = :P510_SCHED_GRP_EVAL_ID;'))
,p_attribute_02=>'P510_SCHED_GRP_EVAL_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(288621587794571620)
,p_event_id=>wwv_flow_api.id(288620705766571613)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(288608301073267785)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00520
begin
wwv_flow_api.create_page(
 p_id=>520
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_SCHEDULING'
,p_name=>'Schedule Groups'
,p_page_mode=>'NORMAL'
,p_step_title=>'Schedule Groups'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Schedule Groups'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(33611445942756505)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217055947'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288611178121307945)
,p_plug_name=>'Schedule Groups'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  sg.sched_grp_id,',
'  sg.sched_grp_name,',
'  sg.created_on,',
'  l.sched_list_name,',
'  l.sched_list_id,',
'  sg.created_by || '' ('' || w.workspace || '')'' created_by,',
'  COUNT(sga.sched_grp_app_id) number_of_apps',
'FROM',
'  sv_sec_sched_grp sg,',
'  apex_workspaces w,',
'  sv_sec_sched_lists l,',
'  sv_sec_sched_grp_apps sga',
'WHERE',
'  sg.created_ws = w.workspace_id',
'  AND sg.sched_list_id = l.sched_list_id',
'  AND sg.sched_grp_id = sga.sched_grp_id(+)',
'GROUP BY',
'  sg.sched_grp_id,',
'  sg.sched_grp_name,',
'  sg.created_on,',
'  l.sched_list_name,',
'  l.sched_list_id,',
'  sg.created_by || '' ('' || w.workspace || '')'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288611290809307945)
,p_name=>'Schedule Groups'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:525:&SESSION.::&DEBUG.::P525_SCHED_GRP_ID:#SCHED_GRP_ID#'
,p_detail_link_text=>'<i class="fa fa-pencil fa-large"></i>'
,p_owner=>'SSPENDOL'
,p_internal_uid=>255023413326645352
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288611485789307946)
,p_db_column_name=>'SCHED_GRP_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Sched Grp Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_GRP_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288611610180307946)
,p_db_column_name=>'SCHED_GRP_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Group Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_GRP_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288611687668307946)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Created On'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_ON'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288611781640307946)
,p_db_column_name=>'SCHED_LIST_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Notification List'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_LIST_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288611907985307947)
,p_db_column_name=>'SCHED_LIST_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Sched List Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_LIST_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288611999474307947)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_BY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288612206945307947)
,p_db_column_name=>'NUMBER_OF_APPS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'# of Apps'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'NUMBER_OF_APPS'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288612279944308084)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2550245'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SCHED_GRP_NAME:SCHED_LIST_NAME:CREATED_BY:CREATED_ON:NUMBER_OF_APPS:'
,p_sort_column_1=>'SCHED_GRP_NAME'
,p_sort_direction_1=>'ASC'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00525
begin
wwv_flow_api.create_page(
 p_id=>525
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Manage Schedule Groups'
,p_page_mode=>'NORMAL'
,p_step_title=>'Manage Schedule Groups'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217060025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288622799853638790)
,p_plug_name=>'Manage Schedule Groups'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288628189807690033)
,p_plug_name=>'Scheduled Group Applications'
,p_parent_plug_id=>wwv_flow_api.id(288622799853638790)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  sga.application_id,',
'  sga.scoring_method,',
'  w.workspace,',
'  ats.attribute_set_name,',
'  a.application_name,',
'  sga.save_pdf',
'FROM',
'  sv_sec_sched_grp_apps sga,',
'  apex_workspaces w,',
'  sv_sec_attribute_sets ats,',
'  apex_applications a',
'WHERE',
'  sga.workspace_id = w.workspace_id',
'  AND sga.attribute_set_id = ats.attribute_set_id',
'  AND sga.application_id = a.application_id',
'  AND sga.sched_grp_id = :P525_SCHED_GRP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288628302032690033)
,p_name=>'Scheduled Group Applications'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'SSPENDOL'
,p_internal_uid=>255040424550027440
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288628680330690078)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'ID'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'APPLICATION_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288628797335690078)
,p_db_column_name=>'SCORING_METHOD'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Scoring'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'SCORING_METHOD'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288628900051690078)
,p_db_column_name=>'WORKSPACE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Workspace'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'WORKSPACE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288628978893690078)
,p_db_column_name=>'ATTRIBUTE_SET_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Attr Set'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'ATTRIBUTE_SET_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288629106555690079)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'APPLICATION_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288629202824690079)
,p_db_column_name=>'SAVE_PDF'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'PDF'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'SAVE_PDF'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288629291192690467)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2550415'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'EDIT:REMOVE:APPLICATION_ID:SCORING_METHOD:WORKSPACE:ATTRIBUTE_SET_NAME:APPLICATION_NAME:SAVE_PDF'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(288623294800638793)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:520:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(288623110127638791)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P525_SCHED_GRP_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(288622984101638791)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_condition=>'P525_SCHED_GRP_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(288623809300638797)
,p_branch_action=>'f?p=&APP_ID.:520:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288624001539638799)
,p_name=>'P525_SCHED_GRP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(288622799853638790)
,p_use_cache_before_default=>'NO'
,p_source=>'SCHED_GRP_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288624195589638806)
,p_name=>'P525_SCHED_GRP_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(288622799853638790)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Group Name'
,p_source=>'SCHED_GRP_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288624410215638807)
,p_name=>'P525_SCHED_LIST_ID'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(288622799853638790)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notification List'
,p_source=>'SCHED_LIST_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  sched_list_name,',
'  sched_list_id',
'FROM',
'  sv_sec_sched_lists',
'WHERE',
'  created_by||created_ws = (SELECT created_by||created_ws FROM sv_sec_sched_grp WHERE sched_grp_id = :P525_SCHED_GRP_ID)',
'ORDER BY',
'  sched_list_name'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288624798624638810)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SV_SEC_SCHED_GRP'
,p_attribute_02=>'SV_SEC_SCHED_GRP'
,p_attribute_03=>'P525_SCHED_GRP_ID'
,p_attribute_04=>'SCHED_GRP_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288624999319638813)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SV_SEC_SCHED_GRP'
,p_attribute_02=>'SV_SEC_SCHED_GRP'
,p_attribute_03=>'P525_SCHED_GRP_ID'
,p_attribute_04=>'SCHED_GRP_ID'
,p_attribute_11=>'U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288625206226638814)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(288623110127638791)
);
end;
/
prompt --application/pages/page_00530
begin
wwv_flow_api.create_page(
 p_id=>530
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_SCHEDULING'
,p_name=>'Notification Lists'
,p_page_mode=>'NORMAL'
,p_step_title=>'Notification Lists'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Notification Lists'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(33611445942756505)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217060213'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288613385195315090)
,p_plug_name=>'Notification Lists'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  sl.sched_list_id,',
'  sl.sched_list_name,',
'  sl.created_on,',
'  sl.created_by || '' ('' || w.workspace || '')'' created_by,',
'  COUNT(slm.sched_list_member_id) number_of_members',
'FROM',
'  sv_sec_sched_lists sl,',
'  sv_sec_sched_list_members slm,',
'  apex_workspaces w',
'WHERE',
'  sl.created_ws = w.workspace_id',
'  AND sl.sched_list_id = slm.sched_list_id(+)',
'GROUP BY',
'  sl.sched_list_id,',
'  sl.sched_list_name,',
'  sl.created_on,',
'  sl.created_by || '' ('' || w.workspace || '')'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288613491678315091)
,p_name=>'Notification Lists'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link=>'f?p=&APP_ID.:535:&SESSION.::&DEBUG.::P535_SCHED_LIST_ID:#SCHED_LIST_ID#'
,p_detail_link_text=>'<i class="fa fa-pencil fa-large"></i>'
,p_owner=>'SSPENDOL'
,p_internal_uid=>255025614195652498
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288613686536315092)
,p_db_column_name=>'SCHED_LIST_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Sched List Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_LIST_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288613791636315092)
,p_db_column_name=>'SCHED_LIST_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Notification List'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SCHED_LIST_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288613898426315092)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Created On'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_ON'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288613980601315093)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Created By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_BY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288614088080315093)
,p_db_column_name=>'NUMBER_OF_MEMBERS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'# of Members'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'NUMBER_OF_MEMBERS'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288614204531315222)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2550264'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SCHED_LIST_NAME:CREATED_BY:CREATED_ON:NUMBER_OF_MEMBERS:'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00535
begin
wwv_flow_api.create_page(
 p_id=>535
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_SCHEDULING'
,p_name=>'Manage Notification Lists'
,p_page_mode=>'NORMAL'
,p_step_title=>'Manage Notification Lists'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(33611445942756505)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'SSPENDOL'
,p_last_upd_yyyymmddhh24miss=>'20160504074433'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288630308066735220)
,p_plug_name=>'Manage Notification Lists'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288632900159740285)
,p_plug_name=>'Notification List Members'
,p_parent_plug_id=>wwv_flow_api.id(288630308066735220)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  first_name,',
'  last_name,',
'  email',
'FROM',
'  sv_sec_sched_list_members',
'WHERE',
'  sched_list_id = :P535_SCHED_LIST_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288632991858740285)
,p_name=>'Notification List Members'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_owner=>'SSPENDOL'
,p_internal_uid=>255045114376077692
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288633204455740286)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'First Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'FIRST_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288633303743740288)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Last Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'LAST_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288633386514740289)
,p_db_column_name=>'EMAIL'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Email'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'EMAIL'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288633600505740465)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2550458'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'FIRST_NAME:LAST_NAME:EMAIL'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(288630810069735222)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:530:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(288630604714735221)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P535_SCHED_LIST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(288630483934735221)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_condition=>'P535_SCHED_LIST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(288631284719735226)
,p_branch_action=>'f?p=&APP_ID.:530:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288631504469735227)
,p_name=>'P535_SCHED_LIST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(288630308066735220)
,p_use_cache_before_default=>'NO'
,p_source=>'SCHED_LIST_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(288631708556735236)
,p_name=>'P535_SCHED_LIST_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(288630308066735220)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notification List Name'
,p_source=>'SCHED_LIST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(33676795613756605)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288632096301735240)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SV_SEC_SCHED_LISTS'
,p_attribute_02=>'SV_SEC_SCHED_LISTS'
,p_attribute_03=>'P535_SCHED_LIST_ID'
,p_attribute_04=>'SCHED_LIST_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288632305184735241)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of SV_SEC_SCHED_LISTS'
,p_attribute_02=>'SV_SEC_SCHED_LISTS'
,p_attribute_03=>'P535_SCHED_LIST_ID'
,p_attribute_04=>'SCHED_LIST_ID'
,p_attribute_11=>'U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(288632479684735241)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(288630604714735221)
);
end;
/
prompt --application/pages/page_00540
begin
wwv_flow_api.create_page(
 p_id=>540
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_SCHEDULING'
,p_name=>'Job Runs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Job Runs'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(33611445942756505)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217060157'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288603991924226362)
,p_plug_name=>'Job Runs'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select * from all_scheduler_job_run_details',
'WHERE',
'  job_name LIKE ''SV_SERT%'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(288604101066226363)
,p_name=>'Job Runs'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_owner=>'SSPENDOL'
,p_internal_uid=>255016223583563770
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288604286962226367)
,p_db_column_name=>'LOG_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Log ID'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288604408825226367)
,p_db_column_name=>'LOG_DATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Log Date'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_DATE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288604484973226368)
,p_db_column_name=>'OWNER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Owner'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'OWNER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288604587349226368)
,p_db_column_name=>'JOB_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Job Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'JOB_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288604698718226368)
,p_db_column_name=>'JOB_SUBNAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Job Subname'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'JOB_SUBNAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288604779795226368)
,p_db_column_name=>'STATUS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Status'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'STATUS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288604880580226368)
,p_db_column_name=>'ERROR#'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Error#'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ERROR#'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605001594226369)
,p_db_column_name=>'REQ_START_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Req Start Date'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'REQ_START_DATE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605082077226369)
,p_db_column_name=>'ACTUAL_START_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Actual Start Date'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'ACTUAL_START_DATE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605194727226369)
,p_db_column_name=>'RUN_DURATION'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Run Duration'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_static_id=>'RUN_DURATION'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605304249226369)
,p_db_column_name=>'INSTANCE_ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Instance Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'INSTANCE_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605399259226370)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Session Id'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SESSION_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605502533226370)
,p_db_column_name=>'SLAVE_PID'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Slave Pid'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SLAVE_PID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605584414226370)
,p_db_column_name=>'CPU_USED'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Cpu Used'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_static_id=>'CPU_USED'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605697807226370)
,p_db_column_name=>'CREDENTIAL_OWNER'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Credential Owner'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CREDENTIAL_OWNER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605793150226370)
,p_db_column_name=>'CREDENTIAL_NAME'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Credential Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CREDENTIAL_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605878571226371)
,p_db_column_name=>'DESTINATION_OWNER'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Destination Owner'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'DESTINATION_OWNER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288605997591226371)
,p_db_column_name=>'DESTINATION'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Destination'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'DESTINATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(288606082812226371)
,p_db_column_name=>'ADDITIONAL_INFO'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Additional Info'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'ADDITIONAL_INFO'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(288606192617226598)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2550184'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'LOG_ID:LOG_DATE:JOB_NAME:STATUS:ERROR#:ADDITIONAL_INFO'
,p_sort_column_1=>'LOG_ID'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'LOG_DATE'
,p_sort_direction_2=>'DESC'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_01500
begin
wwv_flow_api.create_page(
 p_id=>1500
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Error Logs'
,p_page_mode=>'NORMAL'
,p_step_title=>'Error Logs'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'SSPENDOL'
,p_last_upd_yyyymmddhh24miss=>'20160504071918'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(813911742527269862)
,p_plug_name=>'Logs'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'SELECT * FROM logger_logs'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(813911836380269862)
,p_name=>'Logs'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than 10,000 rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV'
,p_detail_link_text=>'<i class="fa fa-pencil"></i>'
,p_owner=>'SSPENDOL'
,p_internal_uid=>780323958897607269
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912032935269905)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912138060269916)
,p_db_column_name=>'LOGGER_LEVEL'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Logger Level'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'LOGGER_LEVEL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912247919269917)
,p_db_column_name=>'TEXT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Text'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'TEXT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912354995269917)
,p_db_column_name=>'TIME_STAMP'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Time Stamp'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_static_id=>'TIME_STAMP'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912434971269917)
,p_db_column_name=>'SCOPE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Scope'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'SCOPE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912544301269917)
,p_db_column_name=>'MODULE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Module'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'MODULE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912647263269917)
,p_db_column_name=>'ACTION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Action'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'ACTION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912760570269917)
,p_db_column_name=>'USER_NAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'User Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'USER_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912851497269917)
,p_db_column_name=>'CLIENT_IDENTIFIER'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Client Identifier'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'CLIENT_IDENTIFIER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813912955782269918)
,p_db_column_name=>'CALL_STACK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Call Stack'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'CALL_STACK'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813913061817269918)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Unit Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'UNIT_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813913155114269918)
,p_db_column_name=>'LINE_NO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Line No'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_static_id=>'LINE_NO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813913237059269918)
,p_db_column_name=>'SCN'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Scn'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'SCN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(813913353369269918)
,p_db_column_name=>'EXTRA'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Extra'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_static_id=>'EXTRA'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(813913455736270598)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'12871'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'TIME_STAMP:ACTION:TEXT'
,p_sort_column_1=>'TIME_STAMP'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(813915857346337289)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(67942362777565203)
,p_button_name=>'PURGE_LOGS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(33676969712756605)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Purge Logs'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'javascript:confirmDelete(''Are you sure? \n\nPurging the log will remove all entries, and can not be undone.'', ''PURGE'');'||wwv_flow.LF||
''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(813916439815341714)
,p_branch_action=>'f?p=&APP_ID.:1500:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 05-JAN-2011 09:14 by SSPENDOL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(813916545356343303)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Purge Logs'
,p_process_sql_clob=>'delete from logger_logs;'
,p_process_success_message=>'Logs Purged.'
);
end;
/
prompt --application/pages/page_01600
begin
wwv_flow_api.create_page(
 p_id=>1600
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_tab_set=>'T_MAILQUEUE'
,p_name=>'Mail Queue'
,p_page_mode=>'NORMAL'
,p_step_title=>'Mail Queue'
,p_step_sub_title=>'Mail Queue'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20151217060233'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(289037502094485994)
,p_plug_name=>'Mail Queue'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  *',
'FROM',
'  apex_mail_queue'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(289037610207485994)
,p_name=>'Mail Queue'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'SSPENDOL'
,p_internal_uid=>255449732724823401
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289037791439485997)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289037881392486003)
,p_db_column_name=>'MAIL_TO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'To'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_TO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289037991870486003)
,p_db_column_name=>'MAIL_FROM'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'From'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_FROM'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038094211486003)
,p_db_column_name=>'MAIL_REPLYTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Reply To'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_REPLYTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038193966486003)
,p_db_column_name=>'MAIL_SUBJ'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Subject'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_SUBJ'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038281352486004)
,p_db_column_name=>'MAIL_CC'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'CC'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_CC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038398665486004)
,p_db_column_name=>'MAIL_BCC'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'BCC'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_BCC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038499601486004)
,p_db_column_name=>'MAIL_BODY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Body'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_BODY'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038593497486004)
,p_db_column_name=>'MAIL_BODY_HTML'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Body (HTML)'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_BODY_HTML'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038679343486004)
,p_db_column_name=>'MAIL_SEND_COUNT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Send Count'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_SEND_COUNT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038791245486005)
,p_db_column_name=>'MAIL_SEND_ERROR'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Send Error'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_SEND_ERROR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038901330486005)
,p_db_column_name=>'LAST_UPDATED_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Last Updated By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_static_id=>'LAST_UPDATED_BY'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(289038989725486006)
,p_db_column_name=>'LAST_UPDATED_ON'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Last Updated On'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'LAST_UPDATED_ON'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(289039300170488293)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2554515'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'ID:MAIL_TO:MAIL_FROM:MAIL_REPLYTO:MAIL_SUBJ:MAIL_SEND_COUNT:MAIL_SEND_ERROR:LAST_UPDATED_ON:'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_01610
begin
wwv_flow_api.create_page(
 p_id=>1610
,p_user_interface_id=>wwv_flow_api.id(251796396174435486)
,p_name=>'Mail Queue Log'
,p_page_mode=>'NORMAL'
,p_step_title=>'Mail Queue Log'
,p_step_sub_title=>'Mail Queue Log'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20160503223942'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(77369912606559784)
,p_plug_name=>'Mail Queue Logs'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(33635078329756543)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  *',
'FROM',
'  apex_mail_log'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(77370304147559790)
,p_name=>'Mail Queue'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'SSPENDOL'
,p_internal_uid=>77370304147559790
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77370874848559805)
,p_db_column_name=>'MAIL_TO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'To'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_TO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77371263552559806)
,p_db_column_name=>'MAIL_FROM'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'From'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_FROM'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77371633583559806)
,p_db_column_name=>'MAIL_REPLYTO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Reply To'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_REPLYTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77372093862559806)
,p_db_column_name=>'MAIL_SUBJ'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Subject'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_SUBJ'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77372430910559806)
,p_db_column_name=>'MAIL_CC'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'CC'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_CC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77372808566559806)
,p_db_column_name=>'MAIL_BCC'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'BCC'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_BCC'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77374437555559810)
,p_db_column_name=>'MAIL_SEND_ERROR'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Send Error'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'MAIL_SEND_ERROR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(77375218707559810)
,p_db_column_name=>'LAST_UPDATED_ON'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Last Updated On'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_static_id=>'LAST_UPDATED_ON'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67943395414565213)
,p_db_column_name=>'MAIL_MESSAGE_CREATED'
,p_display_order=>23
,p_column_identifier=>'N'
,p_column_label=>'Mail message created'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67943416590565214)
,p_db_column_name=>'MAIL_MESSAGE_SEND_BEGIN'
,p_display_order=>33
,p_column_identifier=>'O'
,p_column_label=>'Mail message send begin'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67943576943565215)
,p_db_column_name=>'MAIL_MESSAGE_SEND_END'
,p_display_order=>43
,p_column_identifier=>'P'
,p_column_label=>'Mail message send end'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67943693385565216)
,p_db_column_name=>'MAIL_BODY_SIZE'
,p_display_order=>53
,p_column_identifier=>'Q'
,p_column_label=>'Mail body size'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67943764928565217)
,p_db_column_name=>'MAIL_BODY_HTML_SIZE'
,p_display_order=>63
,p_column_identifier=>'R'
,p_column_label=>'Mail body html size'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67943892966565218)
,p_db_column_name=>'MAIL_ATTACHMENT_COUNT'
,p_display_order=>73
,p_column_identifier=>'S'
,p_column_label=>'Mail attachment count'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67943975765565219)
,p_db_column_name=>'MAIL_ATTACHMENT_SIZE'
,p_display_order=>83
,p_column_identifier=>'T'
,p_column_label=>'Mail attachment size'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(77375640048559815)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'773757'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'MAIL_TO:MAIL_FROM:MAIL_REPLYTO:MAIL_SUBJ:MAIL_SEND_ERROR:LAST_UPDATED_ON::MAIL_MESSAGE_CREATED:MAIL_MESSAGE_SEND_BEGIN:MAIL_MESSAGE_SEND_END:MAIL_BODY_SIZE:MAIL_BODY_HTML_SIZE:MAIL_ATTACHMENT_COUNT:MAIL_ATTACHMENT_SIZE'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(252280979666934643)
);
end;
/
prompt --application/deployment/install
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
