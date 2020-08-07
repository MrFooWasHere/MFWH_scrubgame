///@param room
///@param [direction]
///@param [freeze game while transitioning?]
function trans_slide() {

#macro TR_SLIDE_LEFT 0
#macro TR_SLIDE_DOWN 1
#macro TR_SLIDE_RIGHT 2
#macro TR_SLIDE_UP 3

	if (trans_isTransitioning())
		return noone;

	var trans = instance_create_depth(0,0,0,oTransSlide);
	trans.rm = argument[0];
	if (argument_count > 1)
		trans.direction = argument[1];
	if (argument_count > 2)
		trans.freeze = argument[2];

	return trans;



}
