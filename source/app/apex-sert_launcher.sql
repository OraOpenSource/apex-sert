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
,p_default_workspace_id=>5500133552698963
);
end;
/
prompt  Set Application Offset...
begin
   -- SET APPLICATION OFFSET
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(5558957290567820)
,p_name=>'SERT Launcher'
);
 
end;
/
prompt --application/restful_services/sert_launcher
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(5558957290567820)
,p_name=>'SERT Launcher'
,p_parsing_schema=>'SV_SERT_LAUNCHER'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>27
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(5559052192567824)
,p_module_id=>wwv_flow_api.id(5558957290567820)
,p_uri_template=>'launch/{p_session_id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(5559116141567825)
,p_template_id=>wwv_flow_api.id(5559052192567824)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'YES'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_instance_id varchar2(100);',
'  l_cookie_value varchar2(1000);',
'  l_builder_cookie owa_cookie.cookie;',
'  l_url varchar2(32767);',
'begin',
'',
'  -- Get the INSTANCE_ID',
'  select snippet ',
'  into l_instance_id ',
'  from sv_sec_snippets ',
'  where snippet_key = ''INSTANCE_ID'';',
'',
'  -- Get the Builder Cookie value',
'  l_builder_cookie := owa_cookie.get (''ORA_WWV_USER_'' || l_instance_id);',
'  ',
'  if l_builder_cookie.num_vals = 0 THEN',
'    -- Redirect if no Builder Cookie Found',
'    l_url := (''f?p='' || v(''APP_ID'') || '':103:0'');',
'  else',
'    -- Store the cookie and session ID values',
'    sv_sec_util.record_cookie',
'    (',
'      p_session_id => :p_session_id,',
'      p_cookie_val => l_builder_cookie.vals(1)',
'    );',
'',
'    -- Redirect to eSERT',
'    l_url := ''f?p=SERT:101:0::::P101_SESSION_ID:'' || :p_session_id;',
'  end if;',
'',
'',
'  :URL := ''../../'' || l_url;',
'  :STATUS := 302;',
'end;'))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(5559230035569796)
,p_handler_id=>wwv_flow_api.id(5559116141567825)
,p_name=>'LOCATION'
,p_bind_variable_name=>'URL'
,p_source_type=>'HEADER'
,p_access_method=>'OUT'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(5559359294572397)
,p_handler_id=>wwv_flow_api.id(5559116141567825)
,p_name=>'X-APEX-STATUS-CODE'
,p_bind_variable_name=>'STATUS'
,p_source_type=>'HEADER'
,p_access_method=>'OUT'
,p_param_type=>'STRING'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
