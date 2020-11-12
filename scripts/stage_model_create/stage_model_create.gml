/// @description stage_model_create(atlas_bg,atlas_wcells,atlas_hcells,bottomfloor,foundationmin,foundationmax,upperfloortype,deformations_factor,deformations_spread)
/// @param atlas_bg
/// @param atlas_wcells
/// @param atlas_hcells
/// @param bottomfloor
/// @param foundationmin
/// @param foundationmax
/// @param upperfloortype
/// @param deformations_factor
/// @param deformations_spread
function stage_model_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	var atlas_index = argument0,
	    atlas_wcell = 1/argument1,
	    atlas_hcell = 1/argument2,
    
	    bottomfloor = argument3,
    
	    foundation_min = argument4,
	    foundation_max = argument5,
    
	    upperfloor_type     = argument6,                //Affects relative Z and size/sign of deformations
	    upperfloor_deformation_factor = argument7,      //Amount of grid cells that are deformed
	    upperfloor_deformation_spread = argument8;      //Chance of selecting a neighbor cell versus chance of selecting a totally random cell for the next step
    
	//------------------------------------------------------------------------------
	//Preallocation
	//------------------------------------------------------------------------------
	random_set_seed(7525607)
	var xmin = 999999999, xmax = -999999999, ymin = 999999999, ymax = -999999999, zmin = 999999999, zmax = -999999999, ustep = global.trackstep, vstep = 2;
	var model   = d3d_model_create(),
	list_tx     = ds_list_create(),//Store -1, then 1 for each U for quicker access.
	list_ty     = ds_list_create(),
	list_tz     = ds_list_create(),
	list_foux   = ds_list_create(),
	list_fouy   = ds_list_create(),
	list_tdir   = ds_list_create();

	model[37]		= -1;	// For storing the tricols array length
	var	its	= 0;

	xx = 0
	yy = 0

	for(u = 0;u <= 1;u += ustep){
	    for(v = -1;v <= 1;v += vstep){
	        pxx = xx
	        pyy = yy
	        xx = track_get_x(u,v)
	        yy = track_get_y(u,v)
	        zz = track_get_z(u,v)
	        ds_list_add(list_tdir,point_direction(pxx,pyy,xx,yy))
	        xmin= min(xmin,xx)
	        xmax= max(xmax,xx)
	        ymin= min(ymin,yy)
	        ymax= max(ymax,yy)
	        zmin= min(zmin,zz)
	        zmax= max(zmax,zz)
	        ds_list_add(list_tx,xx)
	        ds_list_add(list_ty,yy)
	        ds_list_add(list_tz,zz)
        
	        if(foundation_min <> NONE){
	            vv = v*random_range(foundation_min,foundation_max)
	            ds_list_add(list_foux,track_get_x(u,vv))
	            ds_list_add(list_fouy,track_get_y(u,vv))
	        }
	    }
		its++;
		show_debug_message("U and v stepping: " + string(its*ustep/100) + "%");
	}

	//Make sure it loops!
	for(c = 0;c < 4;c++){
	    ds_list_add(list_tx,  list_tx[|   c])
	    ds_list_add(list_ty,  list_ty[|   c])
	    ds_list_add(list_tz,  list_tz[|   c])
	    ds_list_add(list_tdir,list_tdir[| c])
	    if(foundation_min <> NONE){
	        ds_list_add(list_foux,list_foux[| c])
	        ds_list_add(list_fouy,list_fouy[| c])
	    }
	}

	zbottomfloor = zmin - 16

	//------------------------------------------------------------------------------
	//Spawn floor model polys
	//------------------------------------------------------------------------------
	atlas_xcell = 1
	atlas_ycell = 0
	chunk_size  = 512
	padding     = 2048
	zz			= zbottomfloor
	its			= 0;

	if(bottomfloor){
		var loops_xx		= (xmax + padding - xmin + padding) / chunk_size;
		var loops_yy		= (ymax + padding - ymin + padding) / chunk_size;
	    d3d_model_primitive_begin(model,pr_trianglelist)
	    for(xx = xmin-padding;xx <= xmax+padding;xx += chunk_size){
	        for(yy = ymin-padding;yy <= ymax+padding;yy += chunk_size){
	            d3d_model_vertex_normal_texture(model,xx,           yy,             zz,0,0,1,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell  )*atlas_hcell+0.001)//1
	            d3d_model_vertex_normal_texture(model,xx+chunk_size,yy,             zz,0,0,1,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell  )*atlas_hcell+0.001)//2
	            d3d_model_vertex_normal_texture(model,xx,           yy+chunk_size,  zz,0,0,1,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell+1)*atlas_hcell-0.001)//3
            
	            d3d_model_vertex_normal_texture(model,xx,           yy+chunk_size,  zz,0,0,1,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell+1)*atlas_hcell-0.001)//3
	            d3d_model_vertex_normal_texture(model,xx+chunk_size,yy,             zz,0,0,1,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell  )*atlas_hcell+0.001)//2
	            d3d_model_vertex_normal_texture(model,xx+chunk_size,yy+chunk_size,  zz,0,0,1,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell+1)*atlas_hcell-0.001)//4
				model[37]	+=6;
	        }
			its++;
			show_debug_message("Spawn floor model polys: " + string(its/loops_xx*100) + "%");
	    }
	    d3d_model_primitive_end(model)
	}

	//------------------------------------------------------------------------------
	//Spawn racetrack model polys
	//------------------------------------------------------------------------------
	ls = ds_list_size(list_tx) - 4
	atlas_xcell = 0
	atlas_ycell = 1
	its			= 0;

	d3d_model_primitive_begin(model,pr_trianglelist)
	for(c = 0;c < ls;c += 2){
	    dtn = point_direction(list_tx[|c],list_ty[|c],list_tx[|c+2],list_ty[|c+2])
	    dtz = point_direction(0,list_tz[|c],point_distance(list_tx[|c],list_ty[|c],list_tx[|c+2],list_ty[|c+2]),list_tz[|c + 2])
	    nx  = lengthdir_x(1,dtn)*lengthdir_y(1,dtz)
	    ny  = lengthdir_y(1,dtn)*lengthdir_y(1,dtz)
	    nz  = lengthdir_x(1,dtz)
	    d3d_model_vertex_normal_texture(model,list_tx[| c  ],list_ty[| c  ],list_tz[| c  ],nx,ny,nz,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell  )*atlas_hcell+0.001)//1
	    d3d_model_vertex_normal_texture(model,list_tx[| c+2],list_ty[| c+2],list_tz[| c+2],nx,ny,nz,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell  )*atlas_hcell+0.001)//2
	    d3d_model_vertex_normal_texture(model,list_tx[| c+1],list_ty[| c+1],list_tz[| c+1],nx,ny,nz,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell+1)*atlas_hcell-0.001)//3
    
	    d3d_model_vertex_normal_texture(model,list_tx[| c+1],list_ty[| c+1],list_tz[| c+1],nx,ny,nz,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell+1)*atlas_hcell-0.001)//3
	    d3d_model_vertex_normal_texture(model,list_tx[| c+2],list_ty[| c+2],list_tz[| c+2],nx,ny,nz,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell  )*atlas_hcell+0.001)//2
	    d3d_model_vertex_normal_texture(model,list_tx[| c+3],list_ty[| c+3],list_tz[| c+3],nx,ny,nz,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell+1)*atlas_hcell-0.001)//4
		model[37]	+=6;
		its++;
		show_debug_message("Spawn racetrack model polys: " + string(its/(ls/2)*100) + "%");
	}
	d3d_model_primitive_end(model)

	//------------------------------------------------------------------------------
	//If should, spawn racetrack foundation polys as well
	//------------------------------------------------------------------------------
	atlas_xcell = 0
	atlas_ycell = 0
	its			= 0;

	d3d_model_primitive_begin(model,pr_trianglelist)
	if(foundation_min <> NONE){
	    for(c = 0;c < ls;c++){
	        dtn = point_direction(list_tx[|c],list_ty[|c],list_tx[|c+2],list_ty[|c+2])
	        if(c mod 2){del = +90}else{del = -90}
	        d3d_model_vertex_normal_texture(model,list_tx  [| c  ],list_ty  [| c  ],list_tz[| c  ], lengthdir_x(0.5,dtn+del),lengthdir_y(0.5,dtn+del),0.5,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell  )*atlas_hcell+0.001)//T0
	        d3d_model_vertex_normal_texture(model,list_tx  [| c+2],list_ty  [| c+2],list_tz[| c+2], lengthdir_x(0.5,dtn+del),lengthdir_y(0.5,dtn+del),0.5,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell  )*atlas_hcell+0.001)//T2
	        d3d_model_vertex_normal_texture(model,list_foux[| c  ],list_fouy[| c  ],zbottomfloor,   lengthdir_x(0.5,dtn+del),lengthdir_y(0.5,dtn+del),0.5,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell+1)*atlas_hcell-0.001)//F0
        
	        d3d_model_vertex_normal_texture(model,list_foux[| c  ],list_fouy[| c  ],zbottomfloor,   lengthdir_x(0.5,dtn+del),lengthdir_y(0.5,dtn+del),0.5,(atlas_xcell  )*atlas_wcell+0.001,(atlas_ycell+1)*atlas_hcell-0.001)//F0
	        d3d_model_vertex_normal_texture(model,list_tx  [| c+2],list_ty  [| c+2],list_tz[| c+2], lengthdir_x(0.5,dtn+del),lengthdir_y(0.5,dtn+del),0.5,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell  )*atlas_hcell+0.001)//T2
	        d3d_model_vertex_normal_texture(model,list_foux[| c+2],list_fouy[| c+2],zbottomfloor,   lengthdir_x(0.5,dtn+del),lengthdir_y(0.5,dtn+del),0.5,(atlas_xcell+1)*atlas_wcell-0.001,(atlas_ycell+1)*atlas_hcell-0.001)//F2
			model[37]	+=6;
			its++;
			show_debug_message("Spawn racetrack foundation polys: " + string(its/ls*100) + "%");
	    }
	}
	d3d_model_primitive_end(model)
	//------------------------------------------------------------------------------
	//If should, spawn the upper floor as well
	//------------------------------------------------------------------------------
	switch(upperfloor_type){
	    case uft_PLAINS:
	        //Above lower floor, random changes up and down
	    break
    
	    case uft_ISLANDS:
	        //Below lower floor, only changes up
	    break
    
	    case uft_HOLEPLAINS:
	        //Above lower floor, only changes down
	    break
    
	    case uft_CANYON:
	        //Below lower floor, only changes up, map boundaries and nearby cells get random values above lower floor
	    break
	}

	//Free up memory
	ds_list_destroy(list_tx)
	ds_list_destroy(list_ty)
	ds_list_destroy(list_tz)
	ds_list_destroy(list_foux)
	ds_list_destroy(list_fouy)
	ds_list_destroy(list_tdir)

	return model;



}
