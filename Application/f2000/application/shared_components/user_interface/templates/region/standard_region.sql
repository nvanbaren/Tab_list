--application/shared_components/user_interface/templates/region/standard_region
prompt  ......region template 39422994254603256
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 39422984254603256 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="region-container ui-widget standard-report" id="#REGION_STATIC_ID#"'||unistr('\000a')||
'#REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="header-container ui-widget-header ui-corner-all ui-helper-clearfix">'||unistr('\000a')||
'    <div class="title-container">#TITLE#</div>'||unistr('\000a')||
'    <div class="button-container ui-widget">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Standard region'
 ,p_theme_id => 102
 ,p_theme_class_id => 9
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
