/// @description Draw stuff
d3d_set_lighting(false)
if(splashtext <> "" && splashalpha > 0){
    draw_text_init(font_futuristic_big,1,1)
    c2 = merge_color(splashcolor,c_black,0.5)
    draw_text_transformed_colour(__view_get( e__VW.WView, 0 )*0.5,__view_get( e__VW.HView, 0 )*0.5,string_hash_to_newline(splashtext),splashscale,splashscale,0,splashcolor,splashcolor,c2,c2,splashalpha)
}
d3d_set_lighting(true)

