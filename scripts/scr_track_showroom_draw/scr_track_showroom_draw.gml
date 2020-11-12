///	@description	Draw scenery info
function scr_track_showroom_draw() {

	var logo_x	= x + 230;
	var logo_y	= y + 870;

	draw_sprite(the_item[? "track_logo"],0,logo_x,logo_y);

	var col_x		= x + 480;
	var col_y		= y + 750;
	var y_sep		= 40;

	var total_len	= 0;

	draw_sprite(spr_lower_frame,0,x,y+640);

	draw_text_init(font_eras_bold_itc_26,fa_left,fa_middle);

	for(var i=0;i<ds_list_size(sub_list);i++){
	//for(var i=0;i<16;i++){
		if i == 8 {
			col_x	+= 500;
			col_y	= y + 750;
		}
	
		draw_text_init(font_eras_bold_itc_26,fa_left,fa_middle);
		var the_stage	= sub_list[| i];
		var stage_len	= the_stage[? "length"]*(the_stage[? "end"]-the_stage[? "start"])/global.len_per_mile;
		draw_sprite_ext(spr_arrow,0,col_x,col_y,0.3,0.3,0,c_white,1);
		draw_text(col_x + sprite_get_width(spr_arrow) * 0.4,col_y,"Section " + string(i+1) + ":");
		draw_text_init(font_eras_bold_itc_26,fa_right,fa_middle);
		draw_text(col_x + 450,col_y,string(stage_len) + " miles");
		total_len	+= stage_len;
		col_y		+= y_sep;
	}

	draw_text_init(font_eras_bold_itc_26,fa_left,fa_middle);
	draw_text(x + 480 + sprite_get_width(spr_arrow) * 0.4,y + 695,"TOTAL SECTIONS: " + string(ds_list_size(sub_list)));
	draw_text(x + 980 + sprite_get_width(spr_arrow) * 0.4,y + 695,"LENGTH: " + string(total_len) + " MILES");

	draw_text_init(font_eras_bold_itc_26,fa_center,fa_middle);
	draw_text(x + 1680,y + 710,"TOP SCORES");

	var score_x	= x + 1470;
	var score_y	= y + 750;

	var temp_scores	= ds_priority_create();
	ds_priority_copy(temp_scores, best_scores);

	for(var i=0;i<6;i++){
		if not ds_priority_empty(temp_scores) {
			var the_score	= ds_priority_delete_max(temp_scores);
			draw_text_init(font_eras_bold_itc_20,fa_left,fa_middle);
			draw_text(score_x,score_y,the_score[? "driver"]);
			draw_text_init(font_eras_bold_itc_20,fa_right,fa_middle);
			draw_text(score_x+420,score_y,string(the_score[? "points"]));
		}
		else {
			draw_text_init(font_eras_bold_itc_20,fa_left,fa_middle);
			draw_text(score_x,score_y,"-");
			draw_text_init(font_eras_bold_itc_20,fa_right,fa_middle);
			draw_text(score_x+420,score_y,"-");
		}
		score_y	+= 50;
	}


}
