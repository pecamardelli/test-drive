/// @description Dirt sounds

audio_play_sound(global.dirt_sounds[| irandom(ds_list_size(global.dirt_sounds)-1)],1,false);

if (w > global.w_right_bound || w < global.w_left_bound) && movespd > 0 {
	alarm_set(1,game_get_speed(gamespeed_fps)/movespd*1.2);
}