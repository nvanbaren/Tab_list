--application/shared_components/user_interface/lov/jquery_ui_themes
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 2652513466855582 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'JQUERY UI THEMES',
  p_lov_query=> '.'||to_char(2652513466855582 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2652820312855590 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'Base',
  p_lov_return_value=>'base',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2653120048855626 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'Black tie',
  p_lov_return_value=>'black-tie',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2653397958855626 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>3,
  p_lov_disp_value=>'Blitzer',
  p_lov_return_value=>'blitzer',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2653694125855628 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>4,
  p_lov_disp_value=>'Cupertino',
  p_lov_return_value=>'cupertino',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2654006859855628 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>5,
  p_lov_disp_value=>'Dark hive',
  p_lov_return_value=>'dark-hive',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2654291675855628 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>6,
  p_lov_disp_value=>'Dot luv',
  p_lov_return_value=>'dot-luv',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2654601934855628 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>7,
  p_lov_disp_value=>'Eggplant',
  p_lov_return_value=>'eggplant',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2654921903855629 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>8,
  p_lov_disp_value=>'Excite bike',
  p_lov_return_value=>'excite-bike',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2655197607855629 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>9,
  p_lov_disp_value=>'Flick',
  p_lov_return_value=>'flick',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2655507305855629 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'Hot sneaks',
  p_lov_return_value=>'hot-sneaks',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2655814659855629 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>11,
  p_lov_disp_value=>'Humanity',
  p_lov_return_value=>'humanity',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2656092256855629 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>12,
  p_lov_disp_value=>'Le frog',
  p_lov_return_value=>'le-frog',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2656412207855631 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>13,
  p_lov_disp_value=>'Mint choc',
  p_lov_return_value=>'mint-choc',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2656721956855631 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>14,
  p_lov_disp_value=>'Overcast',
  p_lov_return_value=>'overcast',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2657004475855631 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>15,
  p_lov_disp_value=>'Pepper grinder',
  p_lov_return_value=>'pepper-grinder',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2657296569855631 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>16,
  p_lov_disp_value=>'Redmond',
  p_lov_return_value=>'redmond',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2657607054855631 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'Smoothness',
  p_lov_return_value=>'smoothness',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2657921280855631 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>30,
  p_lov_disp_value=>'South street',
  p_lov_return_value=>'south-street',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2658194527855632 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>40,
  p_lov_disp_value=>'Start',
  p_lov_return_value=>'start',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2658498689855632 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>50,
  p_lov_disp_value=>'Sunny',
  p_lov_return_value=>'sunny',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2658813498855632 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>60,
  p_lov_disp_value=>'Swanky purse',
  p_lov_return_value=>'swanky-purse',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2659119667855632 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>70,
  p_lov_disp_value=>'Trontastic',
  p_lov_return_value=>'trontastic',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2659419117855632 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>80,
  p_lov_disp_value=>'Darkness',
  p_lov_return_value=>'ui-darkness',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2659704318855632 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>90,
  p_lov_disp_value=>'Lightness',
  p_lov_return_value=>'ui-lightness',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2659990425855634 + wwv_flow_api.g_id_offset,
  p_lov_id=>2652513466855582 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>100,
  p_lov_disp_value=>'Vader',
  p_lov_return_value=>'vader',
  p_lov_data_comment=> '');
 
null;
 
end;
/

prompt  ...Application Trees
--
