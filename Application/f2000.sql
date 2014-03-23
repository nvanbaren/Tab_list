set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 2000 - Tab menu list
--
-- Application Export:
--   Application:     2000
--   Name:            Tab menu list
--   Date and Time:   19:13 Zondag Maart 23, 2014
--   Exported By:     HR
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.0.00.27
--   Instance ID:     63108024791481
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                     10
--     Regions:                 22
--     Dynamic Actions:          1
--   Shared Components:
--     Logic:
--     Navigation:
--       Parent Tabs:            4
--       Tab Sets:               4
--         Tabs:                 9
--       Lists:                  2
--       Breadcrumbs:            1
--       NavBar Entries:         1
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 1
--         Region:               1
--         Label:                1
--         List:                11
--         Popup LOV:            1
--         Button:               1
--         Report:               1
--       Plug-ins:               2
--     Globalization:
--     Reports:
 
 
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
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,2000);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,2000));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,2000));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

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
  p_checksum_salt_last_reset => '20140323183936',
  p_max_session_length_sec=> null,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'en',
  p_flow_language_derived_from=> '',
  p_allow_feedback_yn=> 'N',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'/i/'),
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
  p_last_upd_yyyymmddhh24miss=> '20140323183936',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => true
 ,p_is_default => true
 ,p_theme_id => 102
 ,p_home_url => 'f?p=&APP_ID.:TABMENULIST:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/authorization_type_native_exists
wwv_flow_api.create_plugin_setting (
  p_id => 3014883366076331 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_EXISTS'
  );
--application/plug-in setting/authorization_type_native_not_exists
wwv_flow_api.create_plugin_setting (
  p_id => 3014964957076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_NOT_EXISTS'
  );
--application/plug-in setting/authorization_type_native_item_is_null
wwv_flow_api.create_plugin_setting (
  p_id => 3015081489076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_IS_NULL'
  );
--application/plug-in setting/authorization_type_native_item_is_not_null
wwv_flow_api.create_plugin_setting (
  p_id => 3015161857076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_IS_NOT_NULL'
  );
--application/plug-in setting/authorization_type_native_function_body
wwv_flow_api.create_plugin_setting (
  p_id => 3015266317076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_FUNCTION_BODY'
  );
--application/plug-in setting/authorization_type_native_pref_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 3015368470076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_PREF_EQUALS_VALUE'
  );
--application/plug-in setting/authorization_type_native_pref_not_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 3015477978076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_PREF_NOT_EQUALS_VALUE'
  );
--application/plug-in setting/authorization_type_native_item_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 3015553637076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_EQUALS_VALUE'
  );
--application/plug-in setting/authorization_type_native_item_not_equals_value
wwv_flow_api.create_plugin_setting (
  p_id => 3015679996076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_plugin => 'NATIVE_ITEM_NOT_EQUALS_VALUE'
  );
--application/plug-in setting/region_type_native_jqm_list_view
wwv_flow_api.create_plugin_setting (
  p_id => 3015759489076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_plugin => 'NATIVE_JQM_LIST_VIEW'
  );
--application/plug-in setting/dynamic_action_native_hide
wwv_flow_api.create_plugin_setting (
  p_id => 3015860892076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_HIDE'
  );
--application/plug-in setting/dynamic_action_native_enable
wwv_flow_api.create_plugin_setting (
  p_id => 3015970514076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_ENABLE'
  );
--application/plug-in setting/dynamic_action_native_disable
wwv_flow_api.create_plugin_setting (
  p_id => 3016083944076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_DISABLE'
  );
--application/plug-in setting/dynamic_action_native_set_value
wwv_flow_api.create_plugin_setting (
  p_id => 3016156920076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SET_VALUE'
  );
--application/plug-in setting/dynamic_action_native_javascript_code
wwv_flow_api.create_plugin_setting (
  p_id => 3016275982076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_JAVASCRIPT_CODE'
  );
--application/plug-in setting/dynamic_action_native_add_class
wwv_flow_api.create_plugin_setting (
  p_id => 3016373522076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_ADD_CLASS'
  );
--application/plug-in setting/dynamic_action_native_remove_class
wwv_flow_api.create_plugin_setting (
  p_id => 3016475673076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_REMOVE_CLASS'
  );
--application/plug-in setting/dynamic_action_native_set_css
wwv_flow_api.create_plugin_setting (
  p_id => 3016584462076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SET_CSS'
  );
--application/plug-in setting/authentication_type_native_custom
wwv_flow_api.create_plugin_setting (
  p_id => 3016653407076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_CUSTOM'
  );
--application/plug-in setting/item_type_native_rich_text_editor
wwv_flow_api.create_plugin_setting (
  p_id => 3016754056076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_RICH_TEXT_EDITOR'
  );
--application/plug-in setting/item_type_native_textarea
wwv_flow_api.create_plugin_setting (
  p_id => 3016856132076332 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_TEXTAREA'
  );
--application/plug-in setting/item_type_native_password
wwv_flow_api.create_plugin_setting (
  p_id => 3016979169076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_PASSWORD'
  );
--application/plug-in setting/item_type_native_date_picker_classic
wwv_flow_api.create_plugin_setting (
  p_id => 3017083252076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DATE_PICKER_CLASSIC'
  );
--application/plug-in setting/item_type_native_stop_and_start_html_table
wwv_flow_api.create_plugin_setting (
  p_id => 3017172893076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_STOP_AND_START_HTML_TABLE'
  );
--application/plug-in setting/dynamic_action_native_refresh
wwv_flow_api.create_plugin_setting (
  p_id => 3017260012076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_REFRESH'
  );
--application/plug-in setting/dynamic_action_native_show
wwv_flow_api.create_plugin_setting (
  p_id => 3017357602076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SHOW'
  );
--application/plug-in setting/authentication_type_native_http_header_variable
wwv_flow_api.create_plugin_setting (
  p_id => 3017456996076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_HTTP_HEADER_VARIABLE'
  );
--application/plug-in setting/dynamic_action_native_clear
wwv_flow_api.create_plugin_setting (
  p_id => 3017552493076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_CLEAR'
  );
--application/plug-in setting/dynamic_action_native_alert
wwv_flow_api.create_plugin_setting (
  p_id => 3017653242076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_ALERT'
  );
--application/plug-in setting/dynamic_action_native_confirm
wwv_flow_api.create_plugin_setting (
  p_id => 3017759330076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_CONFIRM'
  );
--application/plug-in setting/process_type_native_parse_uploaded_data
wwv_flow_api.create_plugin_setting (
  p_id => 3017858353076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_PARSE_UPLOADED_DATA'
  );
--application/plug-in setting/region_type_native_data_upload_column_mapping
wwv_flow_api.create_plugin_setting (
  p_id => 3017962931076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_plugin => 'NATIVE_DATA_UPLOAD_COLUMN_MAPPING'
  );
--application/plug-in setting/process_type_native_prepare_uploaded_data
wwv_flow_api.create_plugin_setting (
  p_id => 3018073499076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_PREPARE_UPLOADED_DATA'
  );
--application/plug-in setting/process_type_native_load_uploaded_data
wwv_flow_api.create_plugin_setting (
  p_id => 3018159263076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_LOAD_UPLOADED_DATA'
  );
--application/plug-in setting/authentication_type_native_apex_accounts
wwv_flow_api.create_plugin_setting (
  p_id => 3018252489076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_APEX_ACCOUNTS'
  );
--application/plug-in setting/authentication_type_native_open_door
wwv_flow_api.create_plugin_setting (
  p_id => 3018355954076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_OPEN_DOOR'
  );
--application/plug-in setting/authentication_type_native_db_accounts
wwv_flow_api.create_plugin_setting (
  p_id => 3018455643076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_DB_ACCOUNTS'
  );
--application/plug-in setting/authentication_type_native_ldap
wwv_flow_api.create_plugin_setting (
  p_id => 3018556687076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_LDAP'
  );
--application/plug-in setting/authentication_type_native_ias_sso
wwv_flow_api.create_plugin_setting (
  p_id => 3018660413076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_IAS_SSO'
  );
--application/plug-in setting/authentication_type_native_dad
wwv_flow_api.create_plugin_setting (
  p_id => 3018782438076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHENTICATION TYPE'
 ,p_plugin => 'NATIVE_DAD'
  );
