/// @description Dev Console
switch(get_string("Dev Command", "")){
	case "damage":
		damage_player();
		break;
	case "restart":
		game_restart();
		break;
	case "foo_starman":
		hover_upgrade = !hover_upgrade;
		break;
	case "foo_rocketjump":
		gun_boost = !gun_boost;
		break;
	case "foo_whoneedslegs":
		teleport_upgrade = !teleport_upgrade;
		break;
	case "dnstuff":
		hover_upgrade = true;
		gun_boost = true;
		teleport_upgrade = true;
		break;
	case "snq":
		save_playerState();
		game_restart();
		break;
	case "clean":
		ini_open(savefile);
		ini_section_delete("save_1");
		ini_section_delete("save_1_scraps");
		ini_section_delete("save_2");
		ini_section_delete("save_2_scraps");
		ini_section_delete("save_3");
		ini_section_delete("save_3_scraps");
		ini_section_delete("init");
		ini_close();
		game_restart();
}