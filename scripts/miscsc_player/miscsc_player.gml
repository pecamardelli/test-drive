/// @description miscsc_player()
function miscsc_player() {
	__view_set( e__VW.XView, 0, x - __view_get( e__VW.WView, 0 )*0.5 + lengthdir_x(80,facedir) )
	__view_set( e__VW.YView, 0, y - __view_get( e__VW.HView, 0 )*0.5 + lengthdir_y(80,facedir) )
	//__view_set( e__VW.Angle, 0, lerp(__view_get( e__VW.Angle, 0 ),-(facedir - 90),0.05) )
	__view_set( e__VW.Angle, 0, 0 )



}
