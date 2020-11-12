/// @description 

//if room == init_screen_1 {
switch room {
	case init_screen_1:
		if not instance_exists(obj_fade_screen) {
			scr_fade_screen("out",global.fade_duration,-1,init_screen_2);
		}
		break;
//}
//else if room == init_screen_2 {
	case init_screen_2:
		if not instance_exists(obj_fade_screen){			
			scr_fade_screen("out",global.fade_duration,-1,main_menu);
		}
		break;
}