/// @description Do stuff
script_execute_safe(statescript);
//script_execute_safe(miscscript);

if crashed {
	controlscript	= csc_crashed;
}

if not car_dir_set {
	scr_face_track();
	
	if dir == -1 {
		facedir += 180;
		movedir += 180;
	}

	car_dir_set		= true;
}

if correct_dir {
	facedir		= scr_approach(facedir, movedir, sign(angle_difference(facedir,movedir)));
	
	if abs(angle_difference(facedir,movedir)) < 1 {
		facedir		= movedir;
		correct_dir	= false;
	}
}

image_angle	= facedir;

/*
if dir == 1 and u > obj_trackcontrol.stage_vars[? "end"] + (1 - obj_trackcontrol.stage_vars[? "end"]) / 2 {
	u = obj_trackcontrol.stage_vars[? "start"] / 2;
}
else if dir == -1 and u < obj_trackcontrol.stage_vars[? "start"] / 2 {
	u = obj_trackcontrol.stage_vars[? "end"] + (1 - obj_trackcontrol.stage_vars[? "end"]) / 2;
}
*/

if u < 0.02 or u > 0.98 {
	instance_destroy();
}

scr_am_I_visible();

script_execute(drivingscript);