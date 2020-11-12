/// @description	Returns the lap time in minutes, seconds and cenths of seconds
/// @param			lap_time
function scr_get_lap_time(argument0) {

	var the_time	= argument0;

	var minutes = 0;

	while the_time >= 60000 {
		minutes++;
		the_time	-= 60000;
	}

	var seconds	= 0;

	while the_time >= 1000 {
		seconds++;
		the_time	-= 1000;
	}

	var the_string	= "";

	if minutes < 10 {
		the_string	+= "0" + string(minutes);
	}
	else {
		the_string	+= string(minutes);
	}

	the_string	+= ":";

	if seconds < 10 {
		the_string	+= "0" + string(seconds);
	}
	else {
		the_string	+= string(seconds);
	}

	if the_time < 10 {
		the_string	+= ".00" + string(the_time);
	}
	else if the_time < 100 {
		the_string	+= ".0" + string(the_time);
	}
	else {
		the_string	+= "." + string(the_time);
	}

	return the_string;




}
