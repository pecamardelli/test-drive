/// @description

if hover_text == "Go to bottom" or hover_text == "Go to top" {
	with obj_list_entry {
		while 1 {
			if other.scroll_px > 0 {
				if  y < initial_y {
					y	+= other.scroll_px;
				}
				else {
					break;
				}
			}
			else {
				if y > max_y {
					y	+= other.scroll_px;
				}
				else {
					break;
				}
			}			
		}
	};
}
else {
	with obj_list_entry {
		if other.scroll_px > 0 {
			if  y < initial_y {
				y	+= other.scroll_px;
			}
		}
		else {
			if y > max_y {
				y	+= other.scroll_px;
			}
		}
	};
}