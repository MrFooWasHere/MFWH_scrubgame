/// @description Dev Console
switch(get_string("Dev Command", "")){
	case "damage":
		damage_player();
		break;
	case "restart":
		game_restart();
		break;
	case "starman":
		hover_upgrade = true;
		break;
	case "rocketjump":
		gun_boost = true;
		break;
}