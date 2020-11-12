/// @description	Adds a slot to the opponent list
function scr_add_opponent() {

	var opps_x		= 1220;
	var opps_y		= 75;
	var opps_width	= 660;
	var opps_height	= 60;
	var opps_sep	= 10;

	var entries		= instance_number(obj_list_entry);

	if entries < global.max_opponents {
		var entry							= instance_create_depth(opps_x,opps_y+(opps_height+opps_sep)*entries,-10,obj_list_entry);
		entry.width							= opps_width;
		entry.height						= opps_height;
		entry.index							= -1;
		entry.with_close_button				= true;
		entry.close_button_click_action		= scr_remove_opponent;
		entry.close_button_destroy_action	= scr_rearrange_opponent_list;
		entry.click_action					= scr_opponent_click;
		entry.draw_script					= scr_contestants_draw_script;
	}


}
