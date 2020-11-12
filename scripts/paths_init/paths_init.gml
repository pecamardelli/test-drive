/// @description paths_init()
function paths_init() {
	//Make bloody damn sure this function is only called once in one session!
	for(c = 0;c < 255;c += 1){
	    if(path_exists(c)){
	        n = path_get_name(c)
	        if((string_copy(n,1,10) == "path_track") && (string_copy(n,string_length(n) - 1,2) != "_z")){
	            path_rescale(c,8,8)
	        }
	    }
	    else{
	        break
	    }
	}



}
