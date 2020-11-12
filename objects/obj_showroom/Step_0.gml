/// @description 

if the_index != -1 && the_list != -1 && not item_set {
	the_item	= the_list[| the_index];
	
	if room == rm_select_scenery {
		sub_list	= the_item;
		the_item	= sub_list[| irandom(ds_list_size(the_item)-1)];
		best_scores	= scr_load_stage_scores(the_item, false);
	}

	
	if sprite_get_number(the_item[? "showroom"]) > 1 {
		alarm_set(0,alarm_speed);
	}
	
	item_set	= true;
}

if fade {
	current_alpha -= my_sign / (fade_time * game_get_speed(gamespeed_fps));
	
	if current_alpha <= 0 {
		
		if current_subimg  == sprite_get_number(the_item[? "showroom"]) - 1 {
			current_subimg	= 0;
		}
		else {
			current_subimg++;
		}
		
		my_sign	= -1;
	}
	
	if current_alpha >= 1 {
		fade = false;
		alarm_set(0,alarm_speed);
	}
}

if vspeed < 0 {
	if y + room_height <= last_y {
		y		= last_y - room_height;
		vspeed	= 0;
		
		if y == 0 {
			switch room {
				case rm_select_car:
					global.player_profile[? "car"]			= the_item;
					global.player_profile[? "car_index"]	= the_index;
					break;
				case rm_select_scenery:
					global.race_data[? "track_index"]		= the_index;
					break;
			}
		}
	}
}

if vspeed > 0 {
	if y - room_height >= last_y {
		y		= last_y + room_height;
		vspeed	= 0;
		
		if y == 0 {
			switch room {
				case rm_select_car:
					global.player_profile[? "car"]			= the_item;
					global.player_profile[? "car_index"]	= the_index;
					break;
				case rm_select_scenery:
					global.race_data[? "track_index"]		= the_index;
					break;
			}
		}
	}
}