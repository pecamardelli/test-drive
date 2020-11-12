/// @description	Get the stuff for the section one of The Woods track.
function scr_the_woods_2_stuff() {

	var the_track	= global.track_list[| global.race_data[? "track_index"]];
	my_stage		= the_track[| global.race_data[? "stage_index"]];

#region	TRACK ADDONS (BUSHES, TREES, ELECTRIC POLES, SIGNS, GOAL LINE ETC)

	ds_map_add_list(my_stage, "draw_stuff", ds_list_create());

	signs_w				= random_range(1.3,1.4);
	signs_z				= -5;

	// Curves to the right
	var curves_right	= ds_list_create();
	ds_list_add(curves_right, 0.0527, 0.0762, 0.085, 0.1025, 0.16, 0.1826, 0.2270, 0.3110, 0.3294, 0.4366, 0.4714, 0.5243, 0.5517, 0.605, 0.6298, 0.6412, 0.7360, 0.7744, 0.8250, 0.8529);
	// Curves to the left
	var curves_left		= ds_list_create();
	ds_list_add(curves_left, 0.1300, 0.1980, 0.371, 0.3850, 0.5798, 0.6511, 0.6995, 0.7140, 0.7826);

	road_cones_u		= ds_list_create();
	road_cones_w		= ds_list_create();
	other_signs			= ds_list_create();

	ds_map_add_list(my_stage, "obj_addons", ds_list_create());
	var addons_number		= irandom_range(irandom_range(1,8), irandom_range(8,15));
	var addons_dist			= 1/(addons_number) + random_range(-0.05,0.05);

	for(var d=0;d<addons_number;d++){
		var prob	= random(100);
	
		if prob <= 30 {
			ds_list_add(my_stage[? "obj_addons"], scr_create_addon_object("rock", my_stage[? "start"] + addons_dist*d, random_range(0.97,2) * sign(irandom_range(-100,100)),-5));
			ds_list_mark_as_map(my_stage[? "obj_addons"], ds_list_size(my_stage[? "obj_addons"])-1);
		}
		else if prob <= 60 {
			var addon_w	= random_range(1,1.5);
			ds_list_add(my_stage[? "obj_addons"], scr_create_addon_object("dirt_mound", my_stage[? "start"] + addons_dist*d, addon_w * sign(irandom_range(-100,100)),-5));
			ds_list_mark_as_map(my_stage[? "obj_addons"], ds_list_size(my_stage[? "obj_addons"])-1);
		}
		else {
			var addon_w	= random_range(1.1,1.2);
		
			ds_list_add(my_stage[? "obj_addons"], scr_create_addon_object("small_bridge", my_stage[? "start"] + addons_dist*d, addon_w,-5));
			ds_list_mark_as_map(my_stage[? "obj_addons"], ds_list_size(my_stage[? "obj_addons"])-1);
		
			ds_list_add(my_stage[? "obj_addons"], scr_create_addon_object("small_bridge", my_stage[? "start"] + addons_dist*d, -addon_w,-5));
			ds_list_mark_as_map(my_stage[? "obj_addons"], ds_list_size(my_stage[? "obj_addons"])-1);
		}
	
	}

	scr_populate_draw_stuff(irandom_range(4500,6000),180,150,irandom_range(13,31),curves_left,curves_right);

	ds_list_destroy(curves_left);
	ds_list_destroy(curves_right);
	ds_list_destroy(road_cones_u);
	ds_list_destroy(road_cones_w);
	ds_list_destroy(other_signs);

#endregion

#region GOAL LINE

#region SIDE COLUMNS

	var model_list	= ds_list_create();
	
	var addon		= ds_map_create();
	var model		= d3d_model_create();

	if irandom(100) < 40 {
		var the_tex	= tex_concrete;
	}
	else {
		var the_tex	= spr_rock_wall;
	}

	var the_path	= asset_get_index("path_goalline_side_" + string(irandom_range(1,2)));
	var side_width	= irandom_range(25,40);

	car_init(model, the_path, the_path,the_path,1,side_width/4,side_width/2,side_width,side_width);
	
	ds_map_add(addon, "model", model);
	ds_map_add(addon, "x", 0);
	ds_map_add(addon, "y", 0);
	ds_map_add(addon, "z", -5);
	ds_map_add(addon, "texture", the_tex);
	ds_map_add(addon, "sub_img", irandom(sprite_get_number(addon[? "texture"])-1));

	ds_list_add(model_list, addon);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);
	
	var the_addon	= ds_map_create();

	ds_map_add_list(the_addon, "model_list", model_list);
	ds_map_add(the_addon, "u", my_stage[? "end"] - my_stage[? "ufactor"] * 10);
	ds_map_add(the_addon, "w", 1.4);
	ds_map_add(the_addon, "z", -5);
	ds_map_add(the_addon, "set_trackdir", true);
	ds_map_add(the_addon, "resize_mask", true);
	ds_map_add(the_addon, "mask_width", 15);
	ds_map_add(the_addon, "mask_height", 15);
	ds_map_add(the_addon, "mask", spr_generic_mask);

	ds_list_add(my_stage[? "obj_addons"], the_addon);
	ds_list_mark_as_map(my_stage[? "obj_addons"], ds_list_size(my_stage[? "obj_addons"])-1);

	var the_addon	= ds_map_create();

	ds_map_add_list(the_addon, "model_list", model_list);
	ds_map_add(the_addon, "u", my_stage[? "end"]);
	ds_map_add(the_addon, "w", -1.4);
	ds_map_add(the_addon, "z", -5);
	ds_map_add(the_addon, "set_trackdir", true);
	ds_map_add(the_addon, "resize_mask", true);
	ds_map_add(the_addon, "mask_width", 15);
	ds_map_add(the_addon, "mask_height", 15);
	ds_map_add(the_addon, "mask", spr_generic_mask);

	ds_list_add(my_stage[? "obj_addons"], the_addon);
	ds_list_mark_as_map(my_stage[? "obj_addons"], ds_list_size(my_stage[? "obj_addons"])-1);

#endregion

#region TOP BLOCK

	var model_list	= ds_list_create();
	
	var addon		= ds_map_create();
	var model		= d3d_model_create();
	
	car_init(model,path_block_1,path_block_1,path_block_1,1,128,256,384,384);

	if irandom(100) < 70 {
		var the_tex	= tex_concrete;
	}
	else {
		var the_tex	= spr_rock_wall;
	}
	
	ds_map_add(addon, "model", model);
	ds_map_add(addon, "x", 0);
	ds_map_add(addon, "y", 0);
	ds_map_add(addon, "z", 240);
	ds_map_add(addon, "texture", the_tex);
	ds_map_add(addon, "sub_img", irandom(sprite_get_number(addon[? "texture"])-1));

	ds_list_add(model_list, addon);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);
	
	var the_addon	= ds_map_create();

	ds_map_add_list(the_addon, "model_list", model_list);
	ds_map_add(the_addon, "u", my_stage[? "end"]);
	ds_map_add(the_addon, "w", 0);
	ds_map_add(the_addon, "z", 240);
	ds_map_add(the_addon, "set_trackdir", true);
	ds_map_add(the_addon, "resize_mask", true);
	ds_map_add(the_addon, "mask_width", 15);
	ds_map_add(the_addon, "mask_height", 15);
	ds_map_add(the_addon, "mask", spr_generic_mask);

	ds_list_add(my_stage[? "obj_addons"], the_addon);
	ds_list_mark_as_map(my_stage[? "obj_addons"], ds_list_size(my_stage[? "obj_addons"])-1);

#endregion

#endregion

	my_stage[? "stuff_loaded"]	= true;


}
