/// @description Actions

// ********** KEY INPUTS **********
var inputLeft		= keyboard_check(keyLeft);
var inputRight		= keyboard_check(keyRight);
var inputDown		= keyboard_check(keyDown);
var inputUp			= keyboard_check(keyUp);
var inputShoot		= keyboard_check_pressed(keyShoot);
var inputJump		= keyboard_check_pressed(keyJump);
var inputGrenade	= keyboard_check_pressed(keyGrenade);
var inputHover		= keyboard_check(keyJump);

#region deathLocking
if visible = false then{
		inputLeft		= 0;
		inputRight		= 0;
		inputDown		= 0;
		inputUp		= 0;
		inputShoot		= 0;
		inputJump		= 0;
		inputGrenade	= 0;
		inputHover		= 0;
		c_gravity = 0; // stop falling
}
#endregion

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
	_hover_timer = hover_timer; // reset hover timer
	if gun_boost then can_gunboost = true; // reset gun boost power
} else{
	// reduce coyoteTimer
	v_coyote --;
	// falling
	var fallDir = sign(v_yspeed);
	if fallDir = -1 then v_yspeed += c_gravity else v_yspeed += c_gravity*1.5; // gravity effects
	v_yspeed = clamp(v_yspeed, fallSpeed*-50,fallSpeed); // clamp so you don't fall at the speed of sound
	// hovering
	if hover_upgrade && v_yspeed > 0 && v_coyote <= 0 then{
		if inputHover && _hover_timer > 0{
				v_yspeed = 0;
				_hover_timer --;
				jetpack.active = true;
				jetpack.fuel_colour = get_fuelColour(_hover_timer);
		} else{
			jetpack.active = false;	
		}
	}
}

// ********** JUMPING TIME **********
if inputJump && (onGround || v_coyote > 0) then {
	player_jump(1);
}

#endregion

#region ********** SHOOTING CODE **********
if inputShoot{
	if !onGround && inputDown && can_gunboost then{
		// do a gun boost
		v_yspeed = 0;
		player_jump(0.75);
		sprite_index = s_pShootDown;
		spriteLock = 20;
		player_shoot(true);
		can_gunboost = false;
		// TODO ADD A FLAG THAT CHANGES THE SPRITE HERE
	} else{
		player_shoot(false);	
	}
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
	if ((checkStop ++) >= 80) then break; // Stop the while loop if we get stuck completely
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

// ********** UPDATE POSITION **********

x = newX;
y = newY;

#region ********** DUCKING **********

if sprite_index != s_pDuck {
	mask_index = s_pMask;	
}

#endregion

#region ********** GRENADE CODE **********

if inputGrenade 
{
	if instance_exists(oGrenade_player){
		if inputDown && teleport_upgrade{
			player_warp(oGrenade_player.x, oGrenade_player.y); // teleport to the grenade
		} else{
			with oGrenade_player timer = 0;	 // premature detonate
		}
	}
	if (v_grenades > 0) && !instance_exists(oGrenade_player) {
		// chuck a grenade	
		var grenade = instance_create_depth(x,y-25, depth+1, oGrenade_player);
		grenade.xspd = grenade_xspeed * image_xscale + v_xspeed;
		grenade.grav = grenade_grav;
		grenade.yspd = grenade_yspeed;
		v_grenades --;
	}
}

#endregion

#region ********** DAMAGE COLLISSIONS **********

if place_meeting(x,y,oDamage) && invincible = 0 then{
	damage_player();	
}
if invincible > 0 then {
	invincible --;
	if image_alpha > 0.4 then image_alpha -= 0.2 else image_alpha = 1;
} else{
	image_alpha = 1;	
}

#endregion

#region ********** CAMERA UPDATE **********

var camYdist = abs(y - camera.y)

if ( onGround || camYdist > 50 ){
	var yoffset = inputUp*80;
	with camera {
		desiredY = oPlayer.y + cam_ypos - yoffset;
	}
}

#endregion

#region ********** MISC COLLISSIONS **********

if place_meeting(x,y,oWarp){
	// go to next room
	save_playerState();
	trans_fade(room_next(room));
}
if place_meeting(x,y,oWarpEnd){
	// go to next room
	save_playerState();
	trans_primitive(EP1_SpaceMap,TR_PRIMITIVE_LOS,c_pOrange);
}

#endregion

#region ********** SPRITE CONTROL **********
if spriteLock > 0 then spriteLock -- else
{
	if onGround{
			if abs(v_xspeed) > 0.5 then sprite_index = s_pWalk else {
				if inputDown {
					sprite_index = s_pDuck;
					mask_index = s_pDuckMask;
				}
				else sprite_index = s_pIdle;
			}
	} else{
		if v_yspeed < 0 || v_yspeed > 2 then sprite_index = s_pJump;	
	}
}

#endregion