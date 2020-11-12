/// @description 

if enabled {
	if click_action > -1 {
		script_execute(click_action);
	}
	else if click_action == -100 {
		scr_fade_screen("out",global.fade_duration,-100,-1);
	}
	else if click_action == -10 {
		with obj_window {
			if level == global.window_count {
				fade_out	= true;
			}
		}
	}
	
	if click_goto {
		scr_fade_screen("out", global.fade_duration, false, click_goto);
	}
}