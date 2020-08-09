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
	var doJump = place_meeting(x,y+1,oSolid);
	if doJump then{
		// jump
		y_spd -= jump_height;
	}
}

function behave_follow_x(){
	var _direction = -2(oPlayer.x < x)+1;
	x_spd = _direction * lateral_speed;
}

function behave_follow_jumps(){
	var player_on_ground = false;
	with oPlayer{
		if place_meeting(x,y+1,oSolid) then{
			player_on_ground = true;	
		}
	}
	if !player_on_ground then{
		behave_jumping();	
	}

}

function behave_homing(){
	var xdiff = -2(oPlayer.x < x)+1;
	var ydiff = -2(oPlayer.y < y)+1;
	x_spd = xdiff * lateral_speed;
	y_spd = ydiff * lateral_speed;
}

function enemy_turnaround(){
	if place_meeting(x+x_spd,y,oSolid) then{
		turn_left = !turn_left; // turn around	
	}	
}