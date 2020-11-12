///	@description	Draws the parameter determined by the bar
function scr_draw_param() {

	draw_text_init(font_eras_bold_itc_30,fa_left,fa_middle);

	if param == 0 {
		draw_text(max_x + 50,y,"0.00");
	}
	else if param == 1 {
		draw_text(max_x + 50,y,"1.00");
	}
	else {
		draw_text(max_x + 50,y,string(param));
	}


}
