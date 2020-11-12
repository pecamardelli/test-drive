function scr_exit_window_script() {
	ok_button				= instance_create_depth(x,y,depth-1,obj_button);
	ok_button.x				= x - sprite_get_width(sprite_index) * 0.2;
	ok_button.y				= y + sprite_get_height(sprite_index) * 0.15;
	ok_button.click_action	= -100;
	ok_button.creator		= id;
	ok_button.caption		= "OK";

	no_button				= instance_create_depth(x,y,depth-1,obj_button);
	no_button.x				= x + sprite_get_width(sprite_index) * 0.2;
	no_button.y				= y + sprite_get_height(sprite_index) * 0.15;
	no_button.click_action	= -10;
	no_button.creator		= id;
	no_button.caption		= "NO";


}
