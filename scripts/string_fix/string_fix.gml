/// @description string_fix(number, places)
/// @param number
/// @param  places
function string_fix(argument0, argument1) {
	argument0 = string(argument0)
	return string_repeat("0",argument1 - string_length(argument0)) + argument0



}
