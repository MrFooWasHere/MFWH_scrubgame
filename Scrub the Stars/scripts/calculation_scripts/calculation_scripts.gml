/// @function smooth_approach(current, target, speed)
/// @param {real} current value
/// @param {real} target value
/// @param {real} speed to approach the target value
function smooth_approach(_current, _target, _speed){
	var diff = _target-_current;
	if abs(diff) < 0.0005
	{
	   return _target;
	}
	else 
	{
	   return _current+sign(diff)*abs(diff)*_speed;
	}
}