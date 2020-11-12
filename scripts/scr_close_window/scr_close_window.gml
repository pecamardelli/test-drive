function scr_close_window() {
	var actual_level	= global.window_count;

	with obj_window {
		//if level == other.level {
		if level == actual_level {
			instance_destroy();
		}
	};


}
