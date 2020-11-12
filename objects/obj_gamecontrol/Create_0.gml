
// #######################
// ## GENERIC varIABLES ##
// #######################

randomize();
window_set_cursor(cr_none);
paths_init();
cars_init();
gpu_set_alphatestenable(true);
gpu_set_alphatestref(40);

randomize();

car_wallpaper			= -1;
road_wallpaper			= irandom(sprite_get_number(spr_wallpaper_roads));

cursor_sprite			= spr_icon_cursor;
global.max_view_dist	= 5120;
global.km_per_unit		= 6;
global.miles_per_unit	= global.km_per_unit / 1.6;
global.len_per_mile		= 57587.65512;
global.pound			= 0.453592;
global.inch				= 2.54;
global.w_left_bound		= -0.81;
global.w_right_bound	= 0.72;
global.max_grip			= 1.3;
global.dirt_grip		= 0.7;
global.pause			= false;

global.rock_paths		= ds_list_create();

ds_list_add(global.rock_paths, path_rock_1, path_rock_2, path_rock_3);

// Duration of fade in or out of the screens
global.fade_duration	= 0.5;

// Define the directory of each resource of the game.
global.saved_games_dir	= "saved\\";
global.track_dir		= "tracks\\";
global.data_dir			= "data\\";

// ###############################
// ## OVERALL IN-GAME VARIABLES ##
// ###############################

global.player_profile	= scr_create_driver_profile();
global.track_index		= 0;
global.SFX				= 0;		// Overall game sound gain
global.car_vol			= 1;
global.traffic_vol		= 1;
global.music_vol		= 1;
global.alpha_amount		= 0.03;
global.window_count		= 0;
global.max_opponents	= 2;
global.traffic_density	= 1;

scr_car_data();
scr_traffic_car_data();
scr_track_data();

global.race_data	= ds_map_create();

#region	MISCELLANEOUS

global.broken_glass_list	= ds_list_create();

var my_broken_glass	= ds_map_create();

my_broken_glass[? "sprite_base"]		= spr_broken_glass_01;
my_broken_glass[? "x"]			= 0;
my_broken_glass[? "y"]			= 0;
my_broken_glass[? "x_scale"]	= 0;
my_broken_glass[? "y_scale"]	= 0;

ds_list_add(global.broken_glass_list,my_broken_glass);
ds_list_mark_as_map(global.broken_glass_list, ds_list_size(global.broken_glass_list)-1);

var my_broken_glass	= ds_map_create();

my_broken_glass[? "sprite_base"]		= spr_broken_glass_02;
my_broken_glass[? "x"]			= 0;
my_broken_glass[? "y"]			= 0;
my_broken_glass[? "x_scale"]	= 0;
my_broken_glass[? "y_scale"]	= 0;

ds_list_add(global.broken_glass_list,my_broken_glass);
ds_list_mark_as_map(global.broken_glass_list, ds_list_size(global.broken_glass_list)-1);

var my_broken_glass	= ds_map_create();

my_broken_glass[? "sprite_base"]		= spr_broken_glass_03;
my_broken_glass[? "x"]			= 0;
my_broken_glass[? "y"]			= 0;
my_broken_glass[? "x_scale"]	= 0;
my_broken_glass[? "y_scale"]	= 0;

ds_list_add(global.broken_glass_list,my_broken_glass);
ds_list_mark_as_map(global.broken_glass_list, ds_list_size(global.broken_glass_list)-1);

var my_broken_glass	= ds_map_create();

my_broken_glass[? "sprite_base"]		= spr_broken_glass_04;
my_broken_glass[? "x"]			= 0;
my_broken_glass[? "y"]			= 0;
my_broken_glass[? "x_scale"]	= 0;
my_broken_glass[? "y_scale"]	= 0;

ds_list_add(global.broken_glass_list,my_broken_glass);
ds_list_mark_as_map(global.broken_glass_list, ds_list_size(global.broken_glass_list)-1);

// ### GEAR ABBREVIATIONS ### //

global.gear_abbreviations	= ds_list_create();

global.gear_abbreviations[| 0]	= "Reverse:";
global.gear_abbreviations[| 1]	= "1st gear:";
global.gear_abbreviations[| 2]	= "2nd gear:";
global.gear_abbreviations[| 3]	= "3rd gear:";
global.gear_abbreviations[| 4]	= "4th gear:";
global.gear_abbreviations[| 5]	= "5th gear:";
global.gear_abbreviations[| 6]	= "6th gear:";

#endregion

#region SOUNDS

global.collision_sounds			= ds_list_create();

global.collision_sounds[| 0]	= snd_collision_01;
global.collision_sounds[| 1]	= snd_metal_hit_01;
global.collision_sounds[| 2]	= snd_metal_hit_02;
global.collision_sounds[| 3]	= snd_metal_hit_03;
global.collision_sounds[| 4]	= snd_metal_hit_04;
global.collision_sounds[| 5]	= snd_metal_plane_hit_01;
global.collision_sounds[| 6]	= snd_metal_plane_hit_02;
global.collision_sounds[| 7]	= snd_plastic_hit_01;
global.collision_sounds[| 8]	= snd_wood_hit_01;
global.collision_sounds[| 9]	= snd_wood_hit_02;

global.dirt_sounds		= ds_list_create();

global.dirt_sounds[| 0]	= snd_dirt_01;
global.dirt_sounds[| 1]	= snd_dirt_02;
global.dirt_sounds[| 2]	= snd_dirt_03;
global.dirt_sounds[| 3]	= snd_dirt_04;
global.dirt_sounds[| 4]	= snd_dirt_05;
global.dirt_sounds[| 5]	= snd_dirt_06;

global.flat_tyre_sounds			= ds_list_create();

global.flat_tyre_sounds[| 0]	= snd_flat_tyre_01;
global.flat_tyre_sounds[| 1]	= snd_flat_tyre_02;
global.flat_tyre_sounds[| 2]	= snd_flat_tyre_03;
global.flat_tyre_sounds[| 3]	= snd_flat_tyre_04;
global.flat_tyre_sounds[| 4]	= snd_flat_tyre_05;
global.flat_tyre_sounds[| 5]	= snd_flat_tyre_06;
global.flat_tyre_sounds[| 6]	= snd_flat_tyre_07;
global.flat_tyre_sounds[| 7]	= snd_flat_tyre_08;
global.flat_tyre_sounds[| 8]	= snd_flat_tyre_09;

global.gear_grind_sounds		= ds_list_create();

global.gear_grind_sounds[| 0]	= snd_gear_grind_01;
global.gear_grind_sounds[| 1]	= snd_gear_grind_02;
global.gear_grind_sounds[| 2]	= snd_gear_grind_long_01;

global.engine_break_sounds		= ds_list_create();

global.engine_break_sounds[| 0]	= snd_engine_breakdown_01;
global.engine_break_sounds[| 1]	= snd_engine_breakdown_02;
global.engine_break_sounds[| 2]	= snd_engine_breakdown_03;
global.engine_break_sounds[| 3]	= snd_engine_breakdown_04;
global.engine_break_sounds[| 4]	= snd_engine_breakdown_05;
global.engine_break_sounds[| 5]	= snd_engine_breakdown_06;

#endregion

#region OPPONENT DATA

global.opp_file		= "opponents.dat";
global.opp_list		= ds_list_create();
global.opp_names	= ds_list_create();

global.opp_names[| 0]	= "Travis Daye";
global.opp_names[| 1]	= "Tse Sakamoto";
global.opp_names[| 2]	= "Kuly Goskie";
global.opp_names[| 3]	= "Mike Castoro";
global.opp_names[| 4]	= "Nigel Levins";
global.opp_names[| 5]	= "Kirch Gomez";
global.opp_names[| 6]	= "Castulo War";
global.opp_names[| 7]	= "Carlitos Way";
global.opp_names[| 8]	= "Pinklon Thomas";
global.opp_names[| 9]	= "Camello Diaz";
global.opp_names[| 10]	= "Apollo Crack";
global.opp_names[| 11]	= "Rins de Apoda";
global.opp_names[| 12]	= "Count Rumford";
global.opp_names[| 13]	= "Norman Bates";
global.opp_names[| 14]	= "Jimmy Clix";
global.opp_names[| 15]	= "Mack Enzie";
global.opp_names[| 16]	= "Pete Cantropus";
global.opp_names[| 17]	= "Sarlie Bronx";
global.opp_names[| 18]	= "Kiko Salas";
global.opp_names[| 19]	= "Manteca John";
global.opp_names[| 20]	= "Mack Pirincho";
global.opp_names[| 21]	= "Surtie Jack";

scr_load_opp_data();

#endregion

global.player_profile[? "car"]			= global.car_list[| 0];
global.player_profile[? "car_index"]	= 0;

global.race_data[? "total_laps"]	= 1;
global.race_data[? "track_index"]	= 0;
global.race_data[? "stage_index"]	= irandom(5);
global.race_data[? "contestants"]	= ds_list_create();

var driver;

//for(var i=0;i<irandom(global.max_opponents);i++){
for(var i=0;i<global.max_opponents;i++){
	if i < ds_map_size(global.opp_list) {
		driver		= global.opp_list[? global.opp_names[| i]];
	}
	else {
		driver		= global.opp_list[? global.opp_names[| irandom(ds_list_size(global.opp_names)-1)]];
	}
	
	driver[? "car"]			= global.car_list[| irandom(ds_list_size(global.car_list)-1)];
	driver[? "car_index"]	= 0;
	
	ds_list_add(global.race_data[? "contestants"], driver);
}

scr_clear_driver_stats(true, true);