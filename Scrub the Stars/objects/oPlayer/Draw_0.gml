//draw_sprite(s_pMask,0,x,y);// DEBUG Collission mask
draw_text(mouse_x,mouse_y-32,instance_number(oBullet_player));

if do_drawOutline {
	shader_set(sh_saturation);
	shader_set_uniform_f(shader_get_uniform(sh_saturation, "Position"), 1);
	draw_sprite_ext(sprite_index,image_index,x-1,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x+1,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x,y+1,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x,y-1,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	shader_reset();
}


draw_self();