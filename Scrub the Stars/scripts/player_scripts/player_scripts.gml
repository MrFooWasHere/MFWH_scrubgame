// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_player(){
	player_health --;
	invincible = 30;
	v_xspeed = 0;
	// ********** GAME OVER **********
	if player_health <= 0 && !instance_exists(oPlayerDie) then {
		instance_create_depth(x,y,-9999,oPlayerDie);
		visible = false;
	}
}

function player_shoot(_down){
	var bulletCount = instance_number(oBullet_player); // number of bullets on screen
	var y_offset = 19;
	if sprite_index = s_pDuck then y_offset = 14;
	if maxBullets > bulletCount then{ // if we can fit more buillets on screen
		var shot = instance_create_depth(x,y-y_offset,depth+1,oBullet_player);
		shot.image_xscale = image_xscale; // make the bullet face the right direction
		
		if _down {
			shot.vspeed = bulletSpeed;
			shot.image_angle = 90;
		} else{
			shot.hspeed = bulletSpeed * image_xscale; // send the bullet off in the right direction	
		}
	}
}

function player_jump(_power){
	v_yspeed -= jumpPower*_power;
	v_coyote = 0;	
}

function player_warp(_x, _y){
	var northTime = 0;
	var eastTime = 0;
	var southTime = 0;
	var westTime = 0;
	
	var breakTime = 0;
	
	// probe along the X, get a new location and a time
	
	// probing east
	while ( place_meeting(_x + eastTime, _y, oSolid) ) {
		eastTime ++;
		if ((breakTime++) >= 30) {
			eastTime = -1;
			break;
		}
	}
	
	// probing west
	breakTime = 0;
	while ( place_meeting(_x - westTime, _y, oSolid) ) {
		westTime ++;
		if ((breakTime++) >= 30) {
			westTime = -1;
			break;
		}
	}
	
	// probe along the Y, get a new location and a time
	breakTime = 0;
	while ( place_meeting(_x, _y + southTime, oSolid) ) {
		southTime ++;
		if ((breakTime++) >= 30) {
			southTime = -1;
			break;
		}
	}
	breakTime = 0;
	while ( place_meeting(_x, _y - northTime, oSolid) ) {
		northTime ++;
		if ((breakTime++) >= 30) {
			northTime = -1;
			break;
		}
	}
	
	// check for invalid warp
	if (eastTime + westTime + southTime + northTime == -4){
		// invalid warp
		exit;
	} else{
		// compare times, pick shortest time.
		var newX = 0;
		var newY = -northTime;
		var shortestTime = northTime;
		
		if eastTime < shortestTime{
			shortestTime = eastTime;
			newX = eastTime;
			newY = 0;
		}
		if southTime < shortestTime{
			shortestTime = southTime;
			newX = 0;
			newY = southTime;
		}
		if westTime < shortestTime{
			newX = -westTime;
			newY = 0;
		}
	
		// set new X and Y
		x = _x+newX;
		y = _y+newY;
	}
	
}

function get_fuelColour(_hover){
	// Input a number between 0 and 30 and output a colour code
	// Find what percent of the way through the fuel we are
	var percent_done = (_hover/hover_timer); // returns a number from 0-1;
	var output = make_color_hsv(100 + (150*percent_done), 180,170+(50*percent_done));
	return output;	
}

function check_moveLock(){

}