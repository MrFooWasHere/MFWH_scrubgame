/// @description Move time

x = initx + sin(theta) * arm_length
y = inity + cos(theta) * arm_length

aAcc = -0.001 * sin(theta);

theta += aVel;
aVel += aAcc;

if aAcc < 1 then aAcc = 1;

// ****** UPDATE POSITION
xspeed = x - xprevious;
yspeed = y - yprevious;

if y+16 < oPlayer.y || y+16 < oPlayer.yprevious then{
	sprite_index =-1;	
} else{
	sprite_index = sBlock;	
	while place_meeting(x,y,oPlayer){
		oPlayer.y -= 1;
	}
}
var playerAbove = instance_place(x,y-abs(yspeed)-2,oPlayer);

if playerAbove != noone{
	if playerAbove.y <= y+8 then {
		playerAbove.y = y;
		playerAbove.x += xspeed;
	}
}