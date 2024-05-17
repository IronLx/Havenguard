/// @description Movement|Idling|Moving p2p|State|Job
//movement
horzsp = 0;
vertsp = 0;
grav = 0.3;
walksp = 1;

//idle movement
idle_dist = 50;
idling_x = x;
rand_interval = 20;
calc_move = 0;
move_timer = rand_interval;

//point-2-point moving
movement_target = 200;

//peons status decising on his behaviour
state = STATE.IDLE;
selected_job = noone;

hp = 100;