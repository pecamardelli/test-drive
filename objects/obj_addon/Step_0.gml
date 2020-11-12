/// @description 

//scr_am_I_visible();

if model_data > -1 {
	if model_data[? "set_trackdir"] {
		nxu				= frac(model_data[? "u"] + global.ufactor)

		atx				= track_get_x(model_data[? "u"],model_data[? "w"])
		aty				= track_get_y(model_data[? "u"],model_data[? "w"])
		nxx				= track_get_x(nxu,model_data[? "w"])
		nxy				= track_get_y(nxu,model_data[? "w"])

		trackdir						= point_direction(atx,aty,nxx,nxy);
		model_data[? "set_trackdir"]	= false;
	}	
}

if not mask_set {
	if not is_undefined(model_data[? "mask"]) {
		sprite_index	= model_data[? "mask"];
	}
	mask_set	= true;
}

