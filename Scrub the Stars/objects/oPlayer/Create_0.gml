/// @description Initialise all Character Values

//TODO Make these definable from an INI File
// ********** KEYBINDINGS **********

keyLeft			= global.keybind_left;
keyRight		= global.keybind_right;
keyDown			= global.keybind_down;
keyShoot		= global.keybind_shoot;
keyJump			= global.keybind_jump;
keyGrenade		= global.keybind_grenade;

keyPause		= global.keybind_pause;
keyAccept		= global.keybind_accept;

// ********** MOVEMENT VALUES **********

// Lateral values
v_xspeed		= 0;		// lateral speed
acceleration	= 0.4;		// acceleration value
topSpeed		= 3;		// top speed
xFriction		= 0.2;		// lateral friction
v_xcarry		= 0;		// moving platform value

// Longitude Values
v_yspeed		= 0;		// Vertical speed
c_gravity		= 0.2;		// Gravity
jumpPower		= 5;		// Jump power
fallSpeed		= 10;		// falling speed
coyoteTimer		= 7;		// coyote timer
v_coyote		= 7;		// actual variable timer
v_ycarry		= 0;		// moving platform value

// ********** SHOOTING VALUES **********
maxBullets		= 3;		// maximum number of bullets on screen
bulletSpeed		= 12;		// speed of the bullet
v_grenades		= 3;		// grenades in your inventory
grenade_xspeed	= 2;		// ;;
grenade_yspeed	= -2;		// used to build the grenade trajectory
grenade_grav	= 0.1;		// ;;

// ********** HEALTH ETC **********
player_health	= 4;		// player health
gun_damage		= 0;		// flags for gun upgrades 0-1-2-3
gun_boost		= false;	// flag for gun boost upgrade
can_gunboost	= false;	// flag for being able to gun boost
hover_upgrade	= false;	// flag for hover upgrade
teleport_upgrade= false;	// flag for teleport upgrade
hover_timer		= 30;		// time to spend hovering
_hover_timer	= hover_timer; // actuall variable for hvoering
scrap_count		= 0;		// Currency

// ********** MISC VARIABLES **********
spriteLock		= 0;		// used to "lock" the current sprite
invincible		= 0;		// used for invincibility frames
inventory		= "000000000" // used for storing the inventory

jetpack= instance_create_depth(x,y,depth+1,oJetpack); // initialise the jetpack
camera = instance_create_depth(x,y,depth,oCamera); // Initialise the camera

load_playerState();