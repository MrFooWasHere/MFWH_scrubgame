///@param room
///@param [primitive_type]
///@param [primitive_colour]
function trans_primitive() {
#macro TR_PRIMITIVE_CIRCLE 0
#macro TR_PRIMITIVE_RECT 1
#macro TR_PRIMITIVE_LOS 2

	if (trans_isTransitioning())
		return noone;

	var trans = instance_create_depth(0,0,0,oTransPrimitive);
	trans.rm = argument[0];
	if (argument_count > 1)
		trans.primitive = argument[1];
	if (argument_count > 2)
		trans.colour = argument[2];

	return trans;


}
