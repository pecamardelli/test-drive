///	@description	Draw car's stuff
function scr_car_draw_script() {

	draw_roundrect_color(x,y,x+width,y+height,current_color1,current_color2,false);
	draw_text_init(font_eras_bold_itc_20, fa_left, fa_middle);

	if car > -1 {
		draw_sprite_ext(car[? "thumb"],0,x+80,y+height/2,0.5,0.5,0,c_white,image_alpha);
		draw_text_color(x+170,y+height/2,car[? "maker"] + " " + car[? "model"] + " " + car[? "specs"] + " " + string(car[? "year"]),c_white,c_white,c_white,c_white,image_alpha);
	}


}
