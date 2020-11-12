/// @description

draw_self();

draw_set_color(c_white);

ds_priority_clear(temp_podium);
ds_priority_copy(temp_podium, podium);

var name_x			= room_width / 2;
var name_y			= 190;
var rect_x_padding	= 40;
var rect_y_padding	= 40;

var the_first	= ds_priority_delete_max(temp_podium);

var text_width	= string_width(the_first[? "name"]);
var text_height	= string_height(the_first[? "name"]);

var entry_x		= room_width / 2 - text_width / 2 - 40;
var entry_y		= name_y - text_height / 2 - 40; 

draw_roundrect_color(entry_x-rect_x_padding,
					 entry_y-rect_y_padding,
					 entry_x+text_width+rect_x_padding*2,
					 entry_y+text_height+rect_y_padding*2,
					 c_yellow,c_black,false);
					 
draw_text_init(font_eras_bold_itc_90,fa_center,fa_middle);
draw_text(name_x,name_y,the_first[? "name"]);

var the_car		= the_first[? "car"];
draw_sprite(the_car[? "thumb"],0, room_width-240, 190);

name_y	+= 350;

var the_second	= ds_priority_delete_max(temp_podium);

draw_text_init(font_eras_bold_itc_70,fa_center,fa_middle);
draw_text(name_x,name_y,the_second[? "name"]);

var the_car		= the_second[? "car"];
draw_sprite(the_car[? "thumb"],0, room_width-240, 540);

name_y	+= 350;

var the_third	= ds_priority_delete_max(temp_podium);

draw_text_init(font_eras_bold_itc_70,fa_center,fa_middle);
draw_text(name_x,name_y,the_third[? "name"]);

var the_car		= the_third[? "car"];
draw_sprite(the_car[? "thumb"],0, room_width-240, 890);