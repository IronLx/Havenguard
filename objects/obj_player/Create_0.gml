//input
key_left = 0;
key_right = 0;

//movement
horzsp = 0;
vertsp = 0;
grav = 0.3;
walksp = 2;
controller = 0;
hascontrol = true;

//intertaction
selection_range = 40;

//attack
attack_available = true;
is_animating = false;

hp = 100;

state = PLAYER_STATE.IDLE;

// Camera variables
cam = view_camera[0];
camera_width = camera_get_view_width(cam);
camera_height = camera_get_view_height(cam);

