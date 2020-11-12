///	@description	Obtain the stage standings
function scr_stage_standings() {

	sprite_index	= spr_stage_finish_bg;

	title_x			= room_width / 2;
	title_y			= 49;

	entry_width		= 1820;
	entry_height	= 50;
	entry_x			= 50;

	entry_sep		= 1;

	pos_x		= 95;
	car_x		= 200;
	name_x		= 280;
	laptime_x	= 600;
	topspeed_x	= 880;
	avgspeed_x	= 1035;
	hits_x		= 1150;
	crashes_x	= 1245;
	breaks_x	= 1355;
	score_x		= 1500;
	prizes_x	= 1625;
	date_x		= 1720;

	best_scores	= scr_load_stage_scores(stage_vars, false);

	var the_fastest	= ds_priority_create();

	for (var i=0;i<=opp_list_size;i++) {
		var the_score_map	= scr_create_score_map();
	
		if i == opp_list_size {
			the_driver						= global.player_profile;
			the_score_map[? "is_player"]	= true;
		}
		else {
			the_driver			= opp_list[| i];
		}
	
		var the_driver_car		= the_driver[? "car"];
	
		the_score_map[? "driver_id"]	= the_driver;
		the_score_map[? "car_id"]		= the_driver_car[? "id"];
		the_score_map[? "driver"]		= the_driver[? "name"];
		the_score_map[? "laptime"]		= the_driver[? "stage_time"];
		the_score_map[? "top_speed"]	= the_driver[? "stage_top_speed"];
	
		ds_priority_add(the_fastest, the_score_map, the_score_map[? "top_speed"]);
	
		var avg_speed	= 3600000 * stage_vars[? "miles_length"] / the_driver[? "stage_time"];
	
		the_score_map[? "avg_speed"]	= avg_speed;
		the_score_map[? "hits"]			= the_driver[? "stage_hits"];
		the_score_map[? "crashes"]		= the_driver[? "stage_crashes"];
		the_score_map[? "breaks"]		= the_driver[? "stage_breaks"];
	
		var the_score	= stage_vars[? "length"] * (stage_vars[? "end"] - stage_vars[? "start"])/3;
		the_score		= power(the_score, sqrt(avg_speed/100));
		the_score		= power(the_score, (1 - the_driver[? "stage_hits"] * 0.0007));
		the_score		= power(the_score, (1 - the_driver[? "stage_crashes"] * 0.002));
		the_score		= round(power(the_score, (1 - the_driver[? "stage_breaks"] * 0.0012)));
	
		if the_driver[? "stage_clean_run"] {
			the_score_map[? "clean_run"]	= true;
			the_score		= round(power(the_score, 1.001));
		}
	
		the_score_map[? "unbeaten"]	= the_driver[? "stage_unbeaten"];
		the_score		= round(power(the_score, 1 + the_driver[? "stage_unbeaten"] * 0.001));
	
		the_score_map[? "points"]	= the_score;
		the_driver[? "race_points"]	+= the_score;
	
		ds_priority_add(best_scores, the_score_map, the_score_map[? "points"]);
	
		if ds_priority_size(best_scores) > 10 {
			ds_priority_delete_min(best_scores);
		}

		ds_priority_add(standings, the_score_map, the_score_map[? "laptime"]);
	}

	var the_fastest_driver	= ds_priority_delete_max(the_fastest);
	the_fastest_driver[? "the_fastest"]	= true;
	var the_id	= the_fastest_driver[? "driver_id"];
	the_id[? "race_top_speeds"]++;
	the_id[? "total_top_speeds"]++;
	ds_priority_destroy(the_fastest);

	scr_save_stage_scores(stage_vars, false);


}
