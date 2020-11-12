
draw_set_color(c_white);
d3d_set_hidden(true);
d3d_model_draw(track_model,0,0,0,track_texture);
d3d_set_lighting(false);

scr_draw_stuff();

d3d_set_lighting(true);