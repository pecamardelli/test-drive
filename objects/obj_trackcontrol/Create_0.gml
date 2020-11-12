/// @description Debug setup

window_set_cursor(cr_none);

draw_texture_flush();

the_track		= global.track_list[| global.race_data[? "track_index"]];
stage_vars		= the_track[| global.race_data[? "stage_index"]];

if not stage_vars[? "stuff_loaded"]	{
	script_execute(stage_vars[? "stuff_script"]);
}

var contest_list	= global.race_data[? "contestants"];

global.race_data[? "cars_player"]	= 1;
global.race_data[? "cars_total"]	= ds_list_size(contest_list) + global.race_data[? "cars_player"];

//stage_vars	= global.track_list[? "Mulholland_drive"];

global.track_path		= stage_vars[? "path"];
global.track_path_z		= stage_vars[? "path_z"];
global.trackwidth		= stage_vars[? "width"];
global.trackstep		= stage_vars[? "step"];
global.ufactor			= stage_vars[? "ufactor"];
global.uufactor			= stage_vars[? "uufactor"];
global.wfactor			= stage_vars[? "wfactor"];

track_texture   = stage_vars[? "texture"];

display_set_gui_size(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ))
x               = room_width * 0.5;
y               = room_height * 0.5;

d3d_start()

///Create stage 3D model
//track_model					= stage_model_create(track_texture,2,2,true,2,2.5,NONE,0,1)
//scr_save_track(track_model, stage_vars[? "track_id"], stage_vars[? "id"]);
//exit;

//the_track		= scr_load_track(stage_vars[? "name"]);
//track_model	= the_track[? "track_model"];
track_model		= scr_load_track(stage_vars[? "track_id"], stage_vars[? "id"]);

///Spawn players and countdown
//instance_create(0,0,obj_skyboxcontrol)

m = instance_create(0,0,obj_guicontrol);

for(car = 0; car < global.race_data[? "cars_total"]; car++) {
    global.finish_positions[car] = NONE
    //u = 1 - 32*car*stage_vars[? "ufactor"]
	//w = -0.25 + 0.5 * car;
	
	if global.race_data[? "cars_total"] == 2 {
		u = stage_vars[? "start"] + 0.0009 * car;
		w = -0.4 + 0.8 * car;
	}
	else {
		u = stage_vars[? "start"] - 160 * car * stage_vars[? "ufactor"]*2;
		w = -0.5 + car mod 2;
	}
	
    n = instance_create(track_get_x(u,w),track_get_y(u,w),obj_car)
	//n.stage_vars	= stage_vars;
    n.u = u
	n.uu= n.u*1000
    n.w = w
    n.driver_index = car
	n.car_dir_set	= false;
    if(car >= global.race_data[? "cars_total"] - global.race_data[? "cars_player"]){
		n.s_emit		= audio_emitter_create();
        n.sprite_index	= spr_carmask
        n.controlscript	= csc_player
		//n.controlscript	= csc_ai
        n.miscscript	= miscsc_player
		n.drivingscript	= scr_player_script;
		//n.drivingscript	= scr_cpu_script;
		n.visible		= false;
        m.playerid		= n
		the_player		= n;
		//n.the_car		= global.car_list[| global.player_profile[? "car"]];
		n.driver		= global.player_profile;
		//n.the_car		= n.driver[? "car"];
        __view_set( e__VW.XView, 0, n.x - __view_get( e__VW.WView, 0 )*0.5 )
        __view_set( e__VW.YView, 0, n.y - __view_get( e__VW.HView, 0 )*0.5 )
        __view_set( e__VW.Angle, 0, 90 )
    }
    else{		
        n.sprite_index	= spr_debugenemy;
		n.driver		= contest_list[| car];
		//n.the_car		= n.driver[? "car"];
		
        n.controlscript	= csc_ai;
		//n.controlscript	= csc_finish;
		n.drivingscript	= scr_cpu_script;
		n.is_opponent	= true;
    }
	
	n.the_car		= n.driver[? "car"];
	//n.the_car		= global.car_list[| n.driver[? "car_index"]];
}

//var traffic_q	= irandom_range(10,30);
var traffic_q	= 100 * global.traffic_density;
var len			= stage_vars[? "end"] - stage_vars[? "start"] * 2;

for(var i=0;i<traffic_q;i++){
//for (var i=0;i<1;i++) {
	u = stage_vars[? "start"] * 2 + random(len);
	//u = 0.052;
	w = 0.5;
    n = instance_create(track_get_x(u,w),track_get_y(u,w),obj_traffic_car)

	n.the_car			= global.traffic_car_list[| irandom(ds_list_size(global.traffic_car_list)-1)];
	n.the_car[? "type"]	= "traffic_car";
    n.u					= u
	n.uu				= n.u*1000
	n.dir				= sign(irandom_range(-100,100));
    n.w					= w * n.dir;
	n.car_dir_set		= false;
	n.sprite_index		= spr_carmask;
	n.drivingscript		= csc_ai_traffic;
	//n.drivingscript		= csc_finish;
}
	
instance_create(0,0,obj_startcountdown);

global.number_finished		= 0;
//obj_guicontrol.finish_race	= true;

// Track addons
var obj_addons		= stage_vars[? "obj_addons"];

for(var i=0;i<ds_list_size(obj_addons);i++){
	var the_addon			= obj_addons[| i];
	var addon_obj			= instance_create(track_get_x(the_addon[? "u"],the_addon[? "w"]),track_get_y(the_addon[? "u"],the_addon[? "w"]),obj_addon);
	addon_obj.model_data	= the_addon;
}

///Init lighting
if(stage_vars[? "lighting"] <> NONE) {
    script_execute(stage_vars[? "lighting"]);
}

upper_limit		= 0;
lower_limit		= 0;
draw_stuff_size	= ds_list_size(stage_vars[? "draw_stuff"]);
collision_force	= 0;
angle_diff		= 0;