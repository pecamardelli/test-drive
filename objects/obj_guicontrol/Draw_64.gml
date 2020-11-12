/// @description Draw stuff
d3d_set_lighting(false)

if not looking_back {
	if playerid.the_car[? "hood_base"] {
		draw_sprite_ext(playerid.the_car[? "hood_base"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,c_white,1);
	}

	if playerid.the_car[? "hood_paintable"] {
		draw_sprite_ext(playerid.the_car[? "hood_paintable"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,c_white,1);
		draw_sprite_ext(playerid.the_car[? "hood_paintable"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,playerid.the_car[? "color1"],0.5);
	}

	if playerid.crashed {
		//for(var i=0;i<ds_list_size(global.broken_glass_list);i++){
		for(var i=0;i<ds_list_size(broken_glasses);i++){
			//var the_glass	= global.broken_glass_list[| i];
			var the_glass	= broken_glasses[| i];
			draw_sprite_ext(the_glass[? "sprite_base"],the_glass[? "sub_img"],the_glass[? "x"],the_glass[? "y"],the_glass[? "x_scale"],the_glass[? "y_scale"],0,c_white,1);
		}
	}

	draw_sprite_ext(playerid.the_car[? "dash"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,c_white,1);

	if playerid.the_car[? "dash_paintable"] {
		draw_sprite_ext(playerid.the_car[? "dash_paintable"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,playerid.the_car[? "color1"],1);
	}


	#region GAUGE DRAWING

	// --------------------- SPEEDOMETER ---------------------- //

	if playerid.the_car[? "speedometer_bg"] {
		draw_sprite_ext(playerid.the_car[? "speedometer_bg"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,c_white,1);	
	}

	if playerid.the_car[? "spd_gauge"] {
		draw_sprite_ext(playerid.the_car[? "spd_gauge"],0,playerid.the_car[? "spd_gauge_x"],playerid.the_car[? "spd_gauge_y"],1,1,-spd_angle,c_white,1);
	}

	if playerid.the_car[? "speedometer_front"] {
		draw_sprite_ext(playerid.the_car[? "speedometer_front"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,c_white,1);	
	}

	// -------------------------------------------------------- //

	// --------------------- TACHOMETER ---------------------- //

	if playerid.the_car[? "tachometer_bg"] {
		draw_sprite_ext(playerid.the_car[? "tachometer_bg"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,c_white,1);
	}

	if playerid.the_car[? "rpm_gauge"] {
		draw_sprite_ext(playerid.the_car[? "rpm_gauge"],0,playerid.the_car[? "rpm_gauge_x"],playerid.the_car[? "rpm_gauge_y"],1,1,-rpm_angle,c_white,1);
	}

	if playerid.the_car[? "tachometer_front"] {
		draw_sprite_ext(playerid.the_car[? "tachometer_front"],0,0,__view_get( e__VW.HView, 0 ),1,1,0,c_white,1);
	}

	// ------------------------------------------------------- //

	#endregion

	var steering_wheel_angle	= playerid.turn * 90 / playerid.the_car[? "lateral_accel"];
	draw_sprite_ext(playerid.the_car[? "steering_wheel"],0,playerid.the_car[? "steering_wheel_x"],playerid.the_car[? "steering_wheel_y"],1,1,steering_wheel_angle,c_white,1)

	if playerid.the_car[? "steering_wheel_paintable"] {
		draw_sprite_ext(playerid.the_car[? "steering_wheel_paintable"],0,playerid.the_car[? "steering_wheel_x"],playerid.the_car[? "steering_wheel_y"],1,1,steering_wheel_angle,playerid.the_car[? "color1"],1)
	}
}

//draw_text_colour(__view_get( e__VW.WView, 0 )*0.7,0,string_hash_to_newline(string(playerid.movespd)),c_dkgray,c_dkgray,c_white,c_white,1)
//draw_text_colour(0,0,string(playerlap) + " - " + string(playerid.current_power),c_dkgray,c_dkgray,c_white,c_white,1)

/*
if draw_finish_window {
	draw_text_init(font_consolas,fa_center,fa_middle);
	draw_sprite_ext(spr_window_600x250,0,room_width/2,
										 room_height*0.3,1,1,0,c_white,1);
	draw_text_colour(room_width/2,room_height*0.3,finish_text,c_dkgray,c_dkgray,c_white,c_white,1);	
}
*/
//draw_racetrack_path(  global.track_path,__view_get( e__VW.WView, 0 )*0.75,__view_get( e__VW.HView, 0 )*0.75,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ))
//draw_racetrack_circle(global.track_path,__view_get( e__VW.WView, 0 )*0.75,__view_get( e__VW.HView, 0 )*0.75,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),playerpos,8,c_red)

if(splashcntr > 0){
    draw_set_halign(1)
    draw_set_valign(1)
    draw_set_font(font_futuristic_big)
    c2 = merge_color(splashcolor,c_black,0.5)
    draw_text_colour(__view_get( e__VW.WView, 0 )*0.5,__view_get( e__VW.HView, 0 )*0.5,string_hash_to_newline(splashtext),splashcolor,splashcolor,c2,c2,1)
    draw_set_halign(0)
    draw_set_valign(0)
}
d3d_set_lighting(true)

// Debug screen
draw_text_init(font_consolas,fa_left,fa_top);
draw_text_colour(10,0,"rpm: " + string(playerid.rpm) + " Speed: " + string(playerid.movespd*global.miles_per_unit) + " - hits: " + string(playerid.hits) + " - crashes: " + string(playerid.crashes) + " - breaks: " + string(playerid.breaks) + " - Position: " + string(playerid.place) + " lower_limit: " + string(obj_trackcontrol.lower_limit) + " upper_limit: " + string(obj_trackcontrol.upper_limit),c_dkgray,c_dkgray,c_white,c_white,1);
draw_text_colour(10,30,"u: " + string_format(playerid.u,1,4) + " nearest: " + string(playerid.nearest_dist) + " - fps: " + string(fps) + " - " + string(fps_real),c_dkgray,c_dkgray,c_white,c_white,1);
draw_text_colour(10,60,"Laptime: " + scr_get_lap_time(round(playerid.my_time*1000)) + " - Pause: " + string(global.pause),c_dkgray,c_dkgray,c_white,c_white,1);

/*
draw_text_colour(0,30,"at_point: " + string(playerid.at_point) + " - nx_point: " + string(playerid.nx_point) + " - ad_point: " + string(playerid.ad_point) + " - tgdir: " + string(playerid.tgdir) + " - ad: " + string(playerid.ad),c_dkgray,c_dkgray,c_white,c_white,1);
draw_text_colour(0,60,"at_point: " + string(playerid.at_point) + " - nx_point2: " + string(playerid.nx_point2) + " - ad_point2: " + string(playerid.ad_point2) + " - tgdir2: " + string(playerid.tgdir2) + " - ad2: " + string(playerid.ad2),c_dkgray,c_dkgray,c_white,c_white,1);
draw_text_colour(0,90, "lat acc: " + string(playerid.lateral_accel) + " - curve_speed1: " + string(playerid.curve_speed1) + " - curve_speed2: " + string(playerid.curve_speed2),c_dkgray,c_dkgray,c_white,c_white,1);
draw_text_colour(0,120,"turn:    " + string(playerid.turn) + " other dist: " + string(playerid.the_other_dist),c_dkgray,c_dkgray,c_white,c_white,1);

/*
draw_text_init(font_futuristic,2,0)
draw_text_colour(__view_get( e__VW.WView, 0 ),0,"fuel: " + string(playerid.the_car[? "fuel"]),c_dkgray,c_dkgray,c_white,c_white,1)
draw_text_init(font_consolas,fa_left,fa_top);
draw_text_colour(10,0,"gear: " + string(playerid.actual_gear) + " " + playerid.transmission[? "drive"],c_dkgray,c_dkgray,c_white,c_white,1)
draw_text_colour(250,0,"movedir: " + string(playerid.movedir) + " movespd: " + string(playerid.movespd),c_dkgray,c_dkgray,c_white,c_white,1);
draw_text_colour(0,50,"collision force with other: " + string(playerid.collision_force),c_dkgray,c_dkgray,c_white,c_white,1);

if playerid != NONE {
	draw_text_colour(__view_get( e__VW.WView, 0 )/2,30,"x: " + string(playerid.u) + " - w:" + string(playerid.w),c_dkgray,c_dkgray,c_white,c_white,1)
}