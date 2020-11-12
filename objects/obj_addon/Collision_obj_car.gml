/// @description 

if abs(other.z - model_data[? "z"]) > 140 {
	exit;
}

if not other.crashed and not other.is_opponent {
	var dbetween		= point_direction(x,y,other.x,other.y);
	var my_strength		= strength;
	var collision_force	= other.movespd * my_strength;

	other.movespd			*= power(0.9,collision_force);

	if collision_force > 10 {
		other.crashed			= true;
		other.controlscript		= csc_crashed;
	}
	else {
		with(other){
			if type == "car" {
			    player_add_motion(dbetween,my_strength*0.5,9999);
			    statescript = carstate_stun;
			    cntr        = 10;
				correct_dir	= true;
			}
		};
	}

	if dbetween > 70 && dbetween < 110 {
		with other {
			player_add_motion(dbetween-180,my_strength*0.005,9999);
		};
	}

	audio_play_sound(global.collision_sounds[| irandom(ds_list_size(global.collision_sounds)-1)],1,false);
}
