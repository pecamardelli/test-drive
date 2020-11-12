/// @description
/// @param			u			coordinate
/// @param			w			coordinate
/// @param			z			coordinate
/// @param			tex			Sprite to be used as the texture
///	@param			subimg		Sub image of the sprite
function scr_create_sprite(argument0, argument1, argument2, argument3, argument4) {

	var the_sprite	= ds_map_create();

	the_sprite[? "u"]					= argument0;
	the_sprite[? "w"]					= argument1;
	the_sprite[? "z"]					= argument2;
	the_sprite[? "texture"]				= sprite_get_texture(argument3,argument4);
	the_sprite[? "width"]				= sprite_get_width(argument3);
	the_sprite[? "height"]				= sprite_get_height(argument3);
	the_sprite[? "scale"]				= 1;
	the_sprite[? "strength"]			= 1;
	the_sprite[? "spawn_on_both_sides"]	= false;
	the_sprite[? "been_hit"]			= false;
	the_sprite[? "facing"]				= "car";

	return the_sprite;



}
