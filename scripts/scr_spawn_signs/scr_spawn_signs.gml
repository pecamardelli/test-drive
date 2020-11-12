///	@description
/// @param			sign_list		: All road signs loaded int scr_load_track
///	@param			type			: "pole" or "sign"
function scr_spawn_signs(argument0, argument1) {

	var u,w,n;

	for(var i=0;i<ds_list_size(argument0);i++){
		var road_sign	= argument0[| i];
	
		if argument1 == "pole" and road_sign[? "pole_model"] != false {
			u				= road_sign[? "u"];
			w				= road_sign[? "w"];
			n				= instance_create(track_get_x(u,w),track_get_y(u,w),obj_addon);
			n.u				= u;
			n.my_model		= road_sign[? "pole_model"];
			n.my_texture	= road_sign[? "pole_texture"];
			n.resize_mask	= true;
			n.mask_width	= 5;
			n.mask_height	= 5;
			n.strength		= 0.1;
			n.z				= track_get_z(road_sign[? "u"],road_sign[? "w"]) - 10;
	
			if road_sign[? "spawn_both_sides"] {
				u				= road_sign[? "u"];
				w				= -road_sign[? "w"];
				n				= instance_create(track_get_x(u,w),track_get_y(u,w),obj_addon);
				n.u				= u;
				n.my_model		= road_sign[? "pole_model"];
				n.my_texture	= road_sign[? "pole_texture"];
				n.resize_mask	= true;
				n.mask_width	= 5;
				n.mask_height	= 5;
				n.strength		= 0.1;
				n.z				= track_get_z(road_sign[? "u"], -road_sign[? "w"]) - 10;
			}
		}

		if argument1 == "sign" {
			scr_draw_sign(road_sign, true);
			scr_draw_sign(road_sign, false);

			if road_sign[? "spawn_both_sides"] {
				road_sign[? "w"]	= -road_sign[? "w"];
				scr_draw_sign(road_sign, true);
				scr_draw_sign(road_sign, false);
			}
		}
	}


}
