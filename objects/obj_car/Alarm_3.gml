/// @description Engine breakdown sounds

audio_play_sound(global.engine_break_sounds[| irandom(ds_list_size(global.engine_break_sounds)-1)],1,false);
engine_break_sound_number++;

if engine_break_sound_number < engine_break_sound_repeats {
	alarm_set(3,engine_break_sound_delay);
}