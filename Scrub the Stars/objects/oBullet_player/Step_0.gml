/// @description Destroy clauses

if	distance_to_object(oPlayer) > 400 ||
	place_meeting(x,y,oSolid)
{
	instance_destroy();
}