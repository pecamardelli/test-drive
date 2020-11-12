/// @description 

switch room {
	case init_screen_1:		draw_sprite(spr_wallpaper_cars, car_wallpaper,0,0); break;
	case init_screen_2:		draw_sprite(spr_wallpaper_roads, road_wallpaper,0,0); break;
	case main_menu:			draw_sprite(spr_main_menu,0,0,0); break;
	case rm_game_options:	draw_sprite(spr_options_bg,0,0,0); break;
}