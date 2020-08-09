// Selection moving
num_options = 2;
if current_menu = menu.main then{
		num_options = 4;
}

if keyboard_check_pressed(vk_down)	selection ++;	
if keyboard_check_pressed(vk_up)	selection --;

if selection > num_options then selection = 0;
if selection < 0 then selection = num_options;

if keyboard_check_pressed(vk_enter)	event_user(0);

if keyboard_check_pressed(vk_escape){
	if current_menu = menu.main game_end() else current_menu = menu.main;
}


if keyboard_check_pressed(vk_f1) then trans_spr(rm_Credits,sTrans4);