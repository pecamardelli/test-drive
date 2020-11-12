/// @description cross_product(array1_xyz,array2_xyz)
/// @param array1_xyz
/// @param array2_xyz
function cross_product(argument0, argument1) {
	return array(
	argument0[1]*argument1[2] - argument0[2]*argument1[1],
	argument0[2]*argument1[0] - argument0[0]*argument1[2],
	argument0[0]*argument1[1] - argument0[1]*argument1[0]
	)



}