--application/plug-in setting/dynamic_action_native_set_focus
wwv_flow_api.create_plugin_setting (
  p_id => 3018878335076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SET_FOCUS'
  );
--application/plug-in setting/dynamic_action_native_submit_page
wwv_flow_api.create_plugin_setting (
  p_id => 3018973739076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_SUBMIT_PAGE'
  );
--application/plug-in setting/item_type_native_number_field
wwv_flow_api.create_plugin_setting (
  p_id => 3019055681076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_NUMBER_FIELD'
  );
--application/plug-in setting/item_type_native_slider
wwv_flow_api.create_plugin_setting (
  p_id => 3019178794076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_SLIDER'
  );
--application/plug-in setting/process_type_native_send_email
wwv_flow_api.create_plugin_setting (
  p_id => 3019280551076334 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'PROCESS TYPE'
 ,p_plugin => 'NATIVE_SEND_EMAIL'
  );
--application/plug-in setting/item_type_native_file
wwv_flow_api.create_plugin_setting (
  p_id => 3019374591076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_FILE'
  );
--application/plug-in setting/item_type_native_list_manager
wwv_flow_api.create_plugin_setting (
  p_id => 3019482084076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_LIST_MANAGER'
  );
--application/plug-in setting/dynamic_action_native_cancel_event
wwv_flow_api.create_plugin_setting (
  p_id => 3019561002076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_CANCEL_EVENT'
  );
--application/plug-in setting/item_type_native_date_picker
wwv_flow_api.create_plugin_setting (
  p_id => 3019679141076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DATE_PICKER'
  );
--application/plug-in setting/item_type_native_date_picker_html5
wwv_flow_api.create_plugin_setting (
  p_id => 3019762353076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DATE_PICKER_HTML5'
  );
--application/plug-in setting/item_type_native_text_field
wwv_flow_api.create_plugin_setting (
  p_id => 3019858832076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_TEXT_FIELD'
  );
--application/plug-in setting/item_type_native_color_picker
wwv_flow_api.create_plugin_setting (
  p_id => 3019973964076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_COLOR_PICKER'
  );
--application/plug-in setting/item_type_native_text_with_calculator
wwv_flow_api.create_plugin_setting (
  p_id => 3020067224076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_TEXT_WITH_CALCULATOR'
  );
--application/plug-in setting/item_type_native_hidden
wwv_flow_api.create_plugin_setting (
  p_id => 3020170065076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_HIDDEN'
  );
--application/plug-in setting/item_type_native_display_image
wwv_flow_api.create_plugin_setting (
  p_id => 3020266821076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DISPLAY_IMAGE'
  );
--application/plug-in setting/item_type_native_auto_complete
wwv_flow_api.create_plugin_setting (
  p_id => 3020379482076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_AUTO_COMPLETE'
  );
--application/plug-in setting/item_type_native_popup_lov
wwv_flow_api.create_plugin_setting (
  p_id => 3020467533076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_POPUP_LOV'
  );
--application/plug-in setting/dynamic_action_native_execute_plsql_code
wwv_flow_api.create_plugin_setting (
  p_id => 3020573408076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_plugin => 'NATIVE_EXECUTE_PLSQL_CODE'
  );
--application/plug-in setting/item_type_native_display_only
wwv_flow_api.create_plugin_setting (
  p_id => 3020658193076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_DISPLAY_ONLY'
  );
--application/plug-in setting/item_type_native_checkbox
wwv_flow_api.create_plugin_setting (
  p_id => 3020780851076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_CHECKBOX'
  );
--application/plug-in setting/item_type_native_select_list
wwv_flow_api.create_plugin_setting (
  p_id => 3020877527076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_SELECT_LIST'
  );
--application/plug-in setting/item_type_native_shuttle
wwv_flow_api.create_plugin_setting (
  p_id => 3020965795076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_SHUTTLE'
  );
