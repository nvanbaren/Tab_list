--application/shared_components/plugins/region_type/net_vanbaren_apex_demo_plugin
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'NET.VANBAREN.APEX.DEMO_PLUGIN'
 ,p_display_name => 'Plugin demonstration'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#APEXPLUGINS#'
 ,p_render_function => 'apr$demo_plugin.render_demo_region'
 ,p_ajax_function => 'apr$demo_plugin.ajax_demo_region'
 ,p_standard_attributes => 'SOURCE_PLAIN'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<p>'||unistr('\000a')||
'	Show the settings of the plugin you are demonstrating in a consistent way across you demo application. Main features are:</p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		All instances of a plugin on a page are displayed.</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		Using templates for the layout.</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		Region is refreshed on the dynamic action refresh. Fires the framework events <strong>before refresh</strong> and <strong>after refresh</strong>.</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		Set the name of the plugin static in the region or dynamic with a (page) item.</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
''
 ,p_version_identifier => '0.9'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 81428285932304050 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 160
 ,p_prompt => 'Events template'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<ul><il>Events</il>'||unistr('\000a')||
'#EVENTS#'||unistr('\000a')||
'</ul>'
 ,p_is_translatable => false
 ,p_help_text => 'Template to display all the events defined for the plugin.'||unistr('\000a')||
'#EVENTS# A "list" of the individual events.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 81436904333337660 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 170
 ,p_prompt => 'Event template'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<il>#NAME#</il>'
 ,p_is_translatable => false
 ,p_help_text => 'Template for the individual events of the plugin.'||unistr('\000a')||
'#NAME# Name of the plugin.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84657618276745870 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Main template'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '#EXTRA_INFO#'||unistr('\000a')||
'#TITLE#'||unistr('\000a')||
'#HELP_TEXT#'||unistr('\000a')||
'<table>'||unistr('\000a')||
'#ATTRIBUTES#'||unistr('\000a')||
'</table>'||unistr('\000a')||
'#COMPONENTS#'||unistr('\000a')||
''
 ,p_is_translatable => false
 ,p_help_text => 'Template to display all the information.'||unistr('\000a')||
'Used substitution strings.<br>'||unistr('\000a')||
'#EXTRA_INFO# Region source<br>'||unistr('\000a')||
'#TITLE# Plugin display name<br>'||unistr('\000a')||
'#HELP_TEXT# Help of the plugin<br>'||unistr('\000a')||
'#ATTRIBUTES# Attributes at the application level<br>'||unistr('\000a')||
'#COMPONENTS# Information of the components using the plugin.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84663009843809680 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Application attribute template'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<tr>'||unistr('\000a')||
'  <td>'||unistr('\000a')||
'    <label for="#ID#">#PROMPT##HELP#</label>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td >'||unistr('\000a')||
'    <pre id="#ID#">#VALUE#</pre>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr>'
 ,p_is_translatable => false
 ,p_help_text => 'Template to display the values of the attributes used.'||unistr('\000a')||
'Substitution strings'||unistr('\000a')||
'#ID# Id of the attribute'||unistr('\000a')||
'#PROMPT# Prompt/label of the attribute'||unistr('\000a')||
'#VALUE# Value of the attribute'||unistr('\000a')||
'#HELP#  Replaced by the help template if there is a help text defined for the attribute.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84698514008886560 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Application attribute help'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<div id="h#ID#">#HELP_TEXT#</div>'
 ,p_is_translatable => false
 ,p_help_text => 'Template for the help of plugin attributes. Is only used if there is a help text defined for the attribute. Replaces the #HELP# in the attribute template.<br>'||unistr('\000a')||
'#ID#  Id of the attribute<br>'||unistr('\000a')||
'#HELP_TEXT# Help text of the attribute.<br>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84703907952922600 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Component template'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<div id="#ID#">#TITLE#</div>'||unistr('\000a')||
'<table>'||unistr('\000a')||
'#ATTRIBUTES#'||unistr('\000a')||
'</table>'
 ,p_is_translatable => false
 ,p_help_text => 'Template to display the information of a component that uses the given plugin.<br>'||unistr('\000a')||
'#ID# Id for the component<br>'||unistr('\000a')||
'#TITLE# Title,label or name of the component<br>'||unistr('\000a')||
'#ATTRIBUTES# Attributes of the component<br>'||unistr('\000a')||
'#SUB_COMPONENTS# Actions belonging to the dynamic action or sub regions belonging to the region.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84713233495949000 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Component attribute'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<tr>'||unistr('\000a')||
'  <td>'||unistr('\000a')||
'    <label for="#ID#">#PROMPT##HELP#</label>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td >'||unistr('\000a')||
'    <pre id="#ID#">#VALUE#</pre>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr>'
 ,p_is_translatable => false
 ,p_help_text => 'Template for the attributes of the component. Simmilar to the plugin attributes template.<br>'||unistr('\000a')||
