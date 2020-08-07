/// @description Insert description here
// You can write your code in this editor
switch(global.exitx){
	case map_location.space_station_x:
		image_index = 4;
		break;
	case map_location.mars_x:
		image_index = 2;
		break;
	case map_location.earth_x:
		image_index = 0;
		break;
	case map_location.moon_x:
		image_index = 1;
		break;
	case map_location.debris_x:
		image_index = 3;
		break;
}

if keyboard_check_pressed(mapup){
	// move up if we can
	switch(global.exitx){
	case map_location.space_station_x:
		if global.moonOpen then setExit(map.moon) else setExit(map.earth);
		break;
	case map_location.mars_x:
		setExit(map.debris);
		break;
	case map_location.moon_x:
		setExit(map.earth);
		break;
	case map_location.earth_x:
	case map_location.debris_x:
		break;
	}
}
if keyboard_check_pressed(mapleft){
	switch(global.exitx){
	case map_location.space_station_x:
		setExit(map.mars);
		break;
	case map_location.moon_x:
		setExit(map.earth);
		break;
	case map_location.earth_x:
		setExit(map.debris);
		break;
	case map_location.mars_x:
	case map_location.debris_x:
		break;
	}
}
if keyboard_check_pressed(mapright){
	switch(global.exitx){
	case map_location.earth_x:
		if global.moonOpen then setExit(map.moon);
		break;
	case map_location.mars_x:
		setExit(map.station);
		break;
	case map_location.debris_x:
		setExit(map.earth);
		break;
	case map_location.space_station_x:
	case map_location.moon_x:
		break;
	}
}
if keyboard_check_pressed(mapdown){
	switch(global.exitx){
	case map_location.earth_x:
	case map_location.moon_x:
		setExit(map.station);
		break;
	case map_location.debris_x:
		setExit(map.mars);
		break;
	case map_location.mars_x:
	case map_location.space_station_x:
		break;
	}
}

if keyboard_check_pressed(mapaccept){
	// go to the selected exit	
	ship.goalx = global.exitx;
	ship.goaly = global.exity;
	ship.enter = false;
	
	// transition to the level
	// TODO Fill this in with actual levels based on the exit
	trans_primitive(testRoom,TR_PRIMITIVE_RECT,c_pOrange);
}