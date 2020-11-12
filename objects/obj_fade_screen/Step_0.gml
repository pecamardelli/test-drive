/// @description 

if fade_in and not fade_out {
	if not draw {
		fade_alpha	= 1;		// We set fade_alpha to 0 before setting draw to true. This way we do this once
	}
	
	draw	= true;

	if fade_alpha > 0 {
		fade_alpha	-= 1 / (fade_time*game_get_speed(gamespeed_fps));
	}
	else {
		draw	= false;
		fade_in	= false;
		
		if finish_fade_action > -1 {
			script_execute(finish_fade_action);
		}
		
		instance_destroy();
	}
}

if fade_out and not fade_in {
	if not draw {
		fade_alpha	= 0;		// We set fade_alpha to 1 before setting draw to true. This way we do this once
	}
	
	draw	= true;
	
	if fade_alpha < 1 {
		fade_alpha	+= 1 / (fade_time*game_get_speed(gamespeed_fps));
	}
	else {
		draw		= false;
		fade_out	= false;
		
		if finish_fade_action > -1 {
			script_execute(finish_fade_action);
		}
		else if finish_fade_action < -1 {
			game_end();
		}
		
		instance_destroy();
	}
}