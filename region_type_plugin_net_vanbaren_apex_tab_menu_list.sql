set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
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
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,1246700310426092));
 
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,200);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
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
--application/shared_components/plugins/region_type/net_vanbaren_apex_tab_menu_list
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 8652305017628821 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'NET.VANBAREN.APEX.TAB_MENU_LIST'
 ,p_display_name => 'Tab menu list'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Function APR$TAB_MENU_LIST'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'function APR$TAB_MENU_LIST (p_region               in apex_plugin.t_region'||unistr('\000a')||
'                                             ,p_plugin               in apex_plugin.t_plugin'||unistr('\000a')||
'                                             ,p_is_printer_friendly  in boolean)'||unistr('\000a')||
'return apex_plugin.t_region_render_result '||unistr('\000a')||
'  as'||unistr('\000a')||
'  type r_attributes is record('||unistr('\000a')||
'    link              apex_application_parent_tabs.tab_target%type'||unistr('\000a')||
'   ,label             apex_application_parent_tabs.tab_label%type'||unistr('\000a')||
'   ,image             apex_application_parent_tabs.when_current_image%type'||unistr('\000a')||
'   ,image_attributes  apex_application_parent_tabs.image_attributes%type'||unistr('\000a')||
'   ,tab_level         number'||unistr('\000a')||
'   ,id                apex_application_parent_tabs.parent_tab_id%type'||unistr('\000a')||
'   ,name              apex_application_parent_tabs.tab_name%type'||unistr('\000a')||
'   ,parent_id         apex_application_parent_tabs.parent_tab_id%type'||unistr('\000a')||
'   ,parent_name       apex_application_parent_tabs.tab_name%type'||unistr('\000a')||
'   ,parent_label      apex_application_parent_tabs.tab_label%type'||unistr('\000a')||
'   ,status            varchar2(30)'||unistr('\000a')||
'  );'||unistr('\000a')||
'  '||unistr('\000a')||
'  cursor c_pag(b_app_id  in number'||unistr('\000a')||
'              ,b_page_id in number'||unistr('\000a')||
'              )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    select pag.tab_set'||unistr('\000a')||
'    from   apex_application_pages     pag'||unistr('\000a')||
'    where  pag.page_id = b_page_id'||unistr('\000a')||
'    and    pag.application_id = b_app_id'||unistr('\000a')||
'  ;'||unistr('\000a')||
'  '||unistr('\000a')||
'  cursor c_temp(b_template_name  in varchar2'||unistr('\000a')||
'               ,b_theme_number   in number'||unistr('\000a')||
'               ,b_application_id in number'||unistr('\000a')||
'               )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    select lis.before_sub_list                before_sub_list'||unistr('\000a')||
'    ,      lis.after_sub_list                 after_sub_list'||unistr('\000a')||
'    ,      lis.between_sub_list_items         between_sub_list'||unistr('\000a')||
'    ,      lis.sub_list_item_current          current_sub_list'||unistr('\000a')||
'    ,      lis.sub_list_item_noncurrent       non_current_sub_list'||unistr('\000a')||
'    ,      lis.list_template_before_rows      before_rows'||unistr('\000a')||
'    ,      lis.list_template_after_rows       after_rows'||unistr('\000a')||
'    ,      lis.list_template_current          current_item'||unistr('\000a')||
'    ,      lis.list_template_noncurrent       non_current_item'||unistr('\000a')||
'    ,      lis.item_template_curr_w_child     current_item_with'||unistr('\000a')||
'    ,      lis.item_template_noncurr_w_child  non_current_item_with'||unistr('\000a')||
'    ,      lis.between_items                  between_item'||unistr('\000a')||
'    ,      coalesce(to_clob(lis.first_list_template_current)'||unistr('\000a')||
'                   ,to_clob(lis.first_list_template_noncurrent)'||unistr('\000a')||
'                   ,lis.list_template_current'||unistr('\000a')||
'                   ,lis.list_template_noncurrent)    first_current_item'||unistr('\000a')||
'    ,      nvl(to_clob(lis.first_list_template_noncurrent)'||unistr('\000a')||
'              ,lis.list_template_noncurrent)first_non_current_item'||unistr('\000a')||
'    ,      coalesce(to_clob(lis.f_item_template_curr_w_child)'||unistr('\000a')||
'                   ,to_clob(lis.fitem_template_noncurr_w_child)'||unistr('\000a')||
'                   ,lis.item_template_curr_w_child'||unistr('\000a')||
'                   ,lis.item_template_noncurr_w_child) first_current_with'||unistr('\000a')||
'    ,      nvl(to_clob(lis.fitem_template_noncurr_w_child)'||unistr('\000a')||
'              ,lis.item_template_noncurr_w_child)      first_non_current_with      '||unistr('\000a')||
'    from   apex_application_temp_list lis'||unistr('\000a')||
'    where  lis.application_id = b_application_id'||unistr('\000a')||
'    and    lis.theme_number   = b_theme_number'||unistr('\000a')||
'    and    lis.template_name  = b_template_name'||unistr('\000a')||
'  ;'||unistr('\000a')||
'  '||unistr('\000a')||
'  cursor c_pat(b_app_id in number'||unistr('\000a')||
'              ,b_tabset in varchar2'||unistr('\000a')||
'              )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    select pat.tab_set'||unistr('\000a')||
'    ,      pat.current_for_tabset'||unistr('\000a')||
'    ,      pat.tab_name'||unistr('\000a')||
'    ,      pat.tab_label'||unistr('\000a')||
'    ,      pat.tab_target'||unistr('\000a')||
'    ,      pat.when_current_image'||unistr('\000a')||
'    ,      pat.when_non_current_image'||unistr('\000a')||
'    ,      pat.image_attributes'||unistr('\000a')||
'    ,      pat.parent_tab_id'||unistr('\000a')||
'    ,      pat.condition_type'||unistr('\000a')||
'    ,      pat.condition_expression1'||unistr('\000a')||
'    ,      pat.condition_expression2'||unistr('\000a')||
'    ,      pat.authorization_scheme'||unistr('\000a')||
'    ,      pat.build_option'||unistr('\000a')||
'    from   apex_application_parent_tabs pat'||unistr('\000a')||
'    where	 pat.application_id = b_app_id'||unistr('\000a')||
'    and   (pat.tab_set = b_tabset'||unistr('\000a')||
'           or'||unistr('\000a')||
'           b_tabset is null'||unistr('\000a')||
'           )      '||unistr('\000a')||
'    order by pat.display_sequence'||unistr('\000a')||
'  ;'||unistr('\000a')||
'  '||unistr('\000a')||
'  cursor c_tab(b_app_id in number'||unistr('\000a')||
'              ,b_tab_set in varchar2'||unistr('\000a')||
'              )'||unistr('\000a')||
'  is'||unistr('\000a')||
'    select tab.tab_set'||unistr('\000a')||
'    ,      tab.tab_name'||unistr('\000a')||
'    ,      tab.tab_label'||unistr('\000a')||
'    ,      tab.parent_tabset'||unistr('\000a')||
'    ,      tab.tab_also_current_for_pages'||unistr('\000a')||
'    ,      tab.tab_page'||unistr('\000a')||
'    ,      tab.when_current_tab_image'||unistr('\000a')||
'    ,      tab.when_not_current_tab_image'||unistr('\000a')||
'    ,      tab.tab_image_attributes'||unistr('\000a')||
'    ,      tab.tab_id'||unistr('\000a')||
'    ,      tab.condition_type'||unistr('\000a')||
'    ,      tab.condition_expression1'||unistr('\000a')||
'    ,      tab.condition_expression2'||unistr('\000a')||
'    ,      tab.authorization_scheme'||unistr('\000a')||
'    ,      tab.build_option'||unistr('\000a')||
'    from	 apex_application_tabs tab'||unistr('\000a')||
'    where	 tab.application_id = b_app_id'||unistr('\000a')||
'    and    tab.tab_set        = b_tab_set'||unistr('\000a')||
'    order by tab.display_sequence'||unistr('\000a')||
'  ;'||unistr('\000a')||
'  '||unistr('\000a')||
'  type l_table_pat is table of c_pat%rowtype'||unistr('\000a')||
'  index by pls_integer;'||unistr('\000a')||
'  l_pat_table  l_table_pat;'||unistr('\000a')||
'  '||unistr('\000a')||
'  type l_table_tab is table of c_tab%rowtype'||unistr('\000a')||
'  index by pls_integer;'||unistr('\000a')||
'  l_tab_table  l_table_tab;'||unistr('\000a')||
'  '||unistr('\000a')||
'  c_tabset           apex_application_parent_tabs.tab_set%type := ''main'';'||unistr('\000a')||
'  l_return           apex_plugin.t_region_render_result;'||unistr('\000a')||
'  l_current_tab_set	 apex_application_pages.tab_set%type;'||unistr('\000a')||
'  l_theme_number     number := wwv_flow.g_flow_theme_id;'||unistr('\000a')||
'  l_template_name    p_region.attribute_01%type := p_region.attribute_01;'||unistr('\000a')||
'  l_include_single   p_region.attribute_02%type := p_region.attribute_02;'||unistr('\000a')||
'  l_parent_link      p_region.attribute_03%type := p_region.attribute_03;'||unistr('\000a')||
'  '||unistr('\000a')||
'  l_use_conditions   boolean := (p_region.attribute_04 = ''Y'');'||unistr('\000a')||
'  '||unistr('\000a')||
'  r_temp             c_temp%rowtype;'||unistr('\000a')||
'  r_pat_attributes   r_attributes;'||unistr('\000a')||
'  r_tab_attributes   r_attributes;'||unistr('\000a')||
'  '||unistr('\000a')||
'  l_html_parent		   varchar2(32767);'||unistr('\000a')||
'  l_html_tab			   varchar2(32767);'||unistr('\000a')||
'  l_last_part        varchar2(32767);'||unistr('\000a')||
'  l_first_part       varchar2(32767);'||unistr('\000a')||
'  l_function         varchar2(32767);'||unistr('\000a')||
'  l_result           varchar2(1);'||unistr('\000a')||
'  '||unistr('\000a')||
'  l_is_current       boolean;'||unistr('\000a')||
'  l_number_tabs      number;'||unistr('\000a')||
'  i                  number;'||unistr('\000a')||
'  k                  number;'||unistr('\000a')||
'  h                  number;'||unistr('\000a')||
'  '||unistr('\000a')||
'  function get_url(p_current_parent boolean'||unistr('\000a')||
'                  ,p_tab_name       varchar2'||unistr('\000a')||
'                  ,p_tab_page       number'||unistr('\000a')||
'                  )'||unistr('\000a')||
'  return varchar2'||unistr('\000a')||
'  is'||unistr('\000a')||
'    l_debug_string  varchar2(3);'||unistr('\000a')||
'    l_url           varchar2(150);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    if p_current_parent'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*Standard tab belongs to current parent tab*/'||unistr('\000a')||
'      l_url := ''javascript:doSubmit(''''''||p_tab_name||'''''');'';'||unistr('\000a')||
'    else'||unistr('\000a')||
'      /*Standard tab does not belong to current parent tab'||unistr('\000a')||
'      **standard submit doesn''t work so a url is used'||unistr('\000a')||
'      */'||unistr('\000a')||
'      if wwv_flow.g_debug'||unistr('\000a')||
'      then'||unistr('\000a')||
'        l_debug_string := ''YES'';'||unistr('\000a')||
'      else'||unistr('\000a')||
'        l_debug_string := ''NO'';'||unistr('\000a')||
'      end if; '||unistr('\000a')||
'      l_url := ''f?p=''||wwv_flow.g_flow_alias||'':''||p_tab_page||'':''||wwv_flow.g_instance||''::''||l_debug_string;'||unistr('\000a')||
'      l_url := apex_util.prepare_url(apex_application.do_substitutions(l_url));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    return l_url;'||unistr('\000a')||
'  end;'||unistr('\000a')||
'  '||unistr('\000a')||
'  function replace_substitution(p_template     varchar2'||unistr('\000a')||
'                               ,p_attributes   r_attributes'||unistr('\000a')||
'                               )'||unistr('\000a')||
'  return varchar2                          '||unistr('\000a')||
'  as'||unistr('\000a')||
'    l_url        varchar2(150);'||unistr('\000a')||
'    l_template   varchar2(32767);'||unistr('\000a')||
'  begin'||unistr('\000a')||
'    l_template := replace(p_template,''#LINK#'',p_attributes.link);'||unistr('\000a')||
'    l_template := replace(l_template,''#IMAGE#'',p_attributes.image);'||unistr('\000a')||
'    l_template := replace(l_template,''#IMAGE_ATTR#'',p_attributes.image_attributes);'||unistr('\000a')||
'    l_template := replace(l_template,''#LIST_ITEM_ID#'',p_attributes.id);'||unistr('\000a')||
'    l_template := replace(l_template,''#PARENT_LIST_ITEM_ID#'',p_attributes.parent_id);'||unistr('\000a')||
'    l_template := replace(l_template,''#A1#'',p_attributes.name);'||unistr('\000a')||
'    l_template := replace(l_template,''#A2#'',p_attributes.parent_name);'||unistr('\000a')||
'    l_template := replace(l_template,''#TEXT#'',p_attributes.label);'||unistr('\000a')||
'    l_template := replace(l_template,''#TEXT_ESC_SC#'',sys.htf.escape_sc(p_attributes.label));'||unistr('\000a')||
'    l_template := replace(l_template,''#TEXT#'',p_attributes.parent_label);'||unistr('\000a')||
'    l_template := replace(l_template,''#LEVEL#'',p_attributes.tab_level);'||unistr('\000a')||
'    return  apex_plugin_util.replace_substitutions(l_template);'||unistr('\000a')||
'  end;'||unistr('\000a')||
'    '||unistr('\000a')||
'begin'||unistr('\000a')||
'  apex_plugin_util.'||unistr('\000a')||
'     debug_region(p_plugin               => p_plugin,'||unistr('\000a')||
'                  p_region               => p_region,'||unistr('\000a')||
'                  p_is_printer_friendly  => p_is_printer_friendly);'||unistr('\000a')||
'  '||unistr('\000a')||
'  apex_debug.message(''Start tab menu list'');                 '||unistr('\000a')||
'  /*Determine the current tab set*/'||unistr('\000a')||
'  open c_pag(wwv_flow.g_flow_id,wwv_flow.g_flow_step_id);'||unistr('\000a')||
'  fetch c_pag'||unistr('\000a')||
'  into  l_current_tab_set;'||unistr('\000a')||
'  close c_pag;'||unistr('\000a')||
'  apex_debug.message(''Current tab set determined'');'||unistr('\000a')||
'  /*Get the templates*/'||unistr('\000a')||
'  open c_temp(l_template_name,l_theme_number,wwv_flow.g_flow_id);'||unistr('\000a')||
'  fetch c_temp'||unistr('\000a')||
'  into  r_temp;'||unistr('\000a')||
'  close c_temp;'||unistr('\000a')||
'  '||unistr('\000a')||
'  /*Get the parent tabs*/'||unistr('\000a')||
'  open c_pat(wwv_flow.g_flow_id,c_tabset);'||unistr('\000a')||
'  fetch c_pat bulk collect'||unistr('\000a')||
'  into  l_pat_table;'||unistr('\000a')||
'  close c_pat;'||unistr('\000a')||
'  '||unistr('\000a')||
'  if l_use_conditions'||unistr('\000a')||
'  then'||unistr('\000a')||
'    /*Remove the tabs that shouldn''t be displayed demending on the conditions*/'||unistr('\000a')||
'    for l in l_pat_table.first .. l_pat_table.last'||unistr('\000a')||
'    loop'||unistr('\000a')||
'      l_function := ''return apex$checks.auth_condition_check_int(''''''||l_pat_table(l).condition_type'||unistr('\000a')||
'                 || '''''',''''''||l_pat_table(l).condition_expression1'||unistr('\000a')||
'                 || '''''',''''''||l_pat_table(l).condition_expression2'||unistr('\000a')||
'                 || '''''',''''''||l_pat_table(l).authorization_scheme'||unistr('\000a')||
'                 || '''''',''''''||l_pat_table(l).build_option'||unistr('\000a')||
'                 || '''''');'';'||unistr('\000a')||
'      l_result := apex_plugin_util.get_plsql_function_result(l_function);'||unistr('\000a')||
'      if l_result = 0'||unistr('\000a')||
'      then'||unistr('\000a')||
'        l_pat_table.delete(l);'||unistr('\000a')||
'      end if;  '||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  '||unistr('\000a')||
'  k := l_pat_table.first;'||unistr('\000a')||
'  while k is not null'||unistr('\000a')||
'  loop'||unistr('\000a')||
'    /*Standard tabs belonging to the parent tab*/'||unistr('\000a')||
'    open  c_tab(wwv_flow.g_flow_id,l_pat_table(k).current_for_tabset);'||unistr('\000a')||
'    fetch c_tab bulk collect'||unistr('\000a')||
'    into  l_tab_table;'||unistr('\000a')||
'    close c_tab;'||unistr('\000a')||
'    '||unistr('\000a')||
'    if l_use_conditions'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*Remove the tabs that shouldn''t be displayed demending on the conditions*/'||unistr('\000a')||
'      for g in l_tab_table.first .. l_tab_table.last'||unistr('\000a')||
'      loop'||unistr('\000a')||
'        l_function := ''return apex$checks.auth_condition_check_int(''''''||l_tab_table(g).condition_type'||unistr('\000a')||
'                   || '''''',''''''||l_tab_table(g).condition_expression1'||unistr('\000a')||
'                   || '''''',''''''||l_tab_table(g).condition_expression2'||unistr('\000a')||
'                   || '''''',''''''||l_tab_table(g).authorization_scheme'||unistr('\000a')||
'                   || '''''',''''''||l_tab_table(g).build_option'||unistr('\000a')||
'                   || '''''');'';'||unistr('\000a')||
'        l_result := apex_plugin_util.get_plsql_function_result(l_function);'||unistr('\000a')||
'        if l_result = 0'||unistr('\000a')||
'        then'||unistr('\000a')||
'          l_tab_table.delete(g);'||unistr('\000a')||
'        end if;  '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'    end if;      '||unistr('\000a')||
'    '||unistr('\000a')||
'    l_is_current := (l_pat_table(k).current_for_tabset = nvl(l_current_tab_set,''!''));'||unistr('\000a')||
'    if l_tab_table.count = 1'||unistr('\000a')||
'       and'||unistr('\000a')||
'       l_include_single = ''N'''||unistr('\000a')||
'    then'||unistr('\000a')||
'      l_number_tabs :=  0;'||unistr('\000a')||
'    else  '||unistr('\000a')||
'      l_number_tabs := l_tab_table.count;'||unistr('\000a')||
'    end if;  '||unistr('\000a')||
'    /*Determine the right parent template*/'||unistr('\000a')||
'    if l_number_tabs > 0'||unistr('\000a')||
'       and'||unistr('\000a')||
'       k = 1'||unistr('\000a')||
'       and'||unistr('\000a')||
'       l_is_current'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*First with child current*/'||unistr('\000a')||
'      l_html_parent := nvl(r_temp.first_current_with,r_temp.current_item_with);'||unistr('\000a')||
'      r_pat_attributes.status := ''first-current'';'||unistr('\000a')||
'    elsif l_number_tabs > 0'||unistr('\000a')||
'          and'||unistr('\000a')||
'          k = 1'||unistr('\000a')||
'          and '||unistr('\000a')||
'          not l_is_current'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*First with child not current*/'||unistr('\000a')||
'      l_html_parent := nvl(r_temp.first_non_current_with,r_temp.non_current_item_with);'||unistr('\000a')||
'      r_pat_attributes.status := ''first-non-current'';'||unistr('\000a')||
'    elsif l_number_tabs > 0'||unistr('\000a')||
'          and'||unistr('\000a')||
'          k >1'||unistr('\000a')||
'          and '||unistr('\000a')||
'          l_is_current'||unistr('\000a')||
'    then      '||unistr('\000a')||
'      /*Item with child current*/'||unistr('\000a')||
'      l_html_parent := r_temp.current_item_with;'||unistr('\000a')||
'      r_pat_attributes.status := ''current'';'||unistr('\000a')||
'    elsif l_number_tabs > 0'||unistr('\000a')||
'          and'||unistr('\000a')||
'          k > 1'||unistr('\000a')||
'          and '||unistr('\000a')||
'          not l_is_current  '||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*Item with child non current*/'||unistr('\000a')||
'      l_html_parent := r_temp.non_current_item_with;'||unistr('\000a')||
'      r_pat_attributes.status := ''non-current'';'||unistr('\000a')||
'    elsif l_number_tabs = 0'||unistr('\000a')||
'          and'||unistr('\000a')||
'          k = 1'||unistr('\000a')||
'          and'||unistr('\000a')||
'          l_is_current'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*First without child current*/'||unistr('\000a')||
'      l_html_parent := r_temp.first_current_item;'||unistr('\000a')||
'      r_pat_attributes.status := ''first-current'';'||unistr('\000a')||
'    elsif l_number_tabs = 0'||unistr('\000a')||
'          and'||unistr('\000a')||
'          k = 1'||unistr('\000a')||
'          and '||unistr('\000a')||
'          not l_is_current'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*First without child not current*/'||unistr('\000a')||
'      l_html_parent := r_temp.first_non_current_item;'||unistr('\000a')||
'      r_pat_attributes.status := ''first-non-current'';'||unistr('\000a')||
'    elsif l_number_tabs = 0'||unistr('\000a')||
'          and'||unistr('\000a')||
'          k > 1'||unistr('\000a')||
'          and '||unistr('\000a')||
'          l_is_current'||unistr('\000a')||
'    then      '||unistr('\000a')||
'      /*Item without child current*/'||unistr('\000a')||
'      l_html_parent := r_temp.current_item;'||unistr('\000a')||
'      r_pat_attributes.status := ''current'';'||unistr('\000a')||
'    elsif l_number_tabs = 0'||unistr('\000a')||
'          and'||unistr('\000a')||
'          k > 0'||unistr('\000a')||
'          and '||unistr('\000a')||
'          not l_is_current  '||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*Item without child non current*/ '||unistr('\000a')||
'      l_html_parent := r_temp.non_current_item;'||unistr('\000a')||
'      r_pat_attributes.status := ''non-current'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if k>0'||unistr('\000a')||
'       and '||unistr('\000a')||
'       k=l_pat_table.last'||unistr('\000a')||
'    then'||unistr('\000a')||
'      r_pat_attributes.status :=''last-''||r_pat_attributes.status;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    /*Replace all substition strings*/'||unistr('\000a')||
'    if l_is_current'||unistr('\000a')||
'    then'||unistr('\000a')||
'      r_pat_attributes.image := l_pat_table(k).when_current_image;'||unistr('\000a')||
'    else'||unistr('\000a')||
'      r_pat_attributes.image := l_pat_table(k).when_non_current_image;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    /*Replace different tags*/'||unistr('\000a')||
'    r_pat_attributes.label := l_pat_table(k).tab_label;'||unistr('\000a')||
'    r_pat_attributes.name := l_pat_table(k).tab_name;'||unistr('\000a')||
'    r_pat_attributes.tab_level := 1;'||unistr('\000a')||
'    r_pat_attributes.id := l_pat_table(k).parent_tab_id;'||unistr('\000a')||
'    '||unistr('\000a')||
'    if l_tab_table.count = 0'||unistr('\000a')||
'       or'||unistr('\000a')||
'       l_parent_link = ''Y'''||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*No children the target is the target defined by the parent*/'||unistr('\000a')||
'      r_pat_attributes.link := apex_util.prepare_url(apex_application.do_substitutions(l_pat_table(k).tab_target));                               '||unistr('\000a')||
'    elsif (l_include_single = ''N'''||unistr('\000a')||
'           and'||unistr('\000a')||
'           l_tab_table.count = 1'||unistr('\000a')||
'          )'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*One child and child isn''t included target is target of child*/'||unistr('\000a')||
'      r_pat_attributes.link := get_url(l_is_current'||unistr('\000a')||
'                                      ,l_tab_table(1).tab_name'||unistr('\000a')||
'                                      ,l_tab_table(1).tab_page'||unistr('\000a')||
'                                      );                       '||unistr('\000a')||
'    else'||unistr('\000a')||
'      r_pat_attributes.link :=''#'';'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    '||unistr('\000a')||
'    if k = 1'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*It''s the first parent tab*/'||unistr('\000a')||
'      sys.htp.p(replace_substitution(r_temp.before_rows,r_pat_attributes));'||unistr('\000a')||
'    else'||unistr('\000a')||
'      /*Write between*/'||unistr('\000a')||
'      sys.htp.p(replace_substitution(r_temp.between_item,r_pat_attributes));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    '||unistr('\000a')||
'    if l_tab_table.count = 0'||unistr('\000a')||
'       or'||unistr('\000a')||
'       (l_include_single = ''N'''||unistr('\000a')||
'        and'||unistr('\000a')||
'        l_tab_table.count = 1'||unistr('\000a')||
'       )'||unistr('\000a')||
'    then'||unistr('\000a')||
'      /*No children to be placed*/'||unistr('\000a')||
'      sys.htp.p(replace_substitution(l_html_parent'||unistr('\000a')||
'                                    ,r_pat_attributes'||unistr('\000a')||
'                                    )    '||unistr('\000a')||
'               );'||unistr('\000a')||
'    else'||unistr('\000a')||
'      /*Split parent template to give childeren space'||unistr('\000a')||
'      **Children come before last closing tag if the tag is the same as the first opening tag'||unistr('\000a')||
'      */'||unistr('\000a')||
'      if substr(l_html_parent'||unistr('\000a')||
'               ,regexp_instr(l_html_parent,''</\w{1,}>\w{0,}$'',1,1,0,''i'')+2'||unistr('\000a')||
'               ,regexp_instr(l_html_parent,''>\w{0,}$'',1,1,0,''i'')-regexp_instr(l_html_parent,''</\w{1,}>\w{0,}$'',1,1,0,''i'')-2'||unistr('\000a')||
'               ) '||unistr('\000a')||
'        =   '||unistr('\000a')||
'        substr(l_html_parent'||unistr('\000a')||
'              ,regexp_instr(l_html_parent,''^\w{0,}<'',1,1,1,''i'')'||unistr('\000a')||
'              ,regexp_instr(l_html_parent,''^\w{0,}<\w{1,}'',1,1,1,''i'')-regexp_instr(l_html_parent,''^\w{0,}<'',1,1,1,''i'')'||unistr('\000a')||
'              )'||unistr('\000a')||
'      then     '||unistr('\000a')||
'        l_last_part := substr(l_html_parent'||unistr('\000a')||
'                             ,regexp_instr(l_html_parent,''</\w{1,}>\w{0,}$'',1,1,0,''i'')'||unistr('\000a')||
'                             );'||unistr('\000a')||
'        l_first_part := substr(l_html_parent'||unistr('\000a')||
'                                           ,1'||unistr('\000a')||
'                                           ,regexp_instr(l_html_parent,''</\w{1,}>\w{0,}$'',1,1,0,''i'')-1'||unistr('\000a')||
'                                           );'||unistr('\000a')||
'      else'||unistr('\000a')||
'        /*Sublist items are placed after the list item*/'||unistr('\000a')||
'        l_last_part := null;'||unistr('\000a')||
'        l_first_part := l_html_parent;'||unistr('\000a')||
'      end if;  '||unistr('\000a')||
'      /*Write (first part of) the list item*/'||unistr('\000a')||
'      sys.htp.p(replace_substitution(l_first_part'||unistr('\000a')||
'                                    ,r_pat_attributes'||unistr('\000a')||
'                                    )    '||unistr('\000a')||
'               );'||unistr('\000a')||
'      /*Before sub list items*/'||unistr('\000a')||
'      r_tab_attributes.parent_id := l_pat_table(k).parent_tab_id;'||unistr('\000a')||
'      r_tab_attributes.parent_name := l_pat_table(k).tab_name;'||unistr('\000a')||
'      r_tab_attributes.parent_label := l_pat_table(k).tab_label;'||unistr('\000a')||
'      sys.htp.p(replace_substitution(r_temp.before_sub_list,r_tab_attributes));'||unistr('\000a')||
'      l_html_tab := null;'||unistr('\000a')||
'      /*Loop trough children*/'||unistr('\000a')||
'      h := l_tab_table.first;'||unistr('\000a')||
'      while h is not null'||unistr('\000a')||
'      loop'||unistr('\000a')||
'        if l_tab_table(h).tab_page = wwv_flow.g_flow_step_id'||unistr('\000a')||
'        or instr('',''||l_tab_table(h).tab_also_current_for_pages||'','''||unistr('\000a')||
'                ,'',''||wwv_flow.g_flow_step_id||'','''||unistr('\000a')||
'                ) > 0'||unistr('\000a')||
'        then'||unistr('\000a')||
'          l_html_tab := r_temp.current_sub_list;'||unistr('\000a')||
'          r_tab_attributes.image := l_tab_table(h).when_current_tab_image;'||unistr('\000a')||
'        else'||unistr('\000a')||
'          l_html_tab := r_temp.non_current_sub_list;'||unistr('\000a')||
'          r_tab_attributes.image :=l_tab_table(h).when_current_tab_image;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        r_tab_attributes.tab_level := 2;'||unistr('\000a')||
'        r_tab_attributes.label := l_tab_table(h).tab_label;'||unistr('\000a')||
'        r_tab_attributes.name  := l_tab_table(h).tab_name;'||unistr('\000a')||
'        r_tab_attributes.id  := l_tab_table(h).tab_id;'||unistr('\000a')||
'        r_tab_attributes.image_attributes := l_tab_table(h).tab_image_attributes;'||unistr('\000a')||
'        r_tab_attributes.link := get_url(l_is_current'||unistr('\000a')||
'                                        ,l_tab_table(h).tab_name'||unistr('\000a')||
'                                        ,l_tab_table(h).tab_page'||unistr('\000a')||
'                                        );'||unistr('\000a')||
'        if h = l_tab_table.last'||unistr('\000a')||
'        then'||unistr('\000a')||
'          /*Between sub_list*/'||unistr('\000a')||
'          sys.htp.p(replace_substitution(r_temp.between_sub_list,r_tab_attributes));'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        sys.htp.p(replace_substitution(l_html_tab,r_tab_attributes)); '||unistr('\000a')||
'        h := l_tab_table.next(h);'||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'      /*After sub list*/'||unistr('\000a')||
'      sys.htp.p(replace_substitution(r_temp.after_sub_list,r_tab_attributes));'||unistr('\000a')||
'      /*Last part of the parent*/'||unistr('\000a')||
'      sys.htp.p(replace_substitution(l_last_part,r_pat_attributes));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    if k=l_pat_table.last'||unistr('\000a')||
'    then'||unistr('\000a')||
'       sys.htp.p(replace_substitution(r_temp.after_rows,r_pat_attributes));'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'    k := l_pat_table.next(k);'||unistr('\000a')||
'  end loop;  '||unistr('\000a')||
'  return l_return;'||unistr('\000a')||
'end apr$tab_menu_list;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_render_function => 'APR$TAB_MENU_LIST'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.9.0'
 ,p_plugin_comment => 'Copyright (c) 2014 N. van Baren

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 8652603686674970 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 8652305017628821 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Template'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
 ,p_help_text => 'Name of the list template.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 8653187930697537 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 8652305017628821 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 30
 ,p_prompt => 'Include single tab'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
 ,p_help_text => 'If the there is only one tab that belongs to the parent should it be included. If not the parent tab gets the link of the tab. '
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 8653503014705678 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 8652305017628821 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 40
 ,p_prompt => 'Parent link'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
 ,p_help_text => 'Should the parent have it''s own link.'
  );
null;
 
end;
/



commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done