///	@description	Populates the stuff list
///	@param			plant_q
///	@param			pole_q
///	@param			km_q
///	@param			info_sign_q
///	@param			left_curve_list
///	@param			right_curve_list
function scr_populate_draw_stuff(argument0, argument1, argument2, argument3, argument4, argument5) {

	var plant_Q			= argument0;
	var pole_Q			= argument1;
	var km_stone_Q		= argument2;
	var info_sign_Q		= argument3;
	var curves_left		= argument4;
	var curves_right	= argument5;

	var u_step			= 1 / plant_Q;

	for(var i=0;i<plant_Q;i++){
		var u_pos		= u_step * i;
	
		if random(1) < 0.5 {
			var my_plant			= scr_create_sprite(u_pos,random_range(2,5)*(sign(random(100)-50)),-5,spr_bushes,irandom(sprite_get_number(spr_bushes)-1));
			my_plant[? "strength"]	= random_range(0.2,0.4);
		}
		else {
			var my_plant			= scr_create_sprite(u_pos,random_range(2,5)*(sign(random(100)-50)),-5,spr_trees,irandom(sprite_get_number(spr_trees)-1));
			my_plant[? "strength"]	= random_range(0.5,0.8);
		}

		my_plant[? "scale"]		= random_range(1.2,2);
	
		ds_list_add(my_stage[? "draw_stuff"], my_plant);
		ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
		
		if i mod round(plant_Q/pole_Q) == 0 {
			var my_pole	= scr_create_sprite(u_step * i,2,-20,spr_electric_pole,irandom(sprite_get_number(spr_electric_pole)-1));
			my_pole[? "scale"]		= 1;
			my_pole[? "strength"]	= random_range(1.1,1.5);
			
			ds_list_add(my_stage[? "draw_stuff"], my_pole);
			ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
		}
		
		if i mod round(plant_Q/km_stone_Q) == 0 {
			var my_stone						= scr_create_sprite(u_step * i,1.7,-20,spr_km_stone,irandom(sprite_get_number(spr_km_stone)-1));
			my_stone[? "scale"]					= 1;
			my_stone[? "strength"]				= random_range(0.07,0.12);
			my_stone[? "draw_on_both_sides"]	= true;
			
			ds_list_add(my_stage[? "draw_stuff"], my_stone);
			ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
		}
		
		if i mod round(plant_Q/info_sign_Q) == 0 {
			var my_info						= scr_create_sprite(u_step * i + random_range(-u_step*5,u_step*5),signs_w,signs_z,spr_info_signs,irandom(sprite_get_number(spr_info_signs)-1));
			my_info[? "scale"]				= 1;
			my_info[? "strength"]			= random_range(0.08,0.15);
			my_info[? "draw_on_both_sides"]	= true;
			my_info[? "facing"]				= "track";
			
			ds_list_add(my_stage[? "draw_stuff"], my_info);
			ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
		}
	
		for(var k=0;k<ds_list_size(curves_left);k++){
			if curves_left[| k] >= u_pos - u_step and curves_left[| k] <= u_pos + u_step {
				var my_sign						= scr_create_sprite(curves_left[| k],signs_w,signs_z,spr_road_signs,1);
				my_sign[? "scale"]				= 1;
				my_sign[? "strength"]			= random_range(0.08,0.15);
				my_sign[? "draw_on_both_sides"]	= true;
				my_sign[? "facing"]				= "track";
				
				ds_list_add(my_stage[? "draw_stuff"], my_sign);
				ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
			
				ds_list_delete(curves_left, k);
			}
		}
		
		for(var k=0;k<ds_list_size(curves_right);k++){
			if curves_right[| k] >= u_pos - u_step and curves_right[| k] <= u_pos + u_step {
				var my_sign						= scr_create_sprite(curves_right[| k],signs_w,signs_z,spr_road_signs,2);
				my_sign[? "scale"]				= 1;
				my_sign[? "strength"]			= random_range(0.08,0.15);
				my_sign[? "draw_on_both_sides"]	= true;
				my_sign[? "facing"]				= "track";
				
				ds_list_add(my_stage[? "draw_stuff"], my_sign);
				ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
			
				ds_list_delete(curves_right, k);
			}
		}
	
		for(var k=0;k<ds_list_size(other_signs);k++){
			var the_sign	= other_signs[| k];
			if the_sign[? "u"] >= u_pos - u_step and the_sign[? "u"] <= u_pos + u_step {
				ds_list_add(my_stage[? "draw_stuff"], the_sign);
				ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
				ds_list_delete(other_signs,k);
			}
		}
	
		for(var k=0;k<ds_list_size(road_cones_u);k++){
			if road_cones_u[| k] >= u_pos - u_step and road_cones_u[| k] <= u_pos + u_step {
				var my_sign	= scr_create_sprite(road_cones_u[| k],road_cones_w[| k],-3,spr_road_cones,irandom(sprite_get_number(spr_road_cones)-1));
				my_sign[? "scale"]		= 1;
				my_sign[? "strength"]	= random_range(0.01,0.03);
				
				ds_list_add(my_stage[? "draw_stuff"], my_sign);
				ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
			
				ds_list_delete(road_cones_u, k);
			}
		}
	
		if my_stage[? "end"] >= u_pos - u_step and my_stage[? "end"] <= u_pos + u_step {
			var finish_sign				= scr_create_sprite(my_stage[? "end"]-my_stage[? "ufactor"]*15,0,240,spr_finish_sign,1);
			finish_sign[? "scale"]		= 1;
			finish_sign[? "strength"]	= random_range(0.08,0.15);
			finish_sign[? "facing"]		= "track";
	
			ds_list_add(my_stage[? "draw_stuff"], finish_sign);
			ds_list_mark_as_map(my_stage[? "draw_stuff"], ds_list_size(my_stage[? "draw_stuff"])-1);
		}
	}


}
