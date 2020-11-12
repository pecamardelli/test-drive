///	@description	Place the car facing the track
function scr_face_track() {

	/*
	nxu				= frac(u + global.trackstep);

	atx				= track_get_x(u,w)
	aty				= track_get_y(u,w)
	nxx				= track_get_x(nxu,w)
	nxy				= track_get_y(nxu,w)

	//image_angle		= point_direction(atx,aty,nxx,nxy)
	facedir			= point_direction(atx,aty,nxx,nxy);
	*/

	facedir			= scr_get_angle(u,w,frac(u + global.trackstep),w);
	movedir			= facedir;


}
