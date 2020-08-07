if (image_speed = 0){
	image_speed = 1;
	surface_copy(surf,0,0,application_surface);
	trans_go(rm);
}

if surface_exists(surfSee)&&surface_exists(surf){
	surface_set_target(surfSee);
		draw_clear(c_black);
	draw_surface(surf,0,0);
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
		draw_sprite_ext(sprite_index,image_index,0,0,w/sprite_width,h/sprite_height,0,c_white,1);
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	draw_surface(surfSee,0,0);
}

