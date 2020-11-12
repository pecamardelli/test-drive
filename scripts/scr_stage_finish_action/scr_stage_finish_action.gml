///	@description	Actions taken when clicking or pressing any key at the stage finish screen
function scr_stage_finish_action() {

	if room == rm_stage_finish {
		scr_fade_screen("out",global.fade_duration,-1,rm_stage_finish_overall);
	}
	else if room == rm_stage_finish_overall {
		if global.race_data[? "stage_index"] < ds_list_size(global.track_list[| global.race_data[? "track_index"]]) - 1 {
			global.race_data[? "stage_index"]++;
		
			scr_clear_driver_stats(true, false);
			scr_fade_screen("out",global.fade_duration,-1,race_track);
		}
		else {
			scr_fade_screen("out",global.fade_duration,-1,rm_race_finish);
		}
	}


}
