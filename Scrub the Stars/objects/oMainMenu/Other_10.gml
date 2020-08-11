/// @description Select this option
switch(current_menu){
	case menu.main:
		switch(selection){
				case 0:
					current_menu = menu.newgame;
					selection = 0;
					break;
				case 1:
					current_menu = menu.load;
					selection = 0;
					break;
				case 2:
					current_menu = menu.options;
					selection = 0;
					break;
				case 3:
					trans_spr(rm_Credits,sTrans4);
					break;
				case 4:
					game_end();
					break;
		}
		break;
	case menu.newgame:
		// pick the new saveslot
		global.saveslot = selection+1;
		//clean current save slot
		wipe_save(global.saveslot);
		trans_spr(rm_Episode_Select,sTrans4);
		break;
	case menu.load:
		// pick the new saveslot
		global.saveslot = selection+1;
		trans_spr(rm_Episode_Select,sTrans4);
		break;
	case menu.options:
		//TODO OPTIONS
		break;
}