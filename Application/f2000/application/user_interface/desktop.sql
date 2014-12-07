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
 ,p_home_url => 'f?p=&APP_ID.:TABLIST:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
