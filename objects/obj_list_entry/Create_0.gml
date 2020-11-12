/// @description

enabled			= true;
level			= global.window_count;
caption			= "";
rect_color1		= $222222;
rect_color2		= $080808;
current_color1	= c_black;
current_color2	= c_black;
driver			= -1;
car				= -1;
creator			= -1;
selected		= false;
click_action	= -1;
draw_script		= -1;
sprite_index	= spr_pixel_transparent;

// Make entry visible only when its y value is within the range specified
// by the next two variables
visible_from_y		= 0;
visible_to_y		= room_height;
initial_y			= 0;
max_y				= 0;
width				= 660;
height				= 60;
separation			= 10;
image_xscale		= 580;
image_yscale		= height;
image_alpha			= 0;
with_checkbox		= false;
with_close_button	= false;
scrollable			= false;
scroll_slots		= 0;
scrolled			= 0;
checkbox			= -1;
close_button		= -1;
desired_y			= y;
visible				= false;
fade_out			= false;

close_button_destroy_action	= -1;
close_button_click_action	= -1;