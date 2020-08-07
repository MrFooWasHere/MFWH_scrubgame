draw_set_valign(fa_center);
draw_set_halign(fa_middle);

draw_set_colour(c_black);
draw_text(x+2,y+2,room_get_name(room));
draw_text(x+2,y+102,"Press [Arrow Keys] or [1,2,3,4,5,6,7,8,9 or 0] to see transitions examples");

draw_set_colour(c_white);
draw_text(x,y,room_get_name(room));
draw_text(x,y+100,"Press [Arrow Keys] or [1,2,3,4,5,6,7,8,9 or 0] to see transitions examples");
