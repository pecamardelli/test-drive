/// @description Flat tyre sounds

audio_play_sound(global.flat_tyre_sounds[| irandom(ds_list_size(global.flat_tyre_sounds)-1)],1,false);

if movespd > 0 {
	alarm_set(2,game_get_speed(gamespeed_fps)/movespd*1.2);
}