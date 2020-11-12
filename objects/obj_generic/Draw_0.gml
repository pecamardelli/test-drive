/// @description

if sprite_index != -1 {
	draw_self();
}

draw_text_init(font, text_halign, text_valign);
draw_text_color(x,y+1,text_to_draw, c_black, c_black, c_black, c_black, 1);

if draw_script {
	script_execute(draw_script);
}
