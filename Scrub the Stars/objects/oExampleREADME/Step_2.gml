var rm = room_1;
if (room == room_1)
	rm = room_2;
	
switch(keyboard_lastkey){
	case ord("1"):
		trans_fade(rm);
	break;
	
	case ord("2"):
		trans_spr(rm);
	break;
	
	case ord("3"):
		trans_spr(rm,sTrans2);
	break;
	
	case ord("4"):
		trans_spr(rm,sTrans3);
	break;
	
	case ord("5"):
		trans_spr(rm,sTrans4);
	break;
	
	case ord("6"):
		trans_primitive(rm);
	break;
	
	case ord("7"):
		trans_primitive(rm,TR_PRIMITIVE_RECT,c_red);
	break;
	
	case ord("8"):
		trans_primitive(rm,TR_PRIMITIVE_LOS,c_white);
	break;
	
	case ord("9"):
		trans_blend(rm);
	break;
	
	case ord("0"):
		var c = make_colour_rgb(irandom(255),irandom(255),irandom(255));
		var r = irandom(2);
		switch(r){
			case 0:
				trans_primitive(rm,irandom(3),c)
			break;
			
			case 1:
				trans_fade(rm,c);
			break;
			
			case 2:
				trans_slide(rm,irandom(3),irandom(1));
			break;
		}
	break;
	
	case vk_left:
		trans_slide(rm,TR_SLIDE_LEFT);
	break;
	
	case vk_right:
		trans_slide(rm,TR_SLIDE_RIGHT);
	break;
	
	case vk_up:
		trans_slide(rm,TR_SLIDE_UP);
	break;
	
	case vk_down:
		trans_slide(rm,TR_SLIDE_DOWN);
	break;
	

}

keyboard_lastkey =  -1;