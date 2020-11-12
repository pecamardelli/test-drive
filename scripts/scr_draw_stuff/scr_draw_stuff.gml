/// @description
/// @param			plant_data		ds_list containing the plant data (see scr_create_plant)
function scr_draw_stuff() {

	var gb1x,gb1y,gb1z,gb2x,gb2y,gb2z;
	var nxu,atx,aty,nxx,nxy,face_to;
	var stuff_list	= stage_vars[? "draw_stuff"];
	// Draw the texture

	for(var i=lower_limit;i<upper_limit;i++){
		var my_stuff	= stuff_list[| i];
		nxu				= frac(my_stuff[? "u"] + global.ufactor);

		if my_stuff[? "facing"]	== "car" {
			atx				= track_get_x(my_stuff[? "u"],my_stuff[? "w"]);
			aty				= track_get_y(my_stuff[? "u"],my_stuff[? "w"]);
			nxx				= track_get_x(the_player.u,the_player.w);
			nxy				= track_get_y(the_player.u,the_player.w);
		}
		else if my_stuff[? "facing"]	== "track" {
			atx				= track_get_x(my_stuff[? "u"],0);
			aty				= track_get_y(my_stuff[? "u"],0);
			nxx				= track_get_x(nxu,0);
			nxy				= track_get_y(nxu,0);
		}

		face_to			= point_direction(atx,aty,nxx,nxy)

		gb1x = track_get_x(my_stuff[? "u"], my_stuff[? "w"]) - my_stuff[? "width"] / 2 * my_stuff[? "scale"] * sin(face_to*pi/180);
		gb1y = track_get_y(my_stuff[? "u"], my_stuff[? "w"]) - my_stuff[? "width"] / 2 * my_stuff[? "scale"] * cos(face_to*pi/180);
		gb1z = track_get_z(my_stuff[? "u"], my_stuff[? "w"]) + my_stuff[? "z"] + my_stuff[? "height"] * my_stuff[? "scale"];
		gb2x = track_get_x(my_stuff[? "u"], my_stuff[? "w"]) + my_stuff[? "width"] / 2 * my_stuff[? "scale"] * sin(face_to*pi/180);
		gb2y = track_get_y(my_stuff[? "u"], my_stuff[? "w"]) + my_stuff[? "width"] / 2 * my_stuff[? "scale"] * cos(face_to*pi/180);
		gb2z = track_get_z(my_stuff[? "u"], my_stuff[? "w"]) + my_stuff[? "z"];
	
		//d3d_draw_wall(gb1x,gb1y,gb1z,gb2x,gb2y,gb2z,sprite_get_texture(my_stuff[? "texture"],my_stuff[? "sub_img"]),1,1);
		d3d_draw_wall(gb1x,gb1y,gb1z,gb2x,gb2y,gb2z,my_stuff[? "texture"],1,1);
	
		// Check for collision with player_car
		if instance_position(track_get_x(my_stuff[? "u"],my_stuff[? "w"]), track_get_y(my_stuff[? "u"],my_stuff[? "w"]), the_player) and not the_player.finished and my_stuff[? "z"] < 100 {
			if not my_stuff[? "been_hit"] {
				audio_play_sound(global.collision_sounds[| irandom(ds_list_size(global.collision_sounds)-1)],1,false);
				collision_force	= the_player.movespd*my_stuff[? "strength"];
				the_player.strength			-= collision_force * 0.8;
				my_stuff[? "been_hit"]	= true;
				the_player.movespd			*= power(0.9,collision_force);
				//the_player.movespd	-= (the_player.movespd * my_stuff[? "strength"]) * 1.3;
				the_player.hits++;
			}
		}
	
		if my_stuff[? "draw_on_both_sides"] {
		
			// Check for collision with player_car
			if instance_position(track_get_x(my_stuff[? "u"],-my_stuff[? "w"]), track_get_y(my_stuff[? "u"],-my_stuff[? "w"]), the_player) and not the_player.finished  and my_stuff[? "z"] < 100 {
				if not my_stuff[? "been_hit"] {
					audio_play_sound(global.collision_sounds[| irandom(ds_list_size(global.collision_sounds)-1)],1,false);
					collision_force	= the_player.movespd*my_stuff[? "strength"];
					the_player.strength			-= collision_force * 0.8;
					my_stuff[? "been_hit"]	= true;
					the_player.movespd			*= power(0.9,collision_force);
					//the_player.movespd	-= (the_player.movespd * my_stuff[? "strength"]) * 1.1;
					the_player.hits++;
				}
			}
		
			nxu		= frac(my_stuff[? "u"] + global.trackstep/10);
		
			if my_stuff[? "facing"]	== "car" {
				atx		= track_get_x(my_stuff[? "u"],-my_stuff[? "w"])
				aty		= track_get_y(my_stuff[? "u"],-my_stuff[? "w"])
				nxx		= track_get_x(the_player.u,the_player.w)
				nxy		= track_get_y(the_player.u,the_player.w)
			}
			else if my_stuff[? "facing"]	== "track" {
				atx				= track_get_x(my_stuff[? "u"],0)
				aty				= track_get_y(my_stuff[? "u"],0)
				nxx				= track_get_x(nxu,0)
				nxy				= track_get_y(nxu,0)
			}

			face_to	= point_direction(atx,aty,nxx,nxy)
	
			gb1x = track_get_x(my_stuff[? "u"], -my_stuff[? "w"]) - my_stuff[? "width"] / 2 * my_stuff[? "scale"] * sin(face_to*pi/180);
			gb1y = track_get_y(my_stuff[? "u"], -my_stuff[? "w"]) - my_stuff[? "width"] / 2 * my_stuff[? "scale"] * cos(face_to*pi/180);
			gb1z = track_get_z(my_stuff[? "u"], -my_stuff[? "w"]) + my_stuff[? "z"] + my_stuff[? "height"] * my_stuff[? "scale"];
			gb2x = track_get_x(my_stuff[? "u"], -my_stuff[? "w"]) + my_stuff[? "width"] / 2 * my_stuff[? "scale"] * sin(face_to*pi/180);
			gb2y = track_get_y(my_stuff[? "u"], -my_stuff[? "w"]) + my_stuff[? "width"] / 2 * my_stuff[? "scale"] * cos(face_to*pi/180);
			gb2z = track_get_z(my_stuff[? "u"], -my_stuff[? "w"]) + my_stuff[? "z"];
		
			//d3d_draw_wall(gb1x,gb1y,gb1z,gb2x,gb2y,gb2z,sprite_get_texture(my_stuff[? "texture"],my_stuff[? "sub_img"]),1,1);
			d3d_draw_wall(gb1x,gb1y,gb1z,gb2x,gb2y,gb2z,my_stuff[? "texture"],1,1);
		}
	}



}
