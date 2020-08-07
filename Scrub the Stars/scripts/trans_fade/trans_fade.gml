///@param room
function trans_fade() {

	if (trans_isTransitioning())
		return noone;

	var trans = instance_create_depth(0,0,0,oTransFade);
	trans.rm = argument[0];
	if (argument_count > 1)
		trans.colour = argument[1];
	return trans;


}
