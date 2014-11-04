--application/shared_components/plugins/region_type/net_vanbaren_apex_tab_list
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 8652305017628821 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'NET.VANBAREN.APEX.TAB_LIST'
 ,p_display_name => 'Tab menu list'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'/*CODE*/'
 ,p_render_function => 'APR$TAB_LIST'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '<%= pkg.version%>'
 ,p_plugin_comment => '/*LICENSE*/'
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
wwv_flow_api.create_plugin_attribute (
  p_id => 2527905766211974 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 8652305017628821 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Observe tabs conditions.'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
 ,p_help_text => 'Should the conditions of the individual tabs be observed. In other words if the condition of the tab is not met then the tab will not be rendered. For this setting to work the package APEX$CHECKS needs to be installed. You need to do this yourself. Make sure that the application parsing schema has execution rights for the package. And (public) synonyms are available when necessary.'
  );
null;
 
end;
/

