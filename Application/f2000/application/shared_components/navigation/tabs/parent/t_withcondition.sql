--application/shared_components/navigation/tabs/parent/t_withcondition
wwv_flow_api.create_toplevel_tab (
  p_id=> 2539498667458383 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'main',
  p_tab_sequence=> 50,
  p_tab_name  => 'T_WITHCONDITION',
  p_tab_text  => 'With condition',
  p_tab_target=> 'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_WITHCONDITION',
  p_display_condition_type=> 'NEVER',
  p_tab_comment=> '');
 
 
end;
/

prompt  ...Shared Lists of values
--
prompt  ...Application Trees
--
