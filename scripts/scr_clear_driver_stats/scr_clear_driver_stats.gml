/// @description	Put to zero all driver stage stats
///	@param			clear_stage_stats	-> true or false
///	@param			clear_overall_stats	-> true or false
function scr_clear_driver_stats(argument0, argument1) {

	var opp_list		= global.race_data[? "contestants"];
	var opp_list_size	= ds_list_size(opp_list);

	for(var i=0;i<opp_list_size;i++) {
		var the_driver	= opp_list[| i];
	
		if argument0 {
			the_driver[? "stage_time"]			= 0;
			the_driver[? "stage_hits"]			= 0;
			the_driver[? "stage_crashes"]		= 0;
			the_driver[? "stage_breaks"]		= 0;
			the_driver[? "stage_top_speed"]		= 0;
			the_driver[? "stage_clean_run"]		= false;
			the_driver[? "stage_the_fastest"]	= false;
		}
	
		if argument1 {
			the_driver[? "race_time"]		= 0;
			the_driver[? "race_hits"]		= 0;
			the_driver[? "race_crashes"]	= 0;
			the_driver[? "race_breaks"]		= 0;
			the_driver[? "race_top_speed"]	= 0;
			the_driver[? "race_clean_runs"]	= 0;
			the_driver[? "race_top_speeds"]	= 0;
		}
	}

	if argument0 {
		global.player_profile[? "stage_time"]			= 0;
		global.player_profile[? "stage_hits"]			= 0;
		global.player_profile[? "stage_crashes"]		= 0;
		global.player_profile[? "stage_breaks"]			= 0;
		global.player_profile[? "stage_top_speed"]		= 0;
		global.player_profile[? "stage_clean_run"]		= 0;
		global.player_profile[? "stage_the_fastest"]	= false;
	}

	if argument1 {
		global.player_profile[? "race_time"]		= 0;
		global.player_profile[? "race_hits"]		= 0;
		global.player_profile[? "race_crashes"]		= 0;
		global.player_profile[? "race_breaks"]		= 0;
		global.player_profile[? "race_top_speed"]	= 0;
		global.player_profile[? "race_clean_runs"]	= 0;
		global.player_profile[? "race_top_speeds"]	= 0;
	}


}
