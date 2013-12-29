--application/shared_components/plugins/region_type/net_vanbaren_apex_tab_menu_list
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 8652325017628821 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'NET.VANBAREN.APEX.TAB_MENU_LIST'
 ,p_display_name => 'Tab menu list'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'apr$tab_menu_list.render_tab_region'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '0.9'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 8652623686674970 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 8652325017628821 + wwv_flow_api.g_id_offset
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
  p_id => 8653207930697537 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 8652325017628821 + wwv_flow_api.g_id_offset
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
  p_id => 8653523014705678 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 8652325017628821 + wwv_flow_api.g_id_offset
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

