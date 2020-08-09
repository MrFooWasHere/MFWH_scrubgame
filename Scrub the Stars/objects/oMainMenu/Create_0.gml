menus = array_create(14);

enum menu{
	main,
	newgame,
	load,
	options,
}
menus[menu.main][0] = "START   A   NEW   GAME";
menus[menu.main][1] = "RESTORE   A   GAME";
menus[menu.main][2] = "GAME   OPTIONS";
menus[menu.main][3] = "CREDITS";
menus[menu.main][4] = "QUIT   GAME";

menus[menu.newgame][0] = "SLOT   ONE";
menus[menu.newgame][1] = "SLOT   TWO";
menus[menu.newgame][2] = "SLOT   FOUR";

menus[menu.load][0] = "SLOT   ONE";
menus[menu.load][1] = "SLOT   TWO";
menus[menu.load][2] = "SLOT   FOUR";

menus[menu.options][0] = "FULLSCREEN";
menus[menu.options][1] = "SOUND";
menus[menu.options][2] = "MUSIC";


selection = 0;
current_menu = menu.main;
num_options = 2;

if !audio_is_playing(fearofdark_hopelessromantic){
	audio_play_sound(fearofdark_hopelessromantic,1,1);	
}