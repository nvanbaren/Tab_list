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
--
--application/shared_components/plugins/region_type/net_vanbaren_apex_tab_menu_list
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 5637743691552510 + wwv_flow_api.g_id_offset
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
  p_id => 5638042360598659 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 5637743691552510 + wwv_flow_api.g_id_offset
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
  p_id => 5638626604621226 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 5637743691552510 + wwv_flow_api.g_id_offset
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
  p_id => 5638941688629367 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 5637743691552510 + wwv_flow_api.g_id_offset
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
