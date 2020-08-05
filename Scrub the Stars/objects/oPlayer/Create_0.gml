/// @description Initialise all Character Values

//TODO Make these definable from an INI File
// ********** KEYBINDINGS **********

keyLeft			= vk_left;
keyRight		= vk_right;
keyDown			= vk_down;
keyShoot		= ord("X");
keyJump			= ord("Z");
keyGrenade		= ord("C");

keyPause		= vk_escape;
keyAccept		= vk_enter;

// ********** MOVEMENT VALUES **********

// Lateral values
v_xspeed		= 0;		// lateral speed
acceleration	= 0.4;		// acceleration value
topSpeed		= 3;		// top speed
xFriction		= 0.2;		// lateral friction

// Longitude Values
v_yspeed		= 0;		// Vertical speed
c_gravity		= 0.2;		// Gravity
jumpPower		= 5;		// Jump power
fallSpeed		= 10;		// falling speed
coyoteTimer		= 7;		// coyote timer
v_coyote		= 7;		// actual variable timer

// ********** SHOOTING VALUES **********
maxBullets		= 3;		// maximum number of bullets on screen
bulletSpeed		= 6;		// speed of the bullet
v_grenades		= 3;		// grenades in your inventory
grenade_xspeed	= 2;		// ;;
grenade_yspeed	= -2;		// used to build the grenade trajectory
grenade_grav	= 0.1;		// ;;

// ********** HEALTH ETC **********
player_health	= 4;		// player health
camera = instance_create_depth(x,y,depth,oCamera); // Initialise the camera