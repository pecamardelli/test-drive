/// @description 

if enabled {
	if instance_position(mouse_x,mouse_y,id) {
		if image_alpha <= 0.99 {
			image_alpha	+= 0.01;
		}
	}
	else {
		if image_alpha > 0.7 {
			image_alpha	-= 0.01;
		}
	}
	
	if instance_position(mouse_x,mouse_y,id) {
		cursor_sprite	= spr_icon_hand;
	}
}

if global.window_count > 0 {
	enabled	= false;
}
else {
	enabled	= true;
}
