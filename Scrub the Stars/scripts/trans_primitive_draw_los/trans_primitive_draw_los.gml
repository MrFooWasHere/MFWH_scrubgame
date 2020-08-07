///@param x
///@param y
///@param size
function trans_primitive_draw_los(argument0, argument1, argument2) {

			draw_primitive_begin(pr_trianglefan);
				draw_vertex(argument0,argument1);
				draw_vertex(argument0-argument2/2,argument1);
				draw_vertex(argument0,argument1-argument2/2);
				draw_vertex(argument0+argument2/2,argument1);
				draw_vertex(argument0,argument1+argument2/2);
				draw_vertex(argument0-argument2/2,argument1);
			draw_primitive_end();


}
