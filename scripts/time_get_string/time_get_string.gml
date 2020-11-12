/// @description time_get_string(frames)
/// @param frames
function time_get_string(argument0) {
	var mins, secs, hund;
	hund = clamp((argument0 mod  RACE_FRAMERATE)*1.667,0,99)
	secs = clamp((argument0 div  RACE_FRAMERATE) mod 60,0,59)
	mins =        argument0 div (RACE_FRAMERATE*60)
	return string_fix(mins,2) + "'" + string_fix(secs,2) + "\"" + string_fix(floor(hund),2)



}
