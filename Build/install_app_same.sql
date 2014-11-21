DEFINE workspace_name = '&1'
DEFINE offset = &2
DEFINE database_url = '&3'
DEFINE app_schema = '&4'
DEFINE code_schema ='&5'
DEFINE code_password = '&6'
DEFINE sys_password = '&7'

@Build\install_app.sql &workspace_name &offset &database_url &app_schema &code_schema &code_password &sys_password

exit;