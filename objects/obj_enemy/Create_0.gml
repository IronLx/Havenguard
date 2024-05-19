/// @description Movement|Idling|Moving p2p|State|Job
//movement
horzsp = 0;
vertsp = 0;
grav = 0.3;
walksp = 1;
calc_move = 1;

//peons status decising on his behaviour
state = STATE.MARCHING;

//enemy stats
player_allied_objects = [obj_player, obj_peon, obj_barricade_built];
attack_detection_range = 20;

//attack
timer = 0;
attack_intermission = 30;
hp = 10;