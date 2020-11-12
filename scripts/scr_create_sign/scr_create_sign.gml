/// @description
/// @param			u coordinate
/// @param			w coordinate
/// @param			z coordinate
function scr_create_sign(argument0, argument1, argument2) {

	var the_sign	= ds_map_create();

	the_sign[? "number"]				= 1;
	the_sign[? "distance"]				= 0.004;
	the_sign[? "texture"]				= spr_info_signs;
	the_sign[? "sub_img"]				= 1;
	//the_sign[? "pole_model"]			= global.model_small_pole;
	//the_sign[? "pole_texture"]			= sprite_get_texture(tex_steel,0);
	the_sign[? "u"]						= argument0;
	the_sign[? "u_factor"]				= 0;
	the_sign[? "w"]						= argument1;
	the_sign[? "z"]						= argument2;
	the_sign[? "draw_on_both_sides"]	= true;

	return the_sign;


}
