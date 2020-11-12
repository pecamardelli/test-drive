/// @description 

x				= 0;
y				= 0;
standings		= ds_priority_create();

the_track		= global.track_list[| global.race_data[? "track_index"]];
stage_vars		= the_track[| global.race_data[? "stage_index"]];
opp_list		= global.race_data[? "contestants"];
opp_list_size	= ds_list_size(opp_list);
driver			= -1;
entries			= 10;
first_index		= 0;

if room == rm_stage_finish {
	scr_stage_standings();
}
else if room == rm_stage_finish_overall {
	scr_race_standings();
}