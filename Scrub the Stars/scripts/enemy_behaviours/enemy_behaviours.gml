// ALL ENEMY BEHAVIOUR AI'S
// each script must set x_spd and y_spd
function behave_goomba(){
	x_spd = lateral_speed * (1-(2*turn_left));
	enemy_turnaround();
}

function behave_edge(){
	behave_goomba();
	// detect edges
	if !collision_point(x+x_spd,y+1,oSolid,false,true){
			// about to fall of edge, turn around
			turn_left = !turn_left; // turn around
	}

}

function behave_flying(){
	y = anchorY + sin(timer*freqY)*ampY;
	x = anchorX + sin(timer*freqX)*ampX;
	timer++;
}

function behave_jumping(){

}

function behave_follow_x(){

}

function behave_follow_jumps(){

}

function behave_homing(){

}

function enemy_turnaround(){
	if place_meeting(x+x_spd,y,oSolid) then{
		turn_left = !turn_left; // turn around	
	}	
}