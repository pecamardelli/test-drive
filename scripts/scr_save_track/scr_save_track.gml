/// @description	Save track to disk
/// @param			track_model	-> 3d model with all the data generated with stage_model_create
/// @param			track_name  -> folder name containing the files to load
/// @param			stage_id	-> Name of the track's stage
function scr_save_track(argument0, argument1, argument2) {

	var track_dir	= working_directory + global.track_dir + argument1 + "\\";

	if argument0[0] != undefined {
		buffer_save(argument0[0], track_dir + argument2 + "_point_buffer.sav");
	}

	if argument0[1] != undefined {
		buffer_save(argument0[1], track_dir + argument2 + "_line_buffer.sav");
	}

	if argument0[2] != undefined {
		buffer_save(argument0[2], track_dir + argument2 + "_tri_list_buffer.sav");
	}

	if argument0[3] != undefined {
		buffer_save(argument0[3], track_dir + argument2 + "_point_uv_buffer.sav");
	}

	if argument0[4] != undefined {
		buffer_save(argument0[4], track_dir + argument2 + "_line_uv_buffer.sav");
	}

	if argument0[5] != undefined {
		buffer_save(argument0[5], track_dir + argument2 + "_tri_uv_buffer.sav");
	}

	if argument0[6] != undefined {
		buffer_save(argument0[6], track_dir + argument2 + "_point_vertex_buffer.sav");
	}

	if argument0[7] != undefined {
		buffer_save(argument0[7], track_dir + argument2 + "_line_vertex_buffer.sav");
	}

	if argument0[8] != undefined {
		buffer_save(argument0[8], track_dir + argument2 + "_tri_list_buffer_2.sav");
	}

	var track_data	= ds_map_create();

	track_data[? "color"]		= argument0[9];
	track_data[? "texture"]		= argument0[10];
	track_data[? "vertices"]	= argument0[11];
	track_data[? "prim_kind"]	= argument0[12];
	track_data[? "point_vert"]	= argument0[13];
	track_data[? "line_vert"]	= argument0[14];
	track_data[? "tri_vert"]	= argument0[15];

	var pointcols	= ds_list_create();
	var temp		= argument0[16]; // pointcols

	var i	= 0;

	for(var i=0;i<array_length_1d(temp);i++){
		ds_list_add(pointcols, temp[i]);
	}

	ds_map_add_list(track_data, "pointcols_list", pointcols);

	var linecols	= ds_list_create();
	temp			= argument0[17]; // linecols

	show_debug_message("linecols: " + string(array_length_1d(temp)));

	for(i=0;i<array_length_1d(temp);i++){
		ds_list_add(linecols, temp[i]);
	}

	ds_map_add_list(track_data, "linecols_list", linecols);

	var tricols	= ds_list_create();
	temp		= argument0[18]; // tricols

	// The index 37 has the tricols array length calculated at stage_model_create script. It has over 32000
	// entries, so the built in function array_lenght_1d is useless
	// Apparently, this is the only array being populated in the model creation script.

	for(i=0;i<=argument0[37];i++){
		ds_list_add(tricols, temp[i]);
	}

	ds_map_add_list(track_data, "tricols_list", tricols);

	var vertices	= ds_list_create();

	for(i=19;i<37;i++){
		ds_list_add(vertices, argument0[i]);
	}

	ds_map_add_list(track_data, "vertices_list", vertices);

	var save_file	= file_text_open_write(track_dir + argument2 + "_track_data.sav");

	file_text_write_string(save_file, json_encode(track_data));
	file_text_close(save_file);

	game_end();


}
