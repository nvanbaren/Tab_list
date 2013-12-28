--application/plug-in setting/region_type_plugin_net_vanbaren_apex_demo_plugin
wwv_flow_api.create_plugin_setting (
  p_id => 5643807086660431 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_plugin => 'PLUGIN_NET.VANBAREN.APEX.DEMO_PLUGIN'
 ,p_attribute_01 => '<h3 > <a class="component-container" href="#">Events</a></h3>'||unistr('\000a')||
'<div><ul>'||unistr('\000a')||
'#EVENTS#'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'</div>'
 ,p_attribute_02 => '<li>#NAME#</li>'
 ,p_attribute_05 => '#EXTRA_INFO#'||unistr('\000a')||
'<div class="plugin-header ui-helper-reset ui-state-default ui-corner-all">#TITLE#&nbsp;&nbsp;#VERSION#</div>'||unistr('\000a')||
'<div class="HELP">#HELP_TEXT#</div>'||unistr('\000a')||
'#ABOUT_URL#'||unistr('\000a')||
'<div class="accordion">'||unistr('\000a')||
'#EVENTS#'||unistr('\000a')||
'<h3 data-for="#ID#"> <a class="component-header" href="#">Plugin attributes</a></h3>'||unistr('\000a')||
'<div id="#ID#"><table class="standardReport" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'#ATTRIBUTES#'||unistr('\000a')||
'</table></div>'||unistr('\000a')||
'#COMPONENTS#'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_attribute_06 => '<tr>'||unistr('\000a')||
'  <td class="attribute_help">'||unistr('\000a')||
'    <label class="labelcolumn" for="#ID#" title="click for help">#PROMPT#</label>#HELP#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td class="cell-padding">'||unistr('\000a')||
'    <pre id="#ID#">#VALUE#</pre>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr>'
 ,p_attribute_07 => '<div id="h#ID#"class="demo-help" >#HELP_TEXT#</div>'
 ,p_attribute_08 => '<h3 data-for="#ID#"> <a class="component-header" href="#">#TITLE#</a></h3>'||unistr('\000a')||
'<div id="#ID#"><table class="standardReport" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'#ATTRIBUTES#'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="sub-accordion">'||unistr('\000a')||
'#SUB_COMPONENTS#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_attribute_09 => '<tr>'||unistr('\000a')||
'  <td class="attribute_help">'||unistr('\000a')||
'    <label for="#ID#" class="labelcolumn"title="click for help">#PROMPT#</label>#HELP#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td >'||unistr('\000a')||
'    <pre id="#ID#">#VALUE#</pre>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr>'
 ,p_attribute_10 => '<div id="h#ID#" class="demo-help">#HELP_TEXT#</div>'
 ,p_attribute_11 => '<h4 data-for="#ID#"> <a class="component-container" href="#">#TITLE#</a></h4>'||unistr('\000a')||
'<div id="#ID#"><table class="standardReport" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'#ATTRIBUTES#'||unistr('\000a')||
'</table></div>'
 ,p_attribute_12 => '<tr>'||unistr('\000a')||
'  <td class="attribute_help">'||unistr('\000a')||
'    <label for="#ID#" class="labelcolumn" title="click for help">#PROMPT#</label>#HELP#'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td >'||unistr('\000a')||
'    <pre id="#ID#">#VALUE#</pre>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr>'
 ,p_attribute_13 => '<div id="h#ID#" class="demo-help">#HELP_TEXT#</div>'
 ,p_attribute_14 => '<tr><td>No attributes found.</td></tr>'
 ,p_attribute_15 => '<br><span>More information: <a href="#FULL_URL#">  #URL# </a></span><br>'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

