var draw_script = trans_primitive_draw_circle;
switch(primitive){
	case TR_PRIMITIVE_LOS:
		draw_script = trans_primitive_draw_los;
	break;
	
	case TR_PRIMITIVE_RECT:
		draw_script = trans_primitive_draw_rect;
	break;
}

draw_set_color(colour);
var can_die = true;
var i = 0;
repeat(rh){
	var j = 0;
	repeat(rw){
		if (wait[i,j] > 0){			
			can_die = false;
			temp[i,j]--;
			if (temp[i,j] <=0){
				if (size[i,j] < sep*2){
					size[i,j]++;
				} else {
					wait[i,j]--;
				}
			}
		} else {
			if (size[i,j] > 0){
				size[i,j]--;
				can_die = false;
			} 
		}
		var xx = j*sep;
		var yy = i*sep;
		var s = size[i,j];
		script_execute(draw_script,xx,yy,s);
		j++;
	}
	i++
}
if (can_die)
	instance_destroy();

if (wait_overall<=0 && !die){
	trans_go(rm);
	die = true;
} else {wait_overall--;}
