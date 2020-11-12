/// @description track_get_z(u,w)
/// @param u
/// @param w
function track_get_z(argument0, argument1) {
	var w = argument1;//Just acknowledge that it's used, even though we currently won't actually use it.
	return -path_get_y(global.track_path_z,(argument0 mod 1))



}
