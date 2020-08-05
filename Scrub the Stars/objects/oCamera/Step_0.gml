/// @description Update Camera Position

desiredX = oPlayer.x + (cam_xpos*oPlayer.image_xscale);

x = smooth_approach(x, desiredX, camSpeed);
y = smooth_approach(y, desiredY, camSpeed);