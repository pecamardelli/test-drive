/// @description Init

//init_keys()
type				= "traffic_car";
the_car				= -1;
controlscript		= false;
//statescript			= carstate_startline
statescript			= carstate_normal;
miscscript			= NONE;
drivingscript		= NONE;

u			= 1.00		//Forward coordinate
u_lap		= 0.00		//Forward coordinate for this lap only
w			= 0.00		//Sideways coordinate
desired_w	= 0.5		//Desired Sideways coordinate
z			= 20		//Vertical coordinate
facedir		= 0			//Facing direction
movedir		= 0			//Direction of velocity, may differ from facedir.
movespd		= 0			//Magnitude of velocity
frict		= 0.02
accel		= 1;
deccel		= 0.12
max_turn	= global.max_grip;
turn		= 0
turn1		= 0;
turn2		= 0;
maxspeed	= 50 / global.miles_per_unit;
cntr		= 0;
dir			= 1;		// Forward direction. -1 indicates reverse direction.

car_dir_set		= true;
collision_force	= 0;
correct_dir		= false;

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

the_other_dist	= 0;

crashed			= false;
been_hit		= false;
strength		= 0;

nearest			= -1
nearest_dist	= 0;