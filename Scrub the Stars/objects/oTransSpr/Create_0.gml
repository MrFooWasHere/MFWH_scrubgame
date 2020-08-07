image_speed = 0;
morre = false;
rm = room_next(room);
w = surface_get_width(application_surface);
h = surface_get_height(application_surface);

surf = surface_create(w,h);
surfSee = surface_create(w,h);

event_inherited();