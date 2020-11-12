function carstate_stun() {
	car_physics()

	cntr--
	if(!cntr){
	    statescript = carstate_normal
		been_hit	= false;
	}



}
