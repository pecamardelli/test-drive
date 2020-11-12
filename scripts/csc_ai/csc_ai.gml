/// @description csc_ai()
function csc_ai() {
	init_keys()

	if driver == -1 {
		exit;
	}

	//Find out where I am now
	at_point	= u_lap

	nx_point	= frac(global.ufactor * driver[? "ufactor_modifier"] + at_point);
	ad_point	= frac(global.ufactor*768  * driver[? "ufactor_modifier"] + at_point);
	tgdir		= point_direction(x,y,mean(track_get_x(nx_point,desired_w),track_get_x(ad_point,desired_w)),mean(track_get_y(nx_point,desired_w),track_get_y(ad_point,desired_w)));
	ad			= angle_difference(facedir,tgdir);

	nx_point1	= frac(global.ufactor*768 * driver[? "ufactor_modifier"]+ at_point);
	ad_point1	= frac(global.ufactor*2048 * driver[? "ufactor_modifier"] + at_point);
	tgdir1		= point_direction(x,y,mean(track_get_x(nx_point1,desired_w),track_get_x(ad_point1,desired_w)),mean(track_get_y(nx_point1,desired_w),track_get_y(ad_point1,desired_w)));
	ad1			= angle_difference(facedir,tgdir1);

	nx_point2	= frac(global.ufactor*2048 * driver[? "ufactor_modifier"] + at_point);
	ad_point2	= frac(global.ufactor*8192 * driver[? "ufactor_modifier"] + at_point);
	tgdir2		= point_direction(x,y,mean(track_get_x(nx_point2,desired_w),track_get_x(ad_point2,desired_w)),mean(track_get_y(nx_point2,desired_w),track_get_y(ad_point2,desired_w)));
	ad2			= angle_difference(facedir,tgdir2);

	if not finished {
	
		var change_w_to	= 0;
	
	
		var opps_u	= ds_priority_create();
	
		with obj_car {
			if other.u > u - global.ufactor * global.max_view_dist and other.u < u {
				ds_priority_add(opps_u, id, u);
			}
		}

		if not ds_priority_empty(opps_u) {
		
			nearest			= ds_priority_find_min(opps_u);
			nearest_dist	= point_distance_3d(track_get_x(u,w),
												track_get_y(u,w),
												track_get_z(u,w),
												track_get_x(nearest.u,nearest.w),
												track_get_y(nearest.u,nearest.w),
												track_get_z(nearest.u,nearest.w));
			if nearest_dist < 1500 and movespd > nearest.movespd {
				change_w_to	= 0.5 * sign(nearest.w) * -1;
		
				if abs(w - nearest.w) < 0.5 {
					movespd		= scr_approach(movespd, nearest.movespd,0.01*(movespd - nearest.movespd));
				}
			}
		}
	
		var traffic_u	= ds_priority_create();

		with obj_traffic_car {
			//if u > other.u {
			if other.u > u - global.ufactor * global.max_view_dist and other.u < u {
				ds_priority_add(traffic_u, id, u);
			}
		}

		if not ds_priority_empty(traffic_u) {
		
			nearest_tr		= ds_priority_find_min(traffic_u);
			nearest_tr_dist	= point_distance_3d(track_get_x(u,w),
												track_get_y(u,w),
												track_get_z(u,w),
												track_get_x(nearest_tr.u,nearest_tr.w),
												track_get_y(nearest_tr.u,nearest_tr.w),
												track_get_z(nearest_tr.u,nearest_tr.w));

			if nearest_tr_dist < 6000 {
				if change_w_to != 0 {
					//if sign(w) == sign(nearest_tr.w) {
					if abs(nearest_tr.w - w) < 0.5 {
						if nearest_tr.w < w {
							change_w_to = 0.001;
						}
						else {
							change_w_to = 1.1 * sign(nearest_tr.w);
						}
					}
					else {
						change_w_to	= sign(nearest_tr.w) * 0.5 * -1;
					}
				}
				else {
					change_w_to	= 0.5 * sign(nearest_tr.w) * -1;
				}
			}
		}
	
		if change_w_to != 0 {
			desired_w	= scr_approach(desired_w,change_w_to,0.03);
		}
		else {
			desired_w	= scr_approach(desired_w,power(abs(sin(ad1*pi/180)),0.5 * driver[? "power_modifier"])*sign(ad2),0.006);
		}
		
		//ds_priority_destroy(opps_u);
		//ds_priority_destroy(traffic_u);
	}
	else {
		desired_w	= 1.1;
	}


	if ad2 > 80 {
		ad2 = 80;
	}
	else if ad2 < -80 {
		ad2 = -80;
	}

	if movespd <= 70/global.km_per_unit * sqrt(the_car[? "lateral_accel"]) {
		lateral_accel	= max_turn;
	}
	else {
		//lateral_accel	= max_turn / ( 1 + movespd * global.km_per_unit / 100 / the_car[? "lateral_accel"]);
		lateral_accel	= max_turn / (movespd/(70/global.km_per_unit*sqrt(the_car[? "lateral_accel"]))) ;
	}

	curve_speed1	= cos(abs(ad)*pi/180) * the_car[? "lateral_accel"] * 200 / global.miles_per_unit * driver[? "curve_modifier"];
	curve_speed2	= cos(abs(ad2)*pi/180) * the_car[? "lateral_accel"] * 200 / global.miles_per_unit * driver[? "curve_modifier"];

	if curve_speed1 < 0 {
		curve_speed1 = 0;
	}

	if curve_speed2 < 0 {
		curve_speed2 = 0;
	}

	if movespd > curve_speed1 or movespd > curve_speed2 or finished {
		k_d	= true;
	}
	else {
		k_u	= true;
	}

	turn1	= scr_approach(turn1, max_turn * sin(-ad*pi/180), 0.04);

	if abs(turn1) > lateral_accel {
		turn1	= lateral_accel * sign(turn1);
	}

	turn2	= scr_approach(turn2, max_turn * sin(-ad1*pi/180), 0.04);

	if abs(turn2) > lateral_accel {
		turn2	= lateral_accel * sign(turn1);
	}

	if abs(turn1) < abs(turn2) {
		turn = scr_approach(turn,turn2,0.1);
	}
	else {
		turn = scr_approach(turn,turn1,0.1);
	}

	if(k_u){
		player_add_motion(movedir,accel,maxspeed)
	}
	else if(k_d){
		movespd = max(0,movespd - deccel)
	}

	if movespd > 0 {
		facedir += turn
		movedir += turn
	}

	scr_am_I_visible();



}
