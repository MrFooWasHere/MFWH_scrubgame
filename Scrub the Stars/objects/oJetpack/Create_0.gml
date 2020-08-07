
active = false;
fuel_colour = c_white;

// Create the P System
jet = part_system_create();
part_system_depth(jet, oPlayer.depth+1);

// Create the Jetpack Particle
jetBlast = part_type_create();
part_type_shape(jetBlast,pt_shape_pixel);            //This defines the particles shape
part_type_size(jetBlast,1,1,0,2);                    //This is for the size
part_type_alpha1(jetBlast,1);                        //This is its alpha. There are three different codes for this
part_type_speed(jetBlast,1,3,0.1,0);            //The particles speed
part_type_direction(jetBlast,275,265,0,20);          //The direction
part_type_orientation(jetBlast,0,0,0,0,true);        //This changes the rotation of the particle
part_type_blend(jetBlast,1);                         //This is the blend mode, either additive or normal
part_type_life(jetBlast,5,15);                       //this is its lifespan in steps</pre>

// EDIT THIS AS FUEL DEPLETES
part_type_color1(jetBlast,fuel_colour);                  //This sets its colour. There are three different codes for this