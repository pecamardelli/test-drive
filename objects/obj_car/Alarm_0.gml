/// @description Crash sounds

audio_play_sound(global.collision_sounds[| irandom(ds_list_size(global.collision_sounds)-1)],1,false);
crash_sound_number++;

if crash_sound_number < crash_sound_repeats {
	alarm_set(0,crash_sound_delay);
}
else {
	crash_sound_number	= 0;
	crash_sound_played	= false;
}