function scr_car_data() {
	global.car_list		= ds_list_create();
	global.car_thumbs	= ds_map_create();

#region CORVETTE STING RAY 63

	var the_car = ds_map_create();

	the_car[? "brand"]				= "GM";
	the_car[? "brand_logo"]			= spr_chevrolet_logo_1950;
	the_car[? "maker"]				= "Chevrolet";
	the_car[? "model"]				= "Corvette";
	the_car[? "specs"]				= "Sting Ray";
	the_car[? "year"]				= 1963;
	the_car[? "weight"]				= 1436;
	the_car[? "cx"]					= 0.33;
	the_car[? "lateral_accel"]		= 0.7;
	the_car[? "zero_to_sixty"]		= "5.8 sec";
	the_car[? "quarter_mile"]		= "14.5 sec";
	the_car[? "top_speed"]			= 135;

	// Engine
	the_car[? "engine_type"]		= "OHV V8";
	the_car[? "engine_specs1"]		= "L84";
	the_car[? "engine_specs2"]		= "Ram-Jet FI";
	the_car[? "engine_disp"]		= "327 cu.in.";
	the_car[? "engine_comp"]		= "11.25:1";
	the_car[? "engine_power"]		= 360;
	the_car[? "engine_rpm"]			= 6000;
	the_car[? "engine_min_rpm"]		= 800;
	the_car[? "engine_max_rpm"]		= 7300;
	the_car[? "engine_torque"]		= "352 @ 4000";

	// Transmission
	the_car[? "transmission"]		= "4 spd. manual";

	ds_map_add_list(the_car,"ratios", ds_list_create());

	ds_list_add(the_car[? "ratios"], 2.26);		// Reverse
	ds_list_add(the_car[? "ratios"], 2.20);		// 1st
	ds_list_add(the_car[? "ratios"], 1.64);		// 2nd
	ds_list_add(the_car[? "ratios"], 1.31);		// 3rd
	ds_list_add(the_car[? "ratios"], 1);		// 4th

	the_car[? "final_ratio"]		= 3.08;

	the_car[? "tyre_specs"]			= "Whitewall Nylon 6.7x15";
	the_car[? "tyre_diam"]			= global.inch * (15 + 6.7 * 0.8) * pi / 100000;

	the_car[? "strength"]			= 8;

	the_car[? "id"]							= "vette63";
	the_car[? "enabled"]					= true;
	the_car[? "type"]						= "car";
	the_car[? "showroom"]					= spr_vette63_showroom;
	the_car[? "logo1"]						= spr_vette63_logo1;
	the_car[? "logo2"]						= spr_vette63_logo2;
	the_car[? "thumb"]						= spr_vette63_thumb;
	the_car[? "color1"]						= c_white;
	the_car[? "color2"]						= c_white;
	the_car[? "color3"]						= c_white;
	the_car[? "dash"]						= spr_vette63_dashboard;
	the_car[? "steering_wheel"]				= spr_vette63_steering_wheel;
	the_car[? "steering_wheel_paintable"]	= false;
	the_car[? "steering_wheel_x"]			= 684;
	the_car[? "steering_wheel_y"]			= 1119;

#region 3D MODEL DATA

	var model_scale			= 0.6;

	var model_list	= ds_list_create();

#region BODY

	var model	= ds_map_create();

	var n = d3d_model_create();
	//car_init(n,path_vette63_body_1,path_vette63_body_1,path_vette63_body_1,model_scale,22,32,36,38);
	car_init(n,path_vette63_tch_1,path_vette63_tch_2,path_vette63_tch_3,model_scale,22,28,36,37);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_vette63_body_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region ROOF

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_vette63_roof_1,path_vette63_roof_2,path_vette63_roof_3,model_scale,8,30,32,35);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_vette63_roof_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region REAR BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_empty,path_vette63_rear_bumper2_2,path_vette63_rear_bumper2_3,model_scale,6,6,39,39);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chromic);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_empty,path_vette63_front_bumper_1,path_vette63_front_bumper_1,model_scale,13,13,39,39);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chromic);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region TYRES

	var tyre_model = d3d_model_create()
	car_init(tyre_model,path_tyres,path_tyres,path_tyres,model_scale*1.6,1,2,4,4);

#region REAR

	var model	= ds_map_create();

	var rear_tyre_x	= -23;
	var rear_tyre_y	= 34;
	var rear_tyre_z	= 4;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var rear_tyre_x	= -23;
	var rear_tyre_y	= -34;
	var rear_tyre_z	= 4;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT

	var model	= ds_map_create();

	var front_tyre_x	= 102;
	var front_tyre_y	= 34;
	var front_tyre_z	= 4;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var front_tyre_x	= 102;
	var front_tyre_y	= -34;
	var front_tyre_z	= 4;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#endregion

	ds_map_add(the_car, "model_list", model_list);

