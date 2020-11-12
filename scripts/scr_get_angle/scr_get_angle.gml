///	@description	Get the angle difference between two points
/// @param	u_coord		Current u coord
///	@param	w_coord		Current w coord
///	@param	nxu_coord	Next u coord
///	@param	nxw_coord	Next w coord
function scr_get_angle(argument0, argument1, argument2, argument3) {

	var atx	= track_get_x(argument0,argument1);
	var aty	= track_get_y(argument0,argument1);
	var nxx	= track_get_x(argument2,argument3);
	var nxy	= track_get_y(argument2,argument3);

	return point_direction(atx,aty,nxx,nxy);


}
