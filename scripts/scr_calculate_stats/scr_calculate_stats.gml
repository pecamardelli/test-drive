///	@description	Extrapolate laptimes for those who are behind when the player finishes.
function scr_calculate_stats() {

	var laptime			= round(my_time*1000);
	var my_hits			= hits;
	var my_crashes		= crashes;
	var my_breaks		= breaks;

	var the_track		= global.track_list[| global.race_data[? "track_index"]];
	var stage_vars		= the_track[| global.race_data[? "stage_index"]];

	if u < stage_vars[? "end"] {
		// track_len will always be less than 1
		var track_len	= stage_vars[? "end"] - stage_vars[? "start"];

		// Current u position minus the track's start u value.
		var elapsed_u	= u - stage_vars[? "start"];

		laptime		= round(track_len * laptime / elapsed_u * random_range(0.98,1.02));
		my_hits		= round(track_len * my_hits / elapsed_u * random_range(1.02,1.5));
		my_crashes	= round(track_len * my_crashes / elapsed_u * random_range(1,1.3));
		my_breaks	= round(track_len * my_breaks / elapsed_u * random_range(0.98,1.2));
	}

	driver[? "stage_time"]				= laptime;
	driver[? "stage_hits"]				= my_hits;
	driver[? "stage_crashes"]			= my_crashes;
	driver[? "stage_breaks"]			= my_breaks;






}
