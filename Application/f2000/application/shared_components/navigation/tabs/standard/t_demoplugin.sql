--application/shared_components/navigation/tabs/standard/t_demoplugin
wwv_flow_api.create_tab (
  p_id=> 5842406418057087 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_REGION',
  p_tab_sequence=> 40,
  p_tab_name=> 'T_DEMOPLUGIN',
  p_tab_text => 'Demo plugins',
  p_tab_step => 10,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
