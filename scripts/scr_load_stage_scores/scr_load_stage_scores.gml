/// @description		Load or create the top five scores for the stage
///	@param				stage_id		GML's ID of ds_map containing all stage data (not the string)
///	@param				track_or_stage	Load overall scores (true) or stage scores (false)?
function scr_load_stage_scores(argument0, argument1) {

	if argument1 {
		var score_file	= working_directory + global.track_dir + argument0[? "track_id"] + "\\" + argument0[? "id"] + "_overall.sco";
	}
	else {
		var score_file	= working_directory + global.track_dir + argument0[? "track_id"] + "\\" + argument0[? "id"] + ".sco";
	}

	var the_list	= ds_priority_create();
	
	if file_exists(score_file) {
		var file		= file_text_open_read(score_file);
		var the_scores	= json_decode(file_text_read_string(file));
	
		var key			= ds_map_find_first(the_scores);
	
		while not is_undefined(key) {
			var my_score	= ds_map_create();
			ds_map_copy(my_score, the_scores[? key]);
		
			ds_priority_add(the_list, my_score, my_score[? "points"]);
			key	= ds_map_find_next(the_scores, key);
		}
	
		ds_map_destroy(the_scores);
	}

	return the_list;


}
