function game_init(){
	#region ********** SPACE MAP VALUES **********
	
	enum map_location {
		space_station_x = 1228,
		space_station_y = 614,
		debris_x = 265,
		debris_y = 76,
		mars_x = 174,
		mars_y = 630,
		earth_x = 907,
		earth_y = 110,
		moon_x = 1014,
		moon_y = 147,
		center_x = 656,
		center_y = 353
	}
	enum map {
		station,
		mars,
		debris,
		earth,
		moon
	}
	
	global.enterx = map_location.space_station_x;
	global.entery = map_location.space_station_y;
	global.exitx = map_location.mars_x;
	global.exity = map_location.mars_y;
	
	global.moonOpen = false;
		
	
	#endregion
	
	#region ********** KEY BINDINGS **********
	
	// TODO Make this an INI File
	global.keybind_left		= vk_left;
	global.keybind_right	= vk_right;
	global.keybind_down		= vk_down;
	global.keybind_shoot	= ord("X");
	global.keybind_jump		= ord("Z");
	global.keybind_grenade	= ord("C");
	
	global.keybind_pause	= vk_escape;
	global.keybind_accept	= vk_enter;
	global.keybind_up		= vk_up;
	
	#endregion
	
	#region ********** SAVE GAME SYSTEM **********
	global.saveslot = 1;
	
	ini_open("save.scrub");
	
	// Look for the init key, which tells us the save file has already been made
	if !ini_section_exists("init") {
		// it doesn't exist so we have to build the file
		var i = 1;
		
		repeat(3)
		{
			var thisSaveSlot = "save_" + string(i); // returns save_1, save_2 or save_3
			// Build a save file
			ini_write_real( thisSaveSlot, "save_health", 4);
			ini_write_real( thisSaveSlot, "save_upgrades", 0);
			ini_write_real( thisSaveSlot, "save_teleport", 0);
			ini_write_real( thisSaveSlot, "save_hover", 0);
			ini_write_real( thisSaveSlot, "save_boost", 0);
			ini_write_real( thisSaveSlot, "save_scrap", 0);
			ini_write_real( thisSaveSlot, "save_moon", 0);
			ini_write_real( thisSaveSlot, "save_win", 0);
			ini_write_real( thisSaveSlot, "save_percent", 0);
			ini_write_real( thisSaveSlot, "save_grenades", 0);
			ini_write_string( thisSaveSlot, "save_inventory", "000000000");
			ini_write_real( thisSaveSlot+"_scraps", "Scrap ID's", 0);
			i++;
		}
		
		
		// confirm it has been made for future boots
		ini_write_string( "init","init","save initialised");
	}
	
	
	ini_close();
	
	#endregion
	
	#region ********** ITEMS **********
	
	global.items = array_create(10);
	global.items[0] = sAlcohol;
	global.items[1] = sBlackBox;
	global.items[2] = sCriminal;
	global.items[3] = sFood;
	global.items[4] = sGems;
	global.items[5] = sKey;
	global.items[6] = sPackage;
	global.items[7] = sPowerRegulator;
	global.items[8] = sReligious;
	global.items[9] = sGameEnder;
	
	#endregion
	
	#region ********** ENABLE VIEWS IN LEVEL ROOMS **********
	
	room_set_view_enabled(rm_station_1, true);
	
	#endregion
}

function spawn_spaceShip(_x, _y){
	var _ss = instance_create_depth(_x,_y,-10,o_SpaceShip);
	_ss.goalx = map_location.center_x;
	_ss.goaly = map_location.center_y;
	_ss.enter = true;
	with _ss event_user(0);
	return _ss;
}

function setExit(mapenum){
		switch(mapenum){
			case map.moon:
				global.exitx = map_location.moon_x;
				global.exity = map_location.moon_y;
				break;
			case map.earth:
				global.exitx = map_location.earth_x;
				global.exity = map_location.earth_y;
				break;
			case map.debris:
				global.exitx = map_location.debris_x;
				global.exity = map_location.debris_y;
				break;
			case map.station:
				global.exitx = map_location.space_station_x;
				global.exity = map_location.space_station_y;
				break;
			case map.mars:
				global.exitx = map_location.mars_x;
				global.exity = map_location.mars_y;
				break;				
		}
}
	
function gib(_x,_y){
	var numberofGibs = irandom_range(4,12);
	repeat(numberofGibs){
		var thisGib = instance_create_depth(_x,_y,-1,oGib);
		thisGib.hspeed = random_range(-4,4);
		thisGib.vspeed = random_range(3,7)*-1;
	}
	audio_play_sound(snd_Gib,1,0); // play the gib sound
}

function wipe_save(_id){
	var base = "save_" + string(_id);
	var scr = base + "_scraps";
	ini_open(savefile);
	ini_section_delete(base);
	ini_section_delete(scr);
	
	// write the new save file
	ini_write_real( base, "save_health", 4);
	ini_write_real( base, "save_upgrades", 0);
	ini_write_real( base, "save_teleport", 0);
	ini_write_real( base, "save_hover", 0);
	ini_write_real( base, "save_boost", 0);
	ini_write_real( base, "save_scrap", 0);
	ini_write_real( base, "save_moon", 0);
	ini_write_real( base, "save_win", 0);
	ini_write_real( base, "save_percent", 0);
	ini_write_real( base, "save_grenades", 0);
	ini_write_string( base, "save_inventory", "000000000");
	ini_write_real( scr, "Scrap ID's", 0);
	ini_close();
}


#macro c_pOrange make_color_rgb(255,74,0)
#macro savefile "save.scrub"