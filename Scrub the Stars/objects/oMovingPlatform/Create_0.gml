/// @description INit Values
xspeed = 0;
yspeed = 0;

goalx = 0;
goaly = 0;
initx = x;
inity = y;
mymask = mask_index;

moveDirection = sign(distance);

if distance != 0 then{
	// this platform moves a specific distance
	if vertical{
		goaly = y + distance;
	} else{
		goalx = x + distance;	
	}
}