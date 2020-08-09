if y+8 < oPlayer.y && y+8 < oPlayer.yprevious then{
	sprite_index =-1;	
} else{
	sprite_index = sBlock;	
	if place_meeting(x,y,oPlayer){
		sprite_index =-1;	
	}
}