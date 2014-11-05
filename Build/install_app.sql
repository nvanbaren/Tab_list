DEFINE workspace_name = '&1'
DEFINE offset = &2
DEFINE database_url = '&3'
DEFINE app_schema = '&4'
DEFINE code_schema ='&5'
DEFINE code_password = '&6'
DEFINE sys_password = '&7'

timing start "Install application"
declare
    l_workspace_id number;
begin
    select workspace_id into l_workspace_id
    from   apex_workspaces
    where  workspace = '&workspace_name'
    ;
    --
    apex_application_install.set_workspace_id( l_workspace_id );
    apex_application_install.set_offset(&offset);
    apex_application_install.set_schema('&app_schema');
    apex_application_install.set_application_alias( 'T_TAB_LIST' );
    apex_application_install.set_application_id(2000);
end;
/
prompt install application
@Application/f2000/install.sql
commit;
/
prompt install code
prompt connect &code_schema/&code_password@//&database_url
connect &code_schema/&code_password@//&database_url
@Source\sql\apex$checks.sql
@Source\sql\apr$tab_list.sql
@Source\sql\apr$demo_plugin.sql
prompt code installed

connect sys/&sys_password@//&database_url as sysdba

create directory PLUGIN_FILES as 'c:\temp\Tab_list'
/

declare
    file_list               varchar2(30) default 'imagelist.xml';
    upload_directory_name   varchar2(30) default 'PLUGIN_FILES';
    plugin_folder           varchar2(30) default 'Tab_list';
    plugin_location         varchar2(30) default 'projects';
    repository_folder_path  varchar2(30);
    pathseperator varchar2(1) := '/';

    directory_path      varchar2(256);

    target_folder_path  varchar2(256);
    target_file_path    varchar2(256);
    target_file_name    varchar2(256);

    resource_path       varchar2(256);

    filelist_xml        xmltype := xmltype(bfilename(upload_directory_name,file_list),nls_charset_id('AL32UTF8'));
    content_bfile       bfile;

    result              boolean;

    filelist_dom    dbms_xmldom.domdocument;
    files_nl        dbms_xmldom.domnodelist;
    directory_nl    dbms_xmldom.domnodelist;
    filename_nl     dbms_xmldom.domnodelist;
    files_node      dbms_xmldom.domnode;
    directory_node  dbms_xmldom.domnode;
    file_node       dbms_xmldom.domnode;
    text_node       dbms_xmldom.domnode;
    l_mv_folder     varchar2(30);
    v_message       varchar2(32767);
begin
  
  repository_folder_path := '/'||plugin_location||'/'||plugin_folder||'/';

  if dbms_xdb.existsresource('/'||plugin_location||'/'||plugin_folder) 
  then
    dbms_xdb.deleteresource('/'||plugin_location||'/'||plugin_folder,4);
  end if;
  if not dbms_xdb.existsresource('/'||plugin_location)
  then
    result := dbms_xdb.createfolder('/'||plugin_location);
  end if;
  result  := dbms_xdb.createfolder(repository_folder_path);

  -- create the set of folders in the xdb repository

  filelist_dom := dbms_xmldom.newdomdocument(filelist_xml);

  directory_nl := dbms_xmldom.getelementsbytagname(filelist_dom,'directory');

  for i in 0 .. (dbms_xmldom.getlength(directory_nl) - 1) loop
    directory_node := dbms_xmldom.item(directory_nl,i);
    text_node      := dbms_xmldom.getfirstchild(directory_node);
    directory_path := dbms_xmldom.getnodevalue(text_node);
    directory_path := repository_folder_path || directory_path;
    result          := dbms_xdb.createfolder(directory_path);
  end loop;
  -- load the resources into the xml db repository

  files_nl           := dbms_xmldom.getelementsbytagname(filelist_dom,'files');
  files_node         := dbms_xmldom.item(files_nl,0);

  filename_nl := dbms_xmldom.getelementsbytagname(filelist_dom,'file');

  for i in 0 .. (dbms_xmldom.getlength(filename_nl) - 1) loop
    file_node          := dbms_xmldom.item(filename_nl,i);

    text_node          := dbms_xmldom.getfirstchild(file_node);

    target_file_path   := dbms_xmldom.getnodevalue(text_node);
    target_file_name   := substr(target_file_path,instr(target_file_path,pathseperator,-1)+1);
    target_folder_path := substr(target_file_path,1,instr(target_file_path,pathseperator,-1));
    target_folder_path := substr(target_folder_path,1,length(target_folder_path)-1);
    resource_path := repository_folder_path || target_folder_path || '/' || target_file_name;

    begin
    content_bfile := bfilename(upload_directory_name,target_file_path);
    result := dbms_xdb.createresource(resource_path,content_bfile,nls_charset_id('AL32UTF8'));
    dbms_lob.close(content_bfile);
    exception 
    when others 
    then
        v_message := sqlerrm;
        dbms_output.put_line(v_message);
        dbms_output.put_line('file not found: '||target_file_path);
    end;
   
  end loop;
end;
/

Rem Creates a new ACL for "/projects" and give ANONYMOUS read-only access to it,
Rem ACL for the root folder and gives ANONYMOUS read access to it also

declare
  ro_anonymous_acl   varchar2(80) := '/sys/acls/ro_anonymous_acl.xml';

  procedure publish_folder(folder varchar2, acl varchar2) is
  begin
    for r in (select r.any_path path
                from resource_view r
               where under_path(r.res, folder) = 1) loop
      dbms_xdb.setACL(r.path, acl);
    end loop;
  end;

begin

  if wwv_flow_utilities.db_version_is_at_least('11') then --11g only

    if not dbms_xdb.existsResource(ro_anonymous_acl) and
      (not dbms_xdb.createResource(ro_anonymous_acl,
            XMLType('<acl description="Read-only privileges to anonymous"
                          xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
                          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                          xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
                          http://xmlns.oracle.com/xdb/acl.xsd">
                       <ace>
                         <grant>true</grant>
                         <principal>ANONYMOUS</principal>
                         <privilege>
                           <read-properties/>
                           <read-contents/>
                           <resolve/>
                         </privilege>
                       </ace>
                     </acl>'))) then
      raise program_error;
    end if;
    publish_folder('/projects', ro_anonymous_acl);
    dbms_xdb.setACL('/projects', ro_anonymous_acl);

    if (not dbms_xdb.changePrivileges('/',
                 XMLType('<ace xmlns="http://xmlns.oracle.com/xdb/acl.xsd"
                          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                          xsi:schemaLocation="http://xmlns.oracle.com/xdb/acl.xsd
                          http://xmlns.oracle.com/xdb/acl.xsd">
                            <grant>true</grant>
                            <principal>ANONYMOUS</principal>
                            <privilege>
                              <read-properties/>
                              <resolve/>
                            </privilege>
                          </ace>')) > 0) then
      raise program_error;
    end if;

  end if;
end;
/

commit;

timing stop

drop directory PLUGIN_FILES;
commit;
exit;
