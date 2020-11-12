/// @description
/// @param			sign_data		containing the sign data (see scr_create_sign)
/// @param			sign_or_back	Are we drawing the sign (true) or the back side (false)?
function scr_draw_sign(argument0, argument1) {

	var nxu,atx,aty,nxx,nxy,trackdir,gb1x,gb1y,gb1z,gb2x,gb2y,gb2z,sub_img;

	if argument1 {
		sub_img	= argument0[? "sub_img"];
	}
	else {
		sub_img	= 0;
	}

	// calculate the angle difference between the texture and the track
	nxu				= frac(argument0[? "u"] + global.trackstep/10)

	atx				= track_get_x(argument0[? "u"],0)
	aty				= track_get_y(argument0[? "u"],0)
	nxx				= track_get_x(nxu,0)
	nxy				= track_get_y(nxu,0)

	trackdir		= point_direction(atx,aty,nxx,nxy)

	// Draw the texture
	for(var i=0;i<argument0[? "number"];i++){
		gb1x = track_get_x(argument0[? "u"] - argument0[? "u_factor"] - argument0[? "distance"]*i - global.trackstep * argument1 / 200, argument0[? "w"]) - sprite_get_width(argument0[? "texture"])/2 * sin(trackdir*pi/180);
		gb1y = track_get_y(argument0[? "u"] - argument0[? "u_factor"] - argument0[? "distance"]*i - global.trackstep * argument1 / 200, argument0[? "w"]) - sprite_get_width(argument0[? "texture"])/2 * cos(trackdir*pi/180);
		gb1z = track_get_z(argument0[? "u"] - argument0[? "u_factor"] - argument0[? "distance"]*i - global.trackstep * argument1 / 200, argument0[? "w"]) + argument0[? "z"] + sprite_get_height(argument0[? "texture"]) - 10;
		gb2x = track_get_x(argument0[? "u"] - argument0[? "u_factor"] - argument0[? "distance"]*i - global.trackstep * argument1 / 200, argument0[? "w"]) + sprite_get_width(argument0[? "texture"])/2 * sin(trackdir*pi/180);
		gb2y = track_get_y(argument0[? "u"] - argument0[? "u_factor"] - argument0[? "distance"]*i - global.trackstep * argument1 / 200, argument0[? "w"]) + sprite_get_width(argument0[? "texture"])/2 * cos(trackdir*pi/180);
		gb2z = track_get_z(argument0[? "u"] - argument0[? "u_factor"] - argument0[? "distance"]*i - global.trackstep * argument1 / 200, argument0[? "w"]) + argument0[? "z"] - 10;
		d3d_draw_wall(gb1x,gb1y,gb1z,gb2x,gb2y,gb2z,sprite_get_texture(argument0[? "texture"],sub_img),1,1);
	}



}
