switch(image_speed){
	case 0:
		gpu_set_blendmode_ext(bm_one, bm_src_alpha_sat);
			surface_copy(surf_old_room,0,0,application_surface);
		gpu_set_blendmode(bm_normal);
		image_speed++;
	break;
	case 1:
		trans_go(rm);
		switch(direction){
			case TR_SLIDE_UP:
				xx = 0;
				yy = -h;
			break;
			case TR_SLIDE_DOWN:
				xx = 0;
				yy = h;
			break;
			case TR_SLIDE_RIGHT:
				xx = w;
				yy = 0;
			break;
			case TR_SLIDE_LEFT:
				xx = -w;
				yy = 0;
			break;
		}
		image_speed++;
	break;
	
	case 2:
		if (freeze){
			gpu_set_blendmode_ext(bm_one, bm_src_alpha_sat);
				surface_copy(surf_app,0,0,application_surface);
			gpu_set_blendmode(bm_normal);
			instance_deactivate_all(true);
		} else {
			
		}
			image_speed++;
	break;
	
	default:
		image_speed++;
}


if (surface_exists(surf_old_room)&&surface_exists(surf_app)&&image_speed!=1){
	gpu_set_blendmode_ext(bm_one, bm_src_alpha_sat);
		draw_surface(surf_old_room,x,y);
	gpu_set_blendmode(bm_normal);
	
	if (freeze){
		gpu_set_blendmode_ext(bm_one, bm_src_alpha_sat);
			draw_surface(surf_app,xx,yy);
		gpu_set_blendmode(bm_normal);
	}else{
		draw_surface(application_surface,xx,yy);
	}
	
	var vx = (0-xx)/8;
	var vy = (0-yy)/8;
	
	x+=vx;
	y+=vy;
	xx+=vx;
	yy+=vy;
			
	if (point_distance(0,0,xx,yy)<1)
		instance_destroy();
}


