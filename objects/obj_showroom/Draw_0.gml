/// @description 

if the_item != -1 {
	draw_sprite_ext(the_item[? "showroom"],current_subimg,x,y,1,1,0,c_white,abs(current_alpha));
	
	switch room {
		case rm_select_car:		scr_car_showroom_draw(); break;
		case rm_select_scenery:	scr_track_showroom_draw(); break;
	}
}