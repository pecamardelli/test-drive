///	@description	Show available opponents
function scr_opponent_click_window() {

	var contestant_list	= global.race_data[? "contestants"];

	var entry_x			= x - sprite_get_width(sprite_index) / 2 + 40;
	var entry_y			= y - sprite_get_height(sprite_index) / 2 + 100;
	var initial_y		= entry_y;
	var entry_width		= 660;
	var entry_height	= 60;
	var entry_sep		= 10;
	var entries_to_show	= 10;
	var entries			= ds_list_size(global.opp_names) - ds_list_size(contestant_list);
	var scroll_slots	= entries - entries_to_show;

	for(var i=0;i<ds_list_size(global.opp_names);i++){
		var name_found		= false;
	
		for(var j=0;j<ds_list_size(contestant_list);j++){
			var the_contestant	= contestant_list[| j];
			if global.opp_names[| i]	== the_contestant[? "name"] {
				name_found	= true;
				break;
			}
		}
	
		if not name_found {
			var entry				= instance_create_depth(entry_x,entry_y,depth-1,obj_list_entry);
			entry.driver			= global.opp_list[? global.opp_names[| i]];
			entry.width				= entry_width;
			entry.height			= entry_height;
			entry.separation		= entry_sep;
			entry.visible_from_y	= initial_y -5;
			entry.visible_to_y		= initial_y + (entry_height + entry_sep) * (entries_to_show - 1) + 5;
			entry.initial_y			= entry_y;
			entry.draw_script		= scr_opponent_draw_script;
		
			if scroll_slots > 0 {
				entry.scrollable	= true;
				entry.scroll_slots	= scroll_slots;
			}
		
			//entry.max_y				= entry_y - entries * (entry_height + entry_sep);
			//entry.with_close_button	= true;
			entry.index				= i;
			entry.entry_id			= entry_id;
			entry.click_action		= scr_change_opponent;
			entry_y					+= entry_height + entry_sep;
		}
	}




}
