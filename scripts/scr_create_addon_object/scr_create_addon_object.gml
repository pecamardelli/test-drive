///	@description	What the name says :D
///	@param			type
///	@param			u
/// @param			w
/// @param			z
function scr_create_addon_object(argument0, argument1, argument2, argument3) {

	var u_pos	= argument1;
	var w_pos	= argument2;
	var z_pos	= argument3;

	if argument0	== "rock" {
		var model_list	= ds_list_create();

		for(var i=0;i<irandom_range(1,50);i++){
			var addon		= ds_map_create();
			var model		= d3d_model_create();

			car_init(model, global.rock_paths[| irandom(ds_list_size(global.rock_paths)-1)],
							global.rock_paths[| irandom(ds_list_size(global.rock_paths)-1)],
							global.rock_paths[| irandom(ds_list_size(global.rock_paths)-1)],
							random_range(0.5,2),irandom_range(3,8),irandom_range(12,20),irandom_range(20,35),irandom_range(25,32));

			ds_map_add(addon, "model", model);
			ds_map_add(addon, "x", irandom_range(-300,300));
			ds_map_add(addon, "y", irandom_range(5,100)*sign(w_pos));
			ds_map_add(addon, "z", irandom_range(-5,-20));
			ds_map_add(addon, "texture", spr_rocks);
			ds_map_add(addon, "sub_img", irandom(sprite_get_number(spr_rocks)-1));

			ds_list_add(model_list, addon);
			ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);
		}
	
		var sign_dist	= random_range(0.0008,0.0013);
		var sign_start	= u_pos - random_range(0.005,0.009);
	
		for(var i=0;i<irandom_range(3,7);i++){
			var the_sign						= scr_create_sprite(sign_start-sign_dist*i,signs_w,signs_z,spr_road_signs,5 + i mod 2);
			the_sign[? "scale"]					= 1;
			the_sign[? "strength"]				= random_range(0.08,0.15);
			the_sign[? "draw_on_both_sides"]	= true;
			the_sign[? "facing"]				= "track";
				
			ds_list_add(other_signs, the_sign);
		}
		//ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
	
		if irandom(100) <= 70 {
			var cone_number		= irandom_range(4,10);
			var cone_dist		= random_range(0.00085,0.00115);
			var cone_start		= u_pos - cone_number/2 * cone_dist;
	
			for(var i=0;i<cone_number;i++){
				ds_list_add(road_cones_u, cone_start + cone_dist * i);
				ds_list_add(road_cones_w, sign(w_pos));
			}
		}
	
		var the_addon	= ds_map_create();

		ds_map_add_list(the_addon, "model_list", model_list);
		ds_map_add(the_addon, "u", u_pos);
		ds_map_add(the_addon, "w", w_pos);
		ds_map_add(the_addon, "z", z_pos);
		ds_map_add(the_addon, "set_trackdir", true);
		ds_map_add(the_addon, "resize_mask", true);
		ds_map_add(the_addon, "mask_width", 50);
		ds_map_add(the_addon, "mask_height", 180);
	}
	else if argument0	== "small_bridge" {
		var model_list	= ds_list_create();
	
		var addon		= ds_map_create();
		var model		= d3d_model_create();

		var the_path	= asset_get_index("path_small_bridge_" + string(irandom_range(1,4)));
	
		var bridge_width	= 25;
	
		car_init(model, the_path, the_path,the_path,1,bridge_width/4,bridge_width/2,bridge_width,bridge_width);

		ds_map_add(addon, "model", model);
		ds_map_add(addon, "x", 0);
		//ds_map_add(addon, "y", my_stage[? "width"] + bridge_width + irandom(10));
		ds_map_add(addon, "y", 0);
		ds_map_add(addon, "z", -5);
		ds_map_add(addon, "texture", tex_concrete);
		ds_map_add(addon, "sub_img", irandom(sprite_get_number(addon[? "texture"])-1));

		ds_list_add(model_list, addon);
		ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);
	
		if w_pos <= 1.15 {
			var cone_number		= irandom_range(4,10);
			var cone_dist		= random_range(0.00085,0.00115);
			var cone_start		= u_pos - cone_number/2 * cone_dist;
	
			for(var i=0;i<cone_number;i++){
				ds_list_add(road_cones_u, cone_start + cone_dist * i);
				ds_list_add(road_cones_w, sign(w_pos));
			}
		}
	
		var sign_start	= u_pos - random_range(0.005,0.009);
	
		var the_sign						= scr_create_sprite(sign_start,signs_w,signs_z,spr_road_signs,6);
		the_sign[? "scale"]					= 1;
		the_sign[? "strength"]				= random_range(0.08,0.15);
		the_sign[? "draw_on_both_sides"]	= true;
		the_sign[? "facing"]				= "track";
				
		ds_list_add(other_signs, the_sign);
	
		var the_addon	= ds_map_create();

		ds_map_add_list(the_addon, "model_list", model_list);
		ds_map_add(the_addon, "u", u_pos);
		ds_map_add(the_addon, "w", w_pos);
		ds_map_add(the_addon, "z", z_pos);
		ds_map_add(the_addon, "set_trackdir", true);
		ds_map_add(the_addon, "resize_mask", true);
		ds_map_add(the_addon, "mask_width", 15);
		ds_map_add(the_addon, "mask_height", 15);
		ds_map_add(the_addon, "mask", spr_generic_mask);
	}
	else if argument0	== "dirt_mound" {
		var model_list	= ds_list_create();
	
		var addon		= ds_map_create();
		var model		= d3d_model_create();
	
		car_init(model, path_dirt_mound_1, path_dirt_mound_2,path_dirt_mound_3,
				 random_range(0.5,2),
				 irandom_range(20,60),
				 irandom_range(60,100),
				 irandom_range(100,150),
				 irandom_range(100,150));

		ds_map_add(addon, "model", model);
		ds_map_add(addon, "x", 0);
		ds_map_add(addon, "y", 0);
		ds_map_add(addon, "z", -5);
		ds_map_add(addon, "texture", spr_dirt_mound);
		ds_map_add(addon, "sub_img", irandom(sprite_get_number(addon[? "texture"])-1));

		ds_list_add(model_list, addon);
		ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

		var u_dist				= my_stage[? "ufactor"] * irandom_range(150,250);
	
		var the_sign			= scr_create_sprite(u_pos - u_dist,w_pos,signs_z,spr_roadblocks,irandom(sprite_get_number(spr_roadblocks)-1));
		the_sign[? "scale"]		= 1;
		the_sign[? "strength"]	= random_range(0.05,0.12);
		the_sign[? "facing"]	= "track";
		ds_list_add(other_signs, the_sign);
	
		var the_sign			= scr_create_sprite(u_pos + u_dist,w_pos,signs_z,spr_roadblocks,irandom(sprite_get_number(spr_roadblocks)-1));
		the_sign[? "scale"]		= 1;
		the_sign[? "strength"]	= random_range(0.05,0.12);
		the_sign[? "facing"]	= "track";			
		ds_list_add(other_signs, the_sign);
	
		var sign_start	= u_pos - random_range(0.005,0.009);
	
		var the_sign						= scr_create_sprite(sign_start,signs_w,signs_z,spr_road_signs,4);
		the_sign[? "scale"]					= 1;
		the_sign[? "strength"]				= random_range(0.08,0.15);
		the_sign[? "draw_on_both_sides"]	= true;
		the_sign[? "facing"]				= "track";
				
		ds_list_add(other_signs, the_sign);
	
		var the_addon	= ds_map_create();

		ds_map_add_list(the_addon, "model_list", model_list);
		ds_map_add(the_addon, "u", u_pos);
		ds_map_add(the_addon, "w", w_pos);
		ds_map_add(the_addon, "z", z_pos);
		ds_map_add(the_addon, "set_trackdir", true);
		ds_map_add(the_addon, "resize_mask", true);
		ds_map_add(the_addon, "mask_width", 30);
		ds_map_add(the_addon, "mask_height", 30);
		ds_map_add(the_addon, "mask", spr_generic_mask);
	}

	return the_addon;


}
