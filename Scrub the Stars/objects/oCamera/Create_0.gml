/// @description Initialise view camera

// TODO run room_set_view_enabled(room,true) on every room during the init room
cam_width	= 640;
cam_height	= 360;
cam_xpos	= 64;
cam_ypos	= -22;
camSpeed	= 0.08;

desiredX	= x;
desiredY	= y;

cam_xoffset = cam_width/2;
cam_yoffset = cam_height/2;
view_set_visible(0,true);
cam = camera_create_view(x-cam_xoffset,y-cam_yoffset,cam_width, cam_height, 0, oCamera,-1,-1,cam_xoffset,cam_yoffset);
view_set_camera(0,cam);

