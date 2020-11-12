/// @description

draw_self();

draw_set_color(c_white);
draw_text_init(font_eras_bold_itc_30,fa_center,fa_middle);

if room == rm_stage_finish {
	scr_stage_standings_draw();
}
else {
	scr_race_standings_draw();
}


