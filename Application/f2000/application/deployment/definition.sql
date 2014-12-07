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
  p_welcome_message => 'This application installer will guide you through the process of creating your database objects and seed data.',
  p_configuration_message => 'You can configure the following attributes of your application.',
  p_build_options_message => 'You can choose to include the following build options.',
  p_validation_message => 'The following validations will be performed to ensure your system is compatible with this application.',
  p_install_message=> 'Please confirm that you would like to install this application''s supporting objects.',
  p_install_success_message => 'Your application''s supporting objects have been installed.',
  p_install_failure_message => 'Installation of database objects and seed data has failed.',
  p_upgrade_message => 'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.',
  p_upgrade_confirm_message => 'Please confirm that you would like to install this application''s supporting objects.',
  p_upgrade_success_message => 'Your application''s supporting objects have been installed.',
  p_upgrade_failure_message => 'Installation of database objects and seed data has failed.',
  p_deinstall_success_message => 'Deinstallation complete.',
  p_deinstall_script_clob => s,
  p_prompt_sub_string_01 => 'Y',
  p_install_prompt_01    => 'Location of application javascript files',
  p_prompt_sub_string_02 => 'Y',
  p_install_prompt_02    => 'Location of application CSS files',
  p_prompt_sub_string_04 => 'Y',
  p_install_prompt_04    => 'Location of application image files',
  p_prompt_sub_string_05 => 'Y',
  p_install_prompt_05    => 'Location of demo javascript files',
  p_prompt_sub_string_06 => 'Y',
  p_install_prompt_06    => 'Location of demo CSS files',
  p_prompt_sub_string_07 => 'Y',
  p_install_prompt_07    => 'Location of demo image files',
  p_prompt_sub_string_10 => 'Y',
  p_install_prompt_10    => 'Either http ot https',
  p_required_free_kb => 100,
  p_required_sys_privs => 'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW',
  p_deinstall_message=> '');
end;
 
 
end;
/

