/// @description place_get_string()
function place_get_string(argument0) {
	switch(argument0){
	    case 1: return "1st"
	    case 2: return "2nd"
	    case 3: return "3rd"
	    default:return string(argument0) + "th"
	}



}
