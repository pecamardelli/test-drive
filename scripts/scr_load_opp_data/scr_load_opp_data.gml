/// @description	Load, or create if not exists, all opponent data
function scr_load_opp_data() {

	var filename	= working_directory + global.data_dir + global.opp_file;

	if file_exists(filename) {
		var file		= file_text_open_read(filename);
		global.opp_list	= json_decode(file_text_read_string(file));
		file_text_close(file);
		show_debug_message("Opponent data loaded from disk.");
	}
	else {
		global.opp_list	= ds_map_create();

		ds_list_shuffle(global.opp_names);
	
		for(var i=0;i<ds_list_size(global.opp_names);i++){
	
			var the_opp	= scr_create_driver_profile();
		
			the_opp[? "name"]	= global.opp_names[| i];

			ds_map_add_map(global.opp_list, the_opp[? "name"], the_opp);
		}
	
		show_debug_message("Opponent data not found at: " + filename + ". Creating list...");
		var save_file	= file_text_open_write(filename);
		file_text_write_string(save_file, json_encode(global.opp_list));
		file_text_close(save_file);
		show_debug_message("Opponent list succesfuly created.");
	}


}
