// gravity
yspd += grav;

// collide laterally
if place_meeting(x+xspd,y,oSolid){
	while !place_meeting(x+sign(xspd),y,oSolid){
		x += sign(xspd);	
	}
	// bounce
	xspd *= -bouncedecay;
}

// collide longitudinally
if place_meeting(x,y+yspd,oSolid){
	while !place_meeting(x,y+sign(yspd),oSolid){
		y += sign(yspd);	
	}
	// bounce
	yspd *= -bouncedecay;
}

x += xspd;
y += yspd;

timer --;

if timer <= 0 {
	// explode time
	instance_destroy();
}