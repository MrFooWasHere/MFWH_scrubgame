// Draw HUD Items

// Draw the healthbar
draw_sprite_ext(sHealthBar,player_health,0,0,2,2,0,c_white,1);

// Draw the gun Bar
draw_sprite_ext(sGunBar,gun_damage,0,32,2,2,0,c_white,1);

// draw the scrap bar
draw_sprite_ext(sScrapBar,0,0,52,2,2,0,c_white,1);
draw_set_font(fnt_default);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(70,61,scrap_count);

// Draw the Upgrades
var upgrades = ds_list_create();
if hover_upgrade	then ds_list_add(upgrades, sUpgrade_Hover);
if gun_boost		then ds_list_add(upgrades, sUpgrade_Gun);
if teleport_upgrade then ds_list_add(upgrades, sUpgrade_Teleport);

for (var i = 0; i < ds_list_size(upgrades); i++){
	var thisupgrade = ds_list_find_value(upgrades,i)	
	// draw the sprite for this upgrade
	draw_sprite_ext(thisupgrade,0,0+(48*i),100,2,2,0,c_white,1);
}
ds_list_destroy(upgrades);

