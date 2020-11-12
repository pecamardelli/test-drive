/// @description 

if destroy_action > -1 {
	script_execute(destroy_action);
}
else if destroy_action == -100 {
	game_end();
}

global.window_count--;