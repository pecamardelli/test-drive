/// @description 

if enabled {
	if on_click_go_to != -1 {
		scr_fade_screen("out",global.fade_duration,-1,on_click_go_to);
	}

	if click_action < -1 {
		scr_fade_screen("out",global.fade_duration,click_action,-1);
	}
	else if click_action >= 0 {
		script_execute(click_action);
	}
}