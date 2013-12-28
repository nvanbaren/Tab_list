CREATE OR REPLACE package apex$checks as
/*******************************************************************************
Copyright (c) 2013, A.N. van Baren

Permission to use, copy, modify, and/or distribute this software for any purpose
with or without fee is hereby granted, provided that the above copyright notice
and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH 
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM 
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR 
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR 
PERFORMANCE OF THIS SOFTWARE.

History 19-MRT-2013 N. van Baren c_version added
*******************************************************************************/
  c_version constant number := 20130319;
  
  function auth_condition_check_int
  ( p_condition_type        in apex_application_page_regions.condition_type%type
  , p_condition_expression1 in apex_application_page_regions.condition_expression1%type
  , p_condition_expression2 in apex_application_page_regions.condition_expression2%type
  , p_authorization_scheme  in apex_application_page_regions.authorization_scheme%type
  , p_build_option          in apex_application_page_regions.build_option%type
  ) return number;
  
  function auth_condition_check
  ( p_condition_type        in apex_application_page_regions.condition_type%type
  , p_condition_expression1 in apex_application_page_regions.condition_expression1%type
  , p_condition_expression2 in apex_application_page_regions.condition_expression2%type
  , p_authorization_scheme  in apex_application_page_regions.authorization_scheme%type
  , p_build_option          in apex_application_page_regions.build_option%type
  ) return boolean;
  
  function check_plsql_expression(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean;
  function check_exists(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean;
  function check_sql_expression(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean;
  function check_plsql_function(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean;
end apex$checks;
/


CREATE OR REPLACE package body apex$checks as
  g_true                    constant pls_integer  := 1;
  g_false                   constant pls_integer  := 0;
  
  function check_exists(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean
  is
    /*
    **Interface
    **  p_condition_expression1 sql statement
    **
    **Returns
    **  True if 1 or more rows are returned.
    **
    **History
    **  13-APR-2012 A.N. van Baren Created
    */
    l_column_value_list   apex_plugin_util.t_column_value_list;
    l_return              boolean;
  begin
    l_column_value_list := apex_plugin_util.get_data(p_condition_expression1,1,100,'NONE');
    if l_column_value_list(1).count > 0
    then
      l_return := true;
    else
      l_return := false;
    end if;
    return l_return;
  end;
  
  function check_sql_expression(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean
  is
    /*
    **Interface
    **  p_condition_expression1 sql expression to be checked
    **
    **Returns
    **  Result of the check
    **
    **History
    **  13-APR-2012 A.N. van Baren Created
    */
    l_column_value_list   apex_plugin_util.t_column_value_list;
    l_sql_statement varchar2(32767);
    l_return        boolean;
  begin
    l_sql_statement := 'select 1 from dual where '||p_condition_expression1;
    l_column_value_list := apex_plugin_util.get_data(l_sql_statement,1,100,'NONE');
    if l_column_value_list(1).count = 1
    then
      l_return := true;
    else
      l_return := false;
    end if;
    return l_return;
  end;
  
  function check_plsql_expression(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean
  is
    /*
    **Interface
    **  p_condition_expression1 pl/sql expression to be checked
    **
    **Returns
    **  Result of the check
    **
    **History
    **  13-APR-2012 A.N. van Baren Created
    */
    l_result pls_integer;
    l_statement varchar2(32767);
  begin
    l_statement := 'Declare l_check boolean; l_return pls_integer; '
                || 'Begin l_check:=('||p_condition_expression1||');'
                || '  return sys.diutil.bool_to_int(l_check);'
                || 'end;';
    l_result := apex_plugin_util.get_plsql_function_result(l_statement);
    if l_result = g_true
    then
      return true;
    else  
      return false;
    end if;  
  end;
  
  function check_plsql_function(p_condition_expression1 in apex_application_page_regions.condition_expression1%type)
  return boolean
  is
    /*
    **Interface
    **  p_condition_expression1 pl/sql function returng a boolean
    **
    **Returns
    **  Result of the function
    **
    **History
    **  13-APR-2012 A.N. van Baren Created
    */
    l_statement varchar2(32767);
    l_function  varchar2(4000);
    l_result    pls_integer;
  begin
    l_function := trim(p_condition_expression1);
    if lower(substr(l_function,1,7)) = 'declare'
    then
      l_function := substr(l_function,8);
    end if;
    
    l_statement := ' declare '
                || '   l_test boolean; '
                || '   function test '
                || '   return boolean is '
                || l_function
                || ' begin '
                || '   l_test := test; '
                || '   return sys.diutil.bool_to_int(l_test); '
                || ' end;  '
                ;
    l_result := apex_plugin_util.get_plsql_function_result(l_statement);
    if l_result = g_true
    then
      return true;
    else  
      return false;
    end if;             
  end;
  
  function build_option_enabled(p_build_option in apex_application_page_regions.build_option%type)
  return boolean
  is
    /*
    **Interface
    **  p_build_option  Name of the build option to be checked
    **
    **Returns
    **  true if the build option is enabled or 
    **  the biuld option is disabled but the name is negative ia {not build option} 
    **
    **History
    **  13-APR-2012 A.N. van Baren Created
    */
    cursor c_buo(b_build_option in varchar2
                ,b_application  in number
                )
    is
      select buo.build_option_status
      from   apex_application_build_options buo
      where  buo.build_option_name = b_build_option
      and    buo.application_id = b_application
    ;
    c_included             constant varchar2(8) := 'Included';
    c_excluded             constant varchar2(8) := 'Excluded';
    l_return                        boolean;
    col_buo_build_option_name       apex_application_build_options.build_option_name%type;
    col_buo_build_option_status     apex_application_build_options.build_option_status%type;
  begin
    /*
    By apex executed sql statement for a static LOV
    (required_patch is null 
       or (required_patch > 0 
           and 
           (wwv_flow_item.fetch_g_build_options_excluded is null 
            or instr(wwv_flow_item.fetch_g_build_options_excluded
               ,':'||required_patch||':')
               = 0) 
           ) 
       or (required_patch < 0 
           and 
           (wwv_flow_item.fetch_g_build_options_included is null 
            or instr(wwv_flow_item.fetch_g_build_options_included
                   ,':'||(0-required_patch)||':') = 0
           ) 
          ) 
    ) */
    col_buo_build_option_name := replace(replace(p_build_option,'{Not '),'}');
    if col_buo_build_option_name is not null
    then
      /*Get the build option*/
      open  c_buo(col_buo_build_option_name,wwv_flow.g_flow_id);
      fetch c_buo
      into  col_buo_build_option_status;
      if c_buo%found
      then
        close c_buo;
        l_return := (col_buo_build_option_status = c_included);
      else
        close c_buo;
      end if;
      /*Check if name or the negative is passed in*/
      if  col_buo_build_option_name = p_build_option
      then
        return l_return; 
      else
        return not l_return;
      end if;
    else
      return true;
    end if;  
  end;
  
  function condition_check ( 
     p_condition_type        in apex_application_page_regions.condition_type%type
    ,p_condition_expression1 in apex_application_page_regions.condition_expression1%type
    ,p_condition_expression2 in apex_application_page_regions.condition_expression2%type
    )
  return boolean
  is
    /*
    **Interface
    **  p_condition_type        Checktype
    **  p_condition_expression1 First expression
    **  p_condition_expression2 Second expression
    **
    **Return
    **  result of the check
    **
    **Usages
    **  check_exists
    **  check_sql_expression
    **  check_plsql_expression
    **  check_plsql_function
    **  wwv_flow_error.have_errors_occurred
    **  wwv_flow.g_flow_step_id
    **  wwv_flow.g_user
    **  wwv_flow.g_public_user
    **  wwv_flow.g_request
    **  wwv_flow.g_printer_friendly
    **  wwv_flow.g_browser_language
    **
    **History
    **  13-APR-2012 A.N. van Baren Created
    */ 
    cursor c_stc(b_return_value in varchar2)
    is
      select stc.d
      from   apex_standard_conditions stc
      where  stc.r = b_return_value
    ;  
    l_return          boolean;
    l_condition_type  apex_standard_conditions.d%type;
    l_expression1     varchar2(32767);
    l_expression2     varchar2(32767);
  begin
    open  c_stc(p_condition_type);
    fetch c_stc
    into  l_condition_type;
    close c_stc;
    l_expression1 := apex_application.do_substitutions(p_condition_expression1);
    l_expression2 := apex_application.do_substitutions(p_condition_expression2);
    case nvl(l_condition_type,'ALWAYS')
      when 'ALWAYS'
      then
        l_return := true;  
      when 'NEVER'
      then
        l_return := false;
      when 'REQUEST_EQUALS_CONDITION'
      then
        l_return := (wwv_flow.g_request = p_condition_expression1);
      when 'REQUEST_NOT_EQUAL_CONDITION'
      then
        l_return := not (wwv_flow.g_request = p_condition_expression1);
      when 'REQUEST_IN_CONDITION'
      then
        l_return := (instr(','||p_condition_expression1||',',','||wwv_flow.g_request||',')>0);
      when 'REQUEST_NOT_IN_CONDITION'
      then
        l_return := not (instr(','||p_condition_expression1||',',','||wwv_flow.g_request||',')>0);
      when 'VAL_OF_ITEM_IN_COND_EQ_COND2'
      then
        l_return := (v(p_condition_expression1)= p_condition_expression2);
      when 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
      then
        l_return := not (v(p_condition_expression1)= p_condition_expression2);
      when 'ITEM_IS_NULL'
      then
        l_return := (v(p_condition_expression1) is null);
      when 'ITEM_IS_NOT_NULL'
      then
        l_return := (v(p_condition_expression1) is null); 
      when 'ITEM_IS_NULL_OR_ZERO'
      then
        l_return := (v(p_condition_expression1) is null
                     or
                     v(p_condition_expression1) = 0
                    );  
      when 'ITEM_NOT_NULL_OR_ZERO'
      then
        l_return := not (v(p_condition_expression1) is null
                         or
                         v(p_condition_expression1) = 0
                        ); 
      when 'ITEM_IS_NOT_ZERO'
      then
        l_return := not (v(p_condition_expression1) = 0 );
       when 'ITEM_IS_ZERO'
      then
        l_return := (v(p_condition_expression1) = 0 );
      when 'ITEM_CONTAINS_NO_SPACES'
      then
        l_return := (instr(v(p_condition_expression1),' ')=-1);
      when 'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
      then
        l_return := (instr(','||v(p_condition_expression2)||',',','||v(p_condition_expression1)||',')>1);
       when 'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST'
      then
        l_return := not (instr(','||v(p_condition_expression2)||',',','||v(p_condition_expression1)||',')>1);  
      when 'DISPLAYING_INLINE_VALIDATION_ERRORS' 
      then
        l_return := wwv_flow_error.have_errors_occurred;
      when 'NOT_DISPLAYING_INLINE_VALIDATION_ERRORS'
      then
        l_return := not wwv_flow_error.have_errors_occurred;
      when 'CURRENT_PAGE_EQUALS_CONDITION'
      then 
        l_return := (wwv_flow.g_flow_step_id=p_condition_expression1);
      when 'CURRENT_PAGE_NOT_EQUAL_CONDITION'
      then
        l_return := not (wwv_flow.g_flow_step_id=p_condition_expression1); 
      when 'CURRENT_PAGE_IN_CONDITION'
      then 
        l_return := (instr(','||p_condition_expression1||',',','||wwv_flow.g_flow_step_id||',')>0);
      when 'CURRENT_PAGE_NOT_IN_CONDITION'
      then 
        l_return := not (instr(','||p_condition_expression1||',',','||wwv_flow.g_flow_step_id||',')>0); 
      when 'USER_PREF_IN_COND_EQ_COND2'
      then
        l_return :=(apex_util.get_preference(p_condition_expression1,wwv_flow.g_user) = v(p_condition_expression2));
      when 'USER_PREF_IN_COND_NOT_EQ_COND2'
      then
        l_return := not (apex_util.get_preference(p_condition_expression1,wwv_flow.g_user) = v(p_condition_expression2)); 
      when 'USER_IS_PUBLIC_USER' 
      then
        l_return := (wwv_flow.g_user = wwv_flow.g_public_user);
      when 'USER_IS_NOT_PUBLIC_USER' 
      then
        l_return := not (wwv_flow.g_user = wwv_flow.g_public_user);
      when 'PAGE_IS_IN_PRINTER_FRIENDLY_MODE' 
      then
        l_return := wwv_flow.g_printer_friendly;
      when 'PAGE_IS_NOT_IN_PRINTER_FRIENDLY_MODE'
      then
        l_return := not wwv_flow.g_printer_friendly;
      when 'WHEN_THIS_PAGE_SUBMITTED'
      then
        l_return := (wwv_flow.g_page_submitted =wwv_flow.g_flow_step_id);
      when 'WHEN_THIS_PAGE_NOT_SUBMITTED'
      then
        l_return := not (wwv_flow.g_page_submitted =wwv_flow.g_flow_step_id);
      when 'EXISTS'
      then
        l_return := check_exists(p_condition_expression1);
      when 'NOT_EXISTS'
      then
        l_return := not check_exists(p_condition_expression1);
      when 'SQL_EXPRESSION' 
      then
        l_return := check_sql_expression(p_condition_expression1);
      when 'PLSQL_EXPRESSION' 
      then
        l_return := check_plsql_expression(p_condition_expression1);
      when 'FUNCTION_BODY'
      then
        l_return := check_plsql_function(p_condition_expression1);
      when 'DISPLAY_COND_IN_COND_TEXT'
      then
        l_return := (instr(l_expression2,l_expression1)>0);
      when 'DISPLAY_COND_NOT_IN_COND_TEXT'
      then
        l_return := not (instr(l_expression2,l_expression1)>0);
      when 'DISPLAY_COND_EQUAL_COND_TEXT' 
      then
        l_return := apex_plugin_util.is_equal(l_expression1,l_expression2);
      when 'DISP_COND_NOT_EQUAL_COND_TEXT'
      then
        l_return := not apex_plugin_util.is_equal(l_expression1,l_expression2);
      when 'CONDITION1_IN_VALUE_OF_ITEM_IN_CONDITION2'
      then
        l_return := (instr(v(p_condition_expression2),l_expression1)>0);
      when 'CURRENT_LANG_EQ_COND1'
      then
        l_return := apex_plugin_util.is_equal(wwv_flow.g_browser_language,p_condition_expression1);
      when 'CURRENT_LANG_NOT_EQ_COND1'
      then
        l_return := not apex_plugin_util.is_equal(wwv_flow.g_browser_language,p_condition_expression1);
      when 'CURRENT_LANG_IN_COND1'
      then
        l_return := (instr(p_condition_expression1,wwv_flow.g_browser_language)>0);
      when 'CURRENT_LANG_NOT_IN_COND1'
      then
        l_return := not (instr(p_condition_expression1,wwv_flow.g_browser_language)>0);
      when 'BROWSER_IS_NSCP'
      then
        l_return := apex_plugin_util.is_equal('NSCP',apex_application.get_browser_version);
      when 'BROWSER_IS_MSIE'
      then
        l_return := apex_plugin_util.is_equal('MSIE',apex_application.get_browser_version);
      when 'BROWSER_IS_MSIE_OR_NSCP'
      then 
        l_return := (apex_plugin_util.is_equal('NSCP',apex_application.get_browser_version)
                     or
                     apex_plugin_util.is_equal('MSIE',apex_application.get_browser_version)
                    );
      when 'BROWSER_IS_OTHER'
      then
        l_return := not (apex_plugin_util.is_equal('NSCP',apex_application.get_browser_version)
                         or
                         apex_plugin_util.is_equal('MSIE',apex_application.get_browser_version)
                        );
      when 'DAD_NAME_EQ_CONDITION'
      then
        l_return := apex_plugin_util.is_equal(owa_util.get_cgi_env('DAD_NAME'),p_condition_expression1);
      when 'DAD_NAME_NOT_EQ_CONDITION'
      then
        l_return := not apex_plugin_util.is_equal(owa_util.get_cgi_env('DAD_NAME'),p_condition_expression1);
      when 'SERVER_NAME_EQ_CONDITION'
      then
        l_return := apex_plugin_util.is_equal(owa_util.get_cgi_env('HTTP_HOST'),p_condition_expression1);
      when 'SERVER_NAME_NOT_EQ_CONDITION'
      then
        l_return := not apex_plugin_util.is_equal(owa_util.get_cgi_env('HTTP_HOST'),p_condition_expression1);
      when 'HTTP_HOST_EQ_CONDITION'
      then
        l_return := apex_plugin_util.is_equal(owa_util.get_cgi_env('SERVER_NAME'),p_condition_expression1);
      when 'HTTP_HOST_NOT_EQ_CONDITION'
      then
        l_return := not apex_plugin_util.is_equal(owa_util.get_cgi_env('SERVER_NAME'),p_condition_expression1);  
    else
      l_return := true;
      apex_debug_message.log_message('Condition type not implemented yet');
    end case; 
    return l_return;
  end;
  
  function auth_condition_check
  ( p_condition_type        in apex_application_page_regions.condition_type%type
  , p_condition_expression1 in apex_application_page_regions.condition_expression1%type
  , p_condition_expression2 in apex_application_page_regions.condition_expression2%type
  , p_authorization_scheme  in apex_application_page_regions.authorization_scheme%type
  , p_build_option          in apex_application_page_regions.build_option%type
  ) return boolean
  as
  /* 
  **Interface
  **  p_condition_type
  **  p_condition_expression1
  **  p_condition_expression2
  **  p_authorization_scheme
  **  p_build_option
  **
  **Returns
  **  True if the build option is enabeld, 
  **  the authorization scheme is passed by the user
  **  and the condition is passed
  **
  **Usages
  **  build_option_enabled
  **  condition_check
  **  apex_util.public_check_authorization
  **
  **History
  **  13-APR-2012 A.N. van Baren Created
  */
    l_return         boolean;
  begin
    apex_debug_message.log_message('Start auth_condition_check');
    if not build_option_enabled(p_build_option)
    then
      apex_debug_message.log_message('Build option '||p_build_option||' disabled');
      l_return := false;
    elsif not (p_authorization_scheme is null
           or
           apex_util.public_check_authorization( p_security_scheme => p_authorization_scheme)
          )
    then
      apex_debug_message.log_message('authentication is false');
      l_return := false;
    elsif not condition_check(p_condition_type
                             ,p_condition_expression1
                             ,p_condition_expression2
                             )      
    then
      apex_debug_message.log_message('Condition is false');
      l_return := false;
    else
      apex_debug_message.log_message('Ok');
      l_return := true;
    end if;
    return nvl(l_return,true);
  end auth_condition_check;
  
  function auth_condition_check_int
  ( p_condition_type        in apex_application_page_regions.condition_type%type
  , p_condition_expression1 in apex_application_page_regions.condition_expression1%type
  , p_condition_expression2 in apex_application_page_regions.condition_expression2%type
  , p_authorization_scheme  in apex_application_page_regions.authorization_scheme%type
  , p_build_option          in apex_application_page_regions.build_option%type
  ) return number
  as
  /*
  ** Interface
  **
  ** Return 
  **  1 if auth_condition_check returns true
  **  0 if auth_condition_check returns false
  **
  ** Usages
  **   auth_condition_check
  **
  ** Wijzigingen
  **   13-APR-2012 A.N. van Baren Created
 */ 
  begin
    return sys.diutil.bool_to_int(auth_condition_check(
      p_condition_type
     ,p_condition_expression1
     ,p_condition_expression2
     ,p_authorization_scheme
     ,p_build_option
     ));                         
  end;
end apex$checks;
/
