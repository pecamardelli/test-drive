var menu_entries	= 4;
var sep				= (room_width - sprite_get_width(spr_your_car) * menu_entries) / (menu_entries+1);

var menu_x			= sep + sprite_get_width(spr_your_car)/2;
var menu_y			= 620 + sprite_get_height(spr_your_car)/2;

var menu_your_car					= instance_create_depth(menu_x,menu_y,-10,obj_menu_index);
menu_your_car.sprite_index			= spr_your_car;

//var the_car	= global.player_profile[? "car"];
var the_car	= global.car_list[| global.player_profile[? "car_index"]];

menu_your_car.inner_img				= the_car[? "thumb"];
menu_your_car.y_offset				= 30;
menu_your_car.on_click_go_to		= rm_select_car;

menu_x	+= sep + sprite_get_width(spr_your_car);

var menu_select_track				= instance_create_depth(menu_x,menu_y,-10,obj_menu_index);
menu_select_track.sprite_index		= spr_scenery;

var the_track	= global.track_list[| 0];
var the_stage	= the_track[| 0];

menu_select_track.inner_img			= the_stage[? "thumb"];
//menu_select_track.on_click_go_to	= rm_select_scenery;
menu_select_track.on_click_go_to	= rm_select_scenery;

menu_x	+= sep + sprite_get_width(spr_your_car);

var menu_options					= instance_create_depth(menu_x,menu_y,-10,obj_menu_index);
menu_options.sprite_index			= spr_options;
menu_options.on_click_go_to			= rm_game_options;

menu_x	+= sep + sprite_get_width(spr_your_car);

var menu_go_race					= instance_create_depth(menu_x,menu_y,-10,obj_menu_index);
menu_go_race.sprite_index			= spr_race;
menu_go_race.on_click_go_to			= race_track;

/*
var menu_exit_game					= instance_create_depth(room_width/2,room_height/2-40,-10,obj_menu_index);
menu_exit_game.sprite_index			= spr_quit_button;
menu_exit_game.click_action		= -100;
*/

scr_fade_screen("in",global.fade_duration,-1,-1);

var cont_list	= global.race_data[? "contestants"];
show_debug_message("Showing driver list ")
for(var k=0;k<ds_list_size(cont_list);k++){
	var the_driver	= cont_list[| k];
	var the_car		= the_driver[? "car"];
	show_debug_message(the_driver[? "name"] + " - " + string(the_car[? "maker"]) + " " + string(the_car[? "model"]));
}