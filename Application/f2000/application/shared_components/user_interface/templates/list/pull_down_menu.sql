--application/shared_components/user_interface/templates/list/pull_down_menu
prompt  ......list template 39511401865642260
 
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
t:=t||'<li class="dhtmlMenuItem ui-state-active ui-corner-all"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem ui-state-default ui-corner-all"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlSubMenuN ui-state-active ui-corner-all"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""/><span class="dhtmlSubMenuNa">#TEXT#</span></li>';

t4:=t4||'<li class=" ui-state-default ui-corner-all"><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem ui-state-active ui-corner-all"><a href="#LINK#">#TEXT#</a><button class="ui-button ui-widget ui-button-icon-only ui-state-active border-none" role="button" aria-disabled="false" title="Expand #TEXT#" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" type="BUTTON">'||unistr('\000a')||
'<span class="ui-button-icon-primary ui-icon ui-icon-circle-triangle-s" ></span>'||unistr('\000a')||
'</button>'||unistr('\000a')||
'</l';

t5:=t5||'i>';

t6:=t6||'<li class="dhtmlMenuItem ui-state-default ui-corner-all"><a href="#LINK#">#TEXT#</a>'||unistr('\000a')||
'<button class="ui-button ui-widget ui-button-icon-only ui-state-default border-none" role="button" aria-disabled="false" title="Expand #TEXT#" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" type="BUTTON">'||unistr('\000a')||
'<span class="ui-button-icon-primary ui-icon ui-icon-circle-triangle-s" ></span>'||unistr('\000a')||
'</button>'||unistr('\000a')||
'';

t6:=t6||'</li>';

t7:=t7||'<li class="dhtmlSubMenuS ui-state-active ui-corner-all"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><span class="t13MIMG ui-button-icon-primary ui-icon ui-icon-circle-triangle-e" style="top:0px;"></span></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS ui-state-default ui-corner-all"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><span class="t13MIMG ui-button-icon-primary ui-icon ui-icon-circle-triangle-e" style="top:0px;"></span></a></li>';

wwv_flow_api.create_list_template (
  p_id=>39511391865642260 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu',
  p_theme_id  => 102,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2 ui-state-default ui-corner-all" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
