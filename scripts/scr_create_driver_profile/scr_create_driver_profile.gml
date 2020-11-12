/// @description	What the script name says ;)
function scr_create_driver_profile() {

	var profile	= ds_map_create();

	profile[? "name"]				= environment_get_variable("USERNAME");
	profile[? "born"]				= date_create_datetime(irandom_range(1970,1999),irandom_range(1,12),irandom_range(1,28),0,0,0);
	profile[? "car"]				= 0;

	profile[? "stage_time"]			= 0;
	profile[? "stage_hits"]			= 0;
	profile[? "stage_crashes"]		= 0;
	profile[? "stage_breaks"]		= 0;
	profile[? "stage_top_speed"]	= 0;
	profile[? "stage_clean_run"]	= false;
	profile[? "stage_unbeaten"]		= false;

	profile[? "race_time"]			= 0;
	profile[? "race_hits"]			= 0;
	profile[? "race_crashes"]		= 0;
	profile[? "race_breaks"]		= 0;
	profile[? "race_top_speed"]		= 0;
	profile[? "race_points"]		= 0;
	profile[? "race_wins"]			= 0;
	profile[? "race_clean_runs"]	= 0;
	profile[? "race_top_speeds"]	= 0;
	profile[? "race_unbeaten"]		= 0;

	profile[? "total_stages"]		= 0;
	profile[? "total_races"]		= 0;
	profile[? "total_points"]		= 0;
	profile[? "total_miles"]		= 0;
	profile[? "total_crashes"]		= 0;
	profile[? "total_hits"]			= 0;
	profile[? "total_breaks"]		= 0;
	profile[? "total_time"]			= 0;
	profile[? "total_stages_won"]	= 0;
	profile[? "races_won"]			= 0;
	profile[? "races_second"]		= 0;
	profile[? "races_third"]		= 0;
	profile[? "total_clean_runs"]	= 0;
	profile[? "total_top_speeds"]	= 0;
	profile[? "total_unbeaten"]		= 0;

	profile[? "ufactor_modifier"]	= random_range(random_range(-0.1,0),random_range(0,0.1)) + 1;
	profile[? "power_modifier"]		= random_range(random_range(-0.12,0),random_range(0,0.12)) + 1;
	profile[? "curve_modifier"]		= random_range(random_range(-0.12,0),random_range(0,0.12)) + 1;

	/*
	var cont	= ds_map_create();
		
	cont[? "laptime"]	= 0;
	cont[? "hits"]		= 0;
	cont[? "crashes"]	= 0;
	cont[? "breaks"]	= 0;
	cont[? "top_speed"]	= 0;
		
	ds_map_add_map(profile, "contest_vars", cont);

	var race	= ds_map_create();
		
	cont[? "overall_time"]		= 0;
	cont[? "overall_hits"]		= 0;
	cont[? "overall_crashes"]	= 0;
	cont[? "overall_breaks"]	= 0;
	cont[? "overall_top_speed"]	= 0;
		
	ds_map_add_map(profile, "race_vars", race);
	*/
	return profile;


}
