--------------------------------------------------------
--  DDL for Function APR$TAB_LIST
--------------------------------------------------------

create or replace function APR$TAB_LIST (p_region               in apex_plugin.t_region
                                        ,p_plugin               in apex_plugin.t_plugin
                                        ,p_is_printer_friendly  in boolean)
return apex_plugin.t_region_render_result 
  as
  type r_attributes is record(
    link              apex_application_parent_tabs.tab_target%type
   ,label             apex_application_parent_tabs.tab_label%type
   ,image             apex_application_parent_tabs.when_current_image%type
   ,image_attributes  apex_application_parent_tabs.image_attributes%type
   ,tab_level         number
   ,id                apex_application_parent_tabs.parent_tab_id%type
   ,name              apex_application_parent_tabs.tab_name%type
   ,parent_id         apex_application_parent_tabs.parent_tab_id%type
   ,parent_name       apex_application_parent_tabs.tab_name%type
   ,parent_label      apex_application_parent_tabs.tab_label%type
   ,status            varchar2(30)
  );
  
  cursor c_pag(b_app_id  in number
              ,b_page_id in number
              )
  is
    select pag.tab_set
    from   apex_application_pages     pag
    where  pag.page_id = b_page_id
    and    pag.application_id = b_app_id
  ;
  
  cursor c_temp(b_template_name  in varchar2
               ,b_theme_number   in number
               ,b_application_id in number
               )
  is
    select lis.before_sub_list                before_sub_list
    ,      lis.after_sub_list                 after_sub_list
    ,      lis.between_sub_list_items         between_sub_list
    ,      lis.sub_list_item_current          current_sub_list
    ,      lis.sub_list_item_noncurrent       non_current_sub_list
    ,      lis.list_template_before_rows      before_rows
    ,      lis.list_template_after_rows       after_rows
    ,      lis.list_template_current          current_item
    ,      lis.list_template_noncurrent       non_current_item
    ,      lis.item_template_curr_w_child     current_item_with
    ,      lis.item_template_noncurr_w_child  non_current_item_with
    ,      lis.between_items                  between_item
    ,      coalesce(to_clob(lis.first_list_template_current)
                   ,to_clob(lis.first_list_template_noncurrent)
                   ,lis.list_template_current
                   ,lis.list_template_noncurrent)    first_current_item
    ,      nvl(to_clob(lis.first_list_template_noncurrent)
              ,lis.list_template_noncurrent)first_non_current_item
    ,      coalesce(to_clob(lis.f_item_template_curr_w_child)
                   ,to_clob(lis.fitem_template_noncurr_w_child)
                   ,lis.item_template_curr_w_child
                   ,lis.item_template_noncurr_w_child) first_current_with
    ,      nvl(to_clob(lis.fitem_template_noncurr_w_child)
              ,lis.item_template_noncurr_w_child)      first_non_current_with      
    from   apex_application_temp_list lis
    where  lis.application_id = b_application_id
    and    lis.theme_number   = b_theme_number
    and    lis.template_name  = b_template_name
  ;
  
  cursor c_pat(b_app_id in number
              ,b_tabset in varchar2
              )
  is
    select pat.tab_set
    ,      pat.current_for_tabset
    ,      pat.tab_name
    ,      pat.tab_label
    ,      pat.tab_target
    ,      pat.when_current_image
    ,      pat.when_non_current_image
    ,      pat.image_attributes
    ,      pat.parent_tab_id
    ,      pat.condition_type
    ,      pat.condition_expression1
    ,      pat.condition_expression2
    ,      pat.authorization_scheme
    ,      pat.build_option
    from   apex_application_parent_tabs pat
    where	 pat.application_id = b_app_id
    and   (pat.tab_set = b_tabset
           or
           b_tabset is null
           )      
    order by pat.display_sequence
  ;
  
  cursor c_tab(b_app_id in number
              ,b_tab_set in varchar2
              )
  is
    select tab.tab_set
    ,      tab.tab_name
    ,      tab.tab_label
    ,      tab.parent_tabset
    ,      tab.tab_also_current_for_pages
    ,      tab.tab_page
    ,      tab.when_current_tab_image
    ,      tab.when_not_current_tab_image
    ,      tab.tab_image_attributes
    ,      tab.tab_id
    ,      tab.condition_type
    ,      tab.condition_expression1
    ,      tab.condition_expression2
    ,      tab.authorization_scheme
    ,      tab.build_option
    from	 apex_application_tabs tab
    where	 tab.application_id = b_app_id
    and    tab.tab_set        = b_tab_set
    order by tab.display_sequence
  ;
  
  type l_table_pat is table of c_pat%rowtype
  index by pls_integer;
  l_pat_table  l_table_pat;
  
  type l_table_tab is table of c_tab%rowtype
  index by pls_integer;
  l_tab_table  l_table_tab;
  
  c_tabset           apex_application_parent_tabs.tab_set%type := 'main';
  l_return           apex_plugin.t_region_render_result;
  l_current_tab_set	 apex_application_pages.tab_set%type;
  l_theme_number     number := wwv_flow.g_flow_theme_id;
  l_template_name    p_region.attribute_01%type := p_region.attribute_01;
  l_include_single   p_region.attribute_02%type := p_region.attribute_02;
  l_parent_link      p_region.attribute_03%type := p_region.attribute_03;
 
  l_use_conditions   boolean := (p_region.attribute_04 = 'Y');
  
  r_temp             c_temp%rowtype;
  r_pat_attributes   r_attributes;
  r_tab_attributes   r_attributes;
  
  l_html_parent		   varchar2(32767);
  l_html_tab			   varchar2(32767);
  l_last_part        varchar2(32767);
  l_first_part       varchar2(32767);
  l_function         varchar2(32767);
  l_result           varchar2(1);
  
  l_is_current       boolean;
  l_number_tabs      number;
  i                  number;
  k                  number;
  h                  number;
  
  function get_url(p_current_parent boolean
                  ,p_tab_name       varchar2
                  ,p_tab_page       number
                  )
  return varchar2
  is
    l_debug_string  varchar2(3);
    l_url           varchar2(150);
  begin
    if p_current_parent
    then
      /*Standard tab belongs to current parent tab*/
      l_url := 'javascript:doSubmit('''||p_tab_name||''');';
    else
      /*Standard tab does not belong to current parent tab
      **standard submit doesn't work so a url is used
      */
      if wwv_flow.g_debug
      then
        l_debug_string := 'YES';
      else
        l_debug_string := 'NO';
      end if; 
      l_url := 'f?p='||wwv_flow.g_flow_alias||':'||p_tab_page||':'||wwv_flow.g_instance||'::'||l_debug_string;
      l_url := apex_util.prepare_url(apex_application.do_substitutions(l_url));
    end if;
    return l_url;
  end;
  
  function replace_substitution(p_template     varchar2
                               ,p_attributes   r_attributes
                               )
  return varchar2                          
  as
    l_url        varchar2(150);
    l_template   varchar2(32767);
  begin
    l_template := replace(p_template,'#LINK#',p_attributes.link);
    l_template := replace(l_template,'#IMAGE#',p_attributes.image);
    l_template := replace(l_template,'#IMAGE_ATTR#',p_attributes.image_attributes);
    l_template := replace(l_template,'#LIST_ITEM_ID#',p_attributes.id);
    l_template := replace(l_template,'#PARENT_LIST_ITEM_ID#',p_attributes.parent_id);
    l_template := replace(l_template,'#A1#',p_attributes.name);
    l_template := replace(l_template,'#A2#',p_attributes.parent_name);
    l_template := replace(l_template,'#TEXT#',p_attributes.label);
    l_template := replace(l_template,'#TEXT_ESC_SC#',sys.htf.escape_sc(p_attributes.label));
    l_template := replace(l_template,'#TEXT#',p_attributes.parent_label);
    l_template := replace(l_template,'#LEVEL#',p_attributes.tab_level);
    return  apex_plugin_util.replace_substitutions(l_template);
  end;
    
begin
  apex_plugin_util.
     debug_region(p_plugin               => p_plugin,
                  p_region               => p_region,
                  p_is_printer_friendly  => p_is_printer_friendly);
  
  apex_debug.message('Start tab menu list');                 
  /*Determine the current tab set*/
  open c_pag(wwv_flow.g_flow_id,wwv_flow.g_flow_step_id);
  fetch c_pag
  into  l_current_tab_set;
  close c_pag;
  apex_debug.message('Current tab set determined');
  /*Get the templates*/
  open c_temp(l_template_name,l_theme_number,wwv_flow.g_flow_id);
  fetch c_temp
  into  r_temp;
  close c_temp;
  
  /*Get the parent tabs*/
  open c_pat(wwv_flow.g_flow_id,c_tabset);
  fetch c_pat bulk collect
  into  l_pat_table;
  close c_pat;
  
  if l_use_conditions
  then
    /*Remove the tabs that shouldn't be displayed demending on the conditions*/
    for l in l_pat_table.first .. l_pat_table.last
    loop
      if apex_plugin_util.is_component_used(
          l_tab_table(l).build_option,
          l_tab_table(l).authorization_scheme,
          l_tab_table(l).condition_type,
          l_tab_table(l).condition_expression1,
          l_tab_table(l).condition_expression2
          )
      then
        l_tab_table.delete(l);
      end if;  
    end loop;
  end if;
  
  k := l_pat_table.first;
  while k is not null
  loop
    /*Standard tabs belonging to the parent tab*/
    open  c_tab(wwv_flow.g_flow_id,l_pat_table(k).current_for_tabset);
    fetch c_tab bulk collect
    into  l_tab_table;
    close c_tab;
    
    if l_use_conditions
    then
      /*Remove the tabs that shouldn't be displayed demending on the conditions*/
      for g in l_tab_table.first .. l_tab_table.last
      loop
        l_function := 'return apex$checks.auth_condition_check_int('''||l_tab_table(g).condition_type
                   || ''','''||l_tab_table(g).condition_expression1
                   || ''','''||l_tab_table(g).condition_expression2
                   || ''','''||l_tab_table(g).authorization_scheme
                   || ''','''||l_tab_table(g).build_option
                   || ''');';
        l_result := apex_plugin_util.get_plsql_function_result(l_function);
        if l_result = 0
        then
          l_tab_table.delete(g);
        end if;  
      end loop;
    end if;      
    
    l_is_current := (l_pat_table(k).current_for_tabset = nvl(l_current_tab_set,'!'));
    if l_tab_table.count = 1
       and
       l_include_single = 'N'
    then
      l_number_tabs :=  0;
    else  
      l_number_tabs := l_tab_table.count;
    end if;  
    /*Determine the right parent template*/
    if l_number_tabs > 0
       and
       k = 1
       and
       l_is_current
    then
      /*First with child current*/
      l_html_parent := nvl(r_temp.first_current_with,r_temp.current_item_with);
      r_pat_attributes.status := 'first-current';
    elsif l_number_tabs > 0
          and
          k = 1
          and 
          not l_is_current
    then
      /*First with child not current*/
      l_html_parent := nvl(r_temp.first_non_current_with,r_temp.non_current_item_with);
      r_pat_attributes.status := 'first-non-current';
    elsif l_number_tabs > 0
          and
          k >1
          and 
          l_is_current
    then      
      /*Item with child current*/
      l_html_parent := r_temp.current_item_with;
      r_pat_attributes.status := 'current';
    elsif l_number_tabs > 0
          and
          k > 1
          and 
          not l_is_current  
    then
      /*Item with child non current*/
      l_html_parent := r_temp.non_current_item_with;
      r_pat_attributes.status := 'non-current';
    elsif l_number_tabs = 0
          and
          k = 1
          and
          l_is_current
    then
      /*First without child current*/
      l_html_parent := r_temp.first_current_item;
      r_pat_attributes.status := 'first-current';
    elsif l_number_tabs = 0
          and
          k = 1
          and 
          not l_is_current
    then
      /*First without child not current*/
      l_html_parent := r_temp.first_non_current_item;
      r_pat_attributes.status := 'first-non-current';
    elsif l_number_tabs = 0
          and
          k > 1
          and 
          l_is_current
    then      
      /*Item without child current*/
      l_html_parent := r_temp.current_item;
      r_pat_attributes.status := 'current';
    elsif l_number_tabs = 0
          and
          k > 0
          and 
          not l_is_current  
    then
      /*Item without child non current*/ 
      l_html_parent := r_temp.non_current_item;
      r_pat_attributes.status := 'non-current';
    end if;
    if k>0
       and 
       k=l_pat_table.last
    then
      r_pat_attributes.status :='last-'||r_pat_attributes.status;
    end if;
    /*Replace all substition strings*/
    if l_is_current
    then
      r_pat_attributes.image := l_pat_table(k).when_current_image;
    else
      r_pat_attributes.image := l_pat_table(k).when_non_current_image;
    end if;
    /*Replace different tags*/
    r_pat_attributes.label := l_pat_table(k).tab_label;
    r_pat_attributes.name := l_pat_table(k).tab_name;
    r_pat_attributes.tab_level := 1;
    r_pat_attributes.id := l_pat_table(k).parent_tab_id;
    
    if l_tab_table.count = 0
       or
       l_parent_link = 'Y'
    then
      /*No children the target is the target defined by the parent*/
      r_pat_attributes.link := apex_util.prepare_url(apex_application.do_substitutions(l_pat_table(k).tab_target));                               
    elsif (l_include_single = 'N'
           and
           l_tab_table.count = 1
          )
    then
      /*One child and child isn't included target is target of child*/
      r_pat_attributes.link := get_url(l_is_current
                                      ,l_tab_table(1).tab_name
                                      ,l_tab_table(1).tab_page
                                      );                       
    else
      r_pat_attributes.link :='#';
    end if;
    
    if k = 1
    then
      /*It's the first parent tab*/
      sys.htp.p(replace_substitution(r_temp.before_rows,r_pat_attributes));
    else
      /*Write between*/
      sys.htp.p(replace_substitution(r_temp.between_item,r_pat_attributes));
    end if;
    
    if l_tab_table.count = 0
       or
       (l_include_single = 'N'
        and
        l_tab_table.count = 1
       )
    then
      /*No children to be placed*/
      sys.htp.p(replace_substitution(l_html_parent
                                    ,r_pat_attributes
                                    )    
               );
    else
      /*Split parent template to give childeren space
      **Children come before last closing tag if the tag is the same as the first opening tag
      */
      if substr(l_html_parent
               ,regexp_instr(l_html_parent,'</\w{1,}>\w{0,}$',1,1,0,'i')+2
               ,regexp_instr(l_html_parent,'>\w{0,}$',1,1,0,'i')-regexp_instr(l_html_parent,'</\w{1,}>\w{0,}$',1,1,0,'i')-2
               ) 
        =   
        substr(l_html_parent
              ,regexp_instr(l_html_parent,'^\w{0,}<',1,1,1,'i')
              ,regexp_instr(l_html_parent,'^\w{0,}<\w{1,}',1,1,1,'i')-regexp_instr(l_html_parent,'^\w{0,}<',1,1,1,'i')
              )
      then     
        l_last_part := substr(l_html_parent
                             ,regexp_instr(l_html_parent,'</\w{1,}>\w{0,}$',1,1,0,'i')
                             );
        l_first_part := substr(l_html_parent
                                           ,1
                                           ,regexp_instr(l_html_parent,'</\w{1,}>\w{0,}$',1,1,0,'i')-1
                                           );
      else
        /*Sublist items are placed after the list item*/
        l_last_part := null;
        l_first_part := l_html_parent;
      end if;  
      /*Write (first part of) the list item*/
      sys.htp.p(replace_substitution(l_first_part
                                    ,r_pat_attributes
                                    )    
               );
      /*Before sub list items*/
      r_tab_attributes.parent_id := l_pat_table(k).parent_tab_id;
      r_tab_attributes.parent_name := l_pat_table(k).tab_name;
      r_tab_attributes.parent_label := l_pat_table(k).tab_label;
      sys.htp.p(replace_substitution(r_temp.before_sub_list,r_tab_attributes));
      l_html_tab := null;
      /*Loop trough children*/
      h := l_tab_table.first;
      while h is not null
      loop
        if l_tab_table(h).tab_page = wwv_flow.g_flow_step_id
        or instr(','||l_tab_table(h).tab_also_current_for_pages||','
                ,','||wwv_flow.g_flow_step_id||','
                ) > 0
        then
          l_html_tab := r_temp.current_sub_list;
          r_tab_attributes.image := l_tab_table(h).when_current_tab_image;
        else
          l_html_tab := r_temp.non_current_sub_list;
          r_tab_attributes.image :=l_tab_table(h).when_current_tab_image;
        end if;
        r_tab_attributes.tab_level := 2;
        r_tab_attributes.label := l_tab_table(h).tab_label;
        r_tab_attributes.name  := l_tab_table(h).tab_name;
        r_tab_attributes.id  := l_tab_table(h).tab_id;
        r_tab_attributes.image_attributes := l_tab_table(h).tab_image_attributes;
        r_tab_attributes.link := get_url(l_is_current
                                        ,l_tab_table(h).tab_name
                                        ,l_tab_table(h).tab_page
                                        );
        if h = l_tab_table.last
        then
          /*Between sub_list*/
          sys.htp.p(replace_substitution(r_temp.between_sub_list,r_tab_attributes));
        end if;
        sys.htp.p(replace_substitution(l_html_tab,r_tab_attributes)); 
        h := l_tab_table.next(h);
      end loop;
      /*After sub list*/
      sys.htp.p(replace_substitution(r_temp.after_sub_list,r_tab_attributes));
      /*Last part of the parent*/
      sys.htp.p(replace_substitution(l_last_part,r_pat_attributes));
    end if;
    if k=l_pat_table.last
    then
       sys.htp.p(replace_substitution(r_temp.after_rows,r_pat_attributes));
    end if;
    k := l_pat_table.next(k);
  end loop;  
  return l_return;
end apr$tab_list;

/
