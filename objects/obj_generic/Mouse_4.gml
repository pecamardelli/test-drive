/// @description

//if global.game_vars[? "generic_enabled"] {
if enabled {
	if click_goto != -1 {
		scr_fade_screen("out", global.fade_duration, false, click_goto);
		//room_goto(click_goto);
	}
	
	if click_action > -1 {
		script_execute(click_action);
	}
	else if click_action == -10 {
		creator.fade_out	= true;
		fade_out			= true;
	}
	else if click_action == -100 {
		game_end();
	}
}