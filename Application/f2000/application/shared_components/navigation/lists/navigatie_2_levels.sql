--application/shared_components/navigation/lists/navigatie_2_levels
 
begin
 
wwv_flow_api.create_list (
  p_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Navigatie 2 levels',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 5922712080829827 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>1,
  p_list_item_link_text=> 'Items',
  p_list_item_link_target=> '',
  p_list_item_icon=> '1.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924090240829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'Selectlist domain',
  p_list_item_link_target=> 'f?p=&APP_ID.:DOMAIN:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922712080829827 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '5',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5922905361829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>2,
  p_list_item_link_text=> 'Dynamic action',
  p_list_item_link_target=> '',
  p_list_item_icon=> '2.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '4,6,7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924683206829834 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>100,
  p_list_item_link_text=> 'Get adres',
  p_list_item_link_target=> 'f?p=&APP_ID.:GET_ADRES:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922905361829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '4',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5926199808829838 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>150,
  p_list_item_link_text=> 'Set multiple values',
  p_list_item_link_target=> 'f?p=&APP_ID.:MRSETVALUES:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922905361829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '6',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5926489273829838 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>160,
  p_list_item_link_text=> 'Cascading lov',
  p_list_item_link_target=> 'f?p=&APP_ID.:MRCASCADINGLOV:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5922905361829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5923192898829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>3,
  p_list_item_link_text=> 'Regions',
  p_list_item_link_target=> '',
  p_list_item_icon=> '3.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '2,3',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924412868829834 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>90,
  p_list_item_link_text=> 'Dialog',
  p_list_item_link_target=> 'f?p=&APP_ID.:DIALOG:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923192898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '2',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5925305383829837 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>130,
  p_list_item_link_text=> 'Tab submenu',
  p_list_item_link_target=> 'f?p=&APP_ID.:TABSUBMENU:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923192898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '3',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5925603238829837 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>135,
  p_list_item_link_text=> 'Tab menu list',
  p_list_item_link_target=> 'f?p=&APP_ID.:TABMENULIST:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923192898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5927388180829840 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>190,
  p_list_item_link_text=> 'Demo plugins',
  p_list_item_link_target=> 'f?p=&APP_ID.:DEMO:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923192898829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5923499989829832 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>5,
  p_list_item_link_text=> 'Process',
  p_list_item_link_target=> '',
  p_list_item_icon=> '5.jpg',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '8',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 5924988555829834 + wwv_flow_api.g_id_offset,
  p_list_id=> 5922503692829821 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>120,
  p_list_item_link_text=> 'Dynamic succes message',
  p_list_item_link_target=> 'f?p=&APP_ID.:DYNAMICMESSAGE:&SESSION.::&DEBUG.::::',
  p_parent_list_item_id=> 5923499989829832 + wwv_flow_api.g_id_offset,
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_current_for_pages=> '6',
  p_list_item_owner=> '');
 
null;
 
end;
/

