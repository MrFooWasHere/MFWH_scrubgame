image_speed = 0;
image_index = 0;

goalx = 0;
goaly = 0;
enter = true; // true is coming, false is going

goalDistance = 0;

pos_uni = shader_get_uniform(sh_saturation, "Position"); // control shader
pos = 1;