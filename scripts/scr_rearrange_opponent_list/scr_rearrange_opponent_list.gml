///	@description	What the script name says
function scr_rearrange_opponent_list() {

	with obj_list_entry {
		if enabled {
			if y > other.creator.y {
				desired_y				-= 70;
				close_button.desired_y	-= 70;
			}
		}
	};


}
