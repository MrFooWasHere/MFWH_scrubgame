room_speed = 60;
depth = -100;

/*
	This is a transitions system for rooms that is quite simple to use.
	
	This build has 5 types of transitions:
	trans_fade(room,[colour]) - Simple fade in fade out between rooms
	trans_blend(room) - Simple fade in of the room
	trans_spr(room,[sprite]) - Transition where the first room "dissolve" into the 
		second room based on a sprite [sTrans1,sTrans2,sTrans3,sTrans4].
	trans_slide(room,[direction],[freeze game]) - Transition of snes rpg/metroidvania games. It
		needs to receive a constant as a parameter:
		[TR_SLIDE_DOWN,TR_SLIDE_LEFT,TR_SLIDE_RIGHT,TR_SLIDE_UP]
		And if you want to freeze all instances while the transition is happening just add a true as a third parameter.
	trans_primitive(room,[primitive],colour)
*/

