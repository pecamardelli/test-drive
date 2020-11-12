function lighting_ambient_night() {
	d3d_set_lighting(true)
	d3d_light_define_ambient($000000)
	d3d_light_define_direction(0,16,16,-100, $904040);d3d_light_enable(0,true)



}
