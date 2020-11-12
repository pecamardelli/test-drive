/// @description

// Some objects need to run the following script (if specified) even if the object is not enabled.
if step_action {
	script_execute(step_action);
}

y	= lerp(y,desired_y,0.1);

if enabled and click_action > -1 {
	if instance_position(mouse_x,mouse_y,id){
		cursor_sprite	= spr_icon_hand;
	}
}

if fade_out {
	image_alpha -=	global.alpha_amount;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}