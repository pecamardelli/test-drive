/// @description Placementing

var pq = ds_priority_create(), cntr = 1;
with(obj_car){
    ds_priority_add(pq,id,u)
}
while(!ds_priority_empty(pq)){
    with(ds_priority_delete_max(pq)){
        place = cntr; cntr++
    }
}
ds_priority_destroy(pq)

var ppl = playerlap;
with(playerid){
    other.playerplace = place
    other.playerlap   = clamp(floor(u),1,global.race_data[? "total_laps"]+1)
    other.playerpos   = u_lap
    z += 40
    other.playercarx  = x
    other.playercary  = y
    other.playercarz  = z
    //other.playercardir= image_angle
	other.playercardir= facedir
}

tplayercamx = playercarx + lengthdir_x(10,playercardir + 180)
tplayercamy = playercary + lengthdir_y(10,playercardir + 180)

if not tplayercamz {
	tplayercamz	= playercarz + tplayercamz_modifier;
}

// Apply movement to the camera on the z axis when driving over dirt
if not global.pause {
	if playerid.w > global.w_right_bound || playerid.w < global.w_left_bound {
		scr_shake_camera();
	
		// Decrease the grip on dirt
		if playerid.movespd > 7 {
			playerid.max_turn	= scr_approach(playerid.max_turn, global.dirt_grip, 0.01);
		}
	}
	else {	
		tplayercamz	= playercarz + tplayercamz_modifier;
	
		// Get back the max grip to its original value
		playerid.max_turn	= scr_approach(playerid.max_turn, global.max_grip, 0.01);
	}

	// Smoothly get back the z modifier to the default value
	if tplayercamz_modifier != 1 {
		tplayercamz_modifier	= scr_approach(tplayercamz_modifier, 1, 0.02);
	}
}

/*
playercamx  = lerp(tplayercamx,playercamx,0.75)
playercamy  = lerp(tplayercamy,playercamy,0.75)
playercamz  = lerp(tplayercamz,playercamz,0.75)
*/
playercamx  = tplayercamx;
playercamy  = tplayercamy;
playercamz  = tplayercamz;

//playercamdir= point_direction(playercamx,playercamy,playercarx,playercary)
playercamdir	= playerid.facedir;

/*
if playerid.u > 0.5 {
	playerlap	= global.race_data[? "total_laps"] + 1;
}
*/

if not playerid.finished {
	//if(playerlap == global.race_data[? "total_laps"] + 1){
	if playerid.u >= obj_trackcontrol.stage_vars[? "end"] {
	    /* Finish the race here */
		/*
	    splashtext  = "FINISH!"
	    splashcolor = c_purple
	    splashcntr  = 9999
		*/
	    playerlap = global.race_data[? "total_laps"]
	    with (playerid) {
	        //controlscript	= csc_finish
	        miscscript		= NONE;
			controlscript	= csc_ai;
			race_position	= global.number_finished;
			finished		= true;
			global.number_finished++;
	        //global.finish_positions[global.number_finished] = driver_index
	        //global.number_finished++
        
	        show_debug_message("Player " + string(driver_index) + " finished at postion " + string(global.number_finished))
	    }
		//finish_race		= true;
		/*
		with obj_car {
			finished		= true
		
	        global.finish_positions[global.number_finished] = driver_index
	        global.number_finished++;
		
	        show_debug_message(driver[? "name"] + " finished at postion " + string(global.number_finished));
		};
		*/
	}
	else if(ppl < playerlap){
	    if(playerlap == global.race_data[? "total_laps"]){
	        splashtext  = "Final Lap"
	        splashcolor = c_red
	        splashcntr  = 120
	    }
	    else{
	        splashtext  = "Lap " + string(playerlap)
	        splashcolor = c_gray
	        splashcntr  = 120
	    }	
		//time_stamp	= get_timer();
	}
	
	
	if playerid.movespd == 0 {
		finish_text			= "Fill'er up!";
		draw_finish_window	= true;
	}
	
}

with(obj_car){
    placedraw = place < other.playerplace;
    //Finish if just past the final lap and not finished
    //if(!finished && floor(u) > global.race_data[? "total_laps"]){
	if !finished && (u > obj_trackcontrol.stage_vars[? "end"] or other.playerid.finished) {
        finished		= true
		
        global.finish_positions[global.number_finished] = driver_index
        global.number_finished++;
		
        show_debug_message(driver[? "name"] + " finished at postion " + string(global.number_finished));
    }
}

if global.number_finished == global.race_data[? "cars_total"] {
	if instance_number(obj_fade_screen) == 0 {
		scr_fade_screen("out",4,-1,rm_stage_finish);
	}
}

/* */
///Time
if(playerid <> NONE){
    if(!instance_number(obj_startcountdown)){
        time++
    }
}
splashcntr--

// Gauge positions

spd_angle	= playerid.movespd * playerid.the_car[? "spd_gauge_unit"] * playerid.the_car[? "spd_step_angle"];

if spd_angle > playerid.the_car[? "spd_max_angle"] {
	spd_angle = playerid.the_car[? "spd_max_angle"];
}

rpm_angle	= playerid.the_car[? "rpm_step_angle"] * playerid.rpm;

if rpm_angle > playerid.the_car[? "rpm_max_angle"] {
	rpm_angle = playerid.the_car[? "rpm_max_angle"];
}
