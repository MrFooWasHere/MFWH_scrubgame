/// @description Behaviour

y_spd += grav_force * g_enabled; // effected by gravity

// check that we are on the ground
var onGround = place_meeting(x,y+1,oSolid); 
if onGround then y_spd = 0;

#region ********** BEHAVIOUR CODE **********

// pick the behaviour script
var behaviour_script = behave_goomba;
switch (behaviour){
	case "edge_aware":
		behaviour_script = behave_edge;
		break;	
	case "flying":
		behaviour_script = behave_flying;
		break;
	case "jumping":
		behaviour_script = behave_jumping;
		break;	
	case "follow_x":
		behaviour_script = behave_follow_x;
		break;
	case "follow_jumps":
		behaviour_script = behave_follow_jumps;
		break;	
	case "homing":
		behaviour_script = behave_homing;
		break;
}

script_execute(behaviour_script); // run the behaviour script

#endregion ********** END **********

#region ********** COLLISSIONS **********

// horizontal collissions
var xDir = sign((x+x_spd)-x);
var breakout = 0;
while place_meeting(x+x_spd,y,oSolid){
		x_spd += xDir;
		if ((breakout++) > 32) then{
			x_spd = 0;
			exit; // spent too long, just don't move;
		}
}

// vertical collissions
var yDir = sign((y+y_spd)-y);
breakout = 0;
while place_meeting(x,y+y_spd,oSolid){
	y_spd += yDir;
	if ((breakout++) > 32) then{
		y_spd = 0;
		exit; // spent too long, just don't move;
	}
}

#endregion


// ********** UPDATE POSITION **********
x += x_spd;
y += y_spd;