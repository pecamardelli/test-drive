for(var i=0;i<ds_list_size(global.track_list);i++){
	var the_showroom		= instance_create_depth(0,room_height*i,1,obj_showroom);
	the_showroom.the_list	= global.track_list;
	the_showroom.the_index	= i;
}

with obj_showroom {
	y	-=	room_height * global.track_index;
};

scr_fade_screen("in",global.fade_duration,-1,-1);