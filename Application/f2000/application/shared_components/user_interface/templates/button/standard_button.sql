--application/shared_components/user_interface/templates/button/standard_button
prompt  ......Button Template 39394388701593520
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 39394378701593520 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Standard button'
 ,p_template => 
'<button #BUTTON_ATTRIBUTES# value="#LABEL#" onclick="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" type="button" role="button" aria-disabled="false" >'||unistr('\000a')||
'  <span class="ui-button-text">#LABEL#</span>'||unistr('\000a')||
'</button>'||unistr('\000a')||
''
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 102
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
