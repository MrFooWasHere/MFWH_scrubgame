/// @description Enemy Values

// ********** VALUES **********
en_health		= 1; // health of this enemy

image_blend = make_color_hsv(irandom(255),255,255);
image_xscale = 2;
image_yscale = 2;

y_spd = 0;
x_spd = 0;

grav_force = 0.3;

// SIN VARIABLES
anchorY = y;
anchorX = x;
timer = 0 + random(100);