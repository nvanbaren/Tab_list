--application/pages/page_00007
prompt  ...PAGE 7: Cascading lov
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 7
 ,p_user_interface_id => 3079607899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_DYNAMIC_ACTION'
 ,p_name => 'Cascading lov'
 ,p_alias => 'MRCASCADINGLOV'
 ,p_step_title => 'Cascading lov'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Cascading lov'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224320'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs. <br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3064506541145739 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39423024254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
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
 
---------------------------------------
-- ...updatable report columns for page 7
--
 
begin
 
null;
end;
null;
 
end;
/

 
