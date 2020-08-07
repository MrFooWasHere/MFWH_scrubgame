if pos < 0 then pos = 0;
shader_set(sh_saturation);
shader_set_uniform_f(pos_uni, pos);
draw_self();
shader_reset();