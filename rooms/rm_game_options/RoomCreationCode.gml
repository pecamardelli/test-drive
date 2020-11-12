scr_fade_screen("in",global.fade_duration,-1,-1);

var opps_x		= 1220;
var opps_y		= 75;
var opps_width	= 660;
var opps_height	= 60;
var opps_sep	= 10;

var opp_list		= global.race_data[? "contestants"];
var opp_list_size	= ds_list_size(opp_list);

var add_opp				= instance_create_depth(1818+sprite_get_width(spr_plus_icon)/2,34+sprite_get_height(spr_plus_icon)/2,depth-1,obj_generic);
add_opp.sprite_index	= spr_plus_icon;
add_opp.click_action	= scr_add_opponent;

for(var i=0;i<opp_list_size;i++){
	var entry							= instance_create_depth(opps_x,opps_y,-10,obj_list_entry);
	entry.driver						= opp_list[| i];
	entry.width							= opps_width;
	entry.height						= opps_height;
	entry.close_button_click_action		= scr_remove_opponent;
	entry.close_button_destroy_action	= scr_rearrange_opponent_list;
	entry.with_close_button				= true;
	entry.draw_script					= scr_contestants_draw_script;
	entry.index							= i;
	entry.click_action					= scr_opponent_click;
	opps_y								+= opps_height + opps_sep;
}

var min_x	= 505;
var max_x	= 855;

var sfx_button				= instance_create_depth(min_x + (max_x-min_x) * global.SFX,175,depth-1,obj_generic);
sfx_button.sprite_index		= spr_menu_bar_button;
sfx_button.min_x			= min_x;
sfx_button.max_x			= max_x;
sfx_button.param			= "sfx";
sfx_button.left_down_action	= scr_volume_bar_pos;
sfx_button.draw_script		= scr_draw_param;

var car_vol					= instance_create_depth(min_x + (max_x-min_x) * global.car_vol,275,depth-1,obj_generic);
car_vol.sprite_index		= spr_menu_bar_button;
car_vol.min_x				= min_x;
car_vol.max_x				= max_x;
car_vol.param				= "car";
car_vol.left_down_action	= scr_volume_bar_pos;
car_vol.draw_script			= scr_draw_param;

var traffic_vol					= instance_create_depth(min_x + (max_x-min_x) * global.traffic_vol,375,depth-1,obj_generic);
traffic_vol.sprite_index		= spr_menu_bar_button;
traffic_vol.min_x				= min_x;
traffic_vol.max_x				= max_x;
traffic_vol.param				= "traffic";
traffic_vol.left_down_action	= scr_volume_bar_pos;
traffic_vol.draw_script			= scr_draw_param;

var music_vol				= instance_create_depth(min_x + (max_x-min_x) * global.music_vol,475,depth-1,obj_generic);
music_vol.sprite_index		= spr_menu_bar_button;
music_vol.min_x				= min_x;
music_vol.max_x				= max_x;
music_vol.param				= "music";
music_vol.left_down_action	= scr_volume_bar_pos;
music_vol.draw_script		= scr_draw_param;