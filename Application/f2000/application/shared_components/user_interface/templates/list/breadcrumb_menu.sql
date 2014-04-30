--application/shared_components/user_interface/templates/list/breadcrumb_menu
prompt  ......list template 5867299022672547
 
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
t:=t||'<li class="ui-state-default no-border-rl"><a href="#LINK#"> #TEXT#</a></li>';

t2:=t2||'<li class="ui-state-default no-border-rl"><a href="#LINK#" >#TEXT#</a></li>';

t3:=t3||'<li class="ui-state-active" ><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t5:=t5||'<li class="ui-state-default no-border-rl"><a href="#LINK#"> #TEXT#</a></li>';

t6:=t6||'<li class="ui-state-default no-border-rl"><a href="#LINK#" >#TEXT#</a></li>';

t7:=t7||'<li class="ui-state-active breadcrumb-sub-parent" ><a href="#LINK#"><span>#TEXT#</span><span class="breadcrumb-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-s"></span></a></li>';

t8:=t8||'<li class="ui-state-default breadcrumb-sub-parent"><a href="#LINK#" ><span>#TEXT#</span><span class="breadcrumb-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-s"></span></a></li>';

wwv_flow_api.create_list_template (
  p_id=>5867289022672547 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Breadcrumb menu',
  p_theme_id  => 102,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<ul class="breadcrumb-menu">',
  p_list_template_after_rows=>'<span class="breadcrumb-separator ui-state-default ui-corner-right no-border-l"></span>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<br style="clear:both;">',
  p_between_items=>'<span class="breadcrumb-separator ui-state-default no-border-rl">'||unistr('\000a')||
'<img alt="" src="/i/apex/apex_top_sep.gif">'||unistr('\000a')||
'</span>',
  p_before_sub_list=>'<ul class="submenu ui-corner-bottom ui-corner-tr">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_f_list_template_noncurrent=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_f_list_template_current=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_f_item_template_curr_w_child=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_fi_template_noncurr_w_child=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li></b>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

