///	@description	Removes opponent from list
function scr_remove_opponent() {

	var cont_list	= global.race_data[? "contestants"];
	var cont_list_size	= ds_list_size(cont_list);

	if driver > -1 {
		for(var i=0;i<cont_list_size;i++){
			if driver == cont_list[| i] {
				ds_list_delete(cont_list,i);
				break;
			}
		}
	}

	creator.fade_out	= true;
	fade_out			= true;
	/*
	instance_destroy(creator);
	instance_destroy();



/* end scr_remove_opponent */
}
