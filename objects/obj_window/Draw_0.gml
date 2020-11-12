/// @description 

//draw_self();
draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,image_alpha);

draw_text_init(font_eras_bold_itc_26, fa_center, fa_middle);
draw_text_color(x,y-sprite_get_height(sprite_index)/2+60,caption, c_white, c_white, c_white, c_white, image_alpha);

if text_to_draw != "" {
	draw_text_color(x,y - sprite_get_height(sprite_index)*0.15,text_to_draw, c_white, c_white, c_white, c_white, image_alpha);
}
	
if image_alpha >= 1 {
	if draw_script > -1 {
		script_execute(draw_script);
	}
}