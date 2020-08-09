/// @description Draw the Menu
draw_set_font(fnt_default);
draw_set_halign(fa_center);

num_options = 2;
if current_menu = menu.main then{
		num_options = 4;
}

for (var i = 0; i <= num_options; i ++;){
	// loop through the current menu and draw all the options
	var this_option = menus[current_menu][i];
	// colour the selected option
	if i = selection then draw_set_color(c_pOrange) else draw_set_color(c_white);
	draw_text(640, 144+(24*i), this_option);
}
draw_set_color(c_white);