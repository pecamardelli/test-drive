/// @description player_controls()
function player_controls() {
	if(k_u){
		if actual_gear == 0 {
			player_add_motion(facedir-180,accel,maxspeed);
		}
		else {
			player_add_motion(facedir,accel,maxspeed);
		}
	}
	else if(k_d){
	    movespd = max(0,movespd - deccel)
	}
	else{
	    movespd = max(0,movespd - frict)
	}


	// intVX = scrApproach(intVX, player_vars[? "run_speed"] * intMove, intTempAcc);

	//turn = scr_approach(turn, the_car[? "lateral_accel"], 1)

	//var lateral_accel	= max_turn / ( 1 + movespd * global.km_per_unit / 100 / the_car[? "lateral_accel"]);

	if movespd <= 70/global.km_per_unit * sqrt(the_car[? "lateral_accel"]) {
		var lateral_accel	= max_turn;
	}
	else {
		//lateral_accel	= max_turn / ( 1 + movespd * global.km_per_unit / 100 / the_car[? "lateral_accel"]);
		var lateral_accel	= max_turn / (movespd/(70/global.km_per_unit*sqrt(the_car[? "lateral_accel"]))) ;
	}

	if(k_l){
		turn = scr_approach(turn, lateral_accel, 0.04);
	}
	else if(k_r){
		turn = scr_approach(turn, -lateral_accel, 0.04);
	}
	else {
		turn = scr_approach(turn, 0, 0.01);
	}

	var correction_coef = 3;

	if movespd < correction_coef {
		turn_correction = sqr(movespd / correction_coef);
	}
	else {
		turn_correction	= 1;
	}
	
	if movespd > 0 {
		if actual_gear > 0 {
			facedir += turn * turn_correction;
			movedir += turn * turn_correction;
		}
		else {
			facedir -= turn * turn_correction;
			movedir -= turn * turn_correction;
		}
	}

	if k_lookb {
		var temp					= obj_guicontrol.playercamx;
		obj_guicontrol.playercamx	= obj_guicontrol.playercarx;
		obj_guicontrol.playercarx	= temp;
	
		var temp					= obj_guicontrol.playercamy;
		obj_guicontrol.playercamy	= obj_guicontrol.playercary;
		obj_guicontrol.playercary	= temp;
	
		obj_guicontrol.looking_back	= true;
	}
	else {
		obj_guicontrol.looking_back	= false;
	}


}
