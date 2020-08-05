/// @description Actions

// ********** KEY INPUTS **********
var inputLeft		= keyboard_check(keyLeft);
var inputRight		= keyboard_check(keyRight);
var inputDown		= keyboard_check(keyDown);
var inputShoot		= keyboard_check_pressed(keyShoot);
var inputJump		= keyboard_check_pressed(keyJump);
var inputGrenade	= keyboard_check_pressed(keyGrenade);

var moveInput = inputRight - inputLeft; // moveInput is 1 when moving and -1 when moving lefts

#region ********** LATERAL CODE **********
// All code related to the direction of moveInput goes here
// Adding horizontal speed
v_xspeed += moveInput * (acceleration);			// accelerates in the direction given by moveInput
v_xspeed = clamp(v_xspeed,-topSpeed,topSpeed);	// clamp horizontal speed to the top speed

switch moveInput {
	 case 1:
		image_xscale = 1; // flip sprite
		break;
	 case 0:
		v_xspeed = smooth_approach(v_xspeed,0,xFriction); // Reduce speed when not moving
		break;
	 case -1:
		image_xscale = -1; // flip the sprite
		break;
}
#endregion

#region ********** LONGITUDE CODE **********
var onGround = place_meeting(x,y+1,oSolid);

if onGround{
	v_yspeed = 0; // stop falling when on the ground
	v_coyote = coyoteTimer; // reset the coyote timer 
} else{
	// reduce coyoteTimer
	v_coyote --;
	// falling
	var fallDir = sign(v_yspeed);
	if fallDir = -1 then v_yspeed += c_gravity else v_yspeed += c_gravity*1.5; // gravity effects
	v_yspeed = clamp(v_yspeed, fallSpeed*-50,fallSpeed); // clamp so you don't fall at the speed of sound
}

// ********** JUMPING TIME **********
if inputJump && (onGround || v_coyote > 0) then {
	v_yspeed -= jumpPower;
	v_coyote = 0;
}

#endregion

#region ********** COLLISSION CHECKING **********
// check new x position
var newX	= x+v_xspeed;	  // spot to check
var newXdir = sign(v_xspeed); // direction we're going (INDEPENDANT FROM moveInput)

var checkStop = 0;
while (place_meeting(newX,y,oSolid)){
	newX -= newXdir; // move the newX location back in the newXdir
	v_xspeed = 0; // stop moving when you hit the wall
	if ((checkStop ++) >= 50) then break; // Stop the while loop if we get stuck completely
}

// check if we are further than expected from our old position
var xDist = abs(x - newX); // total distance between the two points
if xDist > 10 then newX = x; // we have gone too far, revert to old X position

// check new y position
var newY	= y+v_yspeed;	// spot to check
var newYdir = sign(v_yspeed); // direction we're going

checkStop = 0;
while (place_meeting(x,newY,oSolid)){
	newY -= newYdir; // move back if we're in the wall
	v_yspeed = 0; // stop falling
	if ((checkStop ++) >= 50) then break; // stop if we get super stuck
}

// check if we are further than expected
var yDist = abs(y-newY); // total distance between the two points
if yDist > 15 then newY = y; // too far, default back to regular y value

#endregion

#region ********** SHOOTING CODE **********

var bulletCount = instance_number(oBullet_player); // number of bullets on screen

if inputShoot then{
	if maxBullets > bulletCount then{ // if we can fit more buillets on screen
		var shot = instance_create_depth(x,y-19,depth+1,oBullet_player);
		shot.image_xscale = image_xscale; // make the bullet face the right direction
		shot.hspeed = bulletSpeed * image_xscale; // send the bullet off in the right direction
	}
}

if inputGrenade && (v_grenades > 0) then{
	// chuck a grenade	
	var grenade = instance_create_depth(x,y-25, depth+1, oGrenade_player);
	grenade.xspd = grenade_xspeed * image_xscale + v_xspeed;
	grenade.grav = grenade_grav;
	grenade.yspd = grenade_yspeed;
	
	v_grenades --;
}

#endregion

#region ********** SPRITE CONTROL **********

if onGround{
		if abs(v_xspeed) > 0.5 then sprite_index = s_pWalk else sprite_index = s_pIdle; 
} else{
	sprite_index = s_pJump;	
}

#endregion

// ********** UPDATE POSITION **********
x = newX;
y = newY;

#region ********** DAMAGE COLLISSIONS **********

if place_meeting(x,y,oDamage) then{
	damage_player();	
}

#endregion

#region ********** CAMERA UPDATE **********

var camYdist = abs(y - camera.y)

if ( onGround || camYdist > 50 ){
	with camera {
		desiredY = oPlayer.y + cam_ypos;
	}
}

#endregion

#region ********** MISC COLLISSIONS **********

if place_meeting(x,y,oWarp){
	game_end();	
}

#endregion