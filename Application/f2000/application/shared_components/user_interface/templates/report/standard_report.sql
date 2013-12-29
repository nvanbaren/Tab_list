--application/shared_components/user_interface/templates/report/standard_report
prompt  ......report template 39457539598622998
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER#" class="border-default cell-padding"> #COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 39457499598623000 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="standardReport" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="ui-widget-content ui-corner-all standardReport">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="border-default cell-padding ui-widget-header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"><span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-e"></span>'||unistr('\000a')||
'<span class="ui-button-text">#PAGINATION_NEXT#</span></a>',
  p_previous_page_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"><span class="ui-button-icon-primary ui-icon ui-icon-arrowthick-1-w"></span>'||unistr('\000a')||
'<span class="ui-button-text">#PAGINATION_PREVIOUS#</span></a>',
  p_next_set_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 102,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 39457499598623000 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr class="ui-state-default">',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
