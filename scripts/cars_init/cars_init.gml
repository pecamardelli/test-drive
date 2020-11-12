/// @description cars_init()
function cars_init() {
	//Make bloody damn sure this function is only called once in one session!

	post	= d3d_model_create();
	car_init(post,path_post_0,path_post_1,path_post_2,1,3,6,9,9)
	global.model_post = post

	/*
	goalline_pole	= d3d_model_create();
	car_init(goalline_pole,path_hpole_1,path_hpole_1,path_hpole_1,1,0,0,245,245);
	global.model_goalline_pole = goalline_pole;
	*/

	goalline_side	= d3d_model_create();
	car_init(goalline_side,path_goalline_side_1,path_goalline_side_1,path_goalline_side_1,1,5,15,25,25);
	global.model_goalline_side = goalline_side;

	/*
	var concrete_guardrail	= d3d_model_create();
	car_init(concrete_guardrail,path_guardrail1,path_guardrail1,path_guardrail1,1,5,12,16,16);
	global.model_concrete_guardrail = concrete_guardrail;
	*/
	var side_to_side	= d3d_model_create();
	car_init(side_to_side,path_block_1,path_block_1,path_block_1,1,128,256,384,384);
	global.model_side_to_side = side_to_side;



}
