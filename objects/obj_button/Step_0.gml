/// @description 

if enabled {
	if instance_position(mouse_x, mouse_y,id) {
		colour_amount	= lerp(colour_amount,1,0.05);
	}
	else {
		colour_amount	= lerp(colour_amount,0,0.05);
	}
	merged_colour	= merge_color(colour,c_white,colour_amount);
	
	if instance_position(mouse_x,mouse_y,id) {
		cursor_sprite	= spr_icon_hand;
	}
}

if global.window_count != level {
	enabled		= false;
}
else {
	enabled		= true;
}

if instance_exists(creator) {
	image_alpha	= creator.image_alpha;
}
