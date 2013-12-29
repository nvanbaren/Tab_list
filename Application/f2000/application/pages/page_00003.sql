--application/pages/page_00003
prompt  ...PAGE 3: Tab submenu
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3
 ,p_user_interface_id => 3079587899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_REGION'
 ,p_name => 'Tab submenu'
 ,p_alias => 'TABSUBMENU'
 ,p_step_title => 'Tab submenu'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Tab submenu'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_file_urls => '/l/apexlib/slidebox.js'
 ,p_inline_css => 
'#menuclasses, #javascriptmenu {margin-top:30px;}'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224350'
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
  p_id=> 3062873550104111 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39423004254603256+ wwv_flow_api.g_id_offset,
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
 
wwv_flow_api.create_page_branch(
  p_id=>19141113083898930 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:TABSUBMENU:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'BEFORE_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 100,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-MAR-2012 00:06 by NICOLETTE');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3
--
 
begin
 
null;
end;
null;
 
end;
/

 
