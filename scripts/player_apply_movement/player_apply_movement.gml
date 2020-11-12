/// @description player_apply_movement(direction,distance)
/// @param direction
/// @param distance
function player_apply_movement(argument0, argument1) {
	var atx, aty, nxu, nxx, nxy, trackdir, alpha;

	nxu         = frac(u_lap + global.trackstep)

	atx         = track_get_x(u_lap,0)
	aty         = track_get_y(u_lap,0)
	nxx         = track_get_x(nxu,0)
	nxy         = track_get_y(nxu,0)

	if(point_distance(atx,aty,nxx,nxy) < 2){exit}

	trackdir    = point_direction(atx,aty,nxx,nxy)
	alpha       = angle_difference(trackdir,argument0)

	//u          += lengthdir_x(argument1*stage_vars[? "ufactor"],alpha)
	uu			+= lengthdir_x(argument1*global.uufactor,alpha)
	u			= uu/1000
	w			-= lengthdir_y(argument1*global.wfactor,alpha)


	u_lap = frac(u)//(u + 1) mod 1
	x = track_get_x(u_lap,w)
	y = track_get_y(u_lap,w)



}
