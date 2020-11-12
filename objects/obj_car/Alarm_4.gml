/// @description Relocate the car on track after crash

crashed		= false;
w			= 1.1;
movespd		= 0;
turn		= 0;
strength	= the_car[? "strength"];
actual_gear	= 1;
scr_face_track();

if is_opponent {
	controlscript	= csc_ai;
}
else {
	controlscript	= csc_player;
	//controlscript	= csc_ai;
}