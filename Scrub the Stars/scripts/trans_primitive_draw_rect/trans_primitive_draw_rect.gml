///@param x
///@param y
///@param size
function trans_primitive_draw_rect(argument0, argument1, argument2) {

			if (argument2>=1){
				draw_rectangle(argument0-argument2/2,argument1-argument2/2,
							   argument0+argument2/2,argument1+argument2/2,false);
			}


}
