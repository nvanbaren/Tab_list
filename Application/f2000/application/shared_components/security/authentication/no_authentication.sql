--application/shared_components/security/authentication/no_authentication
prompt  ......authentication 25653535606962650
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 25653495606962650 + wwv_flow_api.g_id_offset
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
