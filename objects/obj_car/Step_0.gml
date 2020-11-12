/// @description Do stuff

script_execute_safe(statescript);
script_execute_safe(miscscript);

if count_time {
	//my_time	+= 1 / fps;
	my_time	+= fps / sqr(game_get_speed(gamespeed_fps));
}

if not vars_set {
	if driver != -1 {
		strength	= the_car[? "strength"];
		vars_set	= true;
	}
}

if crashed {
	if alarm_get(4) < 0 {
		alarm_set(4,5*game_get_speed(gamespeed_fps));
	}
	
	controlscript	= csc_crashed;
}

var gear_ratios	= the_car[? "ratios"];

if not car_dir_set {
	scr_face_track();
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
//image_angle	= scr_approach(facedir, facedir_modifier, random_range(0.9,1.1));

wheel_rpm	= movespd * global.km_per_unit / the_car[? "tyre_diam"] / 60;
rpm			= scr_approach(rpm, wheel_rpm * the_car[? "final_ratio"] * gear_ratios[| actual_gear], 85);

if rpm < the_car[? "engine_min_rpm"] {
	rpm = the_car[? "engine_min_rpm"];
}

if movespd * global.miles_per_unit > top_speed {
	top_speed	= movespd * global.miles_per_unit;
}

if not finished and place > 1 {
	unbeaten	= 0;
}

script_execute(drivingscript);

if finished {
	if not stats_set {
		//driver[? "stage_time"]				= round(my_time*1000);
		scr_calculate_stats();
		
		driver[? "stage_top_speed"]			= top_speed;
		driver[? "stage_unbeaten"]			= unbeaten;
	
		driver[? "race_time"]				+= driver[? "stage_time"];
		driver[? "race_hits"]				+= hits;
		driver[? "race_crashes"]			+= crashes;
		driver[? "race_breaks"]				+= breaks;
		driver[? "race_unbeaten"]			+= unbeaten;
	
		driver[? "total_stages"]			+= 1;
		driver[? "total_hits"]				+= hits;
		driver[? "total_crashes"]			+= crashes;
		driver[? "total_breaks"]			+= breaks;
		driver[? "total_time"]				+= driver[? "stage_time"];
		driver[? "total_unbeaten"]			+= unbeaten;
	
		if place == 1 {
			driver[? "race_wins"]++;
			driver[? "total_stages_won"]++;
		}
	
		if top_speed > driver[? "race_top_speed"] {
			driver[? "race_top_speed"]	= top_speed;
		}
	
		if hits == 0 and breaks == 0 and crashes == 0 {
			driver[? "stage_clean_run"]		= true;
			driver[? "race_clean_runs"]		+= 1;
			driver[? "total_clean_runs"]	+= 1;
		}
	
		stats_set	= true;
	}
	
	count_time	= false;
}
