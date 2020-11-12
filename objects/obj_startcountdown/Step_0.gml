/// @description State machine
switch(state){
    case 0://Onto next
        if(splash_at > 3){
            state = 2
        }
        else{
            splashtext = splash[   splash_at]
            splashcolor= splashcol[splash_at]
            state = 1
        }
        splashalpha = 1
        splashscale = 0
        splash_at++
    break
    
    case 1://Splash
        if(splashscale < 2){
            splashscale += 0.2
        }
        else{
            splashalpha -= 0.02
            if(splashalpha <= 0){
                state = 0
            }
        }
    break
    
    case 2://Done
        with obj_car {
            statescript	= carstate_normal
			//obj_guicontrol.//time_stamp	= get_timer();
			race_start	= current_time;
			count_time	= true;
        };
        instance_destroy()
    break
}

