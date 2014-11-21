--------------------------------------------------------
--  File created - woensdag-november-05-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package APR$DEMO_PLUGIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "APR$DEMO_PLUGIN" as 
/*******************************************************************************
Copyright (c) 2014, N. van Baren

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
  function render_demo_region(p_region               in apex_plugin.t_region
                             ,p_plugin               in apex_plugin.t_plugin
                             ,p_is_printer_friendly  in boolean)
  return apex_plugin.t_region_render_result;
  
  function ajax_demo_region(p_region in apex_plugin.t_region
                           ,p_plugin in apex_plugin.t_plugin
                           )
  return apex_plugin.t_region_ajax_result;
end apr$demo_plugin;

/

--------------------------------------------------------
--  DDL for Package Body APR$DEMO_PLUGIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY APR$DEMO_PLUGIN as
  c_cell             constant varchar2(10):='CELL';
  c_standard_type    constant varchar2(10):='STANDARD';
  
  g_item_id                   number;
  function clob_replace(p_clob               in clob
                       ,p_string_to_replace  in varchar2
                       ,p_replacement_clob   in clob
                       )
  return clob
  is

    c_whatlen       constant pls_integer := length(p_string_to_replace);
    c_withlen       constant pls_integer := sys.dbms_lob.getlength(p_replacement_clob);
  
    l_return        clob;
    l_segment       clob;
    l_pos           pls_integer := 1-c_withlen;
    l_offset        pls_integer := 1;

  begin
    apex_debug.message('Start clob replace');
    if p_string_to_replace is not null 
    then
      while l_offset < dbms_lob.getlength(p_clob) 
      loop
        l_segment := dbms_lob.substr(p_clob,32767,l_offset);
        loop
          l_pos := dbms_lob.instr(l_segment,p_string_to_replace,l_pos+c_withlen);
          exit when (nvl(l_pos,0) = 0) or (l_pos = 32767-c_withlen);
          l_segment := to_clob( dbms_lob.substr(l_segment,l_pos-1)
                              ||p_replacement_clob
                              ||dbms_lob.substr(l_segment,32767-c_whatlen-l_pos-c_whatlen+1,l_pos+c_whatlen));
        end loop;
        l_return := l_return||l_segment;
        l_offset := l_offset + 32767 - c_whatlen;
      end loop;
    end if;  
    return(l_return);  
  end clob_replace;
  
  function render_attribute (p_prompt             in varchar2
                            ,p_waarde             in varchar2
                            ,p_soort              in varchar2
                            ,p_attribute_template in varchar2
                            ,p_help_template      in varchar2
                            ,p_help_text          in varchar2 default null
                            ,p_id                 in varchar2 default null
                            ,p_standard_list      in varchar2 default null
                            ,p_standard_labels    in varchar2 default null
                            ,p_standard_separator in varchar2 default null
                            )
  return varchar2                    
  is
    type trim_table_type is varray(7) of varchar2(20);
    l_trim_table trim_table_type := trim_table_type(chr(10),'<br />','<br/>','<br>',chr(13),chr(38)||'nbsp;',' ');
    cursor c_pav(b_id  in number
                ,p_app_id in number
                ,p_waarde in varchar2
                )
    is
      select pav.display_value
      from   apex_appl_plugin_attr_values pav
      where  pav.plugin_attribute_id = b_id
      and    pav.application_id = p_app_id
      and    pav.return_value = p_waarde
    ;
    
    c_item_name   constant  varchar2(10):='PI';
    l_checked               varchar2(20);
    l_waarde_element        varchar2(4000);
    l_element               varchar2(32676);
    l_help_text             apex_appl_plugin_attributes.help_text%type;
    l_standard_checked      apex_application_global.vc_arr2;
    l_standard_elements     apex_application_global.vc_arr2;
    l_standard_labels       apex_application_global.vc_arr2;
    l_display_value         varchar2(4000);
    l_item_id               varchar2(100);
    k                       number;
    
  begin
    g_item_id := nvl(g_item_id,0)+1;
    apex_debug.message('Render attribute '||p_prompt||' '||g_item_id);
    
    /*Trim invisable elements these to check if there is a help to be displayed*/
    l_help_text := p_help_text;
    for i in l_trim_table.first .. l_trim_table.last
    loop
      l_help_text := rtrim(ltrim(l_help_text,l_trim_table(i)),l_trim_table(i));      
    end loop;
    l_help_text := trim(l_help_text);
    apex_debug.message('Help is stripped '||g_item_id);
    /*Render de value item part*/
    case upper(p_soort)
      when 'CHECKBOX'
      then
        /*<input type="checkbox" checked="checked" value="Y" name="p_v13" id="P2_TEST_0">*/
        if p_waarde in ('Y','Yes','YES','y')
        then
          l_checked :='checked="checked"';
        else
          l_checked := null;
        end if;
        l_waarde_element := '<input type="checkbox" value="Y" disabled="disabled" '||l_checked||'/>';
      when c_standard_type
      then
        l_standard_checked   := apex_util.string_to_table(p_waarde,':');
        l_standard_elements  := apex_util.string_to_table(p_standard_list,':');
        l_standard_labels    := apex_util.string_to_table(p_standard_labels,':');
        for i in 1..l_standard_elements.count
        loop
          k:=null;
          if l_standard_checked.count >0
          then
            loop
              if k is null
              then
                k:= l_standard_checked.first;
              else  
                k:= l_standard_checked.next(k);
              end if;
              if l_standard_elements(i) = l_standard_checked(k)
              then
                l_checked :='checked="checked"';
                k:= l_standard_checked.last;
              else
                l_checked := null;                
              end if;
              exit when k = l_standard_checked.last;
            end loop;
          end if;  
          l_waarde_element := l_waarde_element
                           || '<input type="checkbox" '
                           || 'id="STANDARD_'||i||'" '
                           || 'disabled="disabled" '
                           || 'value="'||l_standard_elements(i)||'" '
                           || l_checked
                           ||'/><label for="STANDARD_'||i||'">'||l_standard_labels(i)||'</label><br>';
        end loop;
        l_waarde_element:='<fieldset class="checkbox_group">'||l_waarde_element||'</fieldset>';
      when 'SELECT LIST'
      then
        open c_pav(p_id,wwv_flow.g_flow_id,p_waarde);
        fetch c_pav
        into  l_waarde_element;
        close c_pav;
      else
        l_waarde_element :=apex_plugin_util.escape(p_waarde,true);
    end case;
    apex_debug.message('Start attribute replace '||p_prompt);
    if l_help_text is not null
    then
      l_element := replace(p_attribute_template,'#HELP#',replace(p_help_template,'#HELP_TEXT#',p_help_text));
    else
      l_element := replace(p_attribute_template,'#HELP#');
    end if;
    l_element := replace(l_element,'#PROMPT#',p_prompt);
    l_element := replace(l_element,'#ID#',c_item_name||to_char(g_item_id));
    l_element := replace(l_element,'#VALUE#',l_waarde_element);
    apex_debug.message('Waarde '||l_waarde_element);
    apex_debug.message('End attribute replace '||p_prompt);
    return l_element;
  end render_attribute;
   
  procedure render_dynamic_action(p_plugin                   in varchar2
                                 ,p_plu_standard_attributes  in varchar2
                                 ,p_page_id                  in number
                                 ,p_components_template      in varchar2
                                 ,p_comp_attributes_temp     in varchar2
                                 ,p_comp_attr_help_temp      in varchar2
                                 ,p_sub_components_temp      in varchar2 
                                 ,p_sub_comp_attributes_temp in varchar2 
                                 ,p_sub_comp_attr_help_temp  in varchar2
                                 ,p_components_html          in out clob
                                 )
  is
    cursor c_dya(b_app_id in number
                ,b_page_id in number
                ,b_plugin  in varchar2
                )
    is
      select dya.dynamic_action_name
      ,      dya.dynamic_action_id
      ,      dya.when_element
      ,      dya.when_selection_type
      ,      dya.when_region
      ,      dya.when_button
      ,      dya.when_event_scope
      ,      dya.when_event_name
      ,      dya.when_condition
      ,      dya.when_expression
      ,      dya.condition_type         condition_type
      ,      dya.condition_expression1  condition_expression1
      ,      dya.condition_expression2  condition_expression2
      ,      dya.build_option           build_option
      ,      dya.authorization_scheme   authorization_scheme
      from   apex_application_page_da  dya
      where  exists (select ''
                     from   apex_application_page_da_acts daa
                     where  daa.dynamic_action_id = dya.dynamic_action_id
                     and    daa.action_code = 'PLUGIN_'||b_plugin
                     and    daa.application_id = b_app_id
                     and    daa.page_id = b_page_id
                     )
      order by dya.dynamic_action_sequence
    ;
    
    cursor c_daa(b_dynamic_action_id in number)
    is
      select daa.action_id
      ,      daa.action_name
      ,      daa.action_sequence
      ,      daa.execute_on_page_init
      ,      daa.stop_execution_on_error
      ,      daa.dynamic_action_event_result
      ,      daa.affected_elements
      ,      daa.affected_elements_type
      ,      daa.affected_region
      from   apex_application_page_da_acts daa
      where  daa.dynamic_action_id = b_dynamic_action_id
      order  by daa.action_sequence
    ;
    
    cursor c_pla(b_action_id in number)
    is
      select pla.prompt
      ,      decode(pla.attribute_sequence
                   ,1,daa.attribute_01
                   ,2,daa.attribute_02
                   ,3,daa.attribute_03
                   ,4,daa.attribute_04
                   ,5,daa.attribute_05
                   ,6,daa.attribute_06
                   ,7,daa.attribute_07
                   ,8,daa.attribute_08
                   ,9,daa.attribute_09
                   ,10,daa.attribute_10
                   ,11,daa.attribute_11
                   ,12,daa.attribute_12
                   ,13,daa.attribute_13
                   ,14,daa.attribute_14
                   ,15,daa.attribute_15
                   ) waarde
      ,      pla.attribute_type
      ,      pla.plugin_attribute_id
      ,      pla.help_text
      from   apex_application_page_da_acts daa
      left outer join   apex_appl_plugin_attributes pla
      on     daa.action_code = 'PLUGIN_'||pla.plugin_name
      and    daa.application_id = pla.application_id
      and    pla.attribute_scope = 'Component'
      where  daa.action_id = b_action_id
    ;
    
    l_component                      clob;
    l_attributes                     varchar2(32767);
    l_sub_component                  varchar2(32767);
    l_sub_attributes                 varchar2(32767);
    l_sub_components                 clob;
  begin
    apex_debug.message('Print dynamic action');
    --sys.dbms_lob.createtemporary(l_sub_components,true);
    --sys.dbms_lob.open(l_sub_components,sys.DBMS_LOB.LOB_READWRITE);
    apex_debug.message('Start DA');
    for r_dya in c_dya(wwv_flow.g_flow_id,p_page_id,p_plugin)
    loop
      if apex$checks.auth_condition_check(r_dya.condition_type
                                         ,r_dya.condition_expression1
                                         ,r_dya.condition_expression2
                                         ,r_dya.authorization_scheme
                                         ,r_dya.build_option
                                         )
      then
        /*Selected elements*/
        if r_dya.when_selection_type = 'Region'
        then
          l_attributes := render_attribute(r_dya.when_selection_type
                                          ,r_dya.when_region
                                          ,c_cell,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'<p>The name of a region that will trigger the dynamic action. For example this could be an ''Interactive Report'' region, used in conjunction with an ''After Refresh'' event, to define a dynamic action that will fire whenever the report refreshes.</p>'
                                          ||'<p>Another example of where a region can be useful is where you want to define similar behavior for multiple page items in a region. This is only possible for certain events that are raised by items within that region. Please see the item help text for the ''Affected Elements > Selection Type'' of ''Event Scope'' on the ''Action'' page for a list of events that support this type of definition and an example of how this could be utilised.</p>'
                                          );
        elsif r_dya.when_selection_type = 'Button'
        then
          l_attributes := render_attribute(r_dya.when_selection_type
                                          ,r_dya.when_button
                                          ,c_cell
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'The button that will trigger the dynamic action.'
                                          );   
        else
          l_attributes := render_attribute(r_dya.when_selection_type
                                          ,r_dya.when_element
                                          ,c_cell
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          );
        end if;
        l_attributes := l_attributes||render_attribute('Event scope',r_dya.when_event_scope,c_cell,p_comp_attributes_temp,p_comp_attr_help_temp);
        l_attributes := l_attributes||render_attribute('Event name',r_dya.when_event_name,c_cell,p_comp_attributes_temp,p_comp_attr_help_temp);
        l_attributes := l_attributes||render_attribute('Condition',r_dya.when_condition,c_cell,p_comp_attributes_temp,p_comp_attr_help_temp);
        if r_dya.when_condition not in ('is not null','is null')
           and
           r_dya.when_condition is not null
        then   
          l_attributes := l_attributes||render_attribute('Expression',r_dya.when_expression,c_cell,p_comp_attributes_temp,p_comp_attr_help_temp);
        end if;
        /*Render the actions as sub components*/
        for r_daa in c_daa(r_dya.dynamic_action_id)
        loop
          apex_debug.message('Print dynamic action'||r_daa.action_name);
          /*Affected elements*/
          l_sub_attributes := render_attribute('Action sequence',r_daa.action_sequence,c_cell,p_sub_comp_attributes_temp,p_sub_comp_attr_help_temp);
          l_sub_attributes := l_sub_attributes||render_attribute('Fire when event result is',r_daa.dynamic_action_event_result,c_cell,p_sub_comp_attributes_temp,p_sub_comp_attr_help_temp );
          if instr(p_plu_standard_attributes,'ONLOAD') > 0
          then
            l_sub_attributes := l_sub_attributes||render_attribute('Fire on page load',r_daa.execute_on_page_init,'CHECKBOX',p_sub_comp_attributes_temp,p_sub_comp_attr_help_temp);
          end if;
          if instr(p_plu_standard_attributes,'STOP_EXECUTION_ON_ERROR') > 0
          then
            l_sub_attributes := l_sub_attributes||render_attribute('Stop on error',r_daa.stop_execution_on_error,'CHECKBOX',p_sub_comp_attributes_temp,p_sub_comp_attr_help_temp);
          end if;
          if r_daa.affected_elements_type = 'Region'
          then
            l_sub_attributes := l_sub_attributes||render_attribute(r_daa.affected_elements_type,r_daa.affected_region,c_cell,p_sub_comp_attributes_temp,p_sub_comp_attr_help_temp);
          elsif r_daa.affected_elements_type in ('Event Source','Triggering Element')
          then
            l_sub_attributes := l_sub_attributes||render_attribute('Affected type',r_daa.affected_elements_type,c_cell,p_sub_comp_attributes_temp,p_sub_comp_attr_help_temp);
          else  
            l_sub_attributes := l_sub_attributes||render_attribute(r_daa.affected_elements_type,r_daa.affected_elements,c_cell,p_sub_comp_attributes_temp,p_sub_comp_attr_help_temp);
          end if;
          apex_debug.message('Start render attributes DAA');
          for r_pla in c_pla(r_daa.action_id)
          loop
            l_sub_attributes := l_sub_attributes
                             || render_attribute(r_pla.prompt
                                                ,r_pla.waarde
                                                ,r_pla.attribute_type
                                                ,p_sub_comp_attributes_temp
                                                ,p_sub_comp_attr_help_temp
                                                ,r_pla.help_text
                                                ,to_char(r_pla.plugin_attribute_id)
                                                );
          end loop;
          apex_debug.message('End render attributes DAA');
          l_sub_component := replace(p_sub_components_temp,'#TITLE#',r_daa.action_name);
          l_sub_component := replace(l_sub_component,'#ID#','PSC'||r_daa.action_id);
          l_sub_component := replace(l_sub_component,'#ATTRIBUTES#',l_sub_attributes);
          apex_debug.message('End replace attributes DAA');
          l_sub_components := l_sub_components||l_sub_component;
          apex_debug.message('Attributes DAA appended');
        end loop;
        l_component := replace(p_components_template,'#TITLE#',r_dya.dynamic_action_name);
        l_component := replace(l_component,'#ID#','PC'||r_dya.dynamic_action_id);
        l_component := replace(l_component,'#ATTRIBUTES#',l_attributes); if l_sub_components is not null
        then
          sys.dbms_lob.append(p_components_html,clob_replace(l_component,'#SUB_COMPONENTS#',l_sub_components));
        else
          sys.dbms_lob.append(p_components_html,replace(l_component,'#SUB_COMPONENTS#'));
        end if;
        l_sub_components := null;
      end if;
    end loop;
  end render_dynamic_action;
  
  procedure render_item(p_plugin                   in varchar2
                       ,p_plu_standard_attributes  in varchar2
                       ,p_page_id                  in number
                       ,p_components_template      in varchar2
                       ,p_comp_attributes_temp     in varchar2
                       ,p_comp_attr_help_temp      in varchar2
                       ,p_components_html          in out clob
                       )
  is 
    cursor c_pla(b_app_id    in number
                ,b_page_id   in number
                ,b_item_name in varchar2
                )
    is
      select pla.prompt
      ,      decode(pla.attribute_sequence
                   ,1,ite.attribute_01
                   ,2,ite.attribute_02
                   ,3,ite.attribute_03
                   ,4,ite.attribute_04
                   ,5,ite.attribute_05
                   ,6,ite.attribute_06
                   ,7,ite.attribute_07
                   ,8,ite.attribute_08
                   ,9,ite.attribute_09
                   ,10,ite.attribute_10
                   ,11,ite.attribute_11
                   ,12,ite.attribute_12
                   ,13,ite.attribute_13
                   ,14,ite.attribute_14
                   ,15,ite.attribute_15                   
                   ) waarde
      ,      pla.attribute_type
      ,      pla.plugin_attribute_id
      ,      pla.help_text
      from   apex_application_page_items ite
      join   apex_appl_plugin_attributes pla
      on     ite.display_as_code = 'PLUGIN_'||pla.plugin_name
      and    ite.application_id = pla.application_id
      where  pla.attribute_scope = 'Component'
      and    pla.application_id = b_app_id
      and    ite.page_id = b_page_id
      and    ite.item_name = b_item_name
      order by ite.display_sequence, pla.display_sequence
    ;
    cursor c_ite(b_app_id      number
                ,b_page_id     number
                ,b_plugin_name varchar2
                )
    is            
      select ite.label
      ,      ite.item_name      
      ,      ite.format_mask          formatmask
      ,      ite.item_element_width   width
      ,      ite.item_element_height  height
      ,      ite.escape_on_http_output escape
      ,      ite.html_form_element_attributes
      ,      ite.form_element_option_attributes
      ,      ite.lov_definition
      ,      ite.lov_named_lov
      ,      ite.lov_display_extra
      ,      ite.lov_null_text
      ,      ite.lov_null_value
      ,      ite.lov_cascade_parent_items
      ,      ite.condition_type
      ,      ite.condition_expression1
      ,      ite.condition_expression2
      ,      ite.build_option
      ,      ite.authorization_scheme
      from   apex_application_page_items ite
      where  ite.application_id = b_app_id
      and    ite.page_id = b_page_id
      and    ite.display_as_code = 'PLUGIN_'||b_plugin_name
      order by ite.display_sequence
    ;
  
    l_component            varchar2(32767);
    l_attributes           varchar2(32767);   
  begin
    for r_ite in c_ite(wwv_flow.g_flow_id,p_page_id,p_plugin)
    loop
      if apex$checks.auth_condition_check(r_ite.condition_type
                                         ,r_ite.condition_expression1
                                         ,r_ite.condition_expression2
                                         ,r_ite.authorization_scheme
                                         ,r_ite.build_option
                                         )
      then
        apex_debug.message('Render: '||r_ite.item_name);
        l_attributes := null;
        if instr(p_plu_standard_attributes,'WIDTH') > 0
        then
          l_attributes := l_attributes
                       || render_attribute('Width'
                                          ,r_ite.width
                                          ,c_cell
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'Specify the length (in characters) of the form element that will be displayed for this item.'
                                          );
        end if;
        if instr(p_plu_standard_attributes,'HEIGHT') > 0
        then
          l_attributes := l_attributes
                       || render_attribute('Height'
                                          ,r_ite.height
                                          ,c_cell
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'Specify the height (in lines) for text areas, shuttles and multi select lists.'
                                          );
        end if;
        if instr(p_plu_standard_attributes,'FORMAT_MASK') > 0
        then
          l_attributes := l_attributes
                       || render_attribute('Format mask'
                                          ,r_ite.formatmask
                                          ,c_cell
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'Select or enter a format mask. Note that format mask is applicable only to items of source type Database Column.'
                                          );
        end if;
        if instr(p_plu_standard_attributes,'ESCAPE_OUTPUT') > 0
        then
          l_attributes := l_attributes
                       || render_attribute('Escape output'
                                          ,r_ite.escape
                                          ,'CHECKBOX'
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'To prevent Cross-Site Scripting (XSS) attacks this attribute should always be set to Yes! Only if you want that HTML tags which are stored in the page item or in the entries of a list of value are actually rendered, you should set this flag to No.'
                                          );
        end if;
        if instr(p_plu_standard_attributes,'ELEMENT') > 0
        then
          l_attributes := l_attributes
                       || render_attribute('Element attributes'
                                          ,r_ite.html_form_element_attributes
                                          ,c_cell
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'Enter additional attributes to be included in the form element HTML tag.  The SIZE and ID attributes will be generated and therefore should not be supplied.  You may include Javascript, for example:'
                                           ||chr(10)||chr(10)||'<pre>onBlur="javascript:{this.value = this.value.toUpperCase(); }"</pre>'
                                          );
        end if; 
        if instr(p_plu_standard_attributes,'LOV') > 0
        then
          if instr(p_plu_standard_attributes,'LOV_REQUIRED') > 0
          then
            l_attributes := l_attributes
                         || render_attribute('List of Values Required'
                                            ,'Y'
                                            ,'CHECKBOX'
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            );
          else
            l_attributes := l_attributes
                         || render_attribute('List of Values Required'
                                            ,'N'
                                            ,'CHECKBOX'
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            );
          end if;
          if r_ite.lov_named_lov is not null
          then
            l_attributes := l_attributes
                         || render_attribute('Name lov'
                                            ,r_ite.lov_named_lov
                                            ,'TEXT'
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            ,'Name of a shared LOV'
                                            );
          else  
            l_attributes := l_attributes
                         || render_attribute('LOV'
                                            ,r_ite.lov_definition
                                            ,'TEXTAREA'
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            ,'Enter either a query, a static definition for a list of values or a named LOV. The query format depends on the selected item type. See "List of Values Examples" for details. Each column must be a different name or alias. If you select a column expression be sure to use an alias.'
                                            );
          end if;                                  
          if instr(p_plu_standard_attributes,'LOV_DISPLAY_NULL') > 0
          then
            l_attributes := l_attributes
                         || render_attribute('Display null value'
                                            ,r_ite.lov_null_text
                                            ,c_cell
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            ,'If you have selected to display a NULL option in your list of values, enter the display value for the NULL option here.'
                                            );
            l_attributes := l_attributes
                         || render_attribute('Return null value'
                                            ,r_ite.lov_null_value
                                            ,c_cell
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            ,'Enter the NULL value to be used for this item''s list of values.'
                                            );
          end if;
          if instr(p_plu_standard_attributes,'LOV_DISPLAY_EXTRA') > 0
          then
            l_attributes := l_attributes
                         || render_attribute('Display extra values'
                                            ,upper(substr(r_ite.lov_display_extra,1,1))
                                            ,'CHECKBOX'
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            ,'An item may have a session state value which does not occur in its list of values definition. Select whether this list of values should display this extra session state value. If you choose not to display this extra session state value and there is no matching value in the list of values definition, the first value will be the selected value.'
                                            );
          end if;
          if instr(p_plu_standard_attributes,'CASCADING_LOV') > 0
          then
            l_attributes := l_attributes
                         || render_attribute('Cascading lov parents'
                                            ,r_ite.lov_cascade_parent_items
                                            ,c_cell
                                            ,p_comp_attributes_temp
                                            ,p_comp_attr_help_temp
                                            ,'<p>A cascading LOV means that the current item''s list of values should be refreshed if the value of another item on this page gets changed.</p>'
                                            ||'<p>Specify a comma separated list of page items to be used to trigger the refresh. You can then use those page items in the where clause of your "List of Values" SQL statement.</p>'
                                            ||'<p>For example, if you have page items for Car Make and Model, Model would identify Car Make as the Cascading LOV Parent Item so that whenever Car Make is changed, the LOV for Model would be refreshed.</p>'
                                            );
          end if;
        end if;
        if instr(p_plu_standard_attributes,'ELEMENT_OPTION') > 0
        then
          l_attributes := l_attributes
                       || render_attribute('Option attributes'
                                          ,r_ite.form_element_option_attributes
                                          ,c_cell
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,'Enter additional attributes for the HTML table cell used to display each individual option in a radio group or set of check boxes.'
                                          );
        end if;
      end if;
      for r_pla in c_pla(wwv_flow.g_flow_id,p_page_id,r_ite.item_name)
      loop
        l_attributes := l_attributes
                     || render_attribute(r_pla.prompt
                                        ,r_pla.waarde
                                        ,r_pla.attribute_type
                                        ,p_comp_attributes_temp
                                        ,p_comp_attr_help_temp
                                        ,r_pla.help_text
                                        ,r_pla.plugin_attribute_id
                                        );
      end loop;      
      l_component := replace(p_components_template,'#TITLE#',r_ite.label);
      l_component := replace(l_component,'#ID#','PC'||r_ite.item_name);
      l_component := replace(l_component,'#ATTRIBUTES#',l_attributes);
      l_component := replace(l_component,'#SUB_COMPONENTS#',null);
      apex_debug.message('Component: '||length(l_component));
      sys.dbms_lob.append(p_components_html,l_component);
      apex_debug.message('Components: '||sys.dbms_lob.getlength(p_components_html));
    end loop;
    apex_debug.message('End item components');
  end render_item;
  
  function sub_region_attributes(p_attributes        in apex_application_page_regions%rowtype
                                ,p_standard_attributes      in varchar2
                                ,p_sub_comp_attributes_temp in varchar2 
                                ,p_sub_comp_attr_help_temp  in varchar2
                                )
  return varchar2                           
  is    
    cursor c_pla(b_region_id in number)
    is
      select pla.prompt
      ,      decode(pla.attribute_sequence
                   ,1,reg.attribute_01
                   ,2,reg.attribute_02
                   ,3,reg.attribute_03
                   ,4,reg.attribute_04
                   ,5,reg.attribute_05
                   ,6,reg.attribute_06
                   ,7,reg.attribute_07
                   ,8,reg.attribute_08
                   ,9,reg.attribute_09
                   ,10,reg.attribute_10
                   ,11,reg.attribute_11
                   ,12,reg.attribute_12
                   ,13,reg.attribute_13
                   ,14,reg.attribute_14
                   ,reg.attribute_15) waarde
      ,      pla.attribute_type
      ,			 pla.plugin_attribute_id
      ,      pla.help_text
      from   apex_application_page_regions reg
      join   apex_appl_plugin_attributes pla
      on     reg.source_type_code = 'PLUGIN_'||pla.plugin_name
      and    reg.application_id = pla.application_id
      where  pla.attribute_scope = 'Component'
      and    reg.region_id = b_region_id
      order by pla.display_sequence    
    ;
    l_sub_attributes       varchar2(32767);
  begin
    apex_debug_message.log_message('Sub region '||p_attributes.region_name);
    l_sub_attributes := null;
    if apex$checks.auth_condition_check(p_attributes.condition_type
                                       ,p_attributes.condition_expression1
                                       ,p_attributes.condition_expression2
                                       ,p_attributes.authorization_scheme
                                       ,p_attributes.build_option
                                       )
    then
    --SOURCE:TEMPLATE:STATIC:REST:SEQUENCE:SELECTOR:ATTRIBUTE:ESCAPE:TYPE:HEADER:FOOTER:SUBMIT:CUSTOMIZATION:PLUGIN
      if instr(p_standard_attributes,'STATIC') >0
      then
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Static id'
                                            ,p_attributes.static_id
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Static id of the sub region'
                                            );
      end if;
      if instr(p_standard_attributes,'TYPE') >0
      then
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Source type'
                                            ,p_attributes.source_type
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Type of the region determining how the region is renderd.'
                                            );
      end if;
      if instr(p_standard_attributes,'SOURCE') >0
      then
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Source type'
                                            ,p_attributes.region_source
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Source of the region'
                                            );
      end if;
      if instr(p_standard_attributes,'ESCAPE') >0
      then
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Escape html'
                                            ,p_attributes.escape_on_http_output
                                            ,'CHECKBOX'
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Source of the region'
                                            );
      end if;
      if instr(p_standard_attributes,'TEMPLATE') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Template'
                                            ,p_attributes.template
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Template used by the region'
                                            );
      end if;
      if instr(p_standard_attributes,'REST') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Rest enabeld'
                                            ,p_attributes.rest_enabled
                                            ,'CHECKBOX'
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,null
                                            );
      end if;
      if instr(p_standard_attributes,'SEQUENCE') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Sequence'
                                            ,p_attributes.display_sequence
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Display sequence'
                                            );
      end if;
      if instr(p_standard_attributes,'SELECTOR') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Display in region selector'
                                            ,p_attributes.display_region_selector
                                            ,'CHECKBOX'
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,null
                                            );
      end if;
      if instr(p_standard_attributes,'ATTRIBUTE') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Region attributes'
                                            ,p_attributes.region_attributes_substitution
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Region templates that contain the substitution string #REGION_ATTRIBUTES# will be substituted with this value.'
                                            );
      end if;
      if instr(p_standard_attributes,'HEADER') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Region header'
                                            ,p_attributes.region_header_text
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Specifies HTML text to display at the top of the region (just before the #BODY# content).'
                                            );
      end if; 
      if instr(p_standard_attributes,'FOOTER') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Region footer'
                                            ,p_attributes.region_footer_text
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Enter a region footer to display directly after the body content (that is, after #BODY# in the region template. You may use shortcuts, as well as the substitution string #TIMING#, to display the time consumed to render the region.
For report regions you can use the following pagination substitution strings:

  #ROWS_FETCHED# -- Shows the number of rows fetched by the reporting engine (the page size). Use these substitution strings to display customized messages to the user.
  #TOTAL_ROWS# -- Displays the total number of rows that satisfy a SQL query used for a report. For example, "X" in "rows X - Y of Z"
  #FIRST_ROW_FETCHED# -- The "X" in "rows X - Y of Z"
  #LAST_ROW_FETCHED# -- The "Y" in "rows X - Y of Z"
'
                                            );
      end if;
      if instr(p_standard_attributes,'SUBMIT') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Page items to submit'
                                            ,p_attributes.ajax_items_to_submit
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Enter a comma separated list of page items on the current page to be set into session state when the region gets refreshed with a partial page refresh. The region can be refreshed with partial page refresh either during pagination (if ''Enable Partial Page Refresh'' is set to Yes) or with the Dynamic Action, Refresh. These page items can then be used in the "Region Source" SQL statement to restrict the query result.'
                                            );
      end if;
      if instr(p_standard_attributes,'CUSTOMIZATION') >0
      then                                    
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Customization by end user'
                                            ,p_attributes.customization
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'This attribute indicates whether display attributes in this region can be customized by the user.'
                                            );
        l_sub_attributes := l_sub_attributes
                         || render_attribute('Customized Option Name'
                                            ,p_attributes.customization_name
                                            ,c_cell
                                            ,p_sub_comp_attributes_temp
                                            ,p_sub_comp_attr_help_temp
                                            ,'Enter the label that displays for this region on the screen that allows a user to customize a page.'
                                            );                                    
      end if;
      if instr(p_standard_attributes,'PLUGIN') >0
      then
        for r_pla in c_pla(p_attributes.region_id)
        loop
          l_sub_attributes := l_sub_attributes
                           || render_attribute(r_pla.prompt
                                              ,r_pla.waarde
                                              ,r_pla.attribute_type
                                              ,p_sub_comp_attributes_temp
                                              ,p_sub_comp_attr_help_temp
                                              ,r_pla.help_text
                                              ,r_pla.plugin_attribute_id
                                              );
        end loop;
      end if;
    end if;
    return l_sub_attributes;
  end sub_region_attributes;
  
  procedure render_region(p_plugin                   in varchar2
                         ,p_plu_standard_attributes  in varchar2
                         ,p_page_id                  in number
                         ,p_components_template      in varchar2
                         ,p_comp_attributes_temp     in varchar2
                         ,p_comp_attr_help_temp      in varchar2
                         ,p_sub_components_temp      in varchar2 
                         ,p_sub_comp_attributes_temp in varchar2 
                         ,p_sub_comp_attr_help_temp  in varchar2
                         ,p_sub_attributes           in varchar2
                         ,p_components_html          in out clob
                         )
 is
    cursor c_reg(b_app_id  in number
                ,b_page_id in number
                ,b_plugin  in varchar2
                )
    is
      select reg.region_id
      ,      reg.region_name
      ,      reg.region_source
      ,      reg.static_id
      ,      reg.escape_on_http_output  escape
      ,      reg.ajax_items_to_submit   items
      ,      reg.condition_type
      ,      reg.condition_expression1
      ,      reg.condition_expression2
      ,      reg.authorization_scheme
      ,      reg.build_option
      from   apex_application_page_regions reg
      where  reg.source_type_code = 'PLUGIN_'||b_plugin
      and    reg.application_id = b_app_id
      and    reg.page_id = b_page_id
      order by reg.display_sequence
    ;
    
    cursor c_pla(b_region_id in number)
    is
      select pla.prompt
      ,      decode(pla.attribute_sequence
                   ,1,reg.attribute_01
                   ,2,reg.attribute_02
                   ,3,reg.attribute_03
                   ,4,reg.attribute_04
                   ,5,reg.attribute_05
                   ,6,reg.attribute_06
                   ,7,reg.attribute_07
                   ,8,reg.attribute_08
                   ,9,reg.attribute_09
                   ,10,reg.attribute_10
                   ,11,reg.attribute_11
                   ,12,reg.attribute_12
                   ,13,reg.attribute_13
                   ,14,reg.attribute_14
                   ,15,reg.attribute_15
                   ,16,reg.attribute_16
                   ,17,reg.attribute_17
                   ,18,reg.attribute_18
                   ,19,reg.attribute_19
                   ,20,reg.attribute_20
                   ,21,reg.attribute_21
                   ,22,reg.attribute_22
                   ,23,reg.attribute_23
                   ,24,reg.attribute_24
                   ,reg.attribute_25
                   ) waarde
      ,      pla.attribute_type
      ,			 pla.plugin_attribute_id
      ,      pla.help_text
      from   apex_application_page_regions reg
      join   apex_appl_plugin_attributes pla
      on     reg.source_type_code = 'PLUGIN_'||pla.plugin_name
      and    reg.application_id = pla.application_id
      where  pla.attribute_scope = 'Component'
      and    reg.region_id = b_region_id
      order by pla.display_sequence    
    ;
    
    cursor c_reg_c(b_region_id in number)
    is
      select reg.*
      from   apex_application_page_regions reg
      where  reg.parent_region_id = b_region_id
    ;
    
    col_reg_name           apex_application_page_regions.region_name%type := null;
    l_number_children      number;
    l_component            varchar2(32767);
    l_attributes           varchar2(32767);
    l_sub_component        varchar2(32767);
    l_sub_attributes       varchar2(32767);
    l_sub_components       clob;
  begin
    apex_debug_message.log_message('Render region');
    for r_reg in c_reg(wwv_flow.g_flow_id,p_page_id,p_plugin)
    loop
      if apex$checks.auth_condition_check(r_reg.condition_type
                                         ,r_reg.condition_expression1
                                         ,r_reg.condition_expression2
                                         ,r_reg.authorization_scheme
                                         ,r_reg.build_option
                                         )
      then        
        l_attributes := render_attribute('Source'
                                        ,r_reg.region_source
                                        ,'TEXT'
                                        ,p_comp_attributes_temp
                                        ,p_comp_attr_help_temp
                                        ,'Depending on the region type selected, enter region source or content here.'
                                        ||' If the region source is of type SQL, have a look at Examples for example queries.'
                                        );
        l_attributes := l_attributes
                     || render_attribute('Static id'
                                        ,r_reg.static_id
                                        ,'TEXT'
                                        ,p_comp_attributes_temp
                                        ,p_comp_attr_help_temp
                                        ,'The static id'
                                        ); 
        l_attributes := l_attributes
                     || render_attribute('Escape output'
                                        ,r_reg.escape
                                        ,'CHECKBOX'
                                        ,p_comp_attributes_temp
                                        ,p_comp_attr_help_temp
                                        ,'Escape the output'
                                        );
        l_attributes := l_attributes
                     || render_attribute('Items to be submitted'
                                        ,r_reg.items
                                        ,'TEXT'
                                        ,p_comp_attributes_temp
                                        ,p_comp_attr_help_temp
                                        ,'Items to be submitted'
                                        );                                
        for r_pla in c_pla(r_reg.region_id)
        loop
          l_attributes := l_attributes
                       || render_attribute(r_pla.prompt
                                          ,r_pla.waarde
                                          ,r_pla.attribute_type
                                          ,p_comp_attributes_temp
                                          ,p_comp_attr_help_temp
                                          ,r_pla.help_text
                                          ,r_pla.plugin_attribute_id
                                          );
        end loop;
        for r_reg_c in c_reg_c(r_reg.region_id)
        loop
          l_sub_attributes:= sub_region_attributes(r_reg_c
                                                  ,p_sub_attributes
                                                  ,p_sub_comp_attributes_temp
                                                  ,p_sub_comp_attr_help_temp
                                                  );
          l_sub_component := replace(p_sub_components_temp,'#TITLE#',r_reg_c.region_name);
          l_sub_component := replace(l_sub_component,'#ID#','PSC'||r_reg_c.region_id);
          l_sub_component := replace(l_sub_component,'#ATTRIBUTES#',l_sub_attributes);
          l_sub_components := l_sub_components||l_sub_component;
        end loop;
        apex_debug_message.log_message('End subs');                 
        l_component := replace(p_components_template,'#TITLE#',r_reg.region_name);
        l_component := replace(l_component,'#ID#','PC'||r_reg.region_id);
        l_component := replace(l_component,'#ATTRIBUTES#',l_attributes);
        if l_sub_components is not null
        then
          sys.dbms_lob.append(p_components_html,clob_replace(l_component,'#SUB_COMPONENTS#',l_sub_components));
        else
          sys.dbms_lob.append(p_components_html,replace(l_component,'#SUB_COMPONENTS#'));
        end if;
        l_sub_components := null;
      end if;  
    end loop;
  end render_region;
  
  procedure render_process(p_plugin                   in varchar2
                          ,p_plu_standard_attributes  in varchar2
                          ,p_page_id                  in number
                          ,p_components_template      in varchar2
                          ,p_comp_attributes_temp     in varchar2
                          ,p_comp_attr_help_temp      in varchar2
                          ,p_components_html          in out clob
                          )
 is
    cursor c_pro(b_app_id  in number
                ,b_page_id in number
                ,b_plugin  in varchar2
                )
    is
      select pro.process_name
      ,      pro.process_id
      ,      pro.process_point
      ,      pro.condition_type
      ,      pro.condition_expression1
      ,      pro.condition_expression2
      ,      pro.build_option
      ,      pro.authorization_scheme
      from   apex_application_page_proc pro
      where  pro.process_type_code = 'PLUGIN_'||b_plugin
      and    pro.application_id = b_app_id
      and    pro.page_id = b_page_id
      order by pro.execution_sequence    
    ;
    
    cursor c_pla(b_process_id  number)
    is
      select pla.prompt
      ,      decode(pla.attribute_sequence
                   ,1,pro.attribute_01
                   ,2,pro.attribute_02
                   ,3,pro.attribute_03
                   ,4,pro.attribute_04
                   ,5,pro.attribute_05
                   ,6,pro.attribute_06
                   ,7,pro.attribute_07
                   ,8,pro.attribute_08
                   ,9,pro.attribute_09
                   ,10,pro.attribute_10
                   ,11,pro.attribute_11
                   ,12,pro.attribute_12
                   ,13,pro.attribute_13
                   ,14,pro.attribute_14
                   ,pro.attribute_15) waarde
      ,      pla.attribute_type
      ,			 pla.plugin_attribute_id
      ,      pla.help_text
      from   apex_application_page_proc pro
      join   apex_appl_plugin_attributes pla
      on     pro.process_type_code = 'PLUGIN_'||pla.plugin_name
      and    pro.application_id = pla.application_id
      where  pla.attribute_scope = 'Component'
      and    pro.process_id = b_process_id
      order by pla.display_sequence
    ; 
    l_component    varchar2(32767);
    l_attributes   varchar2(32767);
  begin
    for r_pro in c_pro(wwv_flow.g_flow_id,p_page_id,p_plugin)
    loop
      if apex$checks.auth_condition_check(r_pro.condition_type
                                         ,r_pro.condition_expression1
                                         ,r_pro.condition_expression2
                                         ,r_pro.authorization_scheme
                                         ,r_pro.build_option
                                           )
      then
        l_attributes := null;
        for r_pla in c_pla(r_pro.process_id)
        loop
          l_attributes := l_attributes
                       || render_attribute(r_pla.prompt
                                    ,r_pla.waarde
                                    ,r_pla.attribute_type
                                    ,p_comp_attributes_temp
                                    ,p_comp_attr_help_temp
                                    ,r_pla.help_text
                                    ,r_pla.plugin_attribute_id
                                    );
        end loop;
        l_component := replace(p_components_template,'#TITLE#',r_pro.process_name);
        l_component := replace(l_component,'#ID#','PC'||r_pro.process_id);
        l_component := replace(l_component,'#ATTRIBUTES#',l_attributes);
        l_component := replace(l_component,'#SUB_COMPONENTS#',null);
        sys.dbms_lob.append(p_components_html,l_component);
      end if;
    end loop;
  end render_process;
  
  procedure render_html(p_region      in apex_plugin.t_region
                       ,p_plugin      in apex_plugin.t_plugin
                       ,p_page_id     in number
                       ,p_plugin_name in varchar2
                       )
  is
    cursor c_plu(b_app_id  in number
                ,b_plugin  in varchar2
                )
    is
      select plu.plugin_type
      ,      plu.standard_attributes     
      ,      plu.display_name
      ,      plu.help_text
      ,      plu.version_identifier
      ,      plu.about_url
      from   apex_appl_plugins plu
      where  plu.application_id = b_app_id
      and    plu.name = b_plugin
    ;
    
    cursor c_pla(b_app_id  in number
                ,b_plugin  in varchar2
                )
    is            
      select pla.prompt
      ,      decode(pla.attribute_sequence
                   ,1,plu.attribute_01
                   ,2,plu.attribute_02
                   ,3,plu.attribute_03
                   ,4,plu.attribute_04
                   ,5,plu.attribute_05
                   ,6,plu.attribute_06
                   ,7,plu.attribute_07
                   ,8,plu.attribute_08
                   ,9,plu.attribute_09
                   ,10,plu.attribute_10
                   ,11,plu.attribute_11
                   ,12,plu.attribute_12
                   ,13,plu.attribute_13
                   ,14,plu.attribute_14
                   ,plu.attribute_15) waarde
      ,      pla.attribute_type
      ,      pla.plugin_attribute_id  
      ,      pla.help_text
      from   apex_appl_plugins plu
      join   apex_appl_plugin_attributes pla
      on     plu.name = pla.plugin_name
      and    plu.application_id = pla.application_id
      where  pla.attribute_scope = 'Application'
      and    plu.application_id = b_app_id
      and    plu.name = b_plugin
      order by pla.display_sequence
    ;
      
    type l_pla_table_type is table of c_pla%rowtype
    index by pls_integer;
    l_pla_table l_pla_table_type;
    
    cursor c_ple(b_app_id      in number
                ,b_plugin_name in varchar2
                )
    is
      select ple.display_name
      from   apex_appl_plugin_events ple
      where  ple.plugin_name = b_plugin_name
      and    ple.application_id = b_app_id
    ;
    
    c_item_type        constant varchar2(20):='ITEM TYPE';
    c_region_type      constant varchar2(20):='REGION TYPE';
    c_process_type     constant varchar2(20):='PROCESS TYPE';
    c_dynamic_type     constant varchar2(20):='DYNAMIC ACTION';
        
    l_sub_attributes            p_region.attribute_05%type := p_region.attribute_05;
    l_events_temp               p_plugin.attribute_01%type := p_plugin.attribute_01;
    l_event_temp                p_plugin.attribute_02%type := p_plugin.attribute_02;
    l_main_temp                 p_plugin.attribute_05%type := p_plugin.attribute_05;
    l_plugin_attributes_temp    p_plugin.attribute_06%type := p_plugin.attribute_06;
    l_p_attr_help_temp          p_plugin.attribute_07%type := p_plugin.attribute_07;
    l_components_temp           p_plugin.attribute_08%type := p_plugin.attribute_08;
    l_comp_attributes_temp      p_plugin.attribute_09%type := p_plugin.attribute_09;
    l_comp_attr_help_temp       p_plugin.attribute_10%type := p_plugin.attribute_10;
    l_sub_components_temp       p_plugin.attribute_11%type := p_plugin.attribute_11;
    l_sub_comp_attributes_temp  p_plugin.attribute_12%type := p_plugin.attribute_12;
    l_sub_comp_attr_help_temp   p_plugin.attribute_13%type := p_plugin.attribute_13;
    l_no_attributes             p_plugin.attribute_14%type := p_plugin.attribute_14;
    l_about_url                 p_plugin.attribute_15%type := p_plugin.attribute_15;
    
    l_extra_info                p_region.source%type :=p_region.source;
    
    col_plu_plugin_type         apex_appl_plugins.plugin_type%type;
    col_plu_standard_attributes apex_appl_plugins.standard_attributes%type;
    col_plu_display_name        apex_appl_plugins.display_name%type;
    col_plu_help_text           apex_appl_plugins.help_text%type;
    col_plu_name                apex_appl_plugins.name%type := p_plugin_name;
    col_plu_version_identifier  apex_appl_plugins.version_identifier%type;
    col_plu_about_url           apex_appl_plugins.about_url%type;
    col_plu_plugin_id           apex_appl_plugins.plugin_id%type;
    col_reg_static_id           apex_application_page_regions.static_id%type;
    
    l_main_html                 clob;
    l_components_html           clob;
    l_attributes                varchar2(32767);
    l_standard_lists            varchar2(4000);
    l_standard_labels           varchar2(4000);
    l_standard                  varchar2(4000);
    l_events                    varchar2(32767);
    l_full_url                  varchar2(520);
    l_length                    number;
    l_off_set                   number;
    l_segment                   varchar2(32767);
  begin
     /*Open the main lob that is going to hold the html*/
    sys.dbms_lob.createtemporary(l_main_html,true);
    sys.dbms_lob.open(l_main_html,sys.DBMS_LOB.LOB_READWRITE);
    
    apex_debug.message('Start rendering '||col_plu_name);
    col_reg_static_id := nvl(p_region.static_id,p_region.id);
    
    /*Print the region source which holds extra information*/
    l_main_html := replace(l_main_temp,'#EXTRA_INFO#',l_extra_info); 
    /*Plugin elements*/
    open  c_plu(wwv_flow.g_flow_id,col_plu_name);
    fetch c_plu
    into  col_plu_plugin_type
    ,     col_plu_standard_attributes
    ,     col_plu_display_name
    ,     col_plu_help_text
    ,     col_plu_version_identifier
    ,     col_plu_about_url
    ;
    close c_plu;
    l_full_url := case when instr(col_plu_about_url,'http') =0
                  then 'http://'||col_plu_about_url
                  else col_plu_about_url
                  end;
    l_main_html := replace(l_main_html,'#TITLE#',col_plu_display_name);
    l_main_html := replace(l_main_html,'#HELP_TEXT#',col_plu_help_text);
    l_main_html := replace(l_main_html,'#VERSION#',col_plu_version_identifier);
    apex_debug.message('Render about url');
    if col_plu_about_url is not null
    then
      l_main_html := replace(l_main_html,'#ABOUT_URL#',replace(replace(l_about_url,'#FULL_URL#',l_full_url),'#URL#',col_plu_about_url));
    else
      l_main_html := replace(l_main_html,'#ABOUT_URL#',null);
    end if;
    /*Plugin events*/
    apex_debug.message('Render events');
    for r_ple in c_ple(wwv_flow.g_flow_id,col_plu_name)
    loop
      l_events := l_events||replace(l_event_temp,'#NAME#',r_ple.display_name);
    end loop;
    apex_debug.message('Replace events '||l_events);
    if l_events is not null
    then
      l_events := replace(l_events_temp,'#EVENTS#',l_events);
    end if;
    l_main_html := replace(l_main_html,'#EVENTS#',l_events);
    apex_debug.message('After events');
 
    l_length := sys.dbms_lob.getlength(l_main_html);
    apex_debug.message('Lenght of main lob'||l_length);
    /*Print the component with their information*/
    /*Open the components lob that is going to hold the html of the components*/
    sys.dbms_lob.createtemporary(l_components_html,true);
    sys.dbms_lob.open(l_components_html,sys.dbms_lob.LOB_READWRITE);
    
    case upper(col_plu_plugin_type) 
      when c_item_type
      then
        render_item(p_plugin                   => col_plu_name
                   ,p_plu_standard_attributes  => col_plu_standard_attributes
                   ,p_page_id                  => p_page_id
                   ,p_components_template      => l_components_temp
                   ,p_comp_attributes_temp     => l_comp_attributes_temp
                   ,p_comp_attr_help_temp      => l_comp_attr_help_temp
                   ,p_components_html          => l_components_html
                   );
      when c_process_type
      then
        render_process(p_plugin                   => col_plu_name
                      ,p_plu_standard_attributes  => col_plu_standard_attributes
                      ,p_page_id                  => p_page_id
                      ,p_components_template      => l_components_temp
                      ,p_comp_attributes_temp     => l_comp_attributes_temp
                      ,p_comp_attr_help_temp      => l_comp_attr_help_temp
                      ,p_components_html          => l_components_html
                      );
      when c_region_type
      then
        render_region(p_plugin                   => col_plu_name
                     ,p_plu_standard_attributes  => col_plu_standard_attributes
                     ,p_page_id                  => p_page_id
                     ,p_components_template      => l_components_temp
                     ,p_comp_attributes_temp     => l_comp_attributes_temp
                     ,p_comp_attr_help_temp      => l_comp_attr_help_temp
                     ,p_sub_components_temp      => l_sub_components_temp 
                     ,p_sub_comp_attributes_temp => l_sub_comp_attributes_temp 
                     ,p_sub_comp_attr_help_temp  => l_sub_comp_attr_help_temp
                     ,p_components_html          => l_components_html
                     ,p_sub_attributes           => l_sub_attributes
                     );
      when c_dynamic_type
      then
        render_dynamic_action(p_plugin                   => col_plu_name
                             ,p_plu_standard_attributes  => col_plu_standard_attributes
                             ,p_page_id                  => p_page_id
                             ,p_components_template      => l_components_temp
                             ,p_comp_attributes_temp     => l_comp_attributes_temp
                             ,p_comp_attr_help_temp      => l_comp_attr_help_temp
                             ,p_sub_components_temp      => l_sub_components_temp 
                             ,p_sub_comp_attributes_temp => l_sub_comp_attributes_temp 
                             ,p_sub_comp_attr_help_temp  => l_sub_comp_attr_help_temp
                             ,p_components_html          => l_components_html
                             );
    else
      null;
    end case;
    apex_debug.message('Components renderd');
    l_main_html := clob_replace(l_main_html,'#COMPONENTS#',l_components_html);
    apex_debug.message('Components replaced');
        /*Plugin attributes*/
    for r_pla in c_pla(wwv_flow.g_flow_id,col_plu_name)
    loop
      apex_debug.message('Plugin attr. '||r_pla.prompt);
      l_attributes := l_attributes
                   || render_attribute(r_pla.prompt
                                      ,r_pla.waarde
                                      ,r_pla.attribute_type
                                      ,l_plugin_attributes_temp
                                      ,l_p_attr_help_temp
                                      ,r_pla.help_text
                                      ,r_pla.plugin_attribute_id
                                      );
    end loop;
    /*Standard items*/
    apex_debug.message('Start standard items');  
    case upper(col_plu_plugin_type) 
      when c_item_type
      then
        apex_debug.message('Standard attributes item');
        l_standard_lists := 'VISIBLE:SESSION_STATE:SOURCE:READONLY:QUICKPICK:ENCRYPT';
        l_standard_labels := 'Is visble widget:Session state changeable:Has Source Attributes:Has Read Only Attribute:Has Quick Pick Attributes:Has Encrypt Session State Attribute';
        l_standard := col_plu_standard_attributes;
        l_attributes := l_attributes
                     || render_attribute('Standard attributes'
                                  ,rtrim(l_standard,':')
                                  ,c_standard_type
                                  ,l_plugin_attributes_temp
                                  ,l_p_attr_help_temp
                                  ,null
                                  ,null
                                  ,l_standard_lists
                                  ,l_standard_labels
                                  ,':'
                                  );
      when c_region_type
      then
        apex_debug.message('Standard attributes region');
        l_standard_lists :='SOURCE_SQL:SOURCE_PLAIN:SOURCE_REQUIRED';
        l_standard_labels :='Region Source is SQL Statement:Region Source is Plain Text:Region Source Required';
        l_attributes := l_attributes
                    || render_attribute('Standard attributes'
                                  ,col_plu_standard_attributes
                                  ,c_standard_type
                                  ,l_plugin_attributes_temp
                                  ,l_p_attr_help_temp
                                  ,null
                                  ,null
                                  ,l_standard_lists
                                  ,l_standard_labels
                                  ,':'
                                  );
      when c_dynamic_type
      then
        apex_debug.message('Standard attributes dynamic action');
        l_standard_lists :='ITEM:REGION:DOM_OBJECT:JQUERY_SELECTOR:TRIGGERING_ELEMENT:EVENT_SOURCE:REQUIRED:ONLOAD:STOP_EXECUTION_ON_ERROR';
        l_standard_labels :='For Item(s):For Region:For DOM Object:For jQuery Selector:For Triggering Element:For Event Source:Affected Element Required:Check "Fire on page load":Has Stop Execution on Error Attribute';
        l_attributes := l_attributes
                     || render_attribute('Standard attributes'
                                  ,col_plu_standard_attributes
                                  ,c_standard_type
                                  ,l_plugin_attributes_temp
                                  ,l_p_attr_help_temp
                                  ,null
                                  ,null
                                  ,l_standard_lists
                                  ,l_standard_labels
                                  ,':'
                                  );
      else
        null;
    end case;
    l_main_html := replace(l_main_html,'#ATTRIBUTES#',nvl(l_attributes,l_no_attributes)); 
    apex_debug.message('End standard items');
    l_main_html := replace(l_main_html,'#ID#',replace(col_plu_name,'.','_'));
    sys.dbms_lob.close(l_components_html);
    sys.dbms_lob.freetemporary(l_components_html);
    /*Print the html to the page*/
    sys.htp.p('<div id="net_vanbaren_demo_plugin_'||col_reg_static_id||'_catch">');
    l_length := sys.dbms_lob.getlength(l_main_html);
    apex_debug.message('Length '||l_length);
    l_off_set := 1;
    while l_off_set < l_length loop
      l_segment := sys.dbms_lob.substr(l_main_html,least(32767,l_length),l_off_set);
      sys.htp.p(l_segment);
      l_off_set := l_off_set+32767; 
    end loop;
    sys.htp.p('</div>');
    sys.dbms_lob.freetemporary(l_main_html);
    
  end;
  function render_demo_region(p_region               in apex_plugin.t_region
                             ,p_plugin               in apex_plugin.t_plugin
                             ,p_is_printer_friendly  in boolean)
  return apex_plugin.t_region_render_result
  is

    l_result                    apex_plugin.t_region_render_result;
    l_plugin_name_type          p_region.attribute_01%type := p_region.attribute_01;
    l_plugin                    p_region.attribute_02%type := p_region.attribute_02;
    l_page_id_type              p_region.attribute_03%type := p_region.attribute_03;
    l_page_id_source            p_region.attribute_04%type := p_region.attribute_04;
    
    col_reg_static_id           apex_application_page_regions.static_id%type;
    l_js_files_table            apex_application_global.vc_arr2;
    l_css_files_table           apex_application_global.vc_arr2;
    col_plu_name                apex_appl_plugins.name%type;   
    l_skip_extentions           boolean;
    l_items_to_submit           apex_application_page_regions.ajax_items_to_submit%type;
    l_page_id                   number;
  begin
    /* Debug information*/
    if apex_application.g_debug
    then
      apex_plugin_util.
       debug_region(p_plugin               => p_plugin,
                    p_region               => p_region,
                    p_is_printer_friendly  => p_is_printer_friendly);
    end if;
    
    /*Determine the page id where the demonstrated component(s) are located*/
    if l_page_id_type = 'C'
    then
      l_page_id := wwv_flow.g_flow_step_id;
    elsif l_page_id_type = 'S'
    then
      l_page_id := l_page_id_source;
    elsif l_page_id_type = 'I'
    then
      l_page_id := v(l_page_id_source);
      l_items_to_submit := l_page_id_source;
    else
      l_page_id := wwv_flow.g_flow_step_id;
    end if;
    
    /*Determine the internal name of the plugin to be demonstrated*/
    if l_plugin_name_type = 'S'
    then
      col_plu_name := l_plugin;
    elsif l_plugin_name_type = 'I'
    then
      col_plu_name := v(l_plugin);
      l_items_to_submit := ltrim(l_items_to_submit||','||l_plugin,',');
    else
      col_plu_name := l_plugin;
    end if;
    col_reg_static_id := nvl(p_region.static_id,p_region.id);
    render_html(p_region,p_plugin,l_page_id,col_plu_name);
    /*Add after refresh trigger to the region*/
    apex_javascript.add_onload_code('apex.jQuery("#'||col_reg_static_id||'").live("apexrefresh",function(){net_vanbaren_demo_pugin_refresh('||apex_javascript.add_value(col_reg_static_id)||apex_javascript.add_value(wwv_flow_plugin.get_ajax_identifier)||apex_javascript.add_value(l_items_to_submit,false)||');});');
    apex_debug_message.log_message('End rendering');
    return l_result ;
  end render_demo_region;
  
  function ajax_demo_region(p_region in apex_plugin.t_region
                           ,p_plugin in apex_plugin.t_plugin
                           )
  return apex_plugin.t_region_ajax_result
  is
    l_result                    apex_plugin.t_region_ajax_result;
    l_plugin_name_type          p_region.attribute_01%type := p_region.attribute_01;
    l_plugin                    p_region.attribute_02%type := p_region.attribute_02;
    l_page_id_type              p_region.attribute_03%type := p_region.attribute_03;
    l_page_id_source            p_region.attribute_04%type := p_region.attribute_04;
    l_page_id                   number;
    col_plu_name                apex_appl_plugins.name%type;
  begin
    /*Determine the page id where the demonstrated component(s) are located*/
    if l_page_id_type = 'C'
    then
      l_page_id := wwv_flow.g_flow_step_id;
    elsif l_page_id_type = 'S'
    then
      l_page_id := l_page_id_source;
    elsif l_page_id_type = 'I'
    then
      l_page_id := v(l_page_id_source);
    else
      l_page_id := wwv_flow.g_flow_step_id;
    end if;
    
    /*Determine the internal name of the plugin to be demonstrated*/
    if l_plugin_name_type = 'S'
    then
      col_plu_name := l_plugin;
    elsif l_plugin_name_type = 'I'
    then
      col_plu_name := v(l_plugin);
    else
      col_plu_name := l_plugin;
    end if;
    render_html(p_region,p_plugin,l_page_id,col_plu_name);
    return l_result;
  end;
end apr$demo_plugin;

/
