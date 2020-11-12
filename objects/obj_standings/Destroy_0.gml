/// @description 

if not ds_priority_empty(standings) {
	while (1) {
		var item	= ds_priority_delete_min(standings);
		
		if item {
			ds_map_destroy(item);
		}
		else {
			break;
		}
	}
}

ds_priority_destroy(standings);