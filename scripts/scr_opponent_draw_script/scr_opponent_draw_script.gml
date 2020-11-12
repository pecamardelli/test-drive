///	@description	Draw opponent's stuff
function scr_opponent_draw_script() {

	draw_roundrect_color(x,y,x+width,y+height,current_color1,current_color2,false);
	draw_text_init(font_eras_bold_itc_30, fa_left, fa_middle);

	if driver != -1 {
		draw_text_color(x+10,y+height/2,driver[? "name"],c_white,c_white,c_white,c_white,image_alpha);
	}
	else {
		draw_text_color(x+10,y+height/2," - - - - - - - - -",c_white,c_white,c_white,c_white,image_alpha);
	}


}
