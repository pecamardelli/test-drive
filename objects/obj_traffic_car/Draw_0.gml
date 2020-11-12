/// @description Draw

if the_car != -1 {
	d3d_transform_set_identity();
	d3d_transform_add_rotation_z(image_angle);
	d3d_transform_add_translation(x,y,z+10);
	
	draw_set_color(c_white);
	
	var model_list	= the_car[? "model_list"];
	
	for(var i=0; i < ds_list_size(model_list); i++) {
		var the_model	= model_list[| i];
		d3d_model_draw(the_model[? "model"], the_model[? "x"], the_model[? "y"], the_model[? "z"], sprite_get_texture(the_model[? "texture"],0));
	}

	d3d_transform_set_identity();

}