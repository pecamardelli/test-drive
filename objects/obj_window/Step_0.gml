/// @description 

if script > -1 {
	script_execute(script);
	script	= false;
}

if level < global.window_count {
	with obj_window {
		if level == other.level {
			enabled	= false;
		}
	};	
}
else {
	with obj_window {
		if level == other.level {
			enabled	= true;
		}
	};
}

if image_alpha < 1 and not fade_out {
	image_alpha	+= global.alpha_amount;
}

if fade_out {
	image_alpha -=	global.alpha_amount;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}

