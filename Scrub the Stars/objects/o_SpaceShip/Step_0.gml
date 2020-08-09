// Get the right sprite
image_index = enter;

// image selection and scaling
var goaldist = distance_to_point(goalx,goaly);
var percent = (goaldist/goalDistance)

if enter{
	pos = 0.1-(percent/2);
	image_xscale = 2-(percent*2);
	image_yscale = 2-(percent*2);
	
	// pick the sprite
	switch(global.enterx){
		case map_location.space_station_x:
			sprite_index = SS_Station;
			break;
		case map_location.mars_x:
			sprite_index = SS_Mars;
			break;
		case map_location.earth_x:
		case map_location.moon_x:
			sprite_index = SS_Earth;
			break;
		case map_location.debris_x:
			sprite_index = SS_Debris;
			break;
	}
} else{
	pos = (percent/2)-0.4;
	image_xscale = percent*2;
	image_yscale = percent*2;
	
	switch(global.exitx){
		case map_location.space_station_x:
			sprite_index = SS_Station;
			break;
		case map_location.mars_x:
			sprite_index = SS_Mars;
			break;
		case map_location.earth_x:
		case map_location.moon_x:
			sprite_index = SS_Earth;
			break;
		case map_location.debris_x:
			sprite_index = SS_Debris;
			break;
	}
}



x = smooth_approach(x, goalx, 0.01);
y = smooth_approach(y, goaly, 0.01);