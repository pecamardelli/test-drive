/// @description	Populate all track data
function scr_track_data() {

	global.track_list	= ds_list_create();

#region THE WOODS

	var my_track	= ds_list_create();

#region SECTION 1

	my_stage	= ds_map_create();

	ds_map_add(my_stage, "id", "thewoods1");
	ds_map_add(my_stage, "name", "The Woods Section 1");
	ds_map_add(my_stage, "track_id", "the_woods");
	ds_map_add(my_stage, "track_name", "The Woods");
	ds_map_add(my_stage, "track_logo", spr_the_woods_logo);
	ds_map_add(my_stage, "showroom", spr_the_woods_showroom);
	ds_map_add(my_stage, "thumb", spr_the_woods_thumb);
	ds_map_add(my_stage, "lighting", lighting_ambient_daytime);
	ds_map_add(my_stage, "path", path_track_the_woods_01);
	ds_map_add(my_stage, "path_z", path_track_the_woods_z);
	ds_map_add(my_stage, "length",path_get_length(my_stage[? "path"]));
	ds_map_add(my_stage, "width", 256);
	ds_map_add(my_stage, "step", 128/my_stage[? "length"]);
	ds_map_add(my_stage, "ufactor", 1/my_stage[? "length"]);
	ds_map_add(my_stage, "uufactor", 1000/my_stage[? "length"]);
	ds_map_add(my_stage, "wfactor", 1/my_stage[? "width"]);
	ds_map_add(my_stage, "texture", sprite_get_texture(spr_the_woods_bg_01,0));
	ds_map_add(my_stage, "start", 0.05);
	ds_map_add(my_stage, "end", 0.95);
	ds_map_add(my_stage, "tracks_per_dir", 1);

	var stage_length	= my_stage[? "length"] * (my_stage[? "end"] - my_stage[? "start"]) / global.len_per_mile;

	ds_map_add(my_stage, "miles_length", stage_length);
	ds_map_add(my_stage, "stuff_script", scr_the_woods_1_stuff);
	ds_map_add(my_stage, "stuff_loaded", false);

	ds_list_add(my_track, my_stage);
	ds_list_mark_as_map(my_track, ds_list_size(my_track)-1);

#endregion

#region SECTION 2

	my_stage	= ds_map_create();

	ds_map_add(my_stage, "id", "thewoods2");
	ds_map_add(my_stage, "name", "The Woods Section 2");
	ds_map_add(my_stage, "track_id", "the_woods");
	ds_map_add(my_stage, "track_name", "The Woods");
	ds_map_add(my_stage, "track_logo", spr_the_woods_logo);
	ds_map_add(my_stage, "showroom", spr_the_woods_showroom);
	ds_map_add(my_stage, "thumb", spr_the_woods_thumb);
	ds_map_add(my_stage, "lighting", lighting_ambient_daytime);
	ds_map_add(my_stage, "path", path_track_the_woods_02);
	ds_map_add(my_stage, "path_z", path_track_the_woods_z);
	ds_map_add(my_stage, "length",path_get_length(my_stage[? "path"]));
	ds_map_add(my_stage, "width", 256);
	ds_map_add(my_stage, "step", 128/my_stage[? "length"]);
	ds_map_add(my_stage, "ufactor", 1/my_stage[? "length"]);
	ds_map_add(my_stage, "uufactor", 1000/my_stage[? "length"]);
	ds_map_add(my_stage, "wfactor", 1/my_stage[? "width"]);
	ds_map_add(my_stage, "bg", spr_the_woods_bg_01);
	ds_map_add(my_stage, "texture", background_get_texture(my_stage[? "bg"]));
	ds_map_add(my_stage, "start", 0.05);
	ds_map_add(my_stage, "end", 0.95);
	ds_map_add(my_stage, "tracks_per_dir", 1);

	var stage_length	= my_stage[? "length"] * (my_stage[? "end"] - my_stage[? "start"]) / global.len_per_mile;

	ds_map_add(my_stage, "miles_length", stage_length);
	ds_map_add(my_stage, "stuff_script", scr_the_woods_2_stuff);
	ds_map_add(my_stage, "stuff_loaded", false);

	ds_list_add(my_track, my_stage);
	ds_list_mark_as_map(my_track, ds_list_size(my_track)-1);

#endregion

#region SECTION 3

	my_stage	= ds_map_create();

	ds_map_add(my_stage, "id", "thewoods3");
	ds_map_add(my_stage, "name", "The Woods Section 3");
	ds_map_add(my_stage, "track_id", "the_woods");
	ds_map_add(my_stage, "track_name", "The Woods");
	ds_map_add(my_stage, "track_logo", spr_the_woods_logo);
	ds_map_add(my_stage, "showroom", spr_the_woods_showroom);
	ds_map_add(my_stage, "thumb", spr_the_woods_thumb);
	ds_map_add(my_stage, "lighting", lighting_ambient_daytime);
	ds_map_add(my_stage, "path", path_track_the_woods_03);
	ds_map_add(my_stage, "path_z", path_track_the_woods_z);
	ds_map_add(my_stage, "length",path_get_length(my_stage[? "path"]));
	ds_map_add(my_stage, "width", 256);
	ds_map_add(my_stage, "step", 128/my_stage[? "length"]);
	ds_map_add(my_stage, "ufactor", 1/my_stage[? "length"]);
	ds_map_add(my_stage, "uufactor", 1000/my_stage[? "length"]);
	ds_map_add(my_stage, "wfactor", 1/my_stage[? "width"]);
	ds_map_add(my_stage, "texture", sprite_get_texture(spr_the_woods_bg_01,0));
	ds_map_add(my_stage, "start", 0.05);
	ds_map_add(my_stage, "end", 0.95);
	ds_map_add(my_stage, "tracks_per_dir", 1);

	var stage_length	= my_stage[? "length"] * (my_stage[? "end"] - my_stage[? "start"]) / global.len_per_mile;

	ds_map_add(my_stage, "miles_length", stage_length);
	ds_map_add(my_stage, "stuff_script", scr_the_woods_3_stuff);
	ds_map_add(my_stage, "stuff_loaded", false);

	ds_list_add(my_track, my_stage);
	ds_list_mark_as_map(my_track, ds_list_size(my_track)-1);

#endregion

#region SECTION 4

	my_stage	= ds_map_create();

	ds_map_add(my_stage, "id", "thewoods4");
	ds_map_add(my_stage, "name", "The Woods Section 4");
	ds_map_add(my_stage, "track_id", "the_woods");
	ds_map_add(my_stage, "track_name", "The Woods");
	ds_map_add(my_stage, "track_logo", spr_the_woods_logo);
	ds_map_add(my_stage, "showroom", spr_the_woods_showroom);
	ds_map_add(my_stage, "thumb", spr_the_woods_thumb);
	ds_map_add(my_stage, "lighting", lighting_ambient_daytime);
	ds_map_add(my_stage, "path", path_track_the_woods_04);
	ds_map_add(my_stage, "path_z", path_track_the_woods_z);
	ds_map_add(my_stage, "length",path_get_length(my_stage[? "path"]));
	ds_map_add(my_stage, "width", 256);
	ds_map_add(my_stage, "step", 128/my_stage[? "length"]);
	ds_map_add(my_stage, "ufactor", 1/my_stage[? "length"]);
	ds_map_add(my_stage, "uufactor", 1000/my_stage[? "length"]);
	ds_map_add(my_stage, "wfactor", 1/my_stage[? "width"]);
	ds_map_add(my_stage, "texture", sprite_get_texture(spr_the_woods_bg_02,0));
	ds_map_add(my_stage, "start", 0.05);
	ds_map_add(my_stage, "end", 0.95);
	ds_map_add(my_stage, "tracks_per_dir", 1);

	var stage_length	= my_stage[? "length"] * (my_stage[? "end"] - my_stage[? "start"]) / global.len_per_mile;

	ds_map_add(my_stage, "miles_length", stage_length);
	ds_map_add(my_stage, "stuff_script", scr_the_woods_4_stuff);
	ds_map_add(my_stage, "stuff_loaded", false);

	ds_list_add(my_track, my_stage);
	ds_list_mark_as_map(my_track, ds_list_size(my_track)-1);

#endregion

#region SECTION 5

	my_stage	= ds_map_create();

	ds_map_add(my_stage, "id", "thewoods5");
	ds_map_add(my_stage, "name", "The Woods Section 5");
	ds_map_add(my_stage, "track_id", "the_woods");
	ds_map_add(my_stage, "track_name", "The Woods");
	ds_map_add(my_stage, "track_logo", spr_the_woods_logo);
	ds_map_add(my_stage, "showroom", spr_the_woods_showroom);
	ds_map_add(my_stage, "thumb", spr_the_woods_thumb);
	ds_map_add(my_stage, "lighting", lighting_ambient_daytime);
	ds_map_add(my_stage, "path", path_track_the_woods_05);
	ds_map_add(my_stage, "path_z", path_track_the_woods_z);
	ds_map_add(my_stage, "length",path_get_length(my_stage[? "path"]));
	ds_map_add(my_stage, "width", 256);
	ds_map_add(my_stage, "step", 128/my_stage[? "length"]);
	ds_map_add(my_stage, "ufactor", 1/my_stage[? "length"]);
	ds_map_add(my_stage, "uufactor", 1000/my_stage[? "length"]);
	ds_map_add(my_stage, "wfactor", 1/my_stage[? "width"]);
	ds_map_add(my_stage, "texture", sprite_get_texture(spr_the_woods_bg_02,0));
	ds_map_add(my_stage, "start", 0.05);
	ds_map_add(my_stage, "end", 0.95);
	ds_map_add(my_stage, "tracks_per_dir", 1);

	var stage_length	= my_stage[? "length"] * (my_stage[? "end"] - my_stage[? "start"]) / global.len_per_mile;

	ds_map_add(my_stage, "miles_length", stage_length);
	ds_map_add(my_stage, "stuff_script", scr_the_woods_5_stuff);
	ds_map_add(my_stage, "stuff_loaded", false);

	ds_list_add(my_track, my_stage);
	ds_list_mark_as_map(my_track, ds_list_size(my_track)-1);

#endregion

#region SECTION 6

	my_stage	= ds_map_create();

	ds_map_add(my_stage, "id", "thewoods6");
	ds_map_add(my_stage, "name", "The Woods Section 6");
	ds_map_add(my_stage, "track_id", "the_woods");
	ds_map_add(my_stage, "track_name", "The Woods");
	ds_map_add(my_stage, "track_logo", spr_the_woods_logo);
	ds_map_add(my_stage, "showroom", spr_the_woods_showroom);
	ds_map_add(my_stage, "thumb", spr_the_woods_thumb);
	ds_map_add(my_stage, "lighting", lighting_ambient_daytime);
	ds_map_add(my_stage, "path", path_track_the_woods_06);
	ds_map_add(my_stage, "path_z", path_track_the_woods_z);
	ds_map_add(my_stage, "length",path_get_length(my_stage[? "path"]));
	ds_map_add(my_stage, "width", 256);
	ds_map_add(my_stage, "step", 128/my_stage[? "length"]);
	ds_map_add(my_stage, "ufactor", 1/my_stage[? "length"]);
	ds_map_add(my_stage, "uufactor", 1000/my_stage[? "length"]);
	ds_map_add(my_stage, "wfactor", 1/my_stage[? "width"]);
	ds_map_add(my_stage, "texture", sprite_get_texture(spr_the_woods_bg_02,0));
	ds_map_add(my_stage, "start", 0.05);
	ds_map_add(my_stage, "end", 0.95);
	ds_map_add(my_stage, "tracks_per_dir", 1);

	var stage_length	= my_stage[? "length"] * (my_stage[? "end"] - my_stage[? "start"]) / global.len_per_mile;

	ds_map_add(my_stage, "miles_length", stage_length);
	ds_map_add(my_stage, "stuff_script", scr_the_woods_6_stuff);
	ds_map_add(my_stage, "stuff_loaded", false);

	ds_list_add(my_track, my_stage);
	ds_list_mark_as_map(my_track, ds_list_size(my_track)-1);

#endregion

	//ds_map_add_map(global.track_list, "the_woods", my_track);

	ds_list_add(global.track_list, my_track);
	ds_list_mark_as_list(global.track_list, ds_list_size(global.track_list)-1);

#endregion



}
