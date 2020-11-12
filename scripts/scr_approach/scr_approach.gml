/// @description scr_approach(var, limit, inc)
/// @param variable
/// @param limit
/// @param increment
function scr_approach(argument0, argument1, argument2) {

	if(argument0 < argument1){
		return min(argument0 + argument2, argument1);
	}
	else{
		return max(argument0 - argument2, argument1);
	}


}
