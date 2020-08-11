save_scrapPickup(id);

var par = instance_create_depth(x,y,-10,o_collected);
par.sprite_index = sprite_index;

// add it to the inventory
var invID = 0;
// Loop through global.items until you find the sprite
for (var i = 0; i < 10; i ++){
	if global.items[i] == sprite_index then {
		invID = i;
		break;
	}
}

inventory_add(invID);

instance_destroy();