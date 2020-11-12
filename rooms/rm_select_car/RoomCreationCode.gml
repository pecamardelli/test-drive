
for(var i=0;i<ds_list_size(global.car_list);i++){
	var the_showroom		= instance_create_depth(0,room_height*i,-10,obj_showroom);
	the_showroom.the_list	= global.car_list;
	the_showroom.the_index	= i;
}

with obj_showroom {
	y	-=	room_height * global.player_profile[? "car_index"];
};