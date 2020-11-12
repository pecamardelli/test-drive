/// @description	Generate the textures used to draw the car on the track
/// @param			car_ds
function scr_create_3d_textures(argument0) {

	var the_car	= argument0;

	// BODY

	var w		= sprite_get_width(the_car[? "body_tex"]);
	var h		= sprite_get_height(the_car[? "body_tex"]);
	var surf	= surface_create(w,h);

	surface_set_target(surf);

	if the_car[? "body_tex"] {
		draw_sprite(the_car[? "body_tex"],0,0,0);
	}

	if the_car[? "body_tex_paintable_1"] {
		draw_sprite_ext(the_car[? "body_tex_paintable_1"],0,0,0,1,1,0,the_car[? "color1"],1);
	}

	if the_car[? "body_tex_paintable_2"] {
		draw_sprite_ext(the_car[? "body_tex_paintable_2"],0,0,0,1,1,0,the_car[? "color2"],1);
	}

	if sprite_exists(the_car[? "body_sprite"]) {
		sprite_delete(the_car[? "body_sprite"]);
	}

	the_car[? "body_sprite"]	= sprite_create_from_surface(surf,0,0,w,h,false,false,0,0);

	surface_reset_target();

	surface_free(surf);

	// ROOF

	var w		= sprite_get_width(the_car[? "roof_tex"]);
	var h		= sprite_get_height(the_car[? "roof_tex"]);
	var surf	= surface_create(w,h);

	surface_set_target(surf);

	if the_car[? "roof_tex_paintable_1"] {
		draw_sprite_ext(the_car[? "roof_tex_paintable_1"],0,0,0,1,1,0,the_car[? "color1"],1);
	}

	if the_car[? "roof_tex_paintable_2"] {
		draw_sprite_ext(the_car[? "roof_tex_paintable_2"],0,0,0,1,1,0,the_car[? "color2"],1);
	}

	if the_car[? "roof_tex"] {
		draw_sprite(the_car[? "roof_tex"],0,0,0);
	}

	if sprite_exists(the_car[? "roof_sprite"]) {
		sprite_delete(the_car[? "roof_sprite"]);
	}

	the_car[? "roof_sprite"]	= sprite_create_from_surface(surf,0,0,w,h,false,false,0,0);

	surface_reset_target();

	surface_free(surf);



}
