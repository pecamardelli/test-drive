/// @description

global.window_count++;
sprite_index	= spr_window_600x250;
image_alpha		= 0;
enabled			= true;
level			= global.window_count;

x	= room_width / 2;
y	= room_height / 2;

script			= -1;
draw_script		= -1;
step_action		= -1;
click_action	= -1;
destroy_action	= -1;
caption			= "";
text_to_draw	= "";
fade_out		= false;
