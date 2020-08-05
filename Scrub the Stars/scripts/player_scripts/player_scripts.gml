// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_player(){
	player_health --;
	
	// ********** GAME OVER **********
	if player_health <= 0 then {
		game_restart();
	}
}