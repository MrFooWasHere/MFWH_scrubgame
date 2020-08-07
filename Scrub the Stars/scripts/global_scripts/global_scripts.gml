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
	
function saveGame(_saveslot){
		
}
	
#macro c_pOrange make_color_rgb(255,74,0)