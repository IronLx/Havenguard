/// @description Attack Button
if(state != PLAYER_STATE.ATTACKING)
{
	state = PLAYER_STATE.ATTACKING;
	sprite_index = spr_player_attack;
	image_index = 0; // Ensure the animation starts from the beginning
    image_speed = 1; // Set the animation speed
	alarm[0] = 50;
	alarm[1] = 30;
}