declare
  l_workspace_id number;
begin
  select workspace_id into l_workspace_id
  from   apex_workspaces
  where  workspace = 'NICOLETTE'

  apex_application_install.set_workspace_id(l_workspace_id);
  apex_application_install.set_application_id(2000);
end;
/
@Application/f2000/application/init.sql
@Application/f2000/application/set_environment.sql
@Application/f2000/application/delete_application.sql
@Application/f2000/application/end_environment.sql
exit;
/