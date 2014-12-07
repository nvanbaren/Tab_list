--application/pages/page_00011
prompt  ...PAGE 11: pkg.name
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 11
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_REGION'
 ,p_name => 'pkg.name'
 ,p_alias => 'TABLIST'
 ,p_step_title => ' pkg.name'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_file_urls => '&DEMOJAVASCRIPT.slidebox.js'
 ,p_javascript_code_onload => 
'$(function() {'||unistr('\000a')||
'  $(''#sdt_menu > li'')'||unistr('\000a')||
'    .bind(''mouseenter'',function(){slidebox_in(this,120);})'||unistr('\000a')||
'    .bind(''mouseleave'',function(){slidebox_out(this,120);})'||unistr('\000a')||
'});'
 ,p_css_file_urls => '&DEMOCSS.Special-lists.css'
 ,p_inline_css => 
'#FLYOUTMENU{height:520px}'
 ,p_step_template => 39658505916395976 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20141106163955'
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
  p_id=> 2516509071327895 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Vertical menu (Include single tab)',
  p_region_name=>'VERTICALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 120,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Vertical menu',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'N',
  p_attribute_04 => 'Y',
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
  p_id=> 2517615482367636 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Vertical menu (Include single tab + parent link)',
  p_region_name=>'VERTICALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 150,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_grid_column_span => 2,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Vertical menu',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'Y',
  p_attribute_04 => 'Y',
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
  p_id=> 2518421154378681 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Vertical menu (Parent link)',
  p_region_name=>'VERTICALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 130,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Vertical menu',
  p_attribute_02 => 'N',
  p_attribute_03 => 'Y',
  p_attribute_04 => 'Y',
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
  p_id=> 2532293019317945 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Vertical menu (All settings No)',
  p_region_name=>'HORIZONTALMENUCONDITIONS',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 160,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Vertical menu',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'N',
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
  p_id=> 3025975509145341 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Plugin demonstration',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 120,
  p_plug_new_grid         => true,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.DEMO_PLUGIN',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'S',
  p_attribute_02 => 'NET.VANBAREN.APEX.TAB_LIST',
  p_attribute_03 => 'C',
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
  p_id=> 5836366807455394 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Pull down menu',
  p_region_name=>'PULLDOWN',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 180,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Pull Down Menu',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'N',
  p_attribute_04 => 'Y',
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
  p_id=> 5843479823258258 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Horizontal menu',
  p_region_name=>'HORIZONTALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 210,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Horizontal menu',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'Y',
  p_attribute_04 => 'Y',
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
  p_id=> 5844779814532625 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Vertical menu',
  p_region_name=>'VERTICALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Vertical menu',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'Y',
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
  p_id=> 5847665037703758 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Slide down box',
  p_region_name=>'SLIDEDOWNBOX',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 280,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Slide down box',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'N',
  p_attribute_04 => 'Y',
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
  p_id=> 5855274356678184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Fly out',
  p_region_name=>'FLYOUTMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 290,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Fly out',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'N',
  p_attribute_04 => 'Y',
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
  p_id=> 5861965416525909 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Breadcrumb menu',
  p_region_name=>'BREADCRUMBMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 230,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Breadcrumb menu',
  p_attribute_02 => 'N',
  p_attribute_03 => 'Y',
  p_attribute_04 => 'Y',
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

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 3065754349153735 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 11
 ,p_name => 'Accordion plugin demonstration'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 3066055162153752 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 11
 ,p_event_id => 3065754349153735 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'apex.jQuery(".accordion" ).accordion({collapsible: true'||unistr('\000a')||
'                                       ,active:false'||unistr('\000a')||
'                                       ,autoHeight: false'||unistr('\000a')||
'                                      });'||unistr('\000a')||
'apex.jQuery(".sub-accordion" ).accordion({collapsible: true'||unistr('\000a')||
'                                       ,active:false'||unistr('\000a')||
'                                       ,autoHeight: false'||unistr('\000a')||
'                                       ,header:"h4"'||unistr('\000a')||
'                                      });'||unistr('\000a')||
'apex.jQuery(".attribute_help").delegate(''.labelcolumn'',''click'',function(){'||unistr('\000a')||
'  var lDialog, lHelp_element'||unistr('\000a')||
'  lHelp_element = $(this).next(''.demo-help'').html();'||unistr('\000a')||
'  if (lHelp_element===null){'||unistr('\000a')||
'    lHelp_element=''Attribute has no help'''||unistr('\000a')||
'  }'||unistr('\000a')||
'  lDialog = apex.jQuery("#apex_popup_field_help");'||unistr('\000a')||
'  if (lDialog.length===0) {'||unistr('\000a')||
'    // add a new div with the retrieved page'||unistr('\000a')||
'    lDialog = apex.jQuery(''<div id="apex_popup_field_help">''+lHelp_element+''</div>'');'||unistr('\000a')||
'    // open created div as a dialog'||unistr('\000a')||
'    lDialog'||unistr('\000a')||
'      .dialog({'||unistr('\000a')||
'        title: ''Attribute help'','||unistr('\000a')||
'        bgiframe: true,'||unistr('\000a')||
'        width: 500,'||unistr('\000a')||
'        height: 350,'||unistr('\000a')||
'        show: ''drop'','||unistr('\000a')||
'        hide: ''drop'' });'||unistr('\000a')||
'  } else {'||unistr('\000a')||
'    // replace the existing dialog and open it again'||unistr('\000a')||
'    lDialog'||unistr('\000a')||
'      .html(lHelp_element)'||unistr('\000a')||
'      .dialog(''option'', ''title'', ''Attribute help'')'||unistr('\000a')||
'      .dialog(''open'');'||unistr('\000a')||
'  }'||unistr('\000a')||
'});'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 11
--
 
begin
 
null;
end;
null;
 
end;
/

 
