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
		break;
	case menu.load:
		break;
	case menu.options:
		break;
}