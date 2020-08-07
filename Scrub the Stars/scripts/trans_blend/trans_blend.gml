///@param room
function trans_blend(argument0) {

	if (trans_isTransitioning())
		return noone;

	var trans = instance_create_depth(0,0,0,oTransBlend);
	trans.rm = argument0;
	return trans;


}
