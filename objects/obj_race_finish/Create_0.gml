/// @description 

x				= 0;
y				= 0;
podium			= ds_priority_create();
temp_podium		= ds_priority_create();

the_track		= global.track_list[| global.race_data[? "track_index"]];
stage_vars		= the_track[| global.race_data[? "stage_index"]];
opp_list		= global.race_data[? "contestants"];
opp_list_size	= ds_list_size(opp_list);

for(var i=0;i<opp_list_size;i++){
	var the_driver	= opp_list[| i];
	
	ds_priority_add(podium,the_driver, the_driver[? "race_points"]);
}

ds_priority_add(podium, global.player_profile, global.player_profile[? "race_points"]);