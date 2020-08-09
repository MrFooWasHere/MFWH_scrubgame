if keyboard_check_pressed(vk_anykey){
	if keyboard_check_pressed(vk_enter){
		audio_play_sound(snd_menuSelect,0.9,0);	
	} else{
		if lock == 0 {
			// move somewhere
			x+= irandom_range(-8,8);
			y+= irandom(8);
			lock = 15;
		}
		audio_play_sound(snd_menuClick,0.9,0);
	}
}

if lock <= 0 then{
	x = 0;
	y = 0;
} else{
	lock --;	
}