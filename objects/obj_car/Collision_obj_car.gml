/// @description Hit it
/*
var
dbetween = point_direction(x,y,other.x,other.y),
ospeed   = other.movespd,
sspeed   =       movespd
;
*/

var dbetween		= point_direction(x,y,other.x,other.y);
//var my_strength		= strength;
var my_x_force_magnitude	= the_car[? "weight"] * (1 + movespd * dcos(movedir));
var my_y_force_magnitude	= the_car[? "weight"] * (1 + movespd * dsin(movedir));
var other_x_force_magnitude	= other.the_car[? "weight"] * (1 + other.movespd * dcos(other.movedir));
var other_y_force_magnitude	= other.the_car[? "weight"] * (1 + other.movespd * dsin(other.movedir));
var resultant_force			= sqrt(sqr(my_x_force_magnitude - other_x_force_magnitude) + sqr(my_y_force_magnitude - other_y_force_magnitude));

collision_force	= resultant_force;
//collision_force	= abs(other.movespd - movespd) * sin(angle_difference(other.movedir, movedir));
	
if other.type == "car" or other.type == "traffic_car" {
	var ospeed		= other.movespd;
	var sspeed		= movespd;
}

with(other){
	if type == "car" or type == "traffic_car" {
	    //player_add_motion(dbetween,sspeed*0.2,9999);
		player_add_motion(dbetween,sspeed*0.02*(resultant_force/15000),9999);
		
		if not been_hit and not finished {
			been_hit	= true;
			hits++;
		}
		
		facedir		= movedir;
	}
};

statescript = carstate_stun;
cntr        = 10;

if abs(collision_force) > 15000 and not finished {
	if not crashed {
		crashes++;
	}
	crashed			= true;
	
	if not other.crashed {
		other.crashes++;
	}
	other.crashed		= true;
}

if is_opponent {
	facedir		= movedir;
}
else {
	audio_play_sound(global.collision_sounds[| irandom(ds_list_size(global.collision_sounds)-1)],1,false);
	player_add_motion(dbetween + 180,ospeed*0.2,9999);
	correct_dir	= true;
}

//facedir		= scr_approach(facedir, movedir, 1);

