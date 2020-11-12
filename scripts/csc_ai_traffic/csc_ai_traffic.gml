/// @description csc_ai()
function csc_ai_traffic() {
	//init_keys()

	if not instance_number(obj_startcountdown) {
		//Find out where I am now
		at_point	= u_lap;

		nx_point	= frac(global.ufactor + at_point);
		ad_point	= frac(global.ufactor*256*dir + at_point);
		tgdir		= point_direction(x,y,mean(track_get_x(nx_point,desired_w),track_get_x(ad_point,desired_w)),mean(track_get_y(nx_point,desired_w),track_get_y(ad_point,desired_w)));
		ad			= angle_difference(facedir,tgdir);

		desired_w	= 0.55 * dir;

		turn1	= scr_approach(turn1, max_turn * sin(-ad*pi/180), 0.04);
		turn	= scr_approach(turn,turn1,0.1);

		if movespd < maxspeed {
			movespd	= scr_approach(movespd,maxspeed,0.01);
		}

		if movespd > 0 {
			facedir += turn
			movedir += turn
		}
	}


}
