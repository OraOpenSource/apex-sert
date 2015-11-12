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
prompt --application/shared_components/plugins/region_type/com_oracle_apex_d3_barchart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2124254240554005996)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.D3.BARCHART'
,p_display_name=>'D3 Bar Chart'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix=>'#IMAGE_PREFIX#plugins/com.oracle.apex.d3.barchart/'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/d3/3.5.5/d3.min.js',
'#IMAGE_PREFIX#plugins/com.oracle.apex.d3/d3.oracle.js',
'#IMAGE_PREFIX#plugins/com.oracle.apex.d3/oracle.jql.js',
'#IMAGE_PREFIX#plugins/com.oracle.apex.d3/jquery.getScrollbarWidth.js',
'#IMAGE_PREFIX#plugins/com.oracle.apex.d3.tooltip/d3.oracle.tooltip.js',
'#IMAGE_PREFIX#plugins/com.oracle.apex.d3.ary/d3.oracle.ary.js',
'#PLUGIN_FILES#d3.oracle.barchart.js',
'#PLUGIN_FILES#d3.oracle.barchart.apex.js',
'#PLUGIN_FILES#com.oracle.apex.d3.barchart.js'))
,p_css_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/com.oracle.apex.d3.tooltip/d3.oracle.tooltip.css',
'#IMAGE_PREFIX#plugins/com.oracle.apex.d3.ary/d3.oracle.ary.css',
'#PLUGIN_FILES#d3.oracle.barchart.css'))
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render ',
'(',
'    p_region                in  apex_plugin.t_region,',
'    p_plugin                in  apex_plugin.t_plugin,',
'    p_is_printer_friendly   in  boolean ',
')',
'return apex_plugin.t_region_render_result',
'is',
'    c_region_static_id      constant varchar2(255)  := apex_escape.html_attribute( p_region.static_id );',
'',
'-- Assign readable names to plugin attributes. Omit data attributes, they''ll be handled in ajax function.',
'    -- Dimensions',
'    c_height_mode           constant varchar2(200)  := p_region.attribute_21;',
'    c_min_height            constant number         := nvl(p_region.attribute_18, 100);',
'    c_max_height            constant number         := nvl(p_region.attribute_19, 500);',
'    c_spacing               constant number         := nvl(p_region.attribute_16, 20);',
'    c_inner_spacing         constant number         := nvl(p_region.attribute_17, 20);',
'',
'    -- Axis titles',
'    c_x_axis_title          constant varchar2(200)  := p_region.attribute_08;',
'    c_y_axis_title          constant varchar2(200)  := p_region.attribute_09;',
'',
'    -- Axis grid',
'    c_x_axis_grid           constant boolean        := instr('':'' || p_region.attribute_22 || '':'', '':X:'') > 0;',
'    c_y_axis_grid           constant boolean        := instr('':'' || p_region.attribute_22 || '':'', '':Y:'') > 0;',
'',
'    -- Tooltip configuration',
'    c_show_tooltip          constant boolean        := p_region.attribute_10 is not null;',
'    c_series_tooltip        constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':SERIES:'') > 0;',
'    c_x_tooltip             constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':X:'') > 0;',
'    c_y_tooltip             constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':Y:'') > 0;',
'    c_custom_tooltip        constant boolean        := instr('':'' || p_region.attribute_10 || '':'', '':CUSTOM:'') > 0;',
'',
'    -- Legend',
'    c_show_legend           constant boolean        := p_region.attribute_12 is not null;',
'    c_legend_position       constant varchar2(200)  := p_region.attribute_12;',
'',
'    -- Display modes',
'    c_value_template        constant varchar2(200)  := nvl(p_region.attribute_15, p_region.attribute_25);',
'    c_horizontal            constant boolean        := substr(p_region.attribute_06, 1, instr(p_region.attribute_06, '','') - 1) = ''HORIZONTAL'';',
'    c_display               constant varchar2(200)  := substr(p_region.attribute_06, instr(p_region.attribute_06, '','') + 1);',
'    c_responsive            constant boolean        := p_plugin.attribute_06 = ''Y'';',
'    c_transitions           constant boolean        := p_plugin.attribute_05 = ''Y'';',
'',
'    -- Colors',
'    c_color_scheme          constant varchar2(200)  := p_region.attribute_13;',
'    l_colors                varchar2(200)           := p_region.attribute_14;',
'    c_multiple_colors       constant boolean        := p_region.attribute_24 = ''Y'';',
'',
'    -- Aspect ratios',
'    c_min_ar                constant number         := nvl( apex_plugin_util.get_attribute_as_number( p_plugin.attribute_02, ''Min Aspect Radio'' ), 1.333);',
'    c_max_ar                constant number         := nvl( apex_plugin_util.get_attribute_as_number( p_plugin.attribute_01, ''Max Aspect Radio'' ), 3);',
'    c_threshold             constant number         := p_plugin.attribute_03;',
'    c_threshold_of          constant varchar2(200)  := p_plugin.attribute_04;',
'',
'    -- Function constants',
'    c_rgb_list_regex        constant varchar2(200)  := ''^#[0-9a-fA-F]{6}(,#[0-9a-fA-F]{6})*$'';',
'begin',
'    -- Add placeholder div',
'    sys.htp.p (',
'        ''<div class="a-D3BarChart" id="'' || c_region_static_id || ''_region">'' ||',
'            ''<div class="a-D3BarChart-container" id="'' || c_region_static_id || ''_chart"></div>'' ||',
'        ''</div>'' );',
'',
'',
'    -- Color scheme',
'    case c_color_scheme',
'        when ''MODERN'' then',
'            l_colors := ''#FF3B30:#FF9500:#FFCC00:#4CD964:#34AADC:#007AFF:#5856D6:#FF2D55:#8E8E93:#C7C7CC'';',
'        when ''MODERN2'' then',
'            l_colors := ''#1ABC9C:#2ECC71:#4AA3DF:#9B59B6:#3D566E:#F1C40F:#E67E22:#E74C3C'';',
'        when ''SOLAR'' then',
'            l_colors := ''#B58900:#CB4B16:#DC322F:#D33682:#6C71C4:#268BD2:#2AA198:#859900'';',
'        when ''METRO'' then',
'            l_colors := ''#E61400:#19A2DE:#319A31:#EF9608:#8CBE29:#A500FF:#00AAAD:#FF0094:#9C5100:#E671B5'';',
'        else',
'            null;',
'    end case;',
'',
'    -- Build the initial chart. Data will be loaded with ajax.',
'    apex_javascript.add_onload_code (',
'        p_code => ''(function(){ var a = com_oracle_apex_d3_barchart('' ||',
'            apex_javascript.add_value(p_region.static_id) ||',
'            ''{'' ||',
'                apex_javascript.add_attribute(''chartRegionId'',  p_region.static_id || ''_chart'') ||',
'                apex_javascript.add_attribute(''xAxisTitle'',     c_x_axis_title) || ',
'                apex_javascript.add_attribute(''yAxisTitle'',     c_y_axis_title) || ',
'                apex_javascript.add_attribute(''showTooltip'',    c_show_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipSeries'',  c_series_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipX'',       c_x_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipY'',       c_y_tooltip) || ',
'                apex_javascript.add_attribute(''tooltipCustom'',  c_custom_tooltip) || ',
'                apex_javascript.add_attribute(''spacing'',        c_spacing) || ',
'                apex_javascript.add_attribute(''innerSpacing'',   c_inner_spacing) || ',
'                apex_javascript.add_attribute(''horizontal'',     c_horizontal) || ',
'                apex_javascript.add_attribute(''display'',        c_display) || ',
'                apex_javascript.add_attribute(''responsive'',     c_responsive) || ',
'                apex_javascript.add_attribute(''transitions'',    c_transitions) || ',
'                apex_javascript.add_attribute(''valueTemplate'',  c_value_template) || ',
'                apex_javascript.add_attribute(''showLegend'',     c_show_legend) || ',
'                apex_javascript.add_attribute(''legendPosition'', c_legend_position) || ',
'                apex_javascript.add_attribute(''colors'',         l_colors) || ',
'                apex_javascript.add_attribute(''xGrid'',          c_x_axis_grid) || ',
'                apex_javascript.add_attribute(''yGrid'',          c_y_axis_grid) || ',
'                apex_javascript.add_attribute(''multipleColors'', c_multiple_colors) || ',
'                apex_javascript.add_attribute(''heightMode'',     c_height_mode) || ',
'                apex_javascript.add_attribute(''minHeight'',      c_min_height) || ',
'                apex_javascript.add_attribute(''maxHeight'',      c_max_height) || ',
'                apex_javascript.add_attribute(''threshold'',      c_threshold) || ',
'                apex_javascript.add_attribute(''thresholdOf'',    c_threshold_of) || ',
'                apex_javascript.add_attribute(''minAR'',          c_min_ar) || ',
'                apex_javascript.add_attribute(''maxAR'',          c_max_ar) || ',
'                apex_javascript.add_attribute(''noDataFoundMessage'', p_region.no_data_found_message) || ',
'                apex_javascript.add_attribute(''pageItems'',      apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit)) ||',
'                apex_javascript.add_attribute(''ajaxIdentifier'', apex_plugin.get_ajax_identifier, false, false) ||',
'            ''},'' || apex_javascript.add_value( p_region.name, false ) || '');})()'' );',
'    return null;',
'end;',
'',
'function ajax',
'(',
'    p_region    in  apex_plugin.t_region,',
'    p_plugin    in  apex_plugin.t_plugin ',
')',
'return apex_plugin.t_region_ajax_result',
'is',
'    -- It''s better to have named variables instead of using the generic ones, ',
'    -- makes the code more readable. ',
'',
'    c_has_multiple_series   constant boolean := p_region.attribute_03 is not null;',
'',
'    -- Column names',
'    c_x_column              constant varchar2(255) := p_region.attribute_01;',
'    c_y_column              constant varchar2(255) := p_region.attribute_02;',
'    c_series_column         constant varchar2(255) := case when c_has_multiple_series then p_region.attribute_04 end;',
'    c_tooltip_column        constant varchar2(255) := p_region.attribute_11;',
'    c_link_target           constant varchar2(800) := p_region.attribute_20;',
'',
'    -- Series name, for single series configuration',
'    c_series_name           constant varchar2(200) := case when not c_has_multiple_series then p_region.attribute_05 end;',
'    c_use_sql_color         constant boolean       := p_region.attribute_13 = ''COLUMN'';',
'',
'    -- Column numbers for fetching',
'    l_x_column_no           pls_integer;',
'    l_y_column_no           pls_integer;',
'    l_series_column_no      pls_integer;',
'    l_tooltip_column_no     pls_integer;',
'    l_column_value_list     apex_plugin_util.t_column_value_list2;',
'',
'    -- Holders for row data',
'    l_x                     varchar2(200);',
'    l_y                     number;',
'    l_series                varchar2(4000);',
'    l_color                 varchar2(4000);',
'    l_tooltip               varchar2(4000);',
'    l_link                  varchar2(4000);',
'',
'begin',
'',
'    apex_json.initialize_output (',
'        p_http_cache => false );',
'',
'    apex_json.open_object;',
'',
'    -- First, we must get the color mapping if the color scheme requires it.',
'    if c_use_sql_color then',
'        l_column_value_list := apex_plugin_util.get_data2 (',
'            p_sql_statement     => p_region.attribute_23,',
'            p_min_columns       => 2,',
'            p_max_columns       => 2,',
'            p_component_name    => p_region.name );',
'',
'        apex_json.open_array(''colors'');',
'        for l_row_num in 1 .. l_column_value_list(1).value_list.count loop',
'            -- Series, optional',
'            l_series := apex_plugin_util.get_value_as_varchar2 (',
'                p_data_type => l_column_value_list(1).data_type,',
'                p_value     => l_column_value_list(1).value_list(l_row_num) );',
'            l_color := apex_plugin_util.get_value_as_varchar2 (',
'                p_data_type => l_column_value_list(2).data_type,',
'                p_value     => l_column_value_list(2).value_list(l_row_num) );',
'            ',
'            apex_json.open_object;',
'            apex_json.write(''series'', l_series);',
'            apex_json.write(''color'',  l_color);',
'            apex_json.close_object;',
'',
'        end loop;',
'        apex_json.close_array;',
'',
'        l_series := null;',
'    end if;',
'',
'    -- Then, we get the actual data points.',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'        p_sql_statement  => p_region.source,',
'        p_min_columns    => 2,',
'        p_max_columns    => 5,',
'        p_component_name => p_region.name );',
'',
'    -- Get the actual column # for faster access and also verify that the data type',
'    -- of the column matches with what we are looking for',
'    l_x_column_no := apex_plugin_util.get_column_no (',
'                p_attribute_label       => ''x column'',',
'                p_column_alias          => c_x_column,',
'                p_column_value_list     => l_column_value_list,',
'                p_is_required           => true,',
'                p_data_type             => apex_plugin_util.c_data_type_varchar2 );',
'',
'    l_y_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''y column'',',
'        p_column_alias          => c_y_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => true,',
'        p_data_type             => apex_plugin_util.c_data_type_number );',
'',
'    l_series_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''series column'',',
'        p_column_alias          => c_series_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => false,',
'        p_data_type             => apex_plugin_util.c_data_type_varchar2 );',
'',
'    l_tooltip_column_no := apex_plugin_util.get_column_no (',
'        p_attribute_label       => ''tooltip column'',',
'        p_column_alias          => c_tooltip_column,',
'        p_column_value_list     => l_column_value_list,',
'        p_is_required           => false,',
'        p_data_type             => apex_plugin_util.c_data_type_varchar2 );',
'',
'    apex_json.open_array(''data'');',
'',
'    -- Fetch data',
'    for l_row_num in 1 .. l_column_value_list(1).value_list.count loop',
'        begin',
'            apex_plugin_util.set_component_values (',
'                p_column_value_list => l_column_value_list,',
'                p_row_num => l_row_num ',
'            );',
'',
'            -- X is a string, required',
'            if l_x_column_no is not null then',
'                l_x := apex_plugin_util.get_value_as_varchar2 (',
'                    p_data_type => l_column_value_list(l_x_column_no).data_type,',
'                    p_value     => l_column_value_list(l_x_column_no).value_list(l_row_num) );',
'            end if;',
'',
'            -- Y is a number, required',
'            l_y := l_column_value_list(l_y_column_no).value_list(l_row_num).number_value;',
'',
'            -- Series, optional',
'            if l_series_column_no is not null then',
'                l_series := apex_plugin_util.get_value_as_varchar2 (',
'                    p_data_type => l_column_value_list(l_series_column_no).data_type,',
'                    p_value     => l_column_value_list(l_series_column_no).value_list(l_row_num) );',
'            end if;',
'',
'            -- Tooltip, optional',
'            if l_tooltip_column_no is not null then',
'                l_tooltip := apex_plugin_util.get_value_as_varchar2 (',
'                    p_data_type => l_column_value_list(l_tooltip_column_no).data_type,',
'                    p_value     => l_column_value_list(l_tooltip_column_no).value_list(l_row_num) );',
'            end if;',
'',
'            -- Link, optional',
'            if c_link_target is not null then',
'                l_link := apex_util.prepare_url (',
'                    apex_plugin_util.replace_substitutions (',
'                        p_value  => c_link_target,',
'                        p_escape => false ) );',
'            end if;',
'',
'            apex_json.open_object;',
'            apex_json.write(''series'',  nvl(l_series, c_series_name));',
'            apex_json.write(''tooltip'', l_tooltip);',
'            apex_json.write(''link'',    l_link);',
'            apex_json.write(''x'',       l_x);',
'            apex_json.write(''y'',       l_y);',
'            apex_json.close_object;',
'',
'            apex_plugin_util.clear_component_values;',
'        exception when others then',
'            apex_plugin_util.clear_component_values;',
'            raise;',
'        end;',
'    end loop;',
'    apex_json.close_array;',
'    apex_json.close_object;',
'',
'    return null;',
'end;'))
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT:NO_DATA_FOUND_MESSAGE'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>5
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>'Data Driven Documents (D3) Bar Chart provides dynamic and interactive bar charts for data visualization, using Scalable Vector Graphics (SVG), JavaScript, HTML5, and Cascading Style Sheets (CSS3) standards.'
,p_version_identifier=>'5.0.1'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>58
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206714538965745930)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>510
,p_prompt=>'Maximum Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'3'
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the maximum aspect ratio that charts use to recommend a height. A maximum aspect ratio of 3 means that the chart''s width should be no greater than 3 times its height. </p>',
'<p>Note: This setting can be overridden by the ''Maximum Height'' setting on the region.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206714991523745930)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>500
,p_prompt=>'Minimum Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'1.333'
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the minimum aspect ratio that charts use to recommend a height. A minimum aspect ratio of 1.333 means that the chart''s width should be no less than 1.333 times its height. </p>',
'<p>Note: This setting can be overridden by the ''Minimum Height'' setting on the region.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206715371560745931)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>540
,p_prompt=>'Responsive Behavior Threshold'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'480'
,p_display_length=>5
,p_max_length=>5
,p_unit=>'px'
,p_is_translatable=>false
,p_help_text=>'Enter the threshold (in pixels) at which the responsive behavior will be activated.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206715808919745931)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>530
,p_prompt=>'Responsive Behavior Measure'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'WINDOW'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select whether the responsive behavior threshold will be compared to the window or the region width.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206716208394745931)
,p_plugin_attribute_id=>wwv_flow_api.id(206715808919745931)
,p_display_sequence=>10
,p_display_value=>'Window'
,p_return_value=>'WINDOW'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206716633755745931)
,p_plugin_attribute_id=>wwv_flow_api.id(206715808919745931)
,p_display_sequence=>20
,p_display_value=>'Region'
,p_return_value=>'REGION'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206717204855745932)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>550
,p_prompt=>'Enable Transitions'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Select whether transitions are enabled for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206717533390745932)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>520
,p_prompt=>'Responsive Behavior'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Select whether responsive behavior is enabled for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206717970685745932)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'X Values Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which holds the X-axis values for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206718374714745933)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Y Values Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which holds the Y-axis values for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206718789075745933)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>50
,p_prompt=>'Multiple Series'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Check multiple series if you want the chart displaying more than one series of data. The different series must be specified by a column from the region SQL Query.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206719221849745933)
,p_plugin_attribute_id=>wwv_flow_api.id(206718789075745933)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206719660074745933)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>60
,p_prompt=>'Series Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206718789075745933)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'Select the column from the region SQL Query that defines the multiple series for the chart. The values from this column will become the labels for the series.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206720049284745934)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>70
,p_prompt=>'Series Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(206718789075745933)
,p_depending_on_condition_type=>'NULL'
,p_help_text=>'Enter the name of the single data series which is shown on the legend.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206720490291745934)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>40
,p_prompt=>'Display'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VERTICAL,SIDE-BY-SIDE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select how the bar chart data is displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206720887376745935)
,p_plugin_attribute_id=>wwv_flow_api.id(206720490291745934)
,p_display_sequence=>10
,p_display_value=>'Vertical, Side by Side'
,p_return_value=>'VERTICAL,SIDE-BY-SIDE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206721346907745935)
,p_plugin_attribute_id=>wwv_flow_api.id(206720490291745934)
,p_display_sequence=>20
,p_display_value=>'Horizontal, Side by Side'
,p_return_value=>'HORIZONTAL,SIDE-BY-SIDE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206721896888745935)
,p_plugin_attribute_id=>wwv_flow_api.id(206720490291745934)
,p_display_sequence=>30
,p_display_value=>'Vertical, Stacked'
,p_return_value=>'VERTICAL,STACKED'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206722375308745936)
,p_plugin_attribute_id=>wwv_flow_api.id(206720490291745934)
,p_display_sequence=>40
,p_display_value=>'Horizontal, Stacked'
,p_return_value=>'HORIZONTAL,STACKED'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206722849628745936)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>90
,p_prompt=>'X-Axis Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>20
,p_is_translatable=>true
,p_help_text=>'Enter the label for the X-axis.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206723330063745936)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>100
,p_prompt=>'Y-Axis Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>20
,p_is_translatable=>true
,p_help_text=>'The label for the Y-axis.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206723717377745936)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>130
,p_prompt=>'Tooltips'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Check which attributes are shown on the tooltip for each data point. The ''Custom column'' option allows you to specify text for each individual data point as an additional column in the region SQL Query.</p>',
'<p>Note: Leave all options unchecked to disable the tooltip.</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206724127718745937)
,p_plugin_attribute_id=>wwv_flow_api.id(206723717377745936)
,p_display_sequence=>0
,p_display_value=>'Show series name'
,p_return_value=>'SERIES'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206724628321745937)
,p_plugin_attribute_id=>wwv_flow_api.id(206723717377745936)
,p_display_sequence=>10
,p_display_value=>'Show X value'
,p_return_value=>'X'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206725113536745937)
,p_plugin_attribute_id=>wwv_flow_api.id(206723717377745936)
,p_display_sequence=>20
,p_display_value=>'Show Y value'
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206725613363745938)
,p_plugin_attribute_id=>wwv_flow_api.id(206723717377745936)
,p_display_sequence=>30
,p_display_value=>'Custom column'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206726099990745938)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>140
,p_prompt=>'Tooltip Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206723717377745936)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SERIES:X:Y:CUSTOM,SERIES:X:CUSTOM,SERIES:Y:CUSTOM,X:Y:CUSTOM,SERIES:CUSTOM,X:CUSTOM,Y:CUSTOM,CUSTOM'
,p_help_text=>'Enter the column from the region SQL Query that holds the custom tooltip values.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206726472883745938)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>150
,p_prompt=>'Legend'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'No Legend'
,p_help_text=>'Select where the legend is displayed on the chart.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206726923804745938)
,p_plugin_attribute_id=>wwv_flow_api.id(206726472883745938)
,p_display_sequence=>10
,p_display_value=>'Above chart'
,p_return_value=>'TOP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206727337777745939)
,p_plugin_attribute_id=>wwv_flow_api.id(206726472883745938)
,p_display_sequence=>20
,p_display_value=>'Below chart'
,p_return_value=>'BOTTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206728017466745939)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>250
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Theme Default'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Select the color scheme used to render the chart.</p>',
'<p>Note: For multiple series charts, each series will be assigned a different color depending on the setting for ''Multiple Colors''.</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206728341064745939)
,p_plugin_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_display_sequence=>10
,p_display_value=>'Modern'
,p_return_value=>'MODERN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206728853316745940)
,p_plugin_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206729357704745941)
,p_plugin_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206729862194745941)
,p_plugin_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206730353839745941)
,p_plugin_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_display_sequence=>50
,p_display_value=>'SQL Query'
,p_return_value=>'COLUMN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206730867359745942)
,p_plugin_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_display_sequence=>60
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206731356039745942)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>260
,p_prompt=>'Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'CUSTOM'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dl>',
'  <dt>Hexadecimal (hex) notation</dt><dd><pre>#FF3377</pre>;</dd>',
'  <dt>RGB color notation  (red,green,blue)</dt><dd><pre>rgba(0,25,47,0.5)</pre>; or </dd>',
'  <dt>RGBA color notation (red,green,blue,alpha)</dt><dd><pre>rgba(0,25,47,0.5)</pre>; or </dd>',
'  <dt>HTML colors</dt><dd><pre>blue</pre>.</dd>',
'</dl>'))
,p_help_text=>'<p>Enter a colon-separated list of color strings for the custom colors to be used in the chart.</p>'
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206731776332745942)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>120
,p_prompt=>'Custom Value Formatting'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'FRIENDLY'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_depending_on_condition_type=>'NULL'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul>',
'<li><b>,d</b> = 14,435</li>',
'<li><b>d</b> = 14435</li>',
'<li><b>,.2f</b> = 14,435.49</li>',
'<li><b>.2f</b> = 14435.49</li>',
'<li><b>.3s</b> = 14.4k</li>',
'<li><b>$,d</b> = $14,435</li>',
'<li><b>$d</b> = $14435</li>',
'<li><b>$,.2f</b> = $14,435.49</li>',
'<li><b>$.2f</b> = $14435.49</li>',
'<li><b>$.3s</b> = $14.4k</li>',
'<li><b>n" ft."</b> = 14435.49 ft. **</li>',
'<li><b>"[["$.3s"]]"</b> = [[$14.4k]] **</li>',
'<li>Refer to https://github.com/mbostock/d3/wiki/Formatting#d3_format for the full syntax specification</li>',
'</ul>',
'<br/>',
'** You may use leading and trailing double-quoted literals, but this feature is not part of the standard D3 specification'))
,p_help_text=>'Enter the D3 format string used to format the Y-axis values on axes, tooltips and legends. Use <pre>FRIENDLY</pre> to utilize sensible formatting defaults for your data.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206732170881745943)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>200
,p_prompt=>'Spacing Between Categories'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'10'
,p_display_length=>5
,p_max_length=>3
,p_unit=>'%'
,p_is_translatable=>false
,p_help_text=>'Enter the spacing between categories, expressed as an integer percentage (1-100).'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206732620856745943)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>210
,p_prompt=>'Spacing Between Series'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'10'
,p_display_length=>5
,p_max_length=>3
,p_unit=>'%'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206718789075745933)
,p_depending_on_condition_type=>'NOT_NULL'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the spacing between series on the same category (X-axis value). It is represented as an integer percentage (0-100).</p>',
'<p>Note: This setting only affects charts using the "Side by Side" display modes.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206732988596745943)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>180
,p_prompt=>'Minimum Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_display_length=>5
,p_unit=>'px'
,p_is_translatable=>false
,p_help_text=>'Enter the minimum height, in pixels, of the chart. Chart width will adapt to the size of the region. Defaults to 100px.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206733345372745944)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>190
,p_prompt=>'Maximum Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_display_length=>5
,p_unit=>'px'
,p_is_translatable=>false
,p_help_text=>'The maximum height, in pixels, of the chart. Chart width will adapt to the size of the region. Defaults to 500px.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206733758961745944)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>20
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(206734161045745944)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>21
,p_display_sequence=>170
,p_prompt=>'Height Measure'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'BARS'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select how the minimum and maximum height of the chart is calculated.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206734598977745944)
,p_plugin_attribute_id=>wwv_flow_api.id(206734161045745944)
,p_display_sequence=>10
,p_display_value=>'Bars Area'
,p_return_value=>'BARS'
,p_help_text=>'Minimum and maximum height for the area is determined by the height of the the bars drawn. Axis labels may take additional space.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206735096627745945)
,p_plugin_attribute_id=>wwv_flow_api.id(206734161045745944)
,p_display_sequence=>20
,p_display_value=>'Chart Area'
,p_return_value=>'CHART'
,p_help_text=>'Minimum and maximum height will include the axes dimensions.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206735553663745945)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>22
,p_display_sequence=>160
,p_prompt=>'Show Grid Lines'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Check the axes to display grid lines for that axis.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206735961851745945)
,p_plugin_attribute_id=>wwv_flow_api.id(206735553663745945)
,p_display_sequence=>10
,p_display_value=>'X-Axis'
,p_return_value=>'X'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206736449663745946)
,p_plugin_attribute_id=>wwv_flow_api.id(206735553663745945)
,p_display_sequence=>20
,p_display_value=>'Y-Axis'
,p_return_value=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206736939161745946)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>23
,p_display_sequence=>270
,p_prompt=>'Color SQL Query'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206728017466745939)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'COLUMN'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>select ''SALES'', rgb(0,255,0)',
'from dual',
'UNION',
'select ''RESEARCH'', rgba(0,25,47,0.5)',
'from dual;</pre>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter a SQL Query that maps a series name to an RGB color. The first column must contain the series names (and those values must match the ones returned from the region SQL) and the second column must have the RGB or RGBA color notation for the serie'
||'s. ',
'Both columns must be VARCHAR2.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206737410706745946)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>24
,p_display_sequence=>80
,p_prompt=>'Multiple Colors'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(206718789075745933)
,p_depending_on_condition_type=>'NULL'
,p_help_text=>'Select whether each series is displayed in a different color.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(206737760173745946)
,p_plugin_id=>wwv_flow_api.id(2124254240554005996)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>25
,p_display_sequence=>110
,p_prompt=>'Value Format Mask'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Custom'
,p_help_text=>'Select the format mask to apply to the displayed values.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206738206385745947)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>30
,p_display_value=>'14,435'
,p_return_value=>',.0f'
,p_help_text=>'Comma-separated thousands, integers'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206738669450745947)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>40
,p_display_value=>'14435'
,p_return_value=>'.0f'
,p_help_text=>'Integer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206739151872745947)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>60
,p_display_value=>'14,435.49'
,p_return_value=>',.2f'
,p_help_text=>'Comma-separated thousands, 2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206739683901745948)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>70
,p_display_value=>'14435.49'
,p_return_value=>'.2f'
,p_help_text=>'2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206740229432745948)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>71
,p_display_value=>'14.4k'
,p_return_value=>'.3s'
,p_help_text=>'Precision 3, SI suffixes'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206740644725745948)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>80
,p_display_value=>'$14,435'
,p_return_value=>'$,.0f'
,p_help_text=>'Currency, comma-separated thousands, integer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206741146692745949)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>90
,p_display_value=>'$14435'
,p_return_value=>'$.0f'
,p_help_text=>'Currency, integer'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206741706219745949)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>99
,p_display_value=>'$14,435.49'
,p_return_value=>'$,.2f'
,p_help_text=>'Currency, comma-separated thousands, 2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206742177181745949)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>100
,p_display_value=>'$14435.49'
,p_return_value=>'$.2f'
,p_help_text=>'Currency, 2 decimals'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(206742728097745949)
,p_plugin_attribute_id=>wwv_flow_api.id(206737760173745946)
,p_display_sequence=>120
,p_display_value=>'$14.4k'
,p_return_value=>'$.3s'
,p_help_text=>'Currency, precison 3, SI suffixes'
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
