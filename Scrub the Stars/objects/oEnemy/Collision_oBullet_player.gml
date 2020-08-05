/// @description Getting shot

with other instance_destroy(); // destroy the bullet


// ********** ENEMY_DAMAGE() **********
en_health --; // take damage
if en_health <= 0 then instance_destroy(); // destroy self if you're dead