'#ID#  Id of the attribute<br>'||unistr('\000a')||
'#PROMPT# Prompt/label of the attribute.<br>'||unistr('\000a')||
'#VALUE# Value of the attribute.<br>'||unistr('\000a')||
'#HELP# Replaced by the component attribute help template.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84785713859075730 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => 'Component attribute help'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<div id="h#ID">#HELP_TEXT#</div>'
 ,p_is_translatable => false
 ,p_help_text => 'Template for the help of component attributes. Is only used if there is a help text defined for the attribute. Replaces the #HELP# in the attribute template.<br>'||unistr('\000a')||
'#ID#  Id of the attribute<br>'||unistr('\000a')||
'#HELP_TEXT# Help text of the attribute.<br>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84812030182108800 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 11
 ,p_display_sequence => 110
 ,p_prompt => 'Sub component template'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<div id="#ID#">#TITLE#</div>'||unistr('\000a')||
'<table>'||unistr('\000a')||
'#ATTRIBUTES#'||unistr('\000a')||
'</table>'
 ,p_is_translatable => false
 ,p_help_text => 'Template to display the information of a sub component that uses the given plugin. Or belongs to a component that uses the plugin<br>'||unistr('\000a')||
'#ID# Id for the component<br>'||unistr('\000a')||
'#TITLE# Title,label or name of the component<br>'||unistr('\000a')||
'#ATTRIBUTES# Attributes of the component<br>'||unistr('\000a')||
'#SUB_COMPONENTS# Actions belonging to the dynamic action or sub regions belonging to the region.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84868516339180560 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 12
 ,p_display_sequence => 120
 ,p_prompt => 'Sub component attribute'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<tr>'||unistr('\000a')||
'  <td>'||unistr('\000a')||
'    <label for="#ID#">#PROMPT##HELP#</label>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'  <td >'||unistr('\000a')||
'    <pre id="#ID#">#VALUE#</pre>'||unistr('\000a')||
'  </td>'||unistr('\000a')||
'</tr>'
 ,p_is_translatable => false
 ,p_help_text => 'Template for the attributes of the sub-component. Simmilar to the plugin attributes template.<br>'||unistr('\000a')||
'#ID#  Id of the attribute<br>'||unistr('\000a')||
'#PROMPT# Prompt/label of the attribute.<br>'||unistr('\000a')||
'#VALUE# Value of the attribute.<br>'||unistr('\000a')||
'#HELP# Replaced by the component attribute help template.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84893412792198400 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 13
 ,p_display_sequence => 130
 ,p_prompt => 'Sub component attribute help'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<div id="h#ID">#HELP_TEXT#</div>'
 ,p_is_translatable => false
 ,p_help_text => 'Template for the help of component attributes. Is only used if there is a help text defined for the attribute. Replaces the #HELP# in the attribute template.<br>'||unistr('\000a')||
'#ID#  Id of the attribute<br>'||unistr('\000a')||
'#HELP_TEXT# Help text of the attribute.<br>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 84902828638221940 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 14
 ,p_display_sequence => 140
 ,p_prompt => 'No data found'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'No attributes found.'
 ,p_display_length => 105
 ,p_is_translatable => false
 ,p_help_text => 'Text that is displayed if there are no custom attributes of the plugin defined at the application or component level. '
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 54180091995036184 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 15
 ,p_display_sequence => 150
 ,p_prompt => 'About url template'
 ,p_attribute_type => 'TEXTAREA'
 ,p_is_required => true
 ,p_default_value => '<a href="#FULL_URL#"> More information: #URL# </a>'
 ,p_is_translatable => false
 ,p_help_text => '#URL# as given in de plugin'||unistr('\000a')||
'#FULL_URL# Http:// is added if the url doesn''t have them already'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 83390236727549090 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Source type plugin name'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'S'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 83395608807550480 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 83390236727549090 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Static text'
 ,p_return_value => 'S'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 83399913309551840 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 83390236727549090 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Item'
 ,p_return_value => 'I'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 47179718156702830 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Plugin name'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'The internal name of the plugin.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 83424821405563620 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Source type page id'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'C'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 83430226253565000 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 83424821405563620 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Current page'
 ,p_return_value => 'C'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 83434531448566500 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 83424821405563620 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Static text'
 ,p_return_value => 'S'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 83438808376569260 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 83424821405563620 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Item'
 ,p_return_value => 'I'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 83452027769574910 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47179518025693340 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Page id'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 83424821405563620 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'NOT_EQUALS'
 ,p_depending_on_expression => 'C'
  );
null;
 
end;
/

prompt  ...data loading
--
