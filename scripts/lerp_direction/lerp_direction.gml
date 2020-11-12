/// @description lerp_direction(dir1,dir2,amount)
/// @param dir1
/// @param dir2
/// @param amount
function lerp_direction(argument0, argument1, argument2) {
	if(abs(argument0 - argument1) >= 180){
	    return lerp(min(argument0,argument1) + 360,max(argument0,argument1),argument2) mod 360
	}
	else{
	    return lerp(argument0,argument1,argument2)
	}



}
