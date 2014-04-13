--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,2000),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,2000),
  p_owner => nvl(wwv_flow_application_install.get_schema,'HR'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Tab menu list'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'T_TAB_MENU_LIST'),
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20140413211941',
  p_max_session_length_sec=> null,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'en',
  p_flow_language_derived_from=> '',
  p_allow_feedback_yn=> 'N',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 25653475606962650 + wwv_flow_api.g_id_offset,
  p_logout_url=> '',
  p_application_tab_set=> 1,
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> 'release 0.9',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'N',
  p_browser_frame=>'D',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'Y',
  p_csv_encoding=> 'Y',
  p_include_legacy_javascript=> 'Y',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_substitution_string_01 => 'APPJAVSCRIPT',
  p_substitution_value_01  => '/projects/Tab_menu_list/Application/javascript/',
  p_substitution_string_02 => 'APPCSS',
  p_substitution_value_02  => '/projects/Tab_menu_list/Application/css/',
  p_substitution_string_03 => 'THEME',
  p_substitution_value_03  => 'redmond',
  p_substitution_string_04 => 'APPIMAGES',
  p_substitution_value_04  => '/projects/Tab_menu_list/Application/images/',
  p_last_updated_by => 'HR',
  p_last_upd_yyyymmddhh24miss=> '20140413211941',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user-interfaces
--
 
begin
 
