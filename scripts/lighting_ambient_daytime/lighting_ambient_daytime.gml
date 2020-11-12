function lighting_ambient_daytime() {
	d3d_set_lighting(true)
	d3d_light_define_ambient($301010)
	d3d_light_define_direction(0,16,16,-100, $70A0C0);d3d_light_enable(0,true)
	d3d_light_define_direction(1,128,32,-5,  $90AAAA);d3d_light_enable(1,true)
	d3d_light_define_direction(2,164,16,-20, $90AAAA);d3d_light_enable(2,true)



}
