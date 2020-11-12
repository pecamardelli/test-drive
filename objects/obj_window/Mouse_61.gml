/// @description 

if enabled {
	if instance_position(mouse_x,mouse_y,id) {
		with obj_list_entry {
			if scrollable and enabled {
				//if y > max_y {
				if scrolled < scroll_slots {
					desired_y	-= height + separation;
					scrolled++;
				}
			}
		};
	}
}