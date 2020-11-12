///	@description	Draw the stage standings
function scr_stage_standings_draw() {

	var entry_y		= 140;
	var col_y		= entry_y + 28;

	draw_text(title_x, title_y, stage_vars[? "name"] + " - " + string(stage_vars[? "miles_length"]) + " miles - RACE STANDINGS");

	var temp_stands	= ds_priority_create();
	ds_priority_copy(temp_stands, standings);

	for(var t=0;t<first_index;t++){
		ds_priority_delete_min(temp_stands);
	}

	//for(var i=0;i<ds_priority_size(standings);i++){
	if ds_priority_size(standings) < 10 {
		entries	= ds_priority_size(standings);
	}
	else {
		entries	= 10;
	}

	for(var i=0;i<entries;i++){
		var entry			= ds_priority_delete_min(temp_stands);
	
		//var contest_vars	= driver[? "contest_vars"];
		//var car				= driver[? "car"];
	
		if entry[? "is_player"] {
			var colour	= c_blue;
		}
		else {
			var colour	= c_gray;
		}
	
		draw_roundrect_color(entry_x,entry_y,entry_x+entry_width,entry_y+entry_height,colour,c_black,false);
	
		draw_text_init(font_eras_bold_itc_26,fa_center,fa_middle);
	
		draw_text(pos_x,col_y,string(i+first_index+1));
		show_debug_message(entry[? "car_id"])
		draw_sprite_ext(global.car_thumbs[? entry[? "car_id"]],0,car_x,col_y,0.4,0.4,0,c_white,1);
		draw_text(topspeed_x,col_y,string(entry[? "top_speed"]));
	
		var avg_speed	= 3600000 * stage_vars[? "miles_length"] / entry[? "laptime"];
	
		draw_text(avgspeed_x,col_y,string(avg_speed));
		draw_text(hits_x,col_y,string(entry[? "hits"]));
		draw_text(crashes_x,col_y,string(entry[? "crashes"]));
		draw_text(breaks_x,col_y,string(entry[? "breaks"]));
	
		draw_text(score_x,col_y,string(entry[? "points"]));

		draw_text_init(font_eras_bold_itc_26,fa_left,fa_middle);
	
		draw_text(name_x,col_y,entry[? "driver"]);
		draw_text(laptime_x,col_y,scr_get_lap_time(entry[? "laptime"]));

		var offset	= 15;
		
		if entry[? "clean_run"] {
			draw_sprite(spr_prize_clean_run,0,prizes_x,col_y);
		}
	
		if entry[? "the_fastest"] {
			draw_sprite(spr_prize_top_speed,0,prizes_x+sprite_get_width(spr_prize_clean_run)+offset,col_y);
		}
	
		if entry[? "unbeaten"] {
			draw_sprite(spr_prize_unbeaten,0,prizes_x+sprite_get_width(spr_prize_clean_run)*2+offset*2,col_y);
		}
	
		col_y	+= entry_height + entry_sep;
		entry_y	+= entry_height + entry_sep;
	}

	ds_priority_destroy(temp_stands);

	var temp_scores	= ds_priority_create();
	ds_priority_copy(temp_scores, best_scores);

	var entry_y		= 720;
	var col_y		= entry_y + 28;

	//for(var i=0;i<ds_priority_size(stage_vars[? "best_scores"]);i++){
	for(var i=0;i<6;i++){
		if not ds_priority_empty(temp_scores) {
			var entry			= ds_priority_delete_max(temp_scores);

			draw_roundrect_color(entry_x,entry_y,entry_x+entry_width,entry_y+entry_height,c_navy,c_black,false);
	
			draw_text_init(font_eras_bold_itc_26,fa_center,fa_middle);
	
			draw_text(pos_x,col_y,string(i+1));
			draw_sprite_ext(global.car_thumbs[? entry[? "car_id"]],0,car_x,col_y,0.4,0.4,0,c_white,1);
			draw_text(topspeed_x,col_y,string(entry[? "top_speed"]));
	
			var avg_speed	= 3600000 * stage_vars[? "miles_length"] / entry[? "laptime"];
	
			draw_text(avgspeed_x,col_y,string(avg_speed));
			draw_text(hits_x,col_y,string(entry[? "hits"]));
			draw_text(crashes_x,col_y,string(entry[? "crashes"]));
			draw_text(breaks_x,col_y,string(entry[? "breaks"]));
	
			draw_text(score_x,col_y,string(entry[? "points"]));
			draw_text(date_x,col_y,date_date_string(entry[? "date"]));

			draw_text_init(font_eras_bold_itc_26,fa_left,fa_middle);
	
			draw_text(name_x,col_y,entry[? "driver"]);
			draw_text(laptime_x,col_y,scr_get_lap_time(entry[? "laptime"]));
	
			col_y	+= entry_height + entry_sep;
			entry_y	+= entry_height + entry_sep;
		}
	}

	ds_priority_destroy(temp_scores);


}
