/// @description

if with_checkbox {
	if checkbox == -1 {
		checkbox	= instance_create_depth(x+width-sprite_get_width(spr_checkbox)/2-10,y+height/2,depth-1,obj_checkbox);
	}
}

if with_close_button {
	if close_button == -1 {
		close_button				= instance_create_depth(x+600+sprite_get_width(spr_close_window)/2,y+height/2,depth-1,obj_generic);
		close_button.sprite_index	= spr_close_window;
		close_button.creator		= id;
		close_button.click_action	= close_button_click_action;
		close_button.destroy_action	= close_button_destroy_action;
		close_button.driver			= driver;
		close_button.desired_y		= close_button.y;
	}
}

if enabled {
	if instance_position(mouse_x,mouse_y,id) {
		cursor_sprite	= spr_icon_hand;
	}
}

if global.window_count != level {
	enabled	= false;
	
	if instance_exists(close_button) {
		close_button.enabled	= false;
	}
}
else {
	enabled	= true;
	
	if instance_exists(close_button) {
		close_button.enabled	= true;
	}
}

y	= lerp(y,desired_y,0.1);

current_color1	= merge_color(c_black,rect_color1,image_alpha);
current_color2	= merge_color(c_black,rect_color2,image_alpha);

if y >= visible_from_y and y <= visible_to_y {
	visible	= true;
}
else {
	visible	= false;
}

if fade_out {
	if instance_exists(close_button) {
		close_button.fade_out	= true;
	}
	
	image_alpha -=	global.alpha_amount;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}
else {
	if image_alpha < 1 {
		image_alpha +=	global.alpha_amount;
	}
}