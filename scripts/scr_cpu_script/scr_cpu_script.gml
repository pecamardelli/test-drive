function scr_cpu_script() {

	/*
	scr_face_track();

	if not finished {
		movespd	= 50;
	}
	else {
		movespd	= 0;
		show_debug_message("Time elapsed: " + string(race_finish-race_start) + " - total length: " + string(obj_trackcontrol.stage_vars[? "length"] * 0.8));
		game_end();
		exit;
	}

	w		= 0;
	*/

	if rpm <= the_car[? "engine_rpm"] / 2 && actual_gear > 1 {
		actual_gear--;
	}
	else if rpm >= the_car[? "engine_rpm"] && actual_gear < ds_list_size(the_car[? "ratios"]) - 1 {
		actual_gear++;
	}

	scr_set_accel();


}
