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
,p_default_workspace_id=>42394097823295753
,p_default_application_id=>156
,p_default_owner=>'PACKAGE'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_d3_piechart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2415561109383195064)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.D3.PIECHART'
,p_display_name=>'D3 Pie Chart'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix=>'#IMAGE_PREFIX#plugins/com.oracle.apex.d3.piechart/'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- NOTE: THIS IS THE VALUE FOR PLUGIN FILE PREFIX #IMAGE_PREFIX#plugins/com.oracle.apex.d3.piechart/',
'FUNCTION RENDER (',
'    P_REGION IN APEX_PLUGIN.T_REGION,',
'    P_PLUGIN IN APEX_PLUGIN.T_PLUGIN,',
'    P_IS_PRINTER_FRIENDLY IN BOOLEAN',
') RETURN APEX_PLUGIN.T_REGION_RENDER_RESULT IS',
'    -- Plugin attributes readable names',
'    C_WIDTH CONSTANT NUMBER := TO_NUMBER(APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS(P_REGION.ATTRIBUTE_05));',
'    C_INNER_RADIUS CONSTANT NUMBER := TO_NUMBER(APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS(P_REGION.ATTRIBUTE_06));',
'    C_SHOW_LABELS CONSTANT BOOLEAN := (INSTR('':'' || P_REGION.ATTRIBUTE_07 || '':'', '':LABELS:'')  > 0);',
'    C_SHOW_TOOLTIP CONSTANT BOOLEAN := (INSTR('':'' || P_REGION.ATTRIBUTE_07 || '':'', '':TOOLTIP:'') > 0);',
'    C_SHOW_PERCENTAGES CONSTANT BOOLEAN := (INSTR('':'' || P_REGION.ATTRIBUTE_07 || '':'', '':PERCENTAGES:'')  > 0);',
'    C_COLOR_SCHEME CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_08;',
'    C_VALUE_FORMATTING CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_10;',
'    C_CHART_TYPE CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_11;',
'    C_LEGEND_POSITION VARCHAR2(255) := P_REGION.ATTRIBUTE_12;',
'    ',
'    L_COLORS VARCHAR2(2000);',
'    L_OUTER_RADIUS_VALUE NUMBER;',
'    L_OUTER_RADIUS VARCHAR2(255);',
'    L_INNER_RADIUS VARCHAR2(255);',
'',
'    -- Function constants',
'    C_D3_BASE_DIRECTORY CONSTANT VARCHAR2(255) := APEX_APPLICATION.G_IMAGE_PREFIX || ''libraries/d3/3.5.5/'';',
'    --C_JQUERY_RESIZE_BASE_DIRECTORY CONSTANT VARCHAR2(255) := APEX_APPLICATION.G_IMAGE_PREFIX || ''libraries/jquery-elementresize/0.5/'';',
'    C_PLUGIN_BASE CONSTANT VARCHAR2(255) := APEX_APPLICATION.G_IMAGE_PREFIX || ''plugins/com.oracle.apex.d3.piechart/'';',
'    C_D3_ORACLE_BASE CONSTANT VARCHAR2(255) := APEX_APPLICATION.G_IMAGE_PREFIX || ''plugins/com.oracle.apex.d3/'';',
'    C_D3_ARY_BASE CONSTANT VARCHAR2(255) := APEX_APPLICATION.G_IMAGE_PREFIX || ''plugins/com.oracle.apex.d3.ary/'';',
'    C_D3_TOOLTIP_BASE CONSTANT VARCHAR2(255) := APEX_APPLICATION.G_IMAGE_PREFIX || ''plugins/com.oracle.apex.d3.tooltip/'';',
'BEGIN',
'    -- Placeholder div for chart',
'    SYS.HTP.P(',
'        ''<div><div id="'' || APEX_ESCAPE.HTML_ATTRIBUTE(P_REGION.STATIC_ID || ''_chart'') || ''" class="a-D3PieChart-container"></div></div>'' ',
'    );',
'    ',
'    -- JavaScript libraries',
'    /*APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME => ''jquery.resize'',',
'        P_DIRECTORY => C_JQUERY_RESIZE_BASE_DIRECTORY ',
'    );*/',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME => ''d3.min'',',
'        P_DIRECTORY => C_D3_BASE_DIRECTORY ',
'    );',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME => ''d3.oracle'',',
'        P_DIRECTORY => C_D3_ORACLE_BASE ',
'    );',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME      => ''d3.oracle.tooltip'',',
'        P_DIRECTORY => C_D3_TOOLTIP_BASE ',
'    );',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME      => ''d3.oracle.ary'',',
'        P_DIRECTORY => C_D3_ARY_BASE ',
'    );',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME      => ''d3.oracle.piechart'',',
'        P_DIRECTORY => C_PLUGIN_BASE',
'    );',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME      => ''d3.oracle.piechart.labels'',',
'        P_DIRECTORY => C_PLUGIN_BASE',
'    );',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME => ''com.oracle.apex.d3.piechart'',',
'        P_DIRECTORY => C_PLUGIN_BASE',
'    );',
'    ',
'    -- Styles',
'    APEX_CSS.ADD_FILE (',
'        P_NAME => ''d3.oracle.tooltip'',',
'        P_DIRECTORY => C_D3_TOOLTIP_BASE',
'    );',
'    APEX_CSS.ADD_FILE (',
'        P_NAME => ''d3.oracle.ary'',',
'        P_DIRECTORY => C_D3_ARY_BASE',
'    );',
'    APEX_CSS.ADD_FILE (',
'        P_NAME => ''d3.oracle.piechart'',',
'        P_DIRECTORY => C_PLUGIN_BASE',
'    );',
'',
'    -- Color scheme',
'    -- Defaults to NULL',
'    L_COLORS := CASE C_COLOR_SCHEME',
'        WHEN ''MODERN'' THEN',
'            ''#FF3B30:#FF9500:#FFCC00:#4CD964:#34AADC:#007AFF:#5856D6:#FF2D55:#8E8E93:#C7C7CC''',
'        WHEN ''MODERN2'' THEN',
'            ''#1ABC9C:#2ECC71:#4AA3DF:#9B59B6:#3D566E:#F1C40F:#E67E22:#E74C3C''',
'        WHEN ''SOLAR'' THEN',
'            ''#B58900:#CB4B16:#DC322F:#D33682:#6C71C4:#268BD2:#2AA198:#859900''',
'        WHEN ''METRO'' THEN',
'            ''#E61400:#19A2DE:#319A31:#EF9608:#8CBE29:#A500FF:#00AAAD:#FF0094:#9C5100:#E671B5''',
'        WHEN ''CUSTOM'' THEN',
'            P_REGION.ATTRIBUTE_09',
'    END;',
'    ',
'    L_OUTER_RADIUS_VALUE := C_WIDTH / 2;',
'    IF  L_OUTER_RADIUS_VALUE > 0 AND L_OUTER_RADIUS_VALUE < 1 THEN',
'      L_OUTER_RADIUS := ''0'' || TO_CHAR(L_OUTER_RADIUS_VALUE);',
'    ELSE',
'      L_OUTER_RADIUS := TO_CHAR(L_OUTER_RADIUS_VALUE);',
'    END IF;',
'    ',
'    IF C_CHART_TYPE = ''DONUT'' THEN',
'        L_INNER_RADIUS := TO_CHAR(C_INNER_RADIUS);',
'    ELSE',
'        L_INNER_RADIUS := ''0'';',
'    END IF;',
'',
'    -- Initialize the pie chart when the page has been rendered.',
'    -- apex_javascript.add_attribute are used to make sure that',
'    -- the values are properly escaped.   ',
'    APEX_JAVASCRIPT.ADD_ONLOAD_CODE(',
'        P_CODE => ''com_oracle_apex_d3_pie('' ||',
'            APEX_JAVASCRIPT.ADD_VALUE(P_REGION.STATIC_ID) ||',
'            ''{'' ||',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''chartRegionId'',  P_REGION.STATIC_ID || ''_chart'') ||',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''colors'', L_COLORS) || ',
'                ''"outerRadius":'' || L_OUTER_RADIUS || '','' ||',
'                ''"innerRadius":'' || L_INNER_RADIUS || '','' ||',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''showLabels'', C_SHOW_LABELS) || ',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''legendPosition'', C_LEGEND_POSITION) ||',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''showTooltip'', C_SHOW_TOOLTIP) || ',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''showPercentages'', C_SHOW_PERCENTAGES) || ',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''valueTemplate'', C_VALUE_FORMATTING) || ',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''transitions'', TRUE) || ',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''noDataFoundMessage'', P_REGION.NO_DATA_FOUND_MESSAGE) || ',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''pageItems'', APEX_PLUGIN_UTIL.PAGE_ITEM_NAMES_TO_JQUERY(P_REGION.AJAX_ITEMS_TO_SUBMIT)) ||',
'                APEX_JAVASCRIPT.ADD_ATTRIBUTE(''ajaxIdentifier'', APEX_PLUGIN.GET_AJAX_IDENTIFIER, FALSE, FALSE) ||',
'            ''});'' ',
'    );',
'    ',
'    RETURN NULL;',
'END RENDER;',
'',
'FUNCTION AJAX (',
'     P_REGION IN APEX_PLUGIN.T_REGION,',
'     P_PLUGIN IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_REGION_AJAX_RESULT IS',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable. We are using the same defaults for the',
'    -- required attributes as in the plug-in attribute configuration, because',
'    -- they can still be null. Keep them in sync!',
'    C_LABEL_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_01;',
'    C_VALUE_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_02;',
'    C_COLOR_COLUMN CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_03;',
'    ',
'    C_LINK_TARGET CONSTANT VARCHAR2(255) := P_REGION.ATTRIBUTE_04;',
'',
'    L_LABEL_COLUMN_NO PLS_INTEGER;',
'    L_VALUE_COLUMN_NO PLS_INTEGER;',
'    L_COLOR_COLUMN_NO PLS_INTEGER;',
'    ',
'    L_COLUMN_VALUE_LIST APEX_PLUGIN_UTIL.T_COLUMN_VALUE_LIST2;',
'    ',
'    L_LABEL VARCHAR2(4000);',
'    L_VALUE NUMBER;',
'    L_COLOR VARCHAR2(20);',
'    L_LINK VARCHAR2(4000);',
'BEGIN',
'    APEX_PLUGIN_UTIL.PRINT_JSON_HTTP_HEADER;',
'    ',
'    L_COLUMN_VALUE_LIST := APEX_PLUGIN_UTIL.GET_DATA2(',
'        P_SQL_STATEMENT => P_REGION.SOURCE,',
'        P_MIN_COLUMNS => 2,',
'        P_MAX_COLUMNS => NULL,',
'        P_COMPONENT_NAME => P_REGION.NAME',
'    );',
'    ',
'    -- Get the actual column# for faster access and also verify that the data type',
'    -- of the column matches with what we are looking for',
'    L_LABEL_COLUMN_NO := APEX_PLUGIN_UTIL.GET_COLUMN_NO(',
'        P_ATTRIBUTE_LABEL => ''Label Column'',',
'        P_COLUMN_ALIAS => C_LABEL_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED => TRUE,',
'        P_DATA_TYPE => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2 ',
'    );                              ',
'    L_VALUE_COLUMN_NO := APEX_PLUGIN_UTIL.GET_COLUMN_NO(',
'        P_ATTRIBUTE_LABEL=> ''Value Column'',',
'        P_COLUMN_ALIAS => C_VALUE_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED => TRUE,',
'        P_DATA_TYPE => APEX_PLUGIN_UTIL.C_DATA_TYPE_NUMBER',
'    );',
'    L_COLOR_COLUMN_NO := APEX_PLUGIN_UTIL.GET_COLUMN_NO(',
'        P_ATTRIBUTE_LABEL => ''Color Column'',',
'        P_COLUMN_ALIAS => C_COLOR_COLUMN,',
'        P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'        P_IS_REQUIRED => FALSE,',
'        P_DATA_TYPE => APEX_PLUGIN_UTIL.C_DATA_TYPE_VARCHAR2',
'    );',
'',
'    SYS.HTP.PRN(''['');',
'    -- It''s time to emit the selected rows',
'    FOR L_ROW_NUM IN 1 .. L_COLUMN_VALUE_LIST(1).VALUE_LIST.COUNT LOOP',
'        BEGIN',
'            APEX_PLUGIN_UTIL.SET_COMPONENT_VALUES(',
'                P_COLUMN_VALUE_LIST => L_COLUMN_VALUE_LIST,',
'                P_ROW_NUM => L_ROW_NUM',
'            );',
'            ',
'            L_LABEL := APEX_PLUGIN_UTIL.ESCAPE(',
'                APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2(',
'                    P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_LABEL_COLUMN_NO).DATA_TYPE,',
'                    P_VALUE     => L_COLUMN_VALUE_LIST(L_LABEL_COLUMN_NO).VALUE_LIST(L_ROW_NUM)',
'                ),',
'                P_REGION.ESCAPE_OUTPUT',
'            );',
'            L_VALUE := L_COLUMN_VALUE_LIST(L_VALUE_COLUMN_NO).VALUE_LIST(L_ROW_NUM).NUMBER_VALUE;',
'            IF L_COLOR_COLUMN_NO IS NOT NULL THEN',
'                L_COLOR := APEX_PLUGIN_UTIL.ESCAPE(',
'                    APEX_PLUGIN_UTIL.GET_VALUE_AS_VARCHAR2(',
'                        P_DATA_TYPE => L_COLUMN_VALUE_LIST(L_COLOR_COLUMN_NO).DATA_TYPE,',
'                        P_VALUE     => L_COLUMN_VALUE_LIST(L_COLOR_COLUMN_NO).VALUE_LIST(L_ROW_NUM)',
'                    ),',
'                    TRUE',
'                );',
'            END IF;',
'',
'            IF C_LINK_TARGET IS NOT NULL THEN',
'                L_LINK := WWV_FLOW_UTILITIES.PREPARE_URL(',
'                    APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS (',
'                        P_VALUE => C_LINK_TARGET,',
'                        P_ESCAPE => FALSE',
'                    )',
'                );',
'            END IF;',
'            ',
'            -- write the data to our output buffer',
'            SYS.HTP.P(',
'                CASE WHEN L_ROW_NUM > 1 THEN '','' END ||',
'                ''{'' ||',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE(''label'', L_LABEL) ||',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE(''color'', L_COLOR) ||',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE(''link'', L_LINK) ||',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE(''value'', L_VALUE, FALSE, FALSE ) ||',
'                ''}'' );',
'',
'            APEX_PLUGIN_UTIL.CLEAR_COMPONENT_VALUES;',
'        EXCEPTION WHEN OTHERS THEN',
'            APEX_PLUGIN_UTIL.CLEAR_COMPONENT_VALUES;',
'            RAISE;',
'        END;',
'    END LOOP;',
'    SYS.HTP.PRN('']'');',
'',
'    RETURN NULL;',
'END AJAX;'))
,p_render_function=>'RENDER'
,p_ajax_function=>'AJAX'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT:NO_DATA_FOUND_MESSAGE:ESCAPE_OUTPUT'
,p_sql_min_column_count=>1
,p_sql_examples=>'SELECT DEPT.DEPTNO, NVL(DEPT.DNAME, ''UNDEFINED'') LABEL, COUNT(1) VALUE FROM EMP LEFT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DEPT.DEPTNO, DEPT.DNAME;'
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>'Data Driven Documents (D3) Pie / Donut Chart provides dynamic and interactive bar charts for data visualization, using Scalable Vector Graphics (SVG), JavaScript, HTML5, and Cascading Style Sheets (CSS3) standards.'
,p_version_identifier=>'5.0.1'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>28
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56217147391300083)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Label Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the labels for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56217597438300084)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the values for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56217930730300084)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>110
,p_prompt=>'Colors Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dl>',
'  <dt>Hexadecimal (hex) notation</dt><dd><pre>#FF3377</pre>;</dd>',
'  <dt>HTML colors</dt><dd><pre>blue</pre>.</dd>',
'</dl>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Select the column from the region SQL Query that holds the color codes for the chart. The color can be set using hex values or as the name of the color.</p>',
'<p>Note: If no column is entered then the color will automatically be calculated.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56218413010300085)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_reference_scope=>'ROW'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.',
'<pre>f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.</pre>',
'</p>',
'<p>Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert',
'<pre>javascript:alert(''current empno: &amp;EMPNO.'');</pre>',
'</p>'))
,p_help_text=>'<p>Enter a target page to be called when the user clicks a chart entry.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56218822086300085)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>30
,p_prompt=>'Width '
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_max_length=>5
,p_unit=>'px'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the width of the pie chart you want to create. For example, setting the width to 100 will create a pie chart that is a maximum of 100 pixels wide and 100 pixels in height.</p>',
'<p>Note: If no value is specified, the pie chart will consume all the space of the containing region. </p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56219165557300085)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Inner Radius '
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_unit=>'px'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(56231635102300094)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'DONUT'
,p_help_text=>'Enter the radius of the hole inside the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56219612255300086)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Display Options'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Check which attributes are shown on the pie chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56219991101300086)
,p_plugin_attribute_id=>wwv_flow_api.id(56219612255300086)
,p_display_sequence=>10
,p_display_value=>'Tooltip'
,p_return_value=>'TOOLTIP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56220458307300087)
,p_plugin_attribute_id=>wwv_flow_api.id(56219612255300086)
,p_display_sequence=>30
,p_display_value=>'Labels'
,p_return_value=>'LABELS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56220961425300087)
,p_plugin_attribute_id=>wwv_flow_api.id(56219612255300086)
,p_display_sequence=>40
,p_display_value=>'Percentages'
,p_return_value=>'PERCENTAGES'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56221450343300087)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>100
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select the color scheme used to render the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56221887086300088)
,p_plugin_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_display_sequence=>5
,p_display_value=>'Theme'
,p_return_value=>'THEME'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56222418772300088)
,p_plugin_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_display_sequence=>10
,p_display_value=>'Modern'
,p_return_value=>'MODERN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56222925963300088)
,p_plugin_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56223369049300089)
,p_plugin_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56223879057300089)
,p_plugin_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56224330809300089)
,p_plugin_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_display_sequence=>50
,p_display_value=>'SQL Column'
,p_return_value=>'SQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56224917173300090)
,p_plugin_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_display_sequence=>60
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56225372376300090)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>120
,p_prompt=>'Custom Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(56221450343300087)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'CUSTOM'
,p_help_text=>'<p>Enter a list of CSS supported colors separated by colons.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56225802813300090)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>90
,p_prompt=>'Value Format Mask'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select the data format mask for the pie slices.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56226220496300091)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>10
,p_display_value=>'14,435'
,p_return_value=>',.0f'
,p_help_text=>'Comma-separated thousands, integers'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56226662936300091)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>20
,p_display_value=>'14435'
,p_return_value=>'.0f'
,p_help_text=>'Integer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56227157912300091)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>30
,p_display_value=>'14,435.49'
,p_return_value=>',.2f'
,p_help_text=>'Comma-separated thousands, 2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56227632756300091)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>40
,p_display_value=>'14435.49'
,p_return_value=>'.2f'
,p_help_text=>'2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56228150763300092)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>50
,p_display_value=>'14.4k'
,p_return_value=>'.3s'
,p_help_text=>'Precision 3, SI suffixes'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56228704447300092)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>60
,p_display_value=>'$14,435'
,p_return_value=>'$,.0f'
,p_help_text=>'Currency, comma-separated thousands, integer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56229211368300092)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>70
,p_display_value=>'$14435'
,p_return_value=>'$.0f'
,p_help_text=>'Currency, integer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56229672286300093)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>80
,p_display_value=>'$14,435.49'
,p_return_value=>'$,.2f'
,p_help_text=>'Currency, comma-separated thousands, 2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56230155600300093)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>90
,p_display_value=>'$14435.49'
,p_return_value=>'$.2f'
,p_help_text=>'Currency, 2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56230665655300093)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>100
,p_display_value=>'$14.4k'
,p_return_value=>'$.3s'
,p_help_text=>'Currency, precison 3, SI suffixes'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56231136277300094)
,p_plugin_attribute_id=>wwv_flow_api.id(56225802813300090)
,p_display_sequence=>110
,p_display_value=>'FRIENDLY'
,p_return_value=>'friendly'
,p_help_text=>'Automatically use SI units for thousands and millions'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56231635102300094)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>50
,p_prompt=>'Chart Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'PIE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select whether to display a pie chart or donut chart.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56232068686300094)
,p_plugin_attribute_id=>wwv_flow_api.id(56231635102300094)
,p_display_sequence=>10
,p_display_value=>'Pie'
,p_return_value=>'PIE'
,p_help_text=>'A normal Pie Chart'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56232598773300095)
,p_plugin_attribute_id=>wwv_flow_api.id(56231635102300094)
,p_display_sequence=>20
,p_display_value=>'Donut'
,p_return_value=>'DONUT'
,p_help_text=>'A pie chart with a hole in the middle'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(56233045114300095)
,p_plugin_id=>wwv_flow_api.id(2415561109383195064)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>80
,p_prompt=>'Legend'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(56219612255300086)
,p_depending_on_condition_type=>'NOT_NULL'
,p_lov_type=>'STATIC'
,p_null_text=>'No Legend'
,p_help_text=>'Select the position of the legend when it is being displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56233502981300095)
,p_plugin_attribute_id=>wwv_flow_api.id(56233045114300095)
,p_display_sequence=>10
,p_display_value=>'Above Chart'
,p_return_value=>'TOP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(56233992172300096)
,p_plugin_attribute_id=>wwv_flow_api.id(56233045114300095)
,p_display_sequence=>20
,p_display_value=>'Below Chart'
,p_return_value=>'BOTTOM'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
