image_speed = 0;
rm = room_next(room);
w = surface_get_width(application_surface);
h = surface_get_height(application_surface);
freeze = 1;

x = 0;
y = 0;
xx = 0;
yy = 0;

surf_old_room = surface_create(w,h);
surf_app = surface_create(w,h);

event_inherited();
