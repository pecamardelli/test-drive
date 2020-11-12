/// @description csc_ai()
function csc_finish() {
	init_keys()

	//Find out where I am now
	at_point = u_lap
	nx_point = frac(global.ufactor*512 + at_point)
	ad_point = frac(global.ufactor*768 + at_point)
	tgdir    = point_direction(x,y,mean(track_get_x(nx_point,0),track_get_x(ad_point,0)),mean(track_get_y(nx_point,0),track_get_y(ad_point,0)))

	//Adjust angle when necessary by steering left or right when too far away from desired direction.

	if(w < -0.5){
	    k_r = true
	}
	if(w > -0.5){
	    k_l = true
	}

	movespd = max(0,movespd - deccel)

	if turn < 1 && turn > -1 {
		turn = w/2;
	}
	
	if movespd > 0 {
		facedir += turn
		movedir += turn
	}
	



}
