function scr_player_script() {
	if not engine_sound {
		audio_play_sound_on(s_emit,the_car[? "snd_idle"],true,0);
		engine_sound	= true;
	}

	audio_emitter_gain(s_emit, global.SFX);

	scr_set_accel();

	// This formula is a linear function
	var pitch = 1/(the_car[? "engine_max_rpm"] - the_car[? "engine_min_rpm"]) * rpm + 1 - 1/(the_car[? "engine_max_rpm"] - the_car[? "engine_min_rpm"]) * the_car[? "engine_min_rpm"];

	audio_emitter_pitch(s_emit,pitch);

	if k_shift_u {
		if actual_gear > 0 && actual_gear < ds_list_size(the_car[? "ratios"]) - 1 {
			actual_gear++;
		}
		else if actual_gear == 0 && movespd == 0 {
			actual_gear++;
		}
	}

	if k_shift_d {
		if actual_gear > 1 {
			actual_gear--;
		}
		else if actual_gear == 1 && movespd == 0 {
			actual_gear--;
		}
	}

	if obj_guicontrol.playerid.crashed {
		if not crash_sound_triggered {
			alarm_set(0, 1);
			crash_sound_triggered	= true;
		}
	}

	// Check right and left bounds and play dirt sounds if necessary
	if (w > global.w_right_bound || w < global.w_left_bound) && movespd > 0 {
		if alarm_get(1) < 0 {
			alarm_set(1,game_get_speed(gamespeed_fps)/movespd);
		}
	}


}
