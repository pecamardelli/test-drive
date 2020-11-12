///	@description	Show available cars
function scr_car_click_window() {

	var car_list	= global.car_list;

	var entry_x			= x - sprite_get_width(sprite_index) / 2 + 40;
	var entry_y			= y - sprite_get_height(sprite_index) / 2 + 100;
	var initial_y		= entry_y;
	var entry_width		= 660;
	var entry_height	= 60;
	var entry_sep		= 10;
	var entries_to_show	= 10;
	var entries			= ds_list_size(car_list);
	var scroll_slots	= entries - entries_to_show;

	for(var i=0;i<entries;i++){
		var entry				= instance_create_depth(entry_x,entry_y,depth-1,obj_list_entry);
		entry.car				= car_list[| i];
		entry.width				= entry_width;
		entry.height			= entry_height;
		entry.separation		= entry_sep;
		entry.visible_from_y	= initial_y -5;
		entry.visible_to_y		= initial_y + (entry_height + entry_sep) * (entries_to_show - 1) + 5;
		entry.initial_y			= entry_y;
		entry.draw_script		= scr_car_draw_script;
		
		if scroll_slots > 0 {
			entry.scrollable	= true;
			entry.scroll_slots	= scroll_slots;
		}
		
		//entry.max_y				= entry_y - entries * (entry_height + entry_sep);
		//entry.with_close_button	= true;
		entry.index				= i;
		entry.entry_id			= entry_id;
		entry.click_action		= scr_change_car;
		entry_y					+= entry_height + entry_sep;
	}




}
