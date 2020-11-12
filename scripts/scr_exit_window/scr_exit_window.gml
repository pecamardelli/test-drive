function scr_exit_window() {
	var the_window			= instance_create_depth(room_width/2,room_height/2,-1000,obj_window);
	the_window.sprite_index	= spr_window_600x250;
	the_window.text_to_draw	= "Quit game?";
	the_window.script		= scr_exit_window_script;


}
