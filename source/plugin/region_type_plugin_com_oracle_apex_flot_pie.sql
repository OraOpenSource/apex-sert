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
prompt --application/shared_components/plugins/region_type/com_oracle_apex_flot_pie
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2577297973466630661)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.FLOT.PIE'
,p_display_name=>'Flot Pie Chart'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix=>'#IMAGE_PREFIX#plugins/com.oracle.apex.flot_pie/'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.3/excanvas#MIN#.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.3/jquery.flot#MIN#.js',
'#IMAGE_PREFIX#libraries/jquery-flot/0.8.3/jquery.flot.resize#MIN#.js',
'#PLUGIN_FILES#jquery.flot.pie.js',
'#PLUGIN_FILES#com_oracle_apex_flot_pie.js'))
,p_css_file_urls=>'#PLUGIN_FILES#com_oracle_apex_flot_pie.css'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'    -- NOTE: THIS IS THE VALUE FOR PLUGIN FILE PREFIX #IMAGE_PREFIX#plugins/com.oracle.apex.flot_pie/',
'',
'function render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'    -- determine plugin attributes and assign readable names',
'    c_color_scheme         constant varchar2(255) := p_region.attribute_15;',
'    l_colors               varchar2(2000);',
'',
'    c_pie_type             constant apex_application_page_regions.attribute_05%type := nvl(p_region.attribute_05, ''STANDARD'');',
'',
'    c_inner_radius         constant number  := apex_plugin_util.get_attribute_as_number(apex_plugin_util.replace_substitutions(nvl(p_region.attribute_14,''-1'')), ''Inner Radius'');',
'',
'    c_show_tooltip         constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':TOOLTIP:'') > 0);',
'    c_show_legend          constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':LEGEND:'') > 0);',
'    c_show_label           constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':LABEL:'')  > 0);',
'    c_show_value           constant boolean := (instr('':'' || p_region.attribute_08 || '':'', '':VALUE:'')  > 0);',
'    c_pie_width            constant number  := to_number(apex_plugin_util.replace_substitutions(p_region.attribute_06));',
'',
'    c_min_height           constant number  := to_number(nvl(p_region.attribute_17, ''100''));',
'    c_max_height           constant number  := to_number(nvl(p_region.attribute_18, ''400''));',
'',
'    c_min_ar               constant number  := greatest(apex_plugin_util.get_attribute_as_number(p_plugin.attribute_01, ''Min Aspect Ratio''), 0.25);',
'    c_max_ar               constant number  := least(apex_plugin_util.get_attribute_as_number(p_plugin.attribute_02, ''Max Aspect Ratio''), 4);',
'',
'    c_combine_slices       constant boolean := (nvl(p_region.attribute_09, ''N'') = ''Y'');',
'    c_combine_threshold    constant number  := nvl(to_number(p_region.attribute_10), 10);',
'    c_combined_slice_label constant apex_application_page_regions.attribute_11%type := nvl(p_region.attribute_11, ''Other'');',
'    c_combined_slice_link  constant apex_application_page_regions.attribute_12%type := p_region.attribute_12;',
'    c_combined_slice_color constant apex_application_page_regions.attribute_13%type := p_region.attribute_13;',
'begin',
'    -- add placeholder div for chart',
'    sys.htp.p(',
'        ''<div class="flotPieContainer"><div id="'' || apex_escape.html_attribute(p_region.static_id || ''_chart'') || ''" style="width:'' ||',
'        case when c_pie_width is null then ''auto'' else c_pie_width || ''px'' end ||',
'        ''" class="flotPieContainerInner"></div></div>'' );',
'',
'    -- Set the colors to be used, if a non-SQL scheme was selected',
'    case c_color_scheme',
'      when ''MODERN'' then',
'        l_colors := ''#FF3B30,#FF9500,#FFCC00,#4CD964,#34AADC,#007AFF,#5856D6,#FF2D55,#8E8E93,#C7C7CC'';',
'      when ''MODERN2'' then',
'        l_colors := ''#1ABC9C,#2ECC71,#4AA3DF,#9B59B6,#3D566E,#F1C40F,#E67E22,#E74C3C'';',
'      when ''SOLAR'' then',
'        l_colors := ''#B58900,#CB4B16,#DC322F,#D33682,#6C71C4,#268BD2,#2AA198,#859900'';',
'      when ''METRO'' then',
'        l_colors := ''#E61400,#19A2DE,#319A31,#EF9608,#8CBE29,#A500FF,#00AAAD,#FF0094,#9C5100,#E671B5'';',
'      when ''CUSTOM'' then',
'        l_colors := p_region.attribute_16;',
'      when ''SQL'' then',
'        l_colors := null;',
'    end case;',
'',
'    -- Initialize the Flot pie chart when the page has been rendered.',
'    -- apex_javascript.add_attribute are used to make sure that',
'    -- the values are properly escaped.   ',
'    apex_javascript.add_onload_code (',
'        p_code => ''com_oracle_apex_flot_pie('' ||',
'                  apex_javascript.add_value(p_region.static_id) ||',
'                  ''{'' ||',
'                      apex_javascript.add_attribute(''colors'',           l_colors) || ',
'                      apex_javascript.add_attribute(''type'',             c_pie_type) || ',
'                      apex_javascript.add_attribute(''innerRadius'',      c_inner_radius)||',
'                      apex_javascript.add_attribute(''minAR'',            c_min_ar)||',
'                      apex_javascript.add_attribute(''maxAR'',            c_max_ar)||',
'                      apex_javascript.add_attribute(''minHeight'',        c_min_height) || ',
'                      apex_javascript.add_attribute(''maxHeight'',        c_max_height) || ',
'                      apex_javascript.add_attribute(''showLabel'',        c_show_label) || ',
'                      apex_javascript.add_attribute(''showLegend'',       c_show_legend) ||',
'                      apex_javascript.add_attribute(''showTooltip'',      c_show_tooltip) || ',
'                      apex_javascript.add_attribute(''showValue'',        c_show_value) || ',
'                      apex_javascript.add_attribute(''combineSlices'',    c_combine_slices) || ',
'                      apex_javascript.add_attribute(''combineThreshold'', c_combine_threshold) || ',
'                      apex_javascript.add_attribute(''combineLabel'',     apex_plugin_util.escape(',
'                                                                            apex_plugin_util.replace_substitutions (',
'                                                                                p_value  => c_combined_slice_label,',
'                                                                                p_escape => false ),',
'                                                                            p_region.escape_output )) || ',
'                      apex_javascript.add_attribute(''combineUrl'',       wwv_flow_utilities.prepare_url(',
'                                                                            apex_plugin_util.replace_substitutions (',
'                                                                                p_value  => c_combined_slice_link,',
'                                                                                p_escape => false ))) ||',
'                      apex_javascript.add_attribute(''combineColor'',     apex_plugin_util.escape(',
'                                                                            apex_plugin_util.replace_substitutions (',
'                                                                                p_value  => c_combined_slice_color,',
'                                                                                p_escape => false ),',
'                                                                            true )) || ',
'                      apex_javascript.add_attribute(''noDataFoundMessage'', p_region.no_data_found_message) || ',
'                      apex_javascript.add_attribute(''pageItems'',        apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit)) ||',
'                      apex_javascript.add_attribute(''ajaxIdentifier'',   apex_plugin.get_ajax_identifier, false, false) ||',
'                  ''});'' );',
'    apex_javascript.add_onload_code (',
'        p_code => ''setTimeout(function(){$("span.pieLabel").removeAttr("id");},1000);'' );',
'',
'    return null;',
'',
'end render;',
'',
'',
'function ajax (',
'     p_region in apex_plugin.t_region,',
'     p_plugin in apex_plugin.t_plugin )',
'     return apex_plugin.t_region_ajax_result',
'is',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable. We are using the same defaults for the',
'    -- required attributes as in the plug-in attribute configuration, because',
'    -- they can still be null. Keep them in sync!',
'    c_label_column constant varchar2(255) := p_region.attribute_01;',
'    c_value_column constant varchar2(255) := p_region.attribute_02;',
'    c_color_column constant varchar2(255) := p_region.attribute_03;',
'    c_link_target  constant varchar2(255) := p_region.attribute_04;',
'',
'    l_label_column_no   pls_integer;',
'    l_value_column_no   pls_integer;',
'    l_color_column_no   pls_integer;',
'    l_column_value_list apex_plugin_util.t_column_value_list2;',
'    ',
'    l_label             varchar2(4000);',
'    l_value             number;',
'    l_color             varchar2(20);',
'    l_url               varchar2(4000);',
'begin',
'    apex_plugin_util.print_json_http_header;',
'',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => p_region.source,',
'                               p_min_columns    => 2,',
'                               p_max_columns    => null,',
'                               p_component_name => p_region.name );',
'',
'    -- Get the actual column# for faster access and also verify that the data type',
'    -- of the column matches with what we are looking for',
'    l_label_column_no := apex_plugin_util.get_column_no (',
'                             p_attribute_label   => ''Label Column'',',
'                             p_column_alias      => c_label_column,',
'                             p_column_value_list => l_column_value_list,',
'                             p_is_required       => true,',
'                             p_data_type         => apex_plugin_util.c_data_type_varchar2 );',
'                                      ',
'    l_value_column_no := apex_plugin_util.get_column_no (',
'                             p_attribute_label   => ''Value Column'',',
'                             p_column_alias      => c_value_column,',
'                             p_column_value_list => l_column_value_list,',
'                             p_is_required       => true,',
'                             p_data_type         => apex_plugin_util.c_data_type_number );',
'',
'    l_color_column_no := apex_plugin_util.get_column_no (',
'                             p_attribute_label   => ''Color Column'',',
'                             p_column_alias      => c_color_column,',
'                             p_column_value_list => l_column_value_list,',
'                             p_is_required       => false,',
'                             p_data_type         => apex_plugin_util.c_data_type_varchar2 );',
'',
'    sys.htp.prn(''['');',
'',
'    -- It''s time to emit the selected rows',
'    for l_row_num in 1 .. l_column_value_list(1).value_list.count loop',
'        begin',
'            apex_plugin_util.set_component_values (',
'                p_column_value_list => l_column_value_list,',
'                p_row_num           => l_row_num );',
'',
'            -- get the label',
'            l_label := apex_plugin_util.escape (',
'                           apex_plugin_util.get_value_as_varchar2 (',
'                               p_data_type => l_column_value_list(l_label_column_no).data_type,',
'                               p_value     => l_column_value_list(l_label_column_no).value_list(l_row_num) ),',
'                           p_region.escape_output );',
'',
'            -- get the value',
'            l_value := l_column_value_list(l_value_column_no).value_list(l_row_num).number_value;',
'',
'            -- get the color if specified',
'            if l_color_column_no is not null then',
'                l_color := apex_plugin_util.escape (',
'                               apex_plugin_util.get_value_as_varchar2 (',
'                                   p_data_type => l_column_value_list(l_color_column_no).data_type,',
'                                   p_value     => l_column_value_list(l_color_column_no).value_list(l_row_num) ),',
'                               true );',
'            end if;',
'',
'            -- get the link target if it does exist',
'            if c_link_target is not null then',
'                l_url := wwv_flow_utilities.prepare_url (',
'                             apex_plugin_util.replace_substitutions (',
'                                 p_value  => c_link_target,',
'                                 p_escape => false ));',
'            end if;',
'',
'            -- write the data to our output buffer',
'            sys.htp.p (',
'                case when l_row_num > 1 then '','' end ||',
'                ''{'' ||',
'                apex_javascript.add_attribute(''label'', l_label) ||',
'                apex_javascript.add_attribute(''color'', l_color) ||',
'                apex_javascript.add_attribute(''url'',   l_url) ||',
'                apex_javascript.add_attribute(''data'',  l_value, false, false ) ||',
'                ''}'' );',
'',
'            apex_plugin_util.clear_component_values;',
'        exception when others then',
'            apex_plugin_util.clear_component_values;',
'            raise;',
'        end;',
'    end loop;',
'    sys.htp.prn('']'');',
'',
'    return null;',
'end ajax;'))
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:AJAX_ITEMS_TO_SUBMIT:NO_DATA_FOUND_MESSAGE:ESCAPE_OUTPUT'
,p_sql_min_column_count=>1
,p_sql_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select *',
'  from emp',
' order by sal'))
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>'Flot Pie Chart is a pure JavaScript plotting library for jQuery, with a focus on simple usage, attractive looks and interactive features.'
,p_version_identifier=>'5.02'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>25
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577710655948321985)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>510
,p_prompt=>'Minimum Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1.333'
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the minimum aspect ratio that charts use to recommend a height. A maximum aspect ratio of 3 means that the chart''s width should be no greater than 3 times its height. </p>',
'<p>Note: This setting can be overridden by the ''Minimum Height'' setting on the region.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577711068686321985)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>520
,p_prompt=>'Maximum Aspect Ratio'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'1.5'
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the maximum aspect ratio that charts use to recommend a height. A maximum aspect ratio of 3 means that the chart''s width should be no greater than 3 times its height. </p>',
'<p>Note: This setting can be overridden by the ''Maximum Height'' setting on the region.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577711470037321985)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
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
 p_id=>wwv_flow_api.id(2577711850985321986)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
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
 p_id=>wwv_flow_api.id(2577712275542321986)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>170
