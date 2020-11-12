/// @description 

angle_diff		= angle_difference(the_player.facedir,scr_get_angle(the_player.u,0,the_player.u+global.trackstep,0));
var the_cos		= cos(angle_diff*pi/180);
min_view_dist	= 1024 * global.ufactor * sign(the_cos);
max_view_dist	= min_view_dist + global.ufactor * global.max_view_dist * the_cos;

//lower_limit		= round(frac((the_player.u-global.ufactor*512))*draw_stuff_size);
if max_view_dist >= 0 {
	if obj_guicontrol.looking_back {
		lower_limit		= round(frac(the_player.u - max_view_dist)*draw_stuff_size);
	}
	else {
		lower_limit		= round(frac(the_player.u - min_view_dist)*draw_stuff_size);
	}
	
	upper_limit		= round(frac((the_player.u + max_view_dist))*draw_stuff_size);
}
else {
	lower_limit		= round(frac(the_player.u + max_view_dist)*draw_stuff_size);
	upper_limit		= round(frac(the_player.u - min_view_dist)*draw_stuff_size);
}

if upper_limit > draw_stuff_size {
	upper_limit = draw_stuff_size;
}

if not instance_exists(obj_startcountdown) {
	if collision_force >= the_player.strength and not the_player.finished {
		if not the_player.crashed {
			the_player.crashes++;
		}
		the_player.crashed			= true;
		obj_guicontrol.looking_back	= false;
		alarm_set(the_player.alarm[0],1);
		the_player.controlscript	= csc_crashed;
		collision_force				= 0;
	}
}

/*
if the_player.movespd < 0 {
	the_player.movespd	= 0;
}