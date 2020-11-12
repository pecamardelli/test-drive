/// @description	Saves stage best scores to disk
/// @param			stage_id		GML's ID of ds_map containing all stage data (not the string)
///	@param			track_or_stage	Load overall scores (true) or stage scores (false)?
function scr_save_stage_scores(argument0, argument1) {

	if argument1 {
		var score_file	= working_directory + global.track_dir + argument0[? "track_id"] + "\\" + argument0[? "id"] + "_overall.sco";
	}
	else {
		var score_file	= working_directory + global.track_dir + argument0[? "track_id"] + "\\" + argument0[? "id"] + ".sco";
	}

	var temp_scores	= ds_priority_create();
	ds_priority_copy(temp_scores, best_scores);
	
	var temp_map	= ds_map_create();
	var i			= 0;

	while 1 {
		var the_priority	= ds_priority_delete_max(temp_scores);
		
		if the_priority {
			var my_score	= ds_map_create();
			ds_map_copy(my_score, the_priority);
			ds_map_add_map(temp_map, i, my_score);
		}
		else {
			break;
		}
		i++;
	}

	var save_file	= file_text_open_write(score_file);
	file_text_write_string(save_file, json_encode(temp_map));
	file_text_close(save_file);

	ds_map_destroy(temp_map);
	ds_priority_destroy(temp_scores);


}
