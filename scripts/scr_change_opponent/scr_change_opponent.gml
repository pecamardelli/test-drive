///	@description	Changes the opponent in the list.
function scr_change_opponent() {

	var contestant_list	= global.race_data[? "contestants"];

	var driver_on_list	= entry_id.driver;

	for(var i=0;i<ds_list_size(contestant_list);i++){
		if contestant_list[| i] == driver_on_list {
			ds_list_delete(contestant_list,i);
			break;
		}
	}

	entry_id.driver	= driver;
	ds_list_add(contestant_list,driver);

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
