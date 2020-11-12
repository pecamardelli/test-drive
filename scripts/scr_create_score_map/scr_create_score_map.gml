/// @description	Create a ds_map containing all best score fields
function scr_create_score_map() {

	var the_score	= ds_map_create();

	ds_map_add(the_score, "car_id", "");
	ds_map_add(the_score, "driver", "");
	ds_map_add(the_score, "driver_id", -1);
	ds_map_add(the_score, "laptime", 0);
	ds_map_add(the_score, "top_speed", 0);
	ds_map_add(the_score, "avg_speed", 0);
	ds_map_add(the_score, "hits", 0);
	ds_map_add(the_score, "crashes", 0);
	ds_map_add(the_score, "breaks", 0);
	ds_map_add(the_score, "points", 0);
	ds_map_add(the_score, "clean_run", false);
	ds_map_add(the_score, "the_fastest", false);
	ds_map_add(the_score, "unbeaten", false);
	ds_map_add(the_score, "race_clean_runs", 0);
	ds_map_add(the_score, "race_top_speeds", 0);
	ds_map_add(the_score, "race_unbeaten", 0);
	ds_map_add(the_score, "is_player", false);
	ds_map_add(the_score, "date", date_current_datetime());

	return the_score;


}
