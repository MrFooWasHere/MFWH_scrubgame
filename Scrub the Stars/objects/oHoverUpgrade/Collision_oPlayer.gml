save_scrapPickup(id);

var par = instance_create_depth(x,y,-10,o_collected);
par.sprite_index = sprite_index;

// unlock gun boost
oPlayer.gun_boost = true;

//save
save_playerState();

instance_destroy();