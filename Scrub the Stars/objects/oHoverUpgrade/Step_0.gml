/// @description floating

y = anchorY + sin(timer*0.1)*4;
timer++;


rainbow ++;
if rainbow > 255 then rainbow = 0;
image_blend = make_colour_hsv(rainbow,255,255);