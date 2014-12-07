DEFINE workspace_name = '&1'
DEFINE offset = &2
DEFINE database_url = '&3'
DEFINE app_schema = '&4'
DEFINE code_schema ='&5'
DEFINE code_password = '&6'
DEFINE sys_password = '&7'

@Build\install_app.sql &workspace_name &offset &database_url &app_schema &code_schema &code_password &sys_password

prompt install code
connect &code_schema/&code_password@//&database_url

Prompt create public synonyms
CREATE OR REPLACE PUBLIC SYNONYM "APEX$CHECKS" FOR &code_schema.."APEX$CHECKS";
CREATE OR REPLACE PUBLIC SYNONYM "APR$DEMO_PLUGIN" FOR &code_schema.."APR$DEMO_PLUGIN";
CREATE OR REPLACE PUBLIC SYNONYM "APR$TAB_LIST" FOR &code_schema.."APR$TAB_LIST";

Prompt grant execute rights
GRANT execute ON "APEX$CHECKS" TO &app_schema;
GRANT execute ON "APR$DEMO_PLUGIN" TO &app_schema;
GRANT execute ON "APR$TAB_LIST" TO &app_schema;

exit;