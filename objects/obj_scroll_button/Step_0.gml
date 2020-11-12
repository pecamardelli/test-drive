/// @description 

if instance_position(mouse_x, mouse_y, id) {
	if hover_sprite {
		sprite_index	= hover_sprite;
	}
}
else {
	if idle_sprite {
		sprite_index	= idle_sprite;
	}
}