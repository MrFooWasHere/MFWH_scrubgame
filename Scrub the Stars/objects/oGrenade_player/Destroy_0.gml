/// @description Explosion Code

// kill all enemies in the zone
mask_index = s_grenadeMask;
var _list = ds_list_create();
var _num = instance_place_list(x,y,oEnemy, _list, false);

if _num > 0 {
	for (var i = 0; i < _num; i++;)
	{
		instance_destroy(_list[| i]);	
	}
}
ds_list_destroy(_list);

// TODO: Play the explosion animation