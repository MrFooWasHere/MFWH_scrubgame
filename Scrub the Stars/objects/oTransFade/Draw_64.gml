draw_set_colour(colour);
draw_set_alpha(image_alpha);
	draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);


if (die){
	if (image_alpha>0){
		image_alpha-=0.05;
	} else {
		instance_destroy();
	}
}else{
	if (image_alpha < 1){
		image_alpha+=0.05;
	} else {
		die = true;
		trans_go(rm);
	}
}
