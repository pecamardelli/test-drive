/// @description track_get_y(u,w)
/// @param u
/// @param w
function track_get_y(argument0, argument1) {
	if(argument1 == 0){
	    return obj_trackcontrol.y + path_get_y(global.track_path,argument0)
	}
	else{
	    var cx, cy, dir,
	    dap, nap, apad, dir1, dir2;
	    dap = frac(floor(argument0*200)*0.005)
	    nap = frac(dap +                0.005)
	    apad= frac(nap +                0.005)
	    dir1= point_direction(path_get_x(global.track_path,dap),path_get_y(global.track_path,dap),path_get_x(global.track_path,nap ),path_get_y(global.track_path,nap ))
	    dir2= point_direction(path_get_x(global.track_path,nap),path_get_y(global.track_path,nap),path_get_x(global.track_path,apad),path_get_y(global.track_path,apad))
	    cx = path_get_x(global.track_path,argument0)
	    cy = path_get_y(global.track_path,argument0)
	    dir= lerp_direction(dir1,dir2,(argument0 - dap)*200) 
	    return cy + lengthdir_y(global.trackwidth*argument1,dir - 90) + obj_trackcontrol.y
	}



}
