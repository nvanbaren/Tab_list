--application/shared_components/user_interface/templates/label/optional_with_help
prompt  ......label template 39485805441634504
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 39485795441634504 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999" class="label help"><a class="label" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999"><span>',
  p_template_body2=>'</span></a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="ui-state-error ui-corner-all validatie">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 102,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
