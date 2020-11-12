/// @description 

ds_list_destroy(global.car_list);
ds_list_destroy(global.traffic_car_list);
ds_list_destroy(global.broken_glass_list);
ds_list_destroy(global.gear_abbreviations);
ds_list_destroy(global.gear_grind_sounds);
ds_list_destroy(global.collision_sounds);
ds_list_destroy(global.flat_tyre_sounds);
ds_list_destroy(global.dirt_sounds);
ds_list_destroy(global.engine_break_sounds);

ds_map_destroy(global.player_profile);
ds_map_destroy(global.car_thumbs);