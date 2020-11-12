///	@description	Draw code at car selection
function scr_car_showroom_draw() {

	var info_height	= 440;
	var col_sep		= 15;
	var sep			= 30;
	var lines		= ds_list_size(the_item[? "ratios"]) + 5;
	
	var initial_x	= x + 400;
	var initial_y	= y + room_height - info_height + (info_height - lines * sep) / 2 + 5;
		
	var text_x	= initial_x;
	var text_y	= initial_y;

	draw_sprite(spr_lower_frame_car,0,x,y+640);

	draw_text_init(font_eras_bold_itc_36,fa_center,fa_middle);
	draw_sprite(the_item[? "brand_logo"],0,x+20+sprite_get_width(the_item[? "brand_logo"])/2,y+860);
	draw_sprite(the_item[? "logo1"],0,x+room_width-20-sprite_get_width(the_item[? "logo1"])/2,y+860);
	//draw_sprite(the_car[? "logo2"],0,x+room_width-20-sprite_get_width(the_car[? "logo2"])/2,y+957);
	draw_text_color(x+room_width/2,initial_y-30,string(the_item[? "year"]) + " " + string_upper(the_item[? "maker"] + " " + the_item[? "model"] + " " + the_item[? "specs"]),c_white,c_white,c_white,c_white,1);
	
	draw_text_init(font_eras_bold_itc_20,fa_left,fa_top);
		
	draw_text_color(text_x,text_y,"Engine type:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Displacement:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Compression ratio:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Bhp @ rpm, SAE net:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Torque @ rpm, lb-ft:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Weight:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"kg-hp:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"CX:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Lateral accel:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Tyres:",c_white,c_white,c_white,c_white,1);
	
	draw_text_init(font_eras_bold_itc_20,fa_left,fa_top);
	
	var text_x	= room_width/2 + col_sep;
	var text_y	= initial_y;
	
	draw_text_color(text_x,text_y,"Transmission:",c_white,c_white,c_white,c_white,1);
	
	for(var i=0;i<ds_list_size(the_item[? "ratios"]);i++){
		text_y	+= sep;
		draw_text_color(text_x,text_y,global.gear_abbreviations[| i],c_white,c_white,c_white,c_white,1);
	}
	
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Final ratio:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"0-60 mph:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"1/4 mile:",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,"Top speed:",c_white,c_white,c_white,c_white,1);
	
	draw_text_init(font_eras_bold_itc_20,fa_right,fa_top);
	
	var text_x	= room_width/2 - col_sep;
	var text_y	= initial_y;
	
	draw_text_color(text_x,text_y,the_item[? "engine_type"] + " " + the_item[? "engine_specs1"] + " " + the_item[? "engine_specs2"],c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,the_item[? "engine_disp"],c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,the_item[? "engine_comp"],c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,string(the_item[? "engine_power"]) + " @ " + string(the_item[? "engine_rpm"]),c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,the_item[? "engine_torque"],c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,string(the_item[? "weight"]) + " kg",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,string(the_item[? "weight"] / the_item[? "engine_power"]),c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,string(the_item[? "cx"]),c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,string(the_item[? "lateral_accel"]) + " g",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,the_item[? "tyre_specs"],c_white,c_white,c_white,c_white,1);
	
	draw_text_init(font_eras_bold_itc_20,fa_right,fa_top);
	
	var text_x	= room_width - initial_x;
	var text_y	= initial_y;
	
	draw_text_color(text_x,text_y,the_item[? "transmission"],c_white,c_white,c_white,c_white,1);
	
	var ratio_list	= the_item[? "ratios"];
	
	for(var i=0;i<ds_list_size(ratio_list);i++){
		text_y	+= sep;
		draw_text_color(text_x,text_y,string(ratio_list[| i]),c_white,c_white,c_white,c_white,1);
	}
	
	text_y	+= sep;
	draw_text_color(text_x,text_y,string(the_item[? "final_ratio"]) + ":1",c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,the_item[? "zero_to_sixty"],c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,the_item[? "quarter_mile"],c_white,c_white,c_white,c_white,1);
	text_y	+= sep;
	draw_text_color(text_x,text_y,string(the_item[? "top_speed"]) + " mph",c_white,c_white,c_white,c_white,1);


}
