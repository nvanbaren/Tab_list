declare
    l_workspace_id number;
begin
    select workspace_id into l_workspace_id
    from   apex_workspaces
    where  workspace = 'NICOLETTE'
    ;
    --
    apex_application_install.set_workspace_id( l_workspace_id );
    apex_application_install.set_offset(10000000000);
    apex_application_install.set_schema('HR' );
    apex_application_install.set_application_alias( 't_TAB_MENU_LIST' );
    apex_application_install.set_application_id(2000);
end;
/

@Application/f2000.sql
commit;
exit
/