/// @description	Load data from disk
/// @param			track_name  -> folder name containing the files to load
/// @param			stage_id	-> Name of the track's stage
function scr_load_track(argument0, argument1) {

	//var the_track	= ds_map_create();

	var pointcols;
	var linecols;
	var tricols;
	pointcols[0] = -1;
	linecols[0] = -1;
	tricols[0] = -1;

	var dir	= working_directory + global.track_dir + argument0 + "\\";

	var load_file	= file_text_open_read(dir + argument1 + "_track_data.sav");
	var track_data	= json_decode(file_text_read_string(load_file));
	file_text_close(load_file);

	var pointcolslist	= track_data[? "pointcols_list"];

	for(var i=0;i<ds_list_size(pointcolslist);i++){
		pointcols[i]	= pointcolslist[| i];	
	}

	var linecolslist	= track_data[? "linecols_list"];

	for(i=0;i<ds_list_size(linecolslist);i++){
		linecols[i]	= linecolslist[| i];	
	}

	var tricolslist	= track_data[? "tricols_list"];

	for(i=0;i<ds_list_size(tricolslist);i++){
		tricols[i]	= tricolslist[| i];	
	}

	var verticeslist	= track_data[? "vertices_list"];

	var model = [ undefined,				// point buffer
				  undefined,				// line buffer
				  buffer_load(dir + argument1 + "_tri_list_buffer.sav"),				// tri list buffer
				  undefined,				// point uv buffer
				  undefined,				// line uv buffer
				  buffer_load(dir + argument1 + "_tri_uv_buffer.sav"),				// tri uv buffer
				  undefined,				// point vertex buffer
				  undefined,				// line vertex buffer
				  undefined,				// tri list buffer			  
				  track_data[? "color"],				//draw_get_colour(),		// colour used when creating
				  track_data[? "texture"],						// last texture used for drawing
				  track_data[? "vertices"],						// num vertices
				  track_data[? "prim_kind"],						// prim kind
				  track_data[? "point_vert"],						// number of non-colour point vertices
				  track_data[? "line_vert"],						// number of non-colour line vertices
				  track_data[? "tri_vert"],						// number of non-colour tri vertices
				  pointcols,				// offsets to point colours
				  linecols,					// offsets to line colours
				  tricols,					// offsets to tri colours
			  
				  verticeslist[| 0], verticeslist[| 1], verticeslist[| 2], verticeslist[| 3], verticeslist[| 4], verticeslist[| 5], verticeslist[| 6], verticeslist[| 7], verticeslist[| 8],	// vertex 1
				  verticeslist[| 9], verticeslist[| 10], verticeslist[| 11], verticeslist[| 12], verticeslist[| 13], verticeslist[| 14], verticeslist[| 15], verticeslist[| 16], verticeslist[| 17],	// vertex 2
			  
				];
			
	//ds_map_add(the_track, "track_model", model);

	ds_map_destroy(track_data);

	//return the_track;
	return model;



}
