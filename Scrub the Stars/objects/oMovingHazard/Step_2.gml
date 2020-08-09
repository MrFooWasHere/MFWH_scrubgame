/// @description Move time

if distance == 0 {
	// move until you hit something
	if vertical then {
		yspeed = moveSpeed;
		if place_meeting(x,y+yspeed,oSolid) then{
			// swap the direction
			moveSpeed = -moveSpeed;
		}
	} else{
		xspeed = moveSpeed;	
		if place_meeting(x+xspeed,y,oSolid) then{
			// swap the direction
			moveSpeed = -moveSpeed;
		}
	}
} else{
	// move until you reach your goal
	if vertical then{
		yspeed = moveSpeed * moveDirection;
		if sign(goaly-y) != moveDirection then{
			// turn around
			var tempy = inity;
			inity = goaly;
			goaly = tempy;
			moveDirection = -moveDirection;
		}
	} else{
		xspeed = moveSpeed * moveDirection;	
		if sign(goalx-x) != moveDirection then{
			// turn around
			var tempx = initx;
			initx = goalx;
			goalx = tempx;
			moveDirection = -moveDirection;
		}
	}
}


// ****** UPDATE POSITION
x += xspeed;
y += yspeed;