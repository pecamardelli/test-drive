/// @description 

switch room {
	case main_menu:
		if keyboard_check_pressed(vk_escape) and global.window_count == 0 {
			scr_exit_window();
		}	
		break;
	case rm_select_car:
		if keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left) {
			scr_fade_screen("out",global.fade_duration,-1,main_menu);
		}
	
		if keyboard_check_pressed(vk_down) {
			if global.player_profile[? "car_index"] < ds_list_size(global.car_list) - 1 {
				with obj_showroom {
					if y mod room_height == 0 {
						last_y	= y;
						vspeed	= -10;
						y--;
					}
				};
			}
		}
	
		if keyboard_check_pressed(vk_up) {
			if global.player_profile[? "car_index"] > 0 {
				with obj_showroom {
					if y mod room_height == 0 {
						//move_y	-= room_height;
						last_y	= y;
						vspeed	= 10;
						y++;
					}
				};
			}
		}
		break;
	case rm_select_scenery:
		if keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left) {
			scr_fade_screen("out",global.fade_duration,-1,main_menu);
		}
	
		if keyboard_check_pressed(vk_down) {
			if global.race_data[? "track_index"] < ds_list_size(global.track_list) - 1 {
				with obj_showroom {
					if y mod room_height == 0 {
						last_y	= y;
						vspeed	= -10;
						y--;
					}
				};
			}
		}
	
		if keyboard_check_pressed(vk_up) {
			if global.race_data[? "track_index"] > 0 {
				with obj_showroom {
					if y mod room_height == 0 {
						//move_y	-= room_height;
						last_y	= y;
						vspeed	= 10;
						y++;
					}
				};
			}
		}
		break;
	case race_track:
		if keyboard_check_pressed(vk_escape) {
			scr_fade_screen("out",global.fade_duration,-1,main_menu);
		}
		
		if keyboard_check_pressed(ord("P")) {
			if not instance_number(obj_startcountdown) {
				if global.pause {
					instance_activate_object(obj_car);
					instance_activate_object(obj_traffic_car);
				}
				else {
					instance_deactivate_object(obj_car);
					instance_deactivate_object(obj_traffic_car);
				}
				global.pause	= 1 - global.pause;
				keyboard_clear(ord("P"));
			}
		}
		break;
	case rm_stage_finish:
		if keyboard_check_pressed(vk_escape) {
			scr_fade_screen("out",global.fade_duration,-1,main_menu);
		}
		break;
	case rm_game_options:
		if keyboard_check_pressed(vk_escape) {
			scr_fade_screen("out",global.fade_duration,-1,main_menu);
		}
		break;
}

if room != race_track {
	if not instance_position(mouse_x,mouse_y,all) {
		cursor_sprite	= spr_icon_cursor;
	}
}
else {
	cursor_sprite	= -1;
}