#endregion

#region GAUGES

	// ##############
	// ##  GAUGES  ##
	// ##############

	the_car[? "speedometer_bg"]			= false;
	the_car[? "speedometer_front"]		= false;
	the_car[? "spd_gauge"]				= spr_vette63_speed_gauge;
	the_car[? "spd_gauge_unit"]			= global.miles_per_unit;
	the_car[? "spd_gauge_x"]			= 559;
	the_car[? "spd_gauge_y"]			= 870;
	the_car[? "spd_max_angle"]			= 308;
	the_car[? "spd_step_angle"]			= the_car[? "spd_max_angle"]/160;	// Degrees per miles

	the_car[? "tachometer_bg"]			= false;
	the_car[? "tachometer_front"]		= false;
	the_car[? "rpm_gauge"]				= spr_vette63_rpm_gauge;
	the_car[? "rpm_gauge_x"]			= 825;
	the_car[? "rpm_gauge_y"]			= 870;
	the_car[? "rpm_max_angle"]			= 308;
	the_car[? "rpm_step_angle"]			= the_car[? "rpm_max_angle"]/7000;		// Degrees per rpm

#endregion

#region SOUNDS

	the_car[? "snd_idle"]	= snd_chevy_216_idle;
	the_car[? "snd_down"]	= snd_chevy_216_down;
	the_car[? "snd_up"]		= snd_chevy_216_up;

#endregion

	ds_list_add(global.car_list, the_car);
	ds_list_mark_as_map(global.car_list, ds_list_size(global.car_list)-1);

	ds_map_add(global.car_thumbs, the_car[? "id"], the_car[? "thumb"]);

#endregion

#region SHELBY GT500 68

	var the_car = ds_map_create();

	the_car[? "brand"]				= "Ford";
	the_car[? "brand_logo"]			= spr_shelby_logo;
	the_car[? "maker"]				= "Shelby";
	the_car[? "model"]				= "GT500-KR";
	the_car[? "specs"]				= "";
	the_car[? "year"]				= 1968;
	the_car[? "weight"]				= 1470;
	the_car[? "cx"]					= 0.35;
	the_car[? "lateral_accel"]		= 0.67;
	the_car[? "zero_to_sixty"]		= "6 sec";
	the_car[? "quarter_mile"]		= "14.3 sec";
	the_car[? "top_speed"]			= 140;

	// Engine
	the_car[? "engine_type"]		= "OHV V8";
	the_car[? "engine_specs1"]		= "Cobra Jet";
	the_car[? "engine_specs2"]		= "";
	the_car[? "engine_disp"]		= "428 cu.in.";
	the_car[? "engine_comp"]		= "10.6:1";
	the_car[? "engine_power"]		= 435;
	the_car[? "engine_rpm"]			= 5200;
	the_car[? "engine_min_rpm"]		= 800;
	the_car[? "engine_max_rpm"]		= 7000;
	the_car[? "engine_torque"]		= "440 @ 3400";

	// Transmission
	the_car[? "transmission"]		= "4 spd. manual";

	ds_map_add_list(the_car,"ratios", ds_list_create());

	ds_list_add(the_car[? "ratios"], 2.78);		// Reverse
	ds_list_add(the_car[? "ratios"], 2.78);		// 1st
	ds_list_add(the_car[? "ratios"], 1.93);		// 2nd
	ds_list_add(the_car[? "ratios"], 1.36);		// 3rd
	ds_list_add(the_car[? "ratios"], 1);		// 4th

	the_car[? "final_ratio"]		= 3.25;

	the_car[? "tyre_specs"]			= "Blackwall 8x14";
	the_car[? "tyre_diam"]			= global.inch * (14 + 8 * 0.7) * pi / 100000;

	the_car[? "strength"]			= 9;

	the_car[? "id"]							= "shelbygt500";
	the_car[? "enabled"]					= true;
	the_car[? "type"]						= "car";
	the_car[? "showroom"]					= spr_shelby_gt500_showroom;
	the_car[? "logo1"]						= spr_shelby_gt500_logo1;
	the_car[? "logo2"]						= -1;
	the_car[? "thumb"]						= spr_shelby_gt500_thumb;
	the_car[? "color1"]						= c_white;
	the_car[? "color2"]						= c_white;
	the_car[? "color3"]						= c_white;
	the_car[? "dash"]						= spr_vette63_dashboard;
	the_car[? "steering_wheel"]				= spr_vette63_steering_wheel;
	the_car[? "steering_wheel_paintable"]	= false;
	the_car[? "steering_wheel_x"]			= 420;
	the_car[? "steering_wheel_y"]			= 667;

