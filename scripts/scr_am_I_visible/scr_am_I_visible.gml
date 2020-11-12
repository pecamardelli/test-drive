/// @description	Change visible attribute to false when far away from player
function scr_am_I_visible() {
	var player_u	= obj_guicontrol.playerid.u;
	var u_diff		= abs(u - player_u);

	if u_diff < global.ufactor * global.max_view_dist {
		visible	= true;
	}
	else {
		visible	= false;
	}


}
