/// @description Init

playerid				= NONE
playerplace				= 1
playerpos				= 0
playerlap				= 1
playercamx				= 0
playercamy				= 0
playercamz				= 0
playercarx				= 0
playercary				= 0
playercarz				= 0
playercardir			= 0
playercamdir			= 0
draw_finish_window		= false;
//finish_race				= false;
//time_stamp				= 0;
time					= 0
splashtext				= ""
splashcolor				= c_white
splashcntr				= 0
finish_text				= "";
crashed					= false;
looking_back			= false;

tplayercamz				= false;
tplayercamz_modifier	= 1;

view_width				= __view_get( e__VW.WView, 0 );
view_height				= __view_get( e__VW.HView, 0 );

random_var				= 100;
random_sign				= 0;

spd_angle				= 0;
rpm_angle				= 0;

broken_glasses	= ds_list_create();

for(var i=0;i<120;i++){
	var my_broken_glass	= ds_map_create();

	my_broken_glass[? "sprite_base"]	= spr_broken_glass_01;
	my_broken_glass[? "sub_img"]		= irandom(sprite_get_number(my_broken_glass[? "sprite_base"])-1);
	my_broken_glass[? "x"]				= random(view_width);
	my_broken_glass[? "y"]				= random(view_height);
	my_broken_glass[? "x_scale"]		= random_range(0.9,1.1);
	my_broken_glass[? "y_scale"]		= random_range(0.9,1.1);

	ds_list_add(broken_glasses,my_broken_glass);
	ds_list_mark_as_map(broken_glasses, ds_list_size(broken_glasses)-1);
}

part_system_automatic_draw(0,false)

