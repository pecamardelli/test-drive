/// @description Draw the background
/*
d3d_set_lighting(false)
bg     = back_skybox1
bw     = background_get_width(bg)
core_x = 3*bw*(1-(obj_guicontrol.playercamdir/360))

d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
d3d_set_depth(10000000)
for(c = -core_x;c < __view_get( e__VW.WView, 0 );c += bw){
    draw_background(bg,c,0)
}

d3d_set_lighting(true)

