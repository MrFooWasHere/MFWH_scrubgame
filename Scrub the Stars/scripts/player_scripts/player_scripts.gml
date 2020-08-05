// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_player(){
	player_health --;
	
	// ********** GAME OVER **********
	if player_health <= 0 then {
		game_restart();
	}
}

function player_shoot(){
	var bulletCount = instance_number(oBullet_player); // number of bullets on screen
	
	if maxBullets > bulletCount then{ // if we can fit more buillets on screen
		var shot = instance_create_depth(x,y-19,depth+1,oBullet_player);
		shot.image_xscale = image_xscale; // make the bullet face the right direction
		shot.hspeed = bulletSpeed * image_xscale; // send the bullet off in the right direction	
	}
}

function player_jump(_power){
	v_yspeed -= jumpPower*_power;
	v_coyote = 0;	
}