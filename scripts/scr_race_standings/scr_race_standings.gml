///	@description	Create race standings
function scr_race_standings() {

	sprite_index	= spr_stage_finish_overall_bg;

	title_x			= room_width / 2;
	title_y			= 49;

	entry_width		= 1820;
	entry_height	= 50;
	entry_x			= 50;

	entry_sep		= 1;

	pos_x		= 95;
	car_x		= 200;
	name_x		= 280;
	totaltime_x	= 600;
	wins_x		= 965;
	hits_x		= 1150;
	crashes_x	= 1245;
	breaks_x	= 1355;
	score_x		= 1500;
	prizes_x	= 1625;
	date_x		= 1720;

	best_scores	= scr_load_stage_scores(stage_vars, true);

	the_track		= global.track_list[| global.race_data[? "track_index"]];
	stage_vars		= the_track[| global.race_data[? "stage_index"]];

	var temp_stands	= ds_priority_create();

	for(var i=0;i<=opp_list_size;i++){
		var the_score_map	= scr_create_score_map();
	
		if i == opp_list_size {
			var the_driver					= global.player_profile;
			the_score_map[? "is_player"]	= true;
		}
		else {
			var the_driver			= opp_list[| i];
		}
	
		var the_driver_car		= the_driver[? "car"];
	
		the_score_map[? "car_id"]			= the_driver_car[? "id"];
		the_score_map[? "driver"]			= the_driver[? "name"];
		the_score_map[? "driver_id"]		= the_driver;
		the_score_map[? "total_time"]		= the_driver[? "race_time"];
		the_score_map[? "wins"]				= the_driver[? "race_wins"];
		the_score_map[? "hits"]				= the_driver[? "race_hits"];
		the_score_map[? "crashes"]			= the_driver[? "race_crashes"];
		the_score_map[? "breaks"]			= the_driver[? "race_breaks"];
		the_score_map[? "points"]			= the_driver[? "race_points"];
		the_score_map[? "race_clean_runs"]	= the_driver[? "race_clean_runs"];
		the_score_map[? "race_top_speeds"]	= the_driver[? "race_top_speeds"];
		the_score_map[? "race_unbeaten"]	= the_driver[? "race_unbeaten"];
	
		ds_priority_add(best_scores, the_score_map, the_score_map[? "points"]);
	
		if ds_priority_size(best_scores) > 10 {
			ds_priority_delete_min(best_scores);
		}
	
		ds_priority_add(standings, the_score_map, the_score_map[? "points"]);
		ds_priority_add(temp_stands, the_score_map, the_score_map[? "points"]);
	}

	if global.race_data[? "stage_index"] == ds_list_size(the_track) - 1 {
		var temp	= ds_priority_delete_max(temp_stands);
		var the_winner	= temp[? "driver_id"];
		the_winner[? "races_won"]++;
	
		var temp		= ds_priority_delete_max(temp_stands);
		var the_second	= temp[? "driver_id"];
		the_second[? "races_second"]++;
	
		var temp		= ds_priority_delete_max(temp_stands);
		var the_third	= temp[? "driver_id"];
		the_third[? "races_third"]++;
	}

	scr_save_stage_scores(stage_vars, true);


}
