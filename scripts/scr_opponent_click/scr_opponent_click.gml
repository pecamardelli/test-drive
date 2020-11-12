///	@description	Open a window with showing a list of remaining opponents
function scr_opponent_click() {

	if global.window_count	== 0 {
		var the_window			= instance_create_depth(room_width/2,room_height/2,-1000,obj_window);
		the_window.sprite_index	= spr_window_700x800;
		the_window.entry_id		= id;
	
		if mouse_x < x + 380 or driver == -1 {
			the_window.script		= scr_opponent_click_window;
			the_window.caption		= "AVAILABLE OPPONENTS";
		}
		else if mouse_x < x + 580 {
			//if driver > -1 {
				the_window.script		= scr_car_click_window;
				the_window.caption		= "SELECT A CAR";
			/*}
			else {
				the_window.script		= scr_opponent_click_window;
				the_window.caption		= "AVAILABLE OPPONENTS";
			}*/
		}
	}


}