,p_prompt=>'Colors Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2577723684648321993)
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
 p_id=>wwv_flow_api.id(2577712709603321986)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>30
,p_prompt=>'Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
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
 p_id=>wwv_flow_api.id(2577713109812321987)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>40
,p_prompt=>'Pie Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'STANDARD'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select the type of pie chart that should be displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577713528439321988)
,p_plugin_attribute_id=>wwv_flow_api.id(2577713109812321987)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STANDARD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577713950289321988)
,p_plugin_attribute_id=>wwv_flow_api.id(2577713109812321987)
,p_display_sequence=>20
,p_display_value=>'Donut'
,p_return_value=>'DONUT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577714487275321988)
,p_plugin_attribute_id=>wwv_flow_api.id(2577713109812321987)
,p_display_sequence=>30
,p_display_value=>'Tilted'
,p_return_value=>'TILTED'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577714985155321988)
,p_plugin_attribute_id=>wwv_flow_api.id(2577713109812321987)
,p_display_sequence=>40
,p_display_value=>'Rectangular'
,p_return_value=>'RECT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577715467173321988)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>70
,p_prompt=>'Width'
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
 p_id=>wwv_flow_api.id(2577715869200321989)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>60
,p_prompt=>'Display Options'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>true
,p_default_value=>'LABEL:VALUE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Check which attributes are shown on the pie chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577716281255321989)
,p_plugin_attribute_id=>wwv_flow_api.id(2577715869200321989)
,p_display_sequence=>5
,p_display_value=>'Legend'
,p_return_value=>'LEGEND'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577716751135321989)
,p_plugin_attribute_id=>wwv_flow_api.id(2577715869200321989)
,p_display_sequence=>10
,p_display_value=>'Tooltip'
,p_return_value=>'TOOLTIP'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577717305316321989)
,p_plugin_attribute_id=>wwv_flow_api.id(2577715869200321989)
,p_display_sequence=>30
,p_display_value=>'Label'
,p_return_value=>'LABEL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577717761548321990)
,p_plugin_attribute_id=>wwv_flow_api.id(2577715869200321989)
,p_display_sequence=>40
,p_display_value=>'Value'
,p_return_value=>'VALUE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577718251192321990)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Combine Slices'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Select whether slices that are below a given percentage threshold can be combined into a single "other" slice.  For example, if the threshold is set to 10%, then any slice that is below 10% will be grouped into the "other" slice.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577718670870321990)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Combined Slice Threshold'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'10'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2577718251192321990)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_lov_type=>'STATIC'
,p_help_text=>'Enter the threshold percentage which determines which slices to group together in an "other" slice.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577719106433321990)
,p_plugin_attribute_id=>wwv_flow_api.id(2577718670870321990)
,p_display_sequence=>10
,p_display_value=>'1%'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577719535930321990)
,p_plugin_attribute_id=>wwv_flow_api.id(2577718670870321990)
,p_display_sequence=>20
,p_display_value=>'2%'
,p_return_value=>'2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577720104528321991)
,p_plugin_attribute_id=>wwv_flow_api.id(2577718670870321990)
,p_display_sequence=>30
,p_display_value=>'5%'
,p_return_value=>'5'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577720606832321991)
,p_plugin_attribute_id=>wwv_flow_api.id(2577718670870321990)
,p_display_sequence=>40
,p_display_value=>'10%'
,p_return_value=>'10'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577721104427321991)
,p_plugin_attribute_id=>wwv_flow_api.id(2577718670870321990)
,p_display_sequence=>50
,p_display_value=>'15%'
,p_return_value=>'15'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577721543728321992)
,p_plugin_attribute_id=>wwv_flow_api.id(2577718670870321990)
,p_display_sequence=>60
,p_display_value=>'20%'
,p_return_value=>'20'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577722126960321992)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Combined Slice Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Other'
,p_display_length=>20
,p_max_length=>20
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(2577718251192321990)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'Enter the label for the combined slice.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577722528952321992)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Combined Slice Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2577718251192321990)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter a target page to be called when the user clicks the combined slice. </p>',
'<p>Note: Leave the link blank if you do not want to make this clickable. </p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577722845029321992)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Combined Slice Color'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dl>',
'  <dt>Hexadecimal (hex) notation</dt><dd><pre>#FF3377</pre>;</dd>',
'  <dt>HTML colors</dt><dd><pre>blue</pre>.</dd>',
'</dl>'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter the color which should be used for the combined slice. The color can be entered as hex value or as the name of the color.</p>',
'<p>Note: If no color is specified then it will be defaulted to gray.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577723289687321993)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>50
,p_prompt=>'Inner Radius'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_display_length=>5
,p_max_length=>5
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2577713109812321987)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'DONUT'
,p_help_text=>'Enter the radius of the hole inside the donut. Numbers between 0 and 1 are treated as percentages and numbers greater than 1 are treated as pixels'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577723684648321993)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select the color scheme used to render the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577726593163321995)
,p_plugin_attribute_id=>wwv_flow_api.id(2577723684648321993)
,p_display_sequence=>10
,p_display_value=>'Modern'
,p_return_value=>'MODERN'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577724036427321993)
,p_plugin_attribute_id=>wwv_flow_api.id(2577723684648321993)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577724531883321993)
,p_plugin_attribute_id=>wwv_flow_api.id(2577723684648321993)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577725086309321994)
,p_plugin_attribute_id=>wwv_flow_api.id(2577723684648321993)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577725577206321994)
,p_plugin_attribute_id=>wwv_flow_api.id(2577723684648321993)
,p_display_sequence=>50
,p_display_value=>'SQL Column'
,p_return_value=>'SQL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2577726055606321994)
,p_plugin_attribute_id=>wwv_flow_api.id(2577723684648321993)
,p_display_sequence=>60
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577727093745321995)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>160
,p_prompt=>'Custom Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2577723684648321993)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'CUSTOM'
,p_help_text=>'<p>Enter a list of CSS supported colors separated by colons.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577727487252321995)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>180
,p_prompt=>'Minimum Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_max_length=>5
,p_unit=>'px'
,p_is_translatable=>false
,p_help_text=>'Enter the minimum height, in pixels, of the chart. Chart width will adapt to the size of the region.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577727898587321995)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>190
,p_prompt=>'Maximum Height'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>5
,p_is_translatable=>false
,p_help_text=>'Enter the maximum height, in pixels, of the chart. Chart width will adapt to the size of the region.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2577728236600321996)
,p_plugin_id=>wwv_flow_api.id(2577297973466630661)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>80
,p_prompt=>'Value Format Mask'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Enter the data format mask for the pie slices.'
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
