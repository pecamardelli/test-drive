///	@description	Changes the opponent in the list.
function scr_change_car() {

	var driver_on_list		= entry_id.driver;
	driver_on_list[? "car"]	= car;

	with obj_list_entry {
		if level == global.window_count {
			fade_out	= true;
		}
	};

	with obj_window {
		if level == global.window_count {
			fade_out	= true;
		}
	};



}
