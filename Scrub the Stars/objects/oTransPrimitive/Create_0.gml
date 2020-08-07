#macro TR_PRIMITIVE_WAIT 20


primitive = TR_PRIMITIVE_CIRCLE;

colour = $000000;

rm = room_next(room);
depth = -15;
w = display_get_gui_width();
h = display_get_gui_height();
die = false;

sep = 32;
rw = ceil(2+w/sep);
rh = ceil(2+h/sep);
var step_wait = 2;

var i = 0;
repeat(rh){
	var j = 0;
	repeat(rw){
		size[i,j] = 0;
		temp[i,j] = j*step_wait;
		wait[i,j] = TR_PRIMITIVE_WAIT;
		j++;
	}
	i++;
}

wait_overall = j*step_wait + TR_PRIMITIVE_WAIT;

event_inherited();