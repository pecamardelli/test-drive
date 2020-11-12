/// @description Draw

if model_data > -1 {
	d3d_transform_set_identity()
	d3d_transform_add_rotation_z(trackdir + trackdir_z_rot);
	d3d_transform_add_rotation_x(trackdir_x_rot)
	d3d_transform_add_translation(x,y,z)
	draw_set_color(c_white)
	
	var model_list	= model_data[? "model_list"];
	
	for(var i=0; i < ds_list_size(model_list); i++) {
		var the_model	= model_list[| i];
		d3d_model_draw(the_model[? "model"], the_model[? "x"], the_model[? "y"], the_model[? "z"], sprite_get_texture(the_model[? "texture"],the_model[? "sub_img"]));
	}
	d3d_transform_set_identity()
}
