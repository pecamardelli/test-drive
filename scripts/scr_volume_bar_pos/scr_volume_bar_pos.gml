///	@description	Positioning of the button within the bar
function scr_volume_bar_pos() {

	if mouse_x >= min_x and mouse_x <= max_x {
		x	= mouse_x;
	}

	var length		= max_x - min_x;
	var button_x	= mouse_x - min_x;
	var num			= button_x / length;

	if num < 0 {
		num	= 0;
	}
	else if num > 1 {
		num	= 1;
	}

	if param == "sfx" {
		global.SFX	= num;
	}
	else if param == "car" {
		global.car_vol	= num;
	}
	else if param == "traffic" {
		global.traffic_vol	= num;
	}
	else if param == "music" {
		global.music_vol	= num;
	}




}
