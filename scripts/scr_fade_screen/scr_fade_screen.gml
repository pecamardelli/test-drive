/// @description Fade screen
/// @param mode
/// @param fade_time
/// @param finish_fade_action
/// @param finish_fade_goto
function scr_fade_screen(argument0, argument1, argument2, argument3) {

	var fade_obj				= instance_create_depth(0,0,-1000,obj_fade_screen);
	fade_obj.fade_time			= argument1;
	fade_obj.finish_fade_action	= argument2;
	fade_obj.finish_fade_goto	= argument3;

	if argument0 == "out" {
		fade_obj.fade_out	= true;
	}

	if argument0 == "in" {
		fade_obj.fade_in	= true;
	}



}
