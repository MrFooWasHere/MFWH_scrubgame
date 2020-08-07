if (surf = -1){
	surf = surface_create(w,h);
	surface_copy(surf,0,0,application_surface);
	trans_go(rm);
}

if surface_exists(surf){
	draw_set_alpha(image_alpha);
	draw_surface(surf,0,0);
}

image_alpha*=0.9;
if (image_alpha<=0.05){
	instance_destroy();
}
draw_set_alpha(1);