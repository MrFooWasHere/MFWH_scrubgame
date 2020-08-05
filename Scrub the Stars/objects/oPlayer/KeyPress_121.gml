/// @description Dev Console
switch(get_string("Dev Command", "")){
	case "damage":
		damage_player();
		break;
	case "restart":
		game_restart();
		break;
}