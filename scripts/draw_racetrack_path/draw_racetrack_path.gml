/// @description draw_racetrack_path(path,lx,ty,rx,by)
/// @param path
/// @param lx
/// @param ty
/// @param rx
/// @param by
function draw_racetrack_path(argument0, argument1, argument2, argument3, argument4) {
	var pp = path_get_number(argument0), mx = 9999999, Mx = -99999999, my = 9999999, My = -9999999, w = argument3 - argument1,h = argument4 - argument2, c, cs = 0.01, W, H;
	for(c = 0;c < pp;c++){
	    mx = min(mx,path_get_point_x(argument0,c))
	    Mx = max(Mx,path_get_point_x(argument0,c))
	    my = min(my,path_get_point_y(argument0,c))
	    My = max(My,path_get_point_y(argument0,c))
	}
	W = Mx-mx
	H = My-my
	draw_set_color(c_white)
	draw_primitive_begin(pr_linestrip)
	for(var c = 0;c < 1;c += cs){
	    /*draw_line(  argument1 + (path_get_x(argument0,c     )-mx)*w/W,
	                argument2 + (path_get_y(argument0,c     )-my)*h/H,
	                argument1 + (path_get_x(argument0,c+cs  )-mx)*w/W,
	                argument2 + (path_get_y(argument0,c+cs  )-my)*h/H)*/
	    draw_vertex(argument1 + (path_get_x(argument0,c     )-mx)*w/W,
	                argument2 + (path_get_y(argument0,c     )-my)*h/H)
	}
	draw_primitive_end()





}
