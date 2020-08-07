var xoff = 4;
if oPlayer.image_xscale = 1 then xoff = -6;
x = oPlayer.x+xoff;
y = oPlayer.y-18;

if active {
	// blast particles
	part_type_color1(jetBlast,fuel_colour);
	part_particles_create(jet,x,y,jetBlast,4);
}