#region 3D MODEL DATA

	var model_list	= ds_list_create();

#region REAR FENDER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_rear_fender1,path_chevy40_rear_fender2,path_chevy40_rear_fender3,0.4,30,35,36,34);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_red_metal);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT FENDER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_front_fender1,path_chevy40_front_fender2,path_chevy40_front_fender3,0.4,30,35,36,34);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_red_metal);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region HEADLIGHTS

	var model	= ds_map_create();

	var headlight_y	= 23;

	var n = d3d_model_create();
	car_init(n,path_chevy40_headlight1,path_chevy40_headlight2,path_chevy40_headlight2,0.4,2,3,4,4);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", headlight_y);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_red_metal);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", -headlight_y);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_red_metal);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region TRUNK & COCKPIT

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_trunk1,path_chevy40_trunk2,path_chevy40_trunk3,0.4,22,28,30,29);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_red_metal);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region ROOF

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_roof1,path_chevy40_roof2,path_chevy40_roof3,0.4,18,23,26,27);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_red_metal);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_front1,path_chevy40_front2,path_chevy40_front3,0.4,5,16,27,26);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_red_metal);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region REAR BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_rear_bumper1,path_chevy40_rear_bumper2,path_chevy40_rear_bumper3,0.4,24,30,35,35);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chromic);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_front_bumper1,path_chevy40_front_bumper2,path_chevy40_front_bumper3,0.4,24,30,35,35);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chromic);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region STEPSIDE

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_step1,path_chevy40_step1,path_chevy40_step1,0.4,22,28,36,36);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chromic);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region TRUNK & COCKPIT

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_trunk1,path_chevy40_trunk2,path_chevy40_trunk3,0.4,22,28,30,29);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chevy40_3d_tex_latteral);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region ROOF

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_roof1,path_chevy40_roof2,path_chevy40_roof3,0.4,18,23,26,27);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chevy40_3d_tex_roof);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_front1,path_chevy40_front2,path_chevy40_front3,0.4,5,16,27,26);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chevy40_3d_tex_front);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region HEADLIGHT 2

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_chevy40_headlight4,path_chevy40_headlight5,path_chevy40_headlight6,0.4,2,3,4,4);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", headlight_y);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chevy40_3d_tex_headlight);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", -headlight_y);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_chevy40_3d_tex_headlight);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region TYRES

#region REAR

	var model	= ds_map_create();

	var rear_tyre_x	= -17;
	var rear_tyre_y	= 31;
	var rear_tyre_z	= 2;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var rear_tyre_x	= -17;
	var rear_tyre_y	= -31;
	var rear_tyre_z	= 2;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT

	var model	= ds_map_create();

	var front_tyre_x	= 84;
	var front_tyre_y	= 31;
	var front_tyre_z	= 2;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var front_tyre_x	= 84;
	var front_tyre_y	= -31;
	var front_tyre_z	= 2;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#endregion

	ds_map_add(the_car, "model_list", model_list);

#endregion

#region GAUGES

	// ##############
	// ##  GAUGES  ##
	// ##############

	the_car[? "speedometer_bg"]			= false;
	the_car[? "speedometer_front"]		= false;
	the_car[? "spd_gauge"]				= spr_vette63_speed_gauge;
	the_car[? "spd_gauge_unit"]			= global.miles_per_unit;
	the_car[? "spd_gauge_x"]			= 343;
	the_car[? "spd_gauge_y"]			= 514;
	the_car[? "spd_max_angle"]			= 308;
	the_car[? "spd_step_angle"]			= the_car[? "spd_max_angle"]/160;	// Degrees per miles

	the_car[? "tachometer_bg"]			= false;
	the_car[? "tachometer_front"]		= false;
	the_car[? "rpm_gauge"]				= spr_vette63_rpm_gauge;
	the_car[? "rpm_gauge_x"]			= 507;
	the_car[? "rpm_gauge_y"]			= 512;
	the_car[? "rpm_max_angle"]			= 308;
	the_car[? "rpm_step_angle"]			= the_car[? "rpm_max_angle"]/7000;		// Degrees per rpm

#endregion

	ds_list_add(global.car_list, the_car);
	ds_list_mark_as_map(global.car_list, ds_list_size(global.car_list)-1);

	ds_map_add(global.car_thumbs, the_car[? "id"], the_car[? "thumb"]);

#endregion


}
