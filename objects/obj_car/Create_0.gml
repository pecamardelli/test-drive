/// @description Init

init_keys()
type				= "car";
driver				= -1;
the_car				= -1;
controlscript		= false;
statescript			= carstate_startline
miscscript			= NONE;
drivingscript		= NONE;
count_time			= false;
my_time				= 0;
accel_multiplier	= 0.35;

u			= 1.00		//Forward coordinate
u_lap		= 0.00		//Forward coordinate for this lap only
w			= 0.00		//Sideways coordinate
desired_w	= 0.5		//Desired Sideways coordinate
z			= 20		//Vertical coordinate
facedir		= 0			//Facing direction
movedir		= 0			//Direction of velocity, may differ from facedir.
movespd		= 0			//Magnitude of velocity
rpm			= 0;
rpm_angle	= 0;
spd_angle	= 0;
actual_gear	= 1;
frict		= 0.02
deccel		= 0.12
max_turn	= global.max_grip;
turn		= 0
turn1		= 0;
turn2		= 0;
maxspeed	= 100;
cntr		= 0;

place			= 0
placedraw		= false
finished		= false
race_position	= 0;
unbeaten		= 1;

driver_index	= NONE
is_opponent		= false;
vars_set		= false;
car_dir_set		= true;
collision_force	= 0;
correct_dir		= false;

s_emit			= audio_emitter_create();
engine_sound	= false;

crash_sound_triggered	= false;
crash_sound_repeats		= 24;
crash_sound_delay		= 2;
crash_sound_number		= 0;
crash_sound_played		= false;

engine_break_sound_repeats	= irandom_range(3,6);
engine_break_sound_delay	= 2;
engine_break_sound_number	= 0;

//Find out where I am now
at_point	= 0;
nx_point	= 0;
ad_point	= 0;
nx_point2	= 0;
ad_point2	= 0;
tgdir		= 0;
tgdir2		= 0;
ad			= 0;
ad2			= 0;

lateral_accel	= 0;
curve_speed1	= 0;
curve_speed2	= 0;

race_start		= 0;
race_finish		= 0;
the_other_dist	= 0;

crashed			= false;
been_hit		= false;
strength		= 0;
hits			= 0;
crashes			= 0;
breaks			= 0;
top_speed		= 0;

stats_set		= false;
nearest			= -1
nearest_dist	= 0;

nearest_tr		= -1;
nearest_tr_dist	= 0;