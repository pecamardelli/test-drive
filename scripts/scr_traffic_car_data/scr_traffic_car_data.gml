function scr_traffic_car_data() {
	global.traffic_car_list		= ds_list_create();

#region ECONOLINE

	var the_car = ds_map_create();

	the_car[? "strength"]	= 8;
	the_car[? "weight"]		= 2542;

	the_car[? "id"]			= "econoline";
	the_car[? "type"]		= "traffic_car";
	the_car[? "enabled"]	= true;

#region 3D MODEL DATA

	var model_scale			= 0.6;


	var model_list	= ds_list_create();

#region BODY

	var model	= ds_map_create();

	var n = d3d_model_create();
	//car_init(n,path_vette63_body_1,path_vette63_body_1,path_vette63_body_1,model_scale,22,32,36,38);
	car_init(n,path_econoline_body_1,path_econoline_body_1,path_econoline_body_1,model_scale,14,28,44,40);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_econoline_body);

	the_car[? "colour_number"]	= sprite_get_number(model[? "texture"])-1;

	var the_subimg	= irandom(the_car[? "colour_number"]);

	ds_map_add(model, "sub_img", the_subimg);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region ROOF

	var model	= ds_map_create();

	var n = d3d_model_create();
	//car_init(n,path_vette63_body_1,path_vette63_body_1,path_vette63_body_1,model_scale,22,32,36,38);
	car_init(n,path_econoline_roof_1,path_econoline_roof_1,path_econoline_roof_1,model_scale,14,28,34,44);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_econoline_roof);
	ds_map_add(model, "sub_img", the_subimg);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region REAR BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_econoline_rear_bumper,path_econoline_rear_bumper,path_econoline_rear_bumper,model_scale,15,30,45,45);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_steel);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_econoline_front_bumper,path_econoline_front_bumper,path_econoline_front_bumper,model_scale,15,30,45,45);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_steel);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region TYRES

	var tyre_model = d3d_model_create()
	car_init(tyre_model,path_tyres,path_tyres,path_tyres,model_scale*2,1,2,4,4);

#region REAR

	var model	= ds_map_create();

	var rear_tyre_x	= -40;
	var rear_tyre_y	= 39;
	var rear_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var rear_tyre_x	= -40;
	var rear_tyre_y	= -39;
	var rear_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT

	var model	= ds_map_create();

	var front_tyre_x	= 130;
	var front_tyre_y	= 39;
	var front_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var front_tyre_x	= 130;
	var front_tyre_y	= -39;
	var front_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#endregion

	ds_map_add(the_car, "model_list", model_list);

#endregion

	ds_list_add(global.traffic_car_list, the_car);
	ds_list_mark_as_map(global.traffic_car_list, ds_list_size(global.traffic_car_list)-1);

#endregion

#region MERCEDES 190E

	var the_car = ds_map_create();

	the_car[? "strength"]	= 5;
	the_car[? "weight"]		= 1220;

	the_car[? "id"]			= "mercedes190";
	the_car[? "type"]		= "traffic_car";
	the_car[? "enabled"]	= true;

#region 3D MODEL DATA

	var model_scale			= 0.6;

	var model_list	= ds_list_create();

#region BODY

	var model	= ds_map_create();

	var n = d3d_model_create();
	//car_init(n,path_vette63_body_1,path_vette63_body_1,path_vette63_body_1,model_scale,22,32,36,38);
	car_init(n,path_mercedes190_body_1,path_mercedes190_body_1,path_mercedes190_body_1,model_scale,12,24,38,34);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_mercedes190_body);

	the_car[? "colour_number"]	= sprite_get_number(model[? "texture"])-1;

	var the_subimg	= irandom(the_car[? "colour_number"]);

	ds_map_add(model, "sub_img", the_subimg);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region ROOF

	var model	= ds_map_create();

	var n = d3d_model_create();
	//car_init(n,path_vette63_body_1,path_vette63_body_1,path_vette63_body_1,model_scale,22,32,36,38);
	car_init(n,path_mercedes190_roof_1,path_mercedes190_roof_1,path_mercedes190_roof_1,model_scale,12,24,30,38);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_mercedes190_roof);
	ds_map_add(model, "sub_img", the_subimg);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region REAR BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_mercedes190_rear_bumper,path_mercedes190_rear_bumper,path_mercedes190_rear_bumper,model_scale,12,28,39,39);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_dark_metal);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT BUMPER

	var model	= ds_map_create();

	var n = d3d_model_create();
	car_init(n,path_mercedes190_front_bumper,path_mercedes190_front_bumper,path_mercedes190_front_bumper,model_scale,12,28,39,39);

	ds_map_add(model, "model", n);
	ds_map_add(model, "x", 0);
	ds_map_add(model, "y", 0);
	ds_map_add(model, "z", 0);
	ds_map_add(model, "texture", spr_dark_metal);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region TYRES

	var tyre_model = d3d_model_create()
	car_init(tyre_model,path_tyres,path_tyres,path_tyres,model_scale*1.5,1,2,4,4);

#region REAR

	var model	= ds_map_create();

	var rear_tyre_x	= 0;
	var rear_tyre_y	= 34;
	var rear_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var rear_tyre_x	= 0;
	var rear_tyre_y	= -34;
	var rear_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", rear_tyre_x);
	ds_map_add(model, "y", rear_tyre_y);
	ds_map_add(model, "z", rear_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#region FRONT

	var model	= ds_map_create();

	var front_tyre_x	= 125;
	var front_tyre_y	= 34;
	var front_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

	var model	= ds_map_create();

	var front_tyre_x	= 125;
	var front_tyre_y	= -34;
	var front_tyre_z	= 8;

	ds_map_add(model, "model", tyre_model);
	ds_map_add(model, "x", front_tyre_x);
	ds_map_add(model, "y", front_tyre_y);
	ds_map_add(model, "z", front_tyre_z);
	ds_map_add(model, "texture", spr_tyre_tex);
	ds_map_add(model, "sub_img", 0);

	ds_list_add(model_list, model);
	ds_list_mark_as_map(model_list, ds_list_size(model_list)-1);

#endregion

#endregion

	ds_map_add(the_car, "model_list", model_list);

#endregion

	ds_list_add(global.traffic_car_list, the_car);
	ds_list_mark_as_map(global.traffic_car_list, ds_list_size(global.traffic_car_list)-1);

#endregion



}
