function scr_shake_camera() {
	if obj_guicontrol.playerid.movespd > 0 {
		obj_guicontrol.random_sign	= sign(random(obj_guicontrol.random_var)-50);
		obj_guicontrol.tplayercamz	= scr_approach(obj_guicontrol.tplayercamz, obj_guicontrol.playercarz + obj_guicontrol.tplayercamz_modifier * 1.3 * obj_guicontrol.random_sign, 0.04 * obj_guicontrol.playerid.movespd / 30);
	
		if obj_guicontrol.random_sign < 0 {
			obj_guicontrol.random_var	+= 10;
		}
		else {
			obj_guicontrol.random_var	-= 10;
		}
	}


}
