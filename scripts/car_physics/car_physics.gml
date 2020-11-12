function car_physics() {
	image_angle = facedir
	//effect_create_below(ef_smoke,x - lengthdir_x(32,facedir),y - lengthdir_y(32,facedir),0,merge_color(c_yellow,c_red,random_range(0.3,0.6)))

	if(movespd > 0){
	    player_apply_movement(movedir,movespd)
	}

	w = clamp(w,-3,3)

	if(w == -3 || w == 3){
	    if(movespd > 1){
	        //movespd -= wallhugf
			 movespd = max(0,movespd - deccel)
	    }
	}

	//Positioning
	z = track_get_z(u,w)



}
