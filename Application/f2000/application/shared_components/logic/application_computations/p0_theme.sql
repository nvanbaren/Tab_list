--application/shared_components/logic/application_computations/p0_theme
wwv_flow_api.create_flow_computation (
  p_id => 2660811501886864 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_THEME',
  p_computation_point    => 'BEFORE_HEADER',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_application.do_substitutions(''&THEME.'');',
  p_compute_when=> 'P0_THEME',
  p_compute_when_type=> 'ITEM_IS_NULL',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
