function scr_set_accel() {
	if rpm <= the_car[? "engine_rpm"] {
		var rads = lerp(the_car[? "engine_min_rpm"]/the_car[? "engine_max_rpm"], pi/2, (rpm/the_car[? "engine_rpm"]));
	}
	else {
		var rads = lerp(pi/2, pi, (rpm - the_car[? "engine_rpm"]) / (the_car[? "engine_max_rpm"] - the_car[? "engine_rpm"]));
	}

	max_accel		= the_car[? "engine_power"] * sin(rads) / the_car[? "weight"] * accel_multiplier * the_car[? "final_ratio"] / 3.54;
	var multiplier	= 1.00 + movespd / 1000 * global.km_per_unit * the_car[? "cx"];
	accel			= max_accel - power(movespd, multiplier) / 1100;

	if movespd > abs(turn)/4 {
		movespd		-= abs(turn) / 20 * movespd / 40;
	}


}
