/// @description car_init(modelid,path0,path1,path2,pxlengthfactor,w0,w1,w2,w3)
/// @param modelid
/// @param path0
/// @param path1
/// @param path2
/// @param pxlengthfactor
/// @param w0
/// @param w1
/// @param w2
/// @param w3
function car_init(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	step = 0.01;

	d3d_model_primitive_begin(argument0,pr_trianglelist)
	for(c = 0;c < 1;c += step){
	    //Center segment (center-path0)
	    if(argument5 <> 0){
	        xx = array(path_get_x(argument1,c)*argument4, path_get_x(argument1,c + step)*argument4,path_get_x(argument1,c)*argument4, path_get_x(argument1,c + step)*argument4)//Center: override by two of same path
	        yy = array(0, 0, argument5, argument5)
	        zz = array(path_get_y(argument1,c)*-argument4, path_get_y(argument1,c + step)*-argument4, path_get_y(argument1,c)*-argument4, path_get_y(argument1,c + step)*-argument4)
        
	        nn = array(0,argument5*0.1,5)//cross_product(array(xx[1]-xx[0],yy[1]-yy[0],zz[1]-zz[0]),array(xx[2]-xx[0],yy[2]-yy[0],zz[2]-zz[0]))
	        //show_debug_message(string(nn[0])+","+string(nn[1])+","+string(nn[2]))
        
	        uu = array(0,0.25)
	        vv = array(c,c + step)
        
	        //Primary side
	        d3d_model_vertex_normal_texture(argument0,xx[0],yy[0],zz[0],nn[0],nn[1],nn[2],uu[0],vv[0])
	        d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	        d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	        d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	        d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	        d3d_model_vertex_normal_texture(argument0,xx[3],yy[3],zz[3],nn[0],nn[1],nn[2],uu[1],vv[1])
        
	        //Mirror side
	        d3d_model_vertex_normal_texture(argument0,xx[0],-yy[0],zz[0],nn[0],-nn[1],nn[2],uu[0],vv[0])
	        d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	        d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	        d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	        d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	        d3d_model_vertex_normal_texture(argument0,xx[3],-yy[3],zz[3],nn[0],-nn[1],nn[2],uu[1],vv[1])
	    }
	    //Path0-Path1
	    xx = array(path_get_x(argument1,c)*argument4,path_get_x(argument1,c+step)*argument4,path_get_x(argument2,c)*argument4,path_get_x(argument2,c+step)*argument4)
	    yy = array(argument5,argument5,argument6,argument6)
	    zz = array(path_get_y(argument1,c)*-argument4,path_get_y(argument1,c+step)*-argument4,path_get_y(argument2,c)*-argument4,path_get_y(argument2,c+step)*-argument4)
    
	    nn = array(0,argument6*0.1,5)//cross_product(array(xx[1]-xx[0],yy[1]-yy[0],zz[1]-zz[0]),array(xx[2]-xx[0],yy[2]-yy[0],zz[2]-zz[0]))
	    uu = array(0.25,0.5)
	    vv = array(c,c + step)
	    //Primary side
	    d3d_model_vertex_normal_texture(argument0,xx[0],yy[0],zz[0],nn[0],nn[1],nn[2],uu[0],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[3],yy[3],zz[3],nn[0],nn[1],nn[2],uu[1],vv[1])
    
	    //Mirror side
	    d3d_model_vertex_normal_texture(argument0,xx[0],-yy[0],zz[0],nn[0],-nn[1],nn[2],uu[0],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[3],-yy[3],zz[3],nn[0],-nn[1],nn[2],uu[1],vv[1])
    
	    //Path1-Path2
	    xx = array(path_get_x(argument2,c)*argument4,path_get_x(argument2,c+step)*argument4,path_get_x(argument3,c)*argument4,path_get_x(argument3,c+step)*argument4)
	    yy = array(argument6,argument6,argument7,argument7)
	    zz = array(path_get_y(argument2,c)*-argument4,path_get_y(argument2,c+step)*-argument4,path_get_y(argument3,c)*-argument4,path_get_y(argument3,c+step)*-argument4)
    
	    nn = array(0,argument7*0.1,5)//cross_product(array(xx[1]-xx[0],yy[1]-yy[0],zz[1]-zz[0]),array(xx[2]-xx[0],yy[2]-yy[0],zz[2]-zz[0]))
	    uu = array(0.5,0.75)
	    vv = array(c,c + step)
    
	    //Primary side
	    d3d_model_vertex_normal_texture(argument0,xx[0],yy[0],zz[0],nn[0],nn[1],nn[2],uu[0],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[3],yy[3],zz[3],nn[0],nn[1],nn[2],uu[1],vv[1])
    
	    //Mirror side
	    d3d_model_vertex_normal_texture(argument0,xx[0],-yy[0],zz[0],nn[0],-nn[1],nn[2],uu[0],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[3],-yy[3],zz[3],nn[0],-nn[1],nn[2],uu[1],vv[1])
    
	    //Edge
	    xx = array(path_get_x(argument3,c)*argument4,path_get_x(argument3,c+step)*argument4,path_get_x(argument3,c)*argument4,path_get_x(argument3,c+step)*argument4)
	    yy = array(argument7,argument7,argument8,argument8)
	    zz = array(path_get_y(argument3,c)*-argument4,path_get_y(argument3,c+step)*-argument4,path_get_y(argument3,0)*-argument4,path_get_y(argument3,0)*-argument4)
    
	    nn = array(0,argument8*0.1,5)//cross_product(array(xx[1]-xx[0],yy[1]-yy[0],zz[1]-zz[0]),array(xx[2]-xx[0],yy[2]-yy[0],zz[2]-zz[0]))
	    uu = array(0.75,1)
	    vv = array(c,c + step)
    
	    //Primary side
	    d3d_model_vertex_normal_texture(argument0,xx[0],yy[0],zz[0],nn[0],nn[1],nn[2],uu[0],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[2],yy[2],zz[2],nn[0],nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],yy[1],zz[1],nn[0],nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[3],yy[3],zz[3],nn[0],nn[1],nn[2],uu[1],vv[1])
    
	    //Mirror side
	    d3d_model_vertex_normal_texture(argument0,xx[0],-yy[0],zz[0],nn[0],-nn[1],nn[2],uu[0],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[2],-yy[2],zz[2],nn[0],-nn[1],nn[2],uu[1],vv[0])
	    d3d_model_vertex_normal_texture(argument0,xx[1],-yy[1],zz[1],nn[0],-nn[1],nn[2],uu[0],vv[1])
	    d3d_model_vertex_normal_texture(argument0,xx[3],-yy[3],zz[3],nn[0],-nn[1],nn[2],uu[1],vv[1])

	}
	d3d_model_primitive_end(argument0)



}