--application/plug-in setting/item_type_native_radiogroup
wwv_flow_api.create_plugin_setting (
  p_id => 3021077716076335 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_RADIOGROUP'
  );
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 3021177523076339 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
--application/plug-in setting/region_type_plugin_net_vanbaren_apex_demo_plugin
wwv_flow_api.create_plugin_setting (
  p_id => 5643767086660431 + wwv_flow_api.g_id_offset
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

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 18477962771784684 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 200,
  p_icon_image => '',
  p_icon_subtext=> 'Logout',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Logout',
  p_icon_height=> 32,
  p_icon_width=> 32,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'USER_IS_NOT_PUBLIC_USER',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
--application/shared_components/navigation/tabs/standard/t_get_adres
wwv_flow_api.create_tab (
  p_id=> 22474774195338164 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_DYNAMIC_ACTION',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_GET ADRES',
  p_tab_text => 'Get adres',
  p_tab_step => 4,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_set_multiple_values_mr
wwv_flow_api.create_tab (
  p_id=> 23319073067656836 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_DYNAMIC_ACTION',
  p_tab_sequence=> 20,
  p_tab_name=> 'T_SET MULTIPLE VALUES MR',
  p_tab_text => 'Set multiple values MR',
  p_tab_step => 6,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_cascading_lov_mr
wwv_flow_api.create_tab (
  p_id=> 23471190564693852 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_DYNAMIC_ACTION',
  p_tab_sequence=> 30,
  p_tab_name=> 'T_CASCADING LOV MR',
  p_tab_text => 'Cascading LOV MR',
  p_tab_step => 7,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_selectlist_domain
wwv_flow_api.create_tab (
  p_id=> 22827890896576784 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_ITEM',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_SELECTLIST DOMAIN',
  p_tab_text => 'Selectlist domain',
  p_tab_step => 5,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_dynamic_message
wwv_flow_api.create_tab (
  p_id=> 24208369997908040 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_PROCES',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_DYNAMIC MESSAGE',
  p_tab_text => 'Dynamic message',
  p_tab_step => 8,
  p_tab_also_current_for_pages => '8',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_tab_menu
wwv_flow_api.create_tab (
  p_id=> 18479966258784920 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_REGION',
  p_tab_sequence=> 20,
  p_tab_name=> 'T_TAB_MENU',
  p_tab_text => 'Tab menu',
  p_tab_step => 3,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_tab_menu_list
wwv_flow_api.create_tab (
  p_id=> 5836182638455388 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_REGION',
  p_tab_sequence=> 25,
  p_tab_name=> 'T_TAB_MENU_LIST',
  p_tab_text => 'Tab menu list template',
  p_tab_step => 11,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_dialog_region
wwv_flow_api.create_tab (
  p_id=> 21769186262811890 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'T_REGION',
  p_tab_sequence=> 30,
  p_tab_name=> 'T_DIALOG REGION',
  p_tab_text => 'Dialog region',
  p_tab_step => 2,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'main',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_demoplugin
wwv_flow_api.create_tab (
  p_id=> 5842386418057087 + wwv_flow_api.g_id_offset,
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
 
--application/shared_components/navigation/tabs/parent/t_item
wwv_flow_api.create_toplevel_tab (
  p_id=> 22828068213576784 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'main',
  p_tab_sequence=> 10,
  p_tab_name  => 'T_ITEM',
  p_tab_image => '2.jpg',
  p_tab_non_current_image => '2.jpg',
  p_tab_image_attributes  => 'width="16px"',
  p_tab_text  => 'Items',
  p_tab_target=> 'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_ITEM',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_dynamic_action
wwv_flow_api.create_toplevel_tab (
  p_id=> 22474986877338164 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'main',
  p_tab_sequence=> 20,
  p_tab_name  => 'T_DYNAMIC_ACTION',
  p_tab_image => '3.jpg',
  p_tab_non_current_image => '3.jpg',
  p_tab_text  => 'Dynamic actions',
  p_tab_target=> 'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_DYNAMIC_ACTION',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_region
wwv_flow_api.create_toplevel_tab (
  p_id=> 18848782074583410 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'main',
  p_tab_sequence=> 30,
  p_tab_name  => 'T_REGION',
  p_tab_image => '4.jpg',
  p_tab_non_current_image => '4.jpg',
  p_tab_text  => 'Regions',
  p_tab_target=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_REGION',
  p_tab_comment=> '');
 
--application/shared_components/navigation/tabs/parent/t_proces
wwv_flow_api.create_toplevel_tab (
  p_id=> 24275268166919870 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'main',
  p_tab_sequence=> 40,
  p_tab_name  => 'T_PROCES',
  p_tab_image => '5.jpg',
  p_tab_non_current_image => '5.jpg',
  p_tab_text  => 'Proces',
  p_tab_target=> 'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::',
  p_current_on_tabset=> 'T_PROCES',
  p_tab_comment=> '');
 
 
end;
/

prompt  ...Shared Lists of values
--
prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

 
--application/pages/page_00002
prompt  ...PAGE 2: Dialog regions
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_REGION'
 ,p_name => 'Dialog regions'
 ,p_alias => 'DIALOG'
 ,p_step_title => 'Dialog regions'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Dialog regions'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_code => 
'open_dialog=function(pId){'||unistr('\000a')||
'$(''#''+pId).dialog(''open'');'||unistr('\000a')||
'}'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224427'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs. <br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3027967160190179 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00003
prompt  ...PAGE 3: Tab submenu
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_REGION'
 ,p_name => 'Tab submenu'
 ,p_alias => 'TABSUBMENU'
 ,p_step_title => 'Tab submenu'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Tab submenu'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_file_urls => '/l/apexlib/slidebox.js'
 ,p_inline_css => 
'#menuclasses, #javascriptmenu {margin-top:30px;}'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224350'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs. <br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3062853550104111 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>19141093083898930 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:TABSUBMENU:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'BEFORE_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 100,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 06-MAR-2012 00:06 by NICOLETTE');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00004
prompt  ...PAGE 4: Get adres
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 4
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_name => 'Get adres'
 ,p_alias => 'GET_ADRES'
 ,p_step_title => 'Get adres'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Get adres'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224155'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs.<br />This is page &APP_PAGE_ID.<br /><a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3063062207106596 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 4
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00005
prompt  ...PAGE 5: Domain
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 5
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_name => 'Domain'
 ,p_alias => 'DOMAIN'
 ,p_step_title => 'Domain'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Domain'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224110'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs.<br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3063271211109204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 5
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00006
prompt  ...PAGE 6: Set multiple values
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 6
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_DYNAMIC_ACTION'
 ,p_name => 'Set multiple values'
 ,p_alias => 'MRSETVALUES'
 ,p_step_title => 'Set multiple values'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Set multiple values'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224231'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs. <br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3063478484111326 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 6,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>23322089242656908 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:6:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 6
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00007
prompt  ...PAGE 7: Cascading lov
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 7
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_DYNAMIC_ACTION'
 ,p_name => 'Cascading lov'
 ,p_alias => 'MRCASCADINGLOV'
 ,p_step_title => 'Cascading lov'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Cascading lov'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224320'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs. <br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3064466541145739 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 7
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00008
prompt  ...PAGE 8: Dynamic message
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 8
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_PROCES'
 ,p_name => 'Dynamic message'
 ,p_alias => 'DYNAMICMESSAGE'
 ,p_step_title => 'Dynamic message'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Dynamic message'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 39658505916395976 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224513'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs. <br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3063655412114112 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 8
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00010
prompt  ...PAGE 10: Plugin demonstration
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 10
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_REGION'
 ,p_name => 'Plugin demonstration'
 ,p_alias => 'DEMO'
 ,p_step_title => 'Plugin demonstration'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 39658505916395976 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130802224452'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'This is a demo page to get working tabs. <br />'||unistr('\000a')||
'This is page &APP_PAGE_ID.<br />'||unistr('\000a')||
'<a href="f?p=&APP_ALIAS.:11:&SESSION_ID."> Go back </a>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 3063861299115803 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'Demo text',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 10
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00011
prompt  ...PAGE 11: Tab menu list
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 11
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'T_REGION'
 ,p_name => 'Tab menu list'
 ,p_alias => 'TABMENULIST'
 ,p_step_title => 'Tab menu list'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_file_urls => '/projects/Tab_menu_list/Demo/javascript/slidebox.js'
 ,p_javascript_code_onload => 
'$(function() {'||unistr('\000a')||
'  $(''#sdt_menu > li'')'||unistr('\000a')||
'    .bind(''mouseenter'',function(){slidebox_in(this,120);})'||unistr('\000a')||
'    .bind(''mouseleave'',function(){slidebox_out(this,120);})'||unistr('\000a')||
'});'
 ,p_css_file_urls => '/projects/Tab_menu_list/Demo/css/Special-lists.css'
 ,p_step_template => 39658505916395976 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130804181352'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 3025975509145341 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Plugin demonstration',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 120,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.DEMO_PLUGIN',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'S',
  p_attribute_02 => 'NET.VANBAREN.APEX.TAB_MENU_LIST',
  p_attribute_03 => 'C',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5836366807455394 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Pull down menu',
  p_region_name=>'PULLDOWN',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_MENU_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Pull Down Menu',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'N',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5843479823258258 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Horizontal menu',
  p_region_name=>'HORIZONTALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_MENU_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Horizontal menu',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'Y',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5844779814532625 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Vertical menu',
  p_region_name=>'VERTICALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_MENU_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Vertical menu',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5847665037703758 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Slide down box',
  p_region_name=>'SLIDEDOWNBOX',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 100,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_MENU_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Slide down box',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'N',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5855274356678184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Fly out',
  p_region_name=>'FLYOUTMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_MENU_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Fly out',
  p_attribute_02 => 'Y',
  p_attribute_03 => 'N',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5861965416525909 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Breadcrumb menu',
  p_region_name=>'BREADCRUMBMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'PLUGIN_NET.VANBAREN.APEX.TAB_MENU_LIST',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_attribute_01=> 'Breadcrumb menu',
  p_attribute_02 => 'N',
  p_attribute_03 => 'Y',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 3065754349153735 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 11
 ,p_name => 'Accordion plugin demonstration'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 3066055162153752 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 11
 ,p_event_id => 3065754349153735 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'apex.jQuery(".accordion" ).accordion({collapsible: true'||unistr('\000a')||
'                                       ,active:false'||unistr('\000a')||
'                                       ,autoHeight: false'||unistr('\000a')||
'                                      });'||unistr('\000a')||
'apex.jQuery(".sub-accordion" ).accordion({collapsible: true'||unistr('\000a')||
'                                       ,active:false'||unistr('\000a')||
'                                       ,autoHeight: false'||unistr('\000a')||
'                                       ,header:"h4"'||unistr('\000a')||
'                                      });'||unistr('\000a')||
'apex.jQuery(".attribute_help").delegate(''.labelcolumn'',''click'',function(){'||unistr('\000a')||
'  var lDialog, lHelp_element'||unistr('\000a')||
'  lHelp_element = $(this).next(''.demo-help'').html();'||unistr('\000a')||
'  if (lHelp_element===null){'||unistr('\000a')||
'    lHelp_element=''Attribute has no help'''||unistr('\000a')||
'  }'||unistr('\000a')||
'  lDialog = apex.jQuery("#apex_popup_field_help");'||unistr('\000a')||
'  if (lDialog.length===0) {'||unistr('\000a')||
'    // add a new div with the retrieved page'||unistr('\000a')||
'    lDialog = apex.jQuery(''<div id="apex_popup_field_help">''+lHelp_element+''</div>'');'||unistr('\000a')||
'    // open created div as a dialog'||unistr('\000a')||
'    lDialog'||unistr('\000a')||
'      .dialog({'||unistr('\000a')||
'        title: ''Attribute help'','||unistr('\000a')||
'        bgiframe: true,'||unistr('\000a')||
'        width: 500,'||unistr('\000a')||
'        height: 350,'||unistr('\000a')||
'        show: ''drop'','||unistr('\000a')||
'        hide: ''drop'' });'||unistr('\000a')||
'  } else {'||unistr('\000a')||
'    // replace the existing dialog and open it again'||unistr('\000a')||
'    lDialog'||unistr('\000a')||
'      .html(lHelp_element)'||unistr('\000a')||
'      .dialog(''option'', ''title'', ''Attribute help'')'||unistr('\000a')||
'      .dialog(''open'');'||unistr('\000a')||
'  }'||unistr('\000a')||
'});'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 11
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00012
prompt  ...PAGE 12: List templates
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 12
 ,p_user_interface_id => 3079567899087759 + wwv_flow_api.g_id_offset
 ,p_name => 'List templates'
 ,p_alias => 'LISTTEMPLATES'
 ,p_step_title => 'List templates'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_javascript_file_urls => '/l/apexlib/slidebox.js'
 ,p_javascript_code_onload => 
'$(function() {'||unistr('\000a')||
'  $(''#sdt_menu > li'')'||unistr('\000a')||
'    .bind(''mouseenter'',function(){slidebox_in(this,120);})'||unistr('\000a')||
'    .bind(''mouseleave'',function(){slidebox_out(this,120);})'||unistr('\000a')||
'});'
 ,p_css_file_urls => '/l/plugins/Tab menu list/Special-lists.css'
 ,p_inline_css => 
'.tbl-main {'||unistr('\000a')||
'    min-width: 620px;'||unistr('\000a')||
'    vertical-align: top;'||unistr('\000a')||
'}'
 ,p_step_template => 39658505916395976 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'NICOLETTE'
 ,p_last_upd_yyyymmddhh24miss => '20130608181337'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5870361913126467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Horizontal menu',
  p_region_name=>'HORZONTALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 5842964512219108+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5870970617157373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Breadcrumb menu',
  p_region_name=>'BREADCRUMBMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 5867289022672547+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5871992144267687 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Slide down box',
  p_region_name=>'SLIDEDOWNBOX',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 5847462594664229+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5909976717617857 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Vertical menu',
  p_region_name=>'VERTICALMENU',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 5844962629537160+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5913178201319621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Breadcrumb corrected template',
  p_region_name=>'BREADCRUMBCORRECTED',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 5912871490308224+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 5915473040789320 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Fly out',
  p_region_name=>'FLYOUT',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 80,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 5855082895644402+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select lis.template_name'||unistr('\000a')||
',      lis.list_template_before_rows'||unistr('\000a')||
',      lis.list_template_current'||unistr('\000a')||
',      lis.item_template_curr_w_child'||unistr('\000a')||
',      lis.list_template_noncurrent'||unistr('\000a')||
',      lis.item_template_noncurr_w_child'||unistr('\000a')||
',      lis.between_items'||unistr('\000a')||
',      lis.first_list_template_current'||unistr('\000a')||
',      lis.f_item_template_curr_w_child'||unistr('\000a')||
',      lis.first_list_template_noncurrent'||unistr('\000a')||
',      lis.fitem_template_noncurr_w_child'||unistr('\000a')||
', ';

s:=s||'     lis.before_sub_list'||unistr('\000a')||
',      lis.sub_list_item_current'||unistr('\000a')||
',      lis.sub_template_curr_w_child'||unistr('\000a')||
',      lis.sub_list_item_noncurrent'||unistr('\000a')||
',      lis.sub_template_noncurr_w_child'||unistr('\000a')||
',      lis.between_sub_list_items'||unistr('\000a')||
',      lis.after_sub_list'||unistr('\000a')||
',      lis.list_template_after_rows'||unistr('\000a')||
'from   apex_application_temp_list lis'||unistr('\000a')||
'join   apex_application_page_regions reg'||unistr('\000a')||
'on     reg.application_id = lis.application_id'||unistr('\000a')||
'and    ';

s:=s||'reg.list_template_override_id = lis.list_template_id'||unistr('\000a')||
'where  lis.application_id = :app_id'||unistr('\000a')||
'and    lis.theme_number = 102';

wwv_flow_api.create_page_plug (
  p_id=> 5916070128403497 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Templates',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 39422984254603256+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select lis.template_name'||unistr('\000a')||
',      lis.list_template_before_rows'||unistr('\000a')||
',      lis.list_template_current'||unistr('\000a')||
',      lis.item_template_curr_w_child'||unistr('\000a')||
',      lis.list_template_noncurrent'||unistr('\000a')||
',      lis.item_template_noncurr_w_child'||unistr('\000a')||
',      lis.between_items'||unistr('\000a')||
',      lis.first_list_template_current'||unistr('\000a')||
',      lis.f_item_template_curr_w_child'||unistr('\000a')||
',      lis.first_list_template_noncurrent'||unistr('\000a')||
',      lis.fitem_template_noncurr_w_child'||unistr('\000a')||
', ';

a1:=a1||'     lis.before_sub_list'||unistr('\000a')||
',      lis.sub_list_item_current'||unistr('\000a')||
',      lis.sub_template_curr_w_child'||unistr('\000a')||
',      lis.sub_list_item_noncurrent'||unistr('\000a')||
',      lis.sub_template_noncurr_w_child'||unistr('\000a')||
',      lis.between_sub_list_items'||unistr('\000a')||
',      lis.after_sub_list'||unistr('\000a')||
',      lis.list_template_after_rows'||unistr('\000a')||
'from   apex_application_temp_list lis'||unistr('\000a')||
'join   apex_application_page_regions reg'||unistr('\000a')||
'on     reg.application_id = lis.application_id'||unistr('\000a')||
'and    ';

a1:=a1||'reg.list_template_override_id = lis.list_template_id'||unistr('\000a')||
'where  lis.application_id = :app_id'||unistr('\000a')||
'and    lis.theme_number = 102';

wwv_flow_api.create_worksheet(
  p_id=> 5916188591403497+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_region_id=> 5916070128403497+wwv_flow_api.g_id_offset,
  p_name=> 'Templates',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '1000000',
  p_max_row_count_message=> 'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_base_pk1=>'TEMPLATE_NAME',
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'N',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'Y',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />',
  p_allow_exclude_null_values=>'Y',
  p_allow_hide_extra_columns=>'Y',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'NICOLETTE',
  p_internal_uid=> 2901627265327186);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5916378059403541+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TEMPLATE_NAME',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Template name',
  p_report_label           =>'Template name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5916476102403567+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LIST_TEMPLATE_BEFORE_ROWS',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'List template before Rows',
  p_report_label           =>'List template before Rows',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5916580172403567+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LIST_TEMPLATE_CURRENT',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'List template current',
  p_report_label           =>'List template current',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5916684434403567+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ITEM_TEMPLATE_CURR_W_CHILD',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Item template curr W Child',
  p_report_label           =>'Item template curr W Child',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5916775134403572+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LIST_TEMPLATE_NONCURRENT',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'List template noncurrent',
  p_report_label           =>'List template noncurrent',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5916865470403572+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ITEM_TEMPLATE_NONCURR_W_CHILD',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Item template noncurr W Child',
  p_report_label           =>'Item template noncurr W Child',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5916967335403574+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'BETWEEN_ITEMS',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Between items',
  p_report_label           =>'Between items',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917072206403574+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FIRST_LIST_TEMPLATE_CURRENT',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'First list template current',
  p_report_label           =>'First list template current',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917171294403575+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'F_ITEM_TEMPLATE_CURR_W_CHILD',
  p_display_order          =>9,
  p_column_identifier      =>'I',
  p_column_label           =>'F item template curr W Child',
  p_report_label           =>'F item template curr W Child',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917288308403575+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FIRST_LIST_TEMPLATE_NONCURRENT',
  p_display_order          =>10,
  p_column_identifier      =>'J',
  p_column_label           =>'First list template noncurrent',
  p_report_label           =>'First list template noncurrent',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917361649403578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FITEM_TEMPLATE_NONCURR_W_CHILD',
  p_display_order          =>11,
  p_column_identifier      =>'K',
  p_column_label           =>'Fitem template noncurr w child',
  p_report_label           =>'Fitem template noncurr w child',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917465337403578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'BEFORE_SUB_LIST',
  p_display_order          =>12,
  p_column_identifier      =>'L',
  p_column_label           =>'Before sub list',
  p_report_label           =>'Before sub list',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917576194403578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SUB_LIST_ITEM_CURRENT',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Sub list item current',
  p_report_label           =>'Sub list item current',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917687533403578+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SUB_TEMPLATE_CURR_W_CHILD',
  p_display_order          =>14,
  p_column_identifier      =>'N',
  p_column_label           =>'Sub template curr w child',
  p_report_label           =>'Sub template curr w child',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917768616403580+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SUB_LIST_ITEM_NONCURRENT',
  p_display_order          =>15,
  p_column_identifier      =>'O',
  p_column_label           =>'Sub list item noncurrent',
  p_report_label           =>'Sub list item noncurrent',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917866359403580+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SUB_TEMPLATE_NONCURR_W_CHILD',
  p_display_order          =>16,
  p_column_identifier      =>'P',
  p_column_label           =>'Sub template noncurr w child',
  p_report_label           =>'Sub template noncurr w child',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'CLOB',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5917991735403580+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'BETWEEN_SUB_LIST_ITEMS',
  p_display_order          =>17,
  p_column_identifier      =>'Q',
  p_column_label           =>'Between sub list items',
  p_report_label           =>'Between sub list items',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5918063059403581+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'AFTER_SUB_LIST',
  p_display_order          =>18,
  p_column_identifier      =>'R',
  p_column_label           =>'After sub list',
  p_report_label           =>'After sub list',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 5918190077403581+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LIST_TEMPLATE_AFTER_ROWS',
  p_display_order          =>19,
  p_column_identifier      =>'S',
  p_column_label           =>'List template after rows',
  p_report_label           =>'List template after rows',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'TEMPLATE_NAME:LIST_TEMPLATE_BEFORE_ROWS:LIST_TEMPLATE_CURRENT:ITEM_TEMPLATE_CURR_W_CHILD:LIST_TEMPLATE_NONCURRENT:ITEM_TEMPLATE_NONCURR_W_CHILD:BETWEEN_ITEMS:FIRST_LIST_TEMPLATE_CURRENT:F_ITEM_TEMPLATE_CURR_W_CHILD:FIRST_LIST_TEMPLATE_NONCURRENT:FITEM_TEMPLATE_NONCURR_W_CHILD:BEFORE_SUB_LIST:SUB_LIST_ITEM_CURRENT:SUB_TEMPLATE_CURR_W_CHILD:SUB_LIST_ITEM_NONCURRENT:SUB_TEMPLATE_NONCURR_W_CHILD:BETWE';

rc1:=rc1||'EN_SUB_LIST_ITEMS:AFTER_SUB_LIST:LIST_TEMPLATE_AFTER_ROWS';

wwv_flow_api.create_worksheet_rpt(
  p_id => 5918272552404173+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_worksheet_id => 5916188591403497+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'29038',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 12
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/navigatie_2_levels
 
begin
 
wwv_flow_api.create_list (
  p_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Navigatie 2 levels',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 5922692080829827 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>1,
  p_list_item_link_text=> 'Items',
  p_list_item_link_target=> '',
  p_list_item_icon=> '1.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924070240829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Selectlist domain',
  p_list_item_link_target=> 'f?p=&APP_ID.:DOMAIN:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922692080829827 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '5',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5922885361829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>2,
  p_list_item_link_text=> 'Dynamic action',
  p_list_item_link_target=> '',
  p_list_item_icon=> '2.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '4,6,7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924663206829834 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>100,
  p_list_item_link_text=> 'Get adres',
  p_list_item_link_target=> 'f?p=&APP_ID.:GET_ADRES:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922885361829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '4',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5926179808829838 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>150,
  p_list_item_link_text=> 'Set multiple values',
  p_list_item_link_target=> 'f?p=&APP_ID.:MRSETVALUES:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922885361829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '6',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5926469273829838 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>160,
  p_list_item_link_text=> 'Cascading lov',
  p_list_item_link_target=> 'f?p=&APP_ID.:MRCASCADINGLOV:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922885361829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5923172898829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>3,
  p_list_item_link_text=> 'Regions',
  p_list_item_link_target=> '',
  p_list_item_icon=> '3.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '2,3',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924392868829834 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>90,
  p_list_item_link_text=> 'Dialog',
  p_list_item_link_target=> 'f?p=&APP_ID.:DIALOG:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923172898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '2',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5925285383829837 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>130,
  p_list_item_link_text=> 'Tab submenu',
  p_list_item_link_target=> 'f?p=&APP_ID.:TABSUBMENU:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923172898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '3',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5925583238829837 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>135,
  p_list_item_link_text=> 'Tab menu list',
  p_list_item_link_target=> 'f?p=&APP_ID.:TABMENULIST:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923172898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5927368180829840 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>190,
  p_list_item_link_text=> 'Demo plugins',
  p_list_item_link_target=> 'f?p=&APP_ID.:DEMO:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923172898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5923479989829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>5,
  p_list_item_link_text=> 'Process',
  p_list_item_link_target=> '',
  p_list_item_icon=> '5.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '8',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924968555829834 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922483692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>120,
  p_list_item_link_text=> 'Dynamic succes message',
  p_list_item_link_target=> 'f?p=&APP_ID.:DYNAMICMESSAGE:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923479989829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '6',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/navigatie
 
begin
 
wwv_flow_api.create_list (
  p_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Navigatie',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 21976067879926760 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>1,
  p_list_item_link_text=> 'Items',
  p_list_item_link_target=> '',
  p_list_item_icon=> '1.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21976693762926760 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Selectlist domain',
  p_list_item_link_target=> 'f?p=&APP_ID.:DOMAIN:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21976067879926760 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '5',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21976969457926760 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>2,
  p_list_item_link_text=> 'Dynamic action',
  p_list_item_link_target=> '',
  p_list_item_icon=> '2.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '4,6,7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21977571260926760 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>100,
  p_list_item_link_text=> 'Get adres',
  p_list_item_link_target=> 'f?p=&APP_ID.:GET_ADRES:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21976969457926760 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '4',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21980262811926770 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>140,
  p_list_item_link_text=> 'Tabular form actions',
  p_list_item_link_target=> '',
  p_parent_list_item_id=> 21976969457926760 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '6,7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21975468637926760 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>150,
  p_list_item_link_text=> 'Set multiple values',
  p_list_item_link_target=> 'f?p=&APP_ID.:MRSETVALUES:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21980262811926770 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '6',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21975769274926760 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>160,
  p_list_item_link_text=> 'Cascading lov',
  p_list_item_link_target=> 'f?p=&APP_ID.:MRCASCADINGLOV:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21980262811926770 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21977892166926760 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>3,
  p_list_item_link_text=> 'Regions',
  p_list_item_link_target=> '',
  p_list_item_icon=> '3.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '2,3',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21978187376926764 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>90,
  p_list_item_link_text=> 'Dialog',
  p_list_item_link_target=> 'f?p=&APP_ID.:DIALOG:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21977892166926760 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '2',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21978476112926764 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>130,
  p_list_item_link_text=> 'Tab submenu',
  p_list_item_link_target=> 'f?p=&APP_ID.:TABSUBMENU:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21977892166926760 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '3',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5841990756024689 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>135,
  p_list_item_link_text=> 'Tab menu list',
  p_list_item_link_target=> 'f?p=&APP_ID.:TABMENULIST:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21977892166926760 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 24929675857588584 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>190,
  p_list_item_link_text=> 'Demo plugins',
  p_list_item_link_target=> 'f?p=&APP_ID.:DEMO:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21977892166926760 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21978765502926764 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>5,
  p_list_item_link_text=> 'Process',
  p_list_item_link_target=> '',
  p_list_item_icon=> '5.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '8',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 21979091679926764 + wwv_flow_api.g_id_offset,
  p_list_id=> 21974863078926748 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>120,
  p_list_item_link_text=> 'Dynamic succes message',
  p_list_item_link_target=> 'f?p=&APP_ID.:DYNAMICMESSAGE:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 21978765502926764 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '6',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 18479169651784892 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
null;
 
end;
/

prompt  ...page templates for application: 2000
--
--application/shared_components/user_interface/templates/page/no_tabs_right_sidebar_table_based
prompt  ......Page template 39658515916395976
 
begin
 
wwv_flow_api.create_template (
  p_id => 39658505916395976 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 102
 ,p_name => 'No Tabs - Right Sidebar (table-based)'
 ,p_is_popup => false
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/jquery-ui/1.8/ui/minified/jquery.ui.accordion.min.js'||unistr('\000a')||
'&APPJAVASCRIPT.ApexLib_overload.js'
 ,p_css_file_urls => 'http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/themes/&THEME./jquery-ui.css'||unistr('\000a')||
'&APPCSS.Basic-ui.css'
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div id="header">'||unistr('\000a')||
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>'||unistr('\000a')||
'  #REGION_POSITION_07#'||unistr('\000a')||
'  <div id="navbar">'||unistr('\000a')||
'    <div class="app-user">#WELCOME_USER#</div>'||unistr('\000a')||
'    #NAVIGATION_BAR#'||unistr('\000a')||
'    #REGION_POSITION_08#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="tabs">'||unistr('\000a')||
'  <div class="frame">'||unistr('\000a')||
'    <div class="bg">'||unistr('\000a')||
'      <div class="tab-holder">'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="topbar">#REGION'||
'_POSITION_01##REGION_POSITION_04#</div>'||unistr('\000a')||
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
'<div id="body">'||unistr('\000a')||
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'    <tbody>'||unistr('\000a')||
'      <tr>'||unistr('\000a')||
'        <td class="tbl-main">#REGION_POSITION_02##BOX_BODY#</td>'||unistr('\000a')||
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     '||unistr('\000a')||
'      </tr>'||unistr('\000a')||
'    </tbody>'||unistr('\000a')||
' '||
' </table>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'<div id="footer"><div class="content">'||unistr('\000a')||
'<div id="customize">#CUSTOMIZE#</div>'||unistr('\000a')||
'<div class="app-version">#APP_VERSION#</div>'||unistr('\000a')||
'<div class="clear"></div>'||unistr('\000a')||
'  #REGION_POSITION_05#'||unistr('\000a')||
'</div></div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success ui-state-highlight ui-corner-all" id="success-message">'||unistr('\000a')||
'<a class="close-control" href="#" onclick="$(''#success-message'').remove();return false"><span class="ui-icon ui-icon-closethick"></span></a>'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="notification ui-state-error ui-corner-all" id="notification-message"> '||unistr('\000a')||
'<a class="close-control" href="#" onclick="$(''#notification-message'').remove();return false"><span class="ui-icon ui-icon-closethick"></span></a>#MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_03'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_error_page_template => '#MESSAGE#'
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
 ,p_reference_id => 18102530725762581
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...button templates
--
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
--application/shared_components/user_interface/templates/region/standard_region
prompt  ......region template 39422994254603256
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 39422984254603256 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="region-container ui-widget standard-report" id="#REGION_STATIC_ID#"'||unistr('\000a')||
'#REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="header-container ui-widget-header ui-corner-all ui-helper-clearfix">'||unistr('\000a')||
'    <div class="title-container">#TITLE#</div>'||unistr('\000a')||
'    <div class="button-container ui-widget">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Standard region'
 ,p_theme_id => 102
 ,p_theme_class_id => 9
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/horizontal_menu
prompt  ......list template 5842974512219108
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li  class="ui-state-active"><a href="#LINK#"> #TEXT#</a></li>';

t2:=t2||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t3:=t3||'<li class="CurrentTab ui-state-active"><a href="#LINK#">#TEXT#</a></il>';

t4:=t4||'<li class="Tab ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t5:=t5||'<li  class="ui-state-active"><a href="#LINK#"> #TEXT#</a></li>';

t6:=t6||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t7:=t7||'<li class="CurrentTab ui-state-active"><a href="#LINK#">#TEXT#</a></il>';

t8:=t8||'<li class="Tab ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>5842964512219108 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal menu',
  p_theme_id  => 102,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<ul class="horizontal-menu">',
  p_list_template_after_rows=>' </ul>'||unistr('\000a')||
'<br style="clear:both;">'||unistr('\000a')||
'<br style="clear:both;">',
  p_before_sub_list=>'<ul class="submenu ui-corner-bottom ui-corner-tr">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_menu
prompt  ......list template 5844972629537160
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li  class="ui-state-active"><a href="#LINK#"> #TEXT#</a></li>';

t2:=t2||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t3:=t3||'<li class="ui-state-active"><a href="#LINK#">#TEXT#</a></il>';

t4:=t4||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t5:=t5||'<li  class="ui-state-active"><a href="#LINK#"> #TEXT#<span class="vertical-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-e"></span></a></li>';

t6:=t6||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#<span class="vertical-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-e"></span></a></li>';

t7:=t7||'<li class="ui-state-active"><a href="#LINK#">#TEXT#'||unistr('\000a')||
'<span class="vertical-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-e"></span></a></il>';

t8:=t8||'<li class="ui-state-default"><a href="#LINK#">#TEXT#'||unistr('\000a')||
'<span class="vertical-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-e"></span></a></il>';

wwv_flow_api.create_list_template (
  p_id=>5844962629537160 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical menu',
  p_theme_id  => 102,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<ul class="vertical-menu">',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'<br style="clear:both;">',
  p_before_sub_list=>'<ul class="submenu ui-corner-bottom ui-corner-tr">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/slide_down_box
prompt  ......list template 5847472594664229
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li>'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link ">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t2:=t2||'<li >'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t3:=t3||'<a href="#LINK#" class="currentTab">#TEXT#</a>';

t4:=t4||'<a href="#LINK#" class="Tab">#TEXT#</a>';

t5:=t5||'<li>'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link ">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t6:=t6||'<li>'||unistr('\000a')||
'  <a href="#">'||unistr('\000a')||
'    <img src="/projects/Tab_menu_list/Demo/images/#IMAGE#" alt="#TEXT_ESC_SC#"/>'||unistr('\000a')||
'    <span class="sdt_active"></span>'||unistr('\000a')||
'    <span class="sdt_wrap">'||unistr('\000a')||
'      <span class="sdt_link ">#TEXT#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </a>'||unistr('\000a')||
'  <div class="sdt_box">'||unistr('\000a')||
'</li>';

t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5847462594664229 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Slide down box',
  p_theme_id  => 102,
  p_theme_class_id => 9,
  p_list_template_before_rows=>' <ul id="sdt_menu" class="sdt_menu">',
  p_list_template_after_rows=>'</ul>'||unistr('\000a')||
'<br style="clear:both;">'||unistr('\000a')||
'<br style="clear:both;">',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/fly_out
prompt  ......list template 5855092895644402
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#" class="nikon">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#" class="nikon">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#" class="nikon">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#" class="nikon">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>5855082895644402 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Fly out',
  p_theme_id  => 102,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<div class="flyout-wrap"><ul class="flyout">',
  p_list_template_after_rows=>' </ul></div>',
  p_before_sub_list=>'<ul>',
  p_after_sub_list=>'</ul>'||unistr('\000a')||
'<br style="clear:both;">',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/breadcrumb_menu
prompt  ......list template 5867299022672547
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="ui-state-default no-border-rl"><a href="#LINK#"> #TEXT#</a></li>';

t2:=t2||'<li class="ui-state-default no-border-rl"><a href="#LINK#" >#TEXT#</a></li>';

t3:=t3||'<li class="ui-state-active" ><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t5:=t5||'<li class="ui-state-default no-border-rl"><a href="#LINK#"> #TEXT#</a></li>';

t6:=t6||'<li class="ui-state-default no-border-rl"><a href="#LINK#" >#TEXT#</a></li>';

t7:=t7||'<li class="ui-state-active breadcrumb-sub-parent" ><a href="#LINK#"><span>#TEXT#</span><span class="breadcrumb-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-s"></span></a></li>';

t8:=t8||'<li class="ui-state-default breadcrumb-sub-parent"><a href="#LINK#" ><span>#TEXT#</span><span class="breadcrumb-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-s"></span></a></li>';

wwv_flow_api.create_list_template (
  p_id=>5867289022672547 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Breadcrumb menu',
  p_theme_id  => 102,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<ul class="breadcrumb-menu">',
  p_list_template_after_rows=>'<span class="breadcrumb-separator ui-state-default ui-corner-right no-border-l"></span>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<br style="clear:both;">',
  p_between_items=>'<span class="breadcrumb-separator ui-state-default no-border-rl">'||unistr('\000a')||
'<img alt="" src="/i/apex/apex_top_sep.gif">'||unistr('\000a')||
'</span>',
  p_before_sub_list=>'<ul class="submenu ui-corner-bottom ui-corner-tr">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_f_list_template_noncurrent=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_f_list_template_current=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_f_item_template_curr_w_child=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_fi_template_noncurr_w_child=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li></b>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 5899400697839847
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="#LIST_STATUS# ui-state-active">#TEXT#</li>';

t2:=t2||'<li class="#LIST_STATUS# ui-state-default">#TEXT#</li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5899390697839847 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 102,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="wizard-progress-list" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><ul>',
  p_list_template_after_rows=>'</ul></div>',
  p_between_items=>'<li class="progress-indicator">&nbsp;</li>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list_horizontal_train
prompt  ......list template 5899602581839847
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t2:=t2||'    <li class="#LIST_STATUS#">'||unistr('\000a')||
'      <span>#TEXT#</span>'||unistr('\000a')||
'    </li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5899592581839847 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List, Horizontal Train',
  p_theme_id  => 102,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="sHorizontalProgressList">'||unistr('\000a')||
'  <ul>',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div>',
  p_between_items=>'test text',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/breadcrumb_corrected
prompt  ......list template 5912881490308224
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="ui-state-default no-border-rl"><a href="#LINK#"> #TEXT#</a>';

t2:=t2||'<li class="ui-state-default no-border-rl"><a href="#LINK#" >#TEXT#</a>';

t3:=t3||'<li class="ui-state-active" ><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li class="ui-state-default"><a href="#LINK#" >#TEXT#</a></li>';

t5:=t5||'<li class="ui-state-default no-border-rl"><a href="#LINK#"> #TEXT#</a>';

t6:=t6||'<li class="ui-state-default no-border-rl"><a href="#LINK#" >#TEXT#</a>';

t7:=t7||'<li class="ui-state-active breadcrumb-sub-parent" ><a href="#LINK#"><span>#TEXT#</span><span class="breadcrumb-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-s"></span></a></li>';

t8:=t8||'<li class="ui-state-default breadcrumb-sub-parent"><a href="#LINK#" ><span>#TEXT#</span><span class="breadcrumb-sub-icon ui-button-icon-primary ui-icon ui-icon-circle-triangle-s"></span></a></li>';

wwv_flow_api.create_list_template (
  p_id=>5912871490308224 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Breadcrumb corrected',
  p_theme_id  => 102,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<ul class="breadcrumb-menu">',
  p_list_template_after_rows=>'</li><span class="breadcrumb-separator ui-state-default ui-corner-right no-border-l"></span>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<br style="clear:both;">',
  p_between_items=>'</li><span class="breadcrumb-separator ui-state-default no-border-rl">'||unistr('\000a')||
'<img alt="" src="/i/apex/apex_top_sep.gif">'||unistr('\000a')||
'</span>',
  p_before_sub_list=>'<ul class="submenu ui-corner-bottom ui-corner-tr">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_f_list_template_noncurrent=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_f_list_template_current=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_f_item_template_curr_w_child=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_fi_template_noncurr_w_child=>'<li class="ui-state-default ui-corner-left no-border-r"><a href="#LINK#" >#TEXT#</a></li>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list_vertical
prompt  ......list template 5942196119238278
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>';

t2:=t2||'<li class="#LIST_STATUS#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /><span>#TEXT#</span></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>5942186119238278 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List - Vertical',
  p_theme_id  => 102,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<div class="uVerticalProgressList" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><ul>',
  p_list_template_after_rows=>'</ul></div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/basic
prompt  ......list template 5947886013680406
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li  class="#LIST_STATUS#"><div class="ui-state-active ui-corner-all">#TEXT#</div></li>';

t2:=t2||'<li class="#LIST_STATUS#"><div  class="ui-state-default ui-corner-all"> #TEXT#</div></li>';

t3:=t3||'<li ><div class="ui-sate-active ui-corner-all"> #TEXT#</div></il>';

t4:=t4||'<li ><div class="ui-state-default ui-corner-all"> #TEXT#</div></li>';

t5:=t5||'<li  class="#LIST_STATUS#"><div  class="ui-state-active ui-corner-all"> #TEXT#</div></li>';

t6:=t6||'<li class="#LIST_STATUS#"><div  class="ui-state-default ui-corner-all"> #TEXT#</div></li>';

t7:=t7||'<li ><div class="ui-state-active ui-corner-all"> #TEXT#</div></il>';

t8:=t8||'<li ><div class="ui-state-default ui-corner-all"> #TEXT#</div></li>';

wwv_flow_api.create_list_template (
  p_id=>5947876013680406 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Basic',
  p_theme_id  => 102,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<ul class="basic">',
  p_list_template_after_rows=>' </ul>'||unistr('\000a')||
'<br style="clear:both;">'||unistr('\000a')||
'<br style="clear:both;">',
  p_before_sub_list=>'<ul >',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu
prompt  ......list template 39511401865642260
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem ui-state-active ui-corner-all"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem ui-state-default ui-corner-all"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlSubMenuN ui-state-active ui-corner-all"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""/><span class="dhtmlSubMenuNa">#TEXT#</span></li>';

t4:=t4||'<li class=" ui-state-default ui-corner-all"><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem ui-state-active ui-corner-all"><a href="#LINK#">#TEXT#</a><button class="ui-button ui-widget ui-button-icon-only ui-state-active border-none" role="button" aria-disabled="false" title="Expand #TEXT#" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" type="BUTTON">'||unistr('\000a')||
'<span class="ui-button-icon-primary ui-icon ui-icon-circle-triangle-s" ></span>'||unistr('\000a')||
'</button>'||unistr('\000a')||
'</l';

t5:=t5||'i>';

t6:=t6||'<li class="dhtmlMenuItem ui-state-default ui-corner-all"><a href="#LINK#">#TEXT#</a>'||unistr('\000a')||
'<button class="ui-button ui-widget ui-button-icon-only ui-state-default border-none" role="button" aria-disabled="false" title="Expand #TEXT#" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" type="BUTTON">'||unistr('\000a')||
'<span class="ui-button-icon-primary ui-icon ui-icon-circle-triangle-s" ></span>'||unistr('\000a')||
'</button>'||unistr('\000a')||
'';

t6:=t6||'</li>';

t7:=t7||'<li class="dhtmlSubMenuS ui-state-active ui-corner-all"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><span class="t13MIMG ui-button-icon-primary ui-icon ui-icon-circle-triangle-e" style="top:0px;"></span></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS ui-state-default ui-corner-all"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><span class="t13MIMG ui-button-icon-primary ui-icon ui-icon-circle-triangle-e" style="top:0px;"></span></a></li>';

wwv_flow_api.create_list_template (
  p_id=>39511391865642260 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu',
  p_theme_id  => 102,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2 ui-state-default ui-corner-all" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/standard_report
prompt  ......report template 39457489598623000
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER#" class="border-default cell-padding"> #COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 39457479598623000 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="standardReport" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="ui-widget-content ui-corner-all standardReport">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="border-default cell-padding ui-widget-header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"><span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-e"></span>'||unistr('\000a')||
'<span class="ui-button-text">#PAGINATION_NEXT#</span></a>',
  p_previous_page_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"><span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-w"></span>'||unistr('\000a')||
'<span class="ui-button-text">#PAGINATION_PREVIOUS#</span></a>',
  p_next_set_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 102,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 39457479598623000 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="ui-state-default">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/optional_with_help
prompt  ......label template 39485805441634504
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 39485795441634504 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999" class="label help"><a class="label" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999"><span>',
  p_template_body2=>'</span></a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="ui-state-error ui-corner-all validatie">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 102,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 3047578170313538
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 3047568170313538 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list.gif',
  p_popup_icon_attr=>'width=13 height=13',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css>',
  p_page_body_attr=>'bgcolor=white OnLoad=first_field()',
  p_before_field_text=>' ',
  p_page_heading_text=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css><style>a:link { color:#336699; text-decoration:none; padding:2px;} a:visited { color:#336699; text-decoration:none;} a:hover { color:red; text-decoration:underline;} body { font-family:arial; background-color:#ffffff;} </style>',
  p_page_footer_text =>'</center></td></tr></table>',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div><br />',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'Row(s) #FIRST_ROW# - #LAST_ROW',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'',
  p_translate_this_template => 'N',
  p_after_result_set   =>'');
end;
null;
 
end;
/

prompt  ...calendar templates
--
prompt  ...application themes
--
--application/shared_components/user_interface/themes/jquery_ui
prompt  ......theme 39338890098576670
begin
wwv_flow_api.create_theme (
  p_id =>39338880098576670 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 102,
  p_theme_name=>'JQuery UI',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>39658505916395976 + wwv_flow_api.g_id_offset,
  p_error_template=>39657778279395944 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>39659881407395976 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'',
  p_sidebar_display_point=>'',
  p_login_template=>null + wwv_flow_api.g_id_offset,
  p_default_button_template=>39394378701593520 + wwv_flow_api.g_id_offset,
  p_default_region_template=>39422984254603256 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>null + wwv_flow_api.g_id_offset,
  p_default_form_template  =>39819293320431140 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>39422984254603256 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>39422984254603256 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>null + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>null + wwv_flow_api.g_id_offset,
  p_default_irr_template=>39422984254603256 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>39457479598623000 + wwv_flow_api.g_id_offset,
  p_default_label_template=>39485795441634504 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>null + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>null + wwv_flow_api.g_id_offset,
  p_default_list_template=>39511391865642260 + wwv_flow_api.g_id_offset,
  p_default_option_label=>null + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_theme_description=>'Using the jQuery UI theme classes.',
  p_default_required_label=>null + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 2000
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/no_authentication
prompt  ......authentication 25653485606962650
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 25653475606962650 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'No authentication'
 ,p_scheme_type => 'NATIVE_DAD'
 ,p_use_secure_cookie_yn => 'N'
  );
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
  p_id => 8652305017628821 + wwv_flow_api.g_id_offset
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
null;
 
end;
/

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
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 22869881778761344 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_deinstall_script_clob => s,
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_install_script(
  p_id => 22889563392766240 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 22869881778761344 + wwv_flow_api.g_id_offset,
  p_name => 'CG_REF_CODES',
  p_sequence=> 10,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||''||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 22913173300776880 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 22869881778761344 + wwv_flow_api.g_id_offset,
  p_name => 'POSTCODES',
  p_sequence=> 20,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--------------------------------------------------------'||unistr('\000a')||
'--  File created - woensdag-mei-09-2012   '||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table APP_LIST_VALUES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE TABLE "APP_LIST_VALUES" '||unistr('\000a')||
'   (    "ID" NUMBER(8,0), '||unistr('\000a')||
'    "LIS_ID" VARCHAR2(8), '||unistr('\000a')||
'    "V';

s:=s||'ALUE" VARCHAR2(40), '||unistr('\000a')||
'    "CODE" VARCHAR2(8), '||unistr('\000a')||
'    "VERVALLEN" VARCHAR2(1), '||unistr('\000a')||
'    "SYSTEEM_WAARDE" VARCHAR2(1)'||unistr('\000a')||
' ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING'||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPDAT" ;'||unistr('\000a')||
' '||unistr('\000a')||
''||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."ID" IS ''Identifi';

s:=s||'catienummer van waarde in de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."LIS_ID" IS ''Identificatiecode (afkorting) van de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."VALUE" IS ''Lijstwaarde'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."CODE" IS ''Eventuele gebruikte code (afkorting) voor de lijstwaarde'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LIST_VALUES"."SYSTEEM_WAARDE" IS ''Systeem waarde'';'||unistr('\000a')||
' '||unistr('\000a')||
'   CO';

s:=s||'MMENT ON TABLE "APP_LIST_VALUES"  IS ''Bevat de waarden van de standaardlijsten'';'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table APP_LISTS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE TABLE "APP_LISTS" '||unistr('\000a')||
'   (    "ID" VARCHAR2(8 ), '||unistr('\000a')||
'    "DESCRIPTION" VARCHAR2(40 ), '||unistr('\000a')||
'    "APP" VARCHAR2(3 )'||unistr('\000a')||
' ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOG';

s:=s||'GING'||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPDAT" ;'||unistr('\000a')||
' '||unistr('\000a')||
''||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LISTS"."ID" IS ''Identificatiecode (afkorting) van de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LISTS"."DESCRIPTION" IS ''Omschrijving van de lijst'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON COLUMN "APP_LISTS"."APP" IS ''Afkorting van d';

s:=s||'e applicatie'';'||unistr('\000a')||
' '||unistr('\000a')||
'   COMMENT ON TABLE "APP_LISTS"  IS ''Bevat de typen standaardlijsten'';'||unistr('\000a')||
'REM INSERTING into APP_OWNER.APP_LIST_VALUES'||unistr('\000a')||
'SET DEFINE OFF;'||unistr('\000a')||
'REM INSERTING into APP_OWNER.APP_LISTS'||unistr('\000a')||
'SET DEFINE OFF;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Index LIV_PK'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE UNIQUE INDEX "LIV_PK" ON "APP_LIST_VALUES" ("ID';

s:=s||'") '||unistr('\000a')||
'  PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX" ;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Index LIV_UK1'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE UNIQUE INDEX "LIV_UK1" ON ';

s:=s||'"APP_LIST_VALUES" ("LIS_ID", "VALUE") '||unistr('\000a')||
'  PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX" ;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Index LIS_PK'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
' ';

s:=s||' CREATE UNIQUE INDEX "LIS_PK" ON "APP_LISTS" ("ID") '||unistr('\000a')||
'  PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX" ;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  Constraints for Table APP_LIST_VALUES'||unistr('\000a')||
'----------------------------';

s:=s||'----------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "AVCON_57019_SYSTE_000" CHECK (SYSTEEM_WAARDE IN (''J'', ''N'')) ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "LIV_PK" PRIMARY KEY ("ID")'||unistr('\000a')||
'  USING INDEX PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST';

s:=s||' GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX"  ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "LIV_UK1" UNIQUE ("LIS_ID", "VALUE")'||unistr('\000a')||
'  USING INDEX PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX"  ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TAB';

s:=s||'LE "APP_LIST_VALUES" MODIFY ("ID" NOT NULL ENABLE);'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" MODIFY ("LIS_ID" NOT NULL ENABLE);'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" MODIFY ("VALUE" NOT NULL ENABLE);'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  Constraints for Table APP_LISTS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  ALTER TABLE "APP_LISTS" ADD CONSTRAINT "LIS_PK" PRIMARY KE';

s:=s||'Y ("ID")'||unistr('\000a')||
'  USING INDEX PCTFREE 0 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS '||unistr('\000a')||
'  STORAGE(INITIAL 163840 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645'||unistr('\000a')||
'  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)'||unistr('\000a')||
'  TABLESPACE "APPIDX"  ENABLE;'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LISTS" MODIFY ("ID" NOT NULL ENABLE);'||unistr('\000a')||
' '||unistr('\000a')||
'  ALTER TABLE "APP_LISTS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);'||unistr('\000a')||
'-------------------------';

s:=s||'-------------------------------'||unistr('\000a')||
'--  Ref Constraints for Table APP_LIST_VALUES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  ALTER TABLE "APP_LIST_VALUES" ADD CONSTRAINT "LIV_FK1" FOREIGN KEY ("LIS_ID")'||unistr('\000a')||
'      REFERENCES "APP_LISTS" ("ID") ENABLE;'||unistr('\000a')||
''||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_BRUD'||unistr('\000a')||
'-----------------------------------------------------';

s:=s||'---'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_BRUD" BEFORE'||unistr('\000a')||
'  DELETE OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES FOR EACH ROW BEGIN IF :old.lis_id = ''MIDDEL'' THEN IF DELETING THEN app$standaard.message(''E'',1032,NULL,NULL,''ZC'');'||unistr('\000a')||
'elsif UPDATING THEN'||unistr('\000a')||
'  IF :old.value <> :new.value THEN'||unistr('\000a')||
'    app$standaard.message(''E'',1032,NULL,NULL,''ZC'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END';

s:=s||';'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_BRUD" ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_ARIU'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_ARIU" AFTER'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES FOR EACH ROW BEGIN'||unistr('\000a')||
'    /* alleen als code is gewijzigd */'||unistr('\000a')||
'    IF ( :new.code IS NOT NULL'||unistr('\000a')||
'  AND :old.code    IS NULL)'||unistr('\000a')||
'  OR ( :new.code ';

s:=s||'  <> :old.code ) THEN app$muttable.add(:new.rowid);'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_ARIU" ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_BS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_BS" BEFORE'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES BEGIN app$muttab';

s:=s||'le.init;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_BS" ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Trigger LIV_AS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'  CREATE OR REPLACE TRIGGER "LIV_AS" AFTER'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON APP_LIST_VALUES BEGIN DECLARE l_index binary_integer;'||unistr('\000a')||
'  l_rowid rowid;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR l_i';

s:=s||'ndex IN app$muttable.start_index..app$muttable.last_index'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_rowid := app$muttable.getR(l_index);'||unistr('\000a')||
'    /* Doe de controle voor 1 code per lijst */'||unistr('\000a')||
'    app_chk_liv_code(l_rowid);'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  app$muttable.done;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  app$muttable.reset;'||unistr('\000a')||
'  raise;'||unistr('\000a')||
'END;'||unistr('\000a')||
'END LIV_AS;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER "LIV_AS" ENABLE;'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 22936764027781172 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 22869881778761344 + wwv_flow_api.g_id_offset,
  p_name => 'LOV',
  p_sequence=> 30,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
