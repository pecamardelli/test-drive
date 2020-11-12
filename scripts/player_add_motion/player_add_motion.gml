/// @description player_add_motion(dir,motionadd,capvalue)
/// @param dir
/// @param motionadd
/// @param capvalue
function player_add_motion(argument0, argument1, argument2) {
	direction = movedir
	speed     = movespd
	motion_add(argument0,argument1)
	if(speed > argument2){
	    speed = argument2
	}
	movedir = direction
	movespd = speed;


	speed   = 0


}
