///@param room
///@param [spr]
function trans_spr() {

	if (trans_isTransitioning())
		return noone;

	var trans = instance_create_depth(0,0,0,oTransSpr);
	trans.rm = argument[0];
	if (argument_count > 1)
		trans.sprite_index = argument[1];

	return trans;


}
