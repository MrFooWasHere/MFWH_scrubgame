stars = part_system_create_layer("Stars", false);
star = part_type_create();
part_type_shape(star,pt_shape_pixel);            //This defines the particles shape
part_type_size(star,0.5,1,0.01,0);                    //This is for the size
part_type_color1(star,c_white);                  //This sets its colour. There are three different codes for this
part_type_alpha3(star,0,1,1);
part_type_speed(star,2,5,0.2,0);            //The particles speed
part_type_direction(star,0,359,0.1,0);            //The direction
part_type_orientation(star,0,0,0,0,true);        //This changes the rotation of the particle
part_type_blend(star,0);                         //This is the blend mode, either additive or normal
part_type_life(star,90,90);                       //this is its lifespan in steps</pre>