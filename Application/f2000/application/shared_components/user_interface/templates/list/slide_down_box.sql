--application/shared_components/user_interface/templates/list/slide_down_box
prompt  ......list template 5847522594664229
 
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
t:=t||'<li>'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link ">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t2:=t2||'<li >'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t3:=t3||'<a href="#LINK#" class="currentTab">#TEXT#</a>';

t4:=t4||'<a href="#LINK#" class="Tab">#TEXT#</a>';

t5:=t5||'<li>'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link ">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t6:=t6||'<li>'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link ">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5847502594664229 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Slide down box',
  p_theme_id  => 102,
  p_theme_class_id => 9,
  p_list_template_before_rows=>' <ul id="sdt_menu" class="sdt_menu">',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'<br style="clear:both;">'||unistr('\000a')||
'<br style="clear:both;">',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

