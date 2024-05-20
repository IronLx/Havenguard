function HandleState()
{
	switch(state)
	{
		case(STATE.MARCHING):
			//CHECK IF THERE'S ANYONE DEFINED IN CREATE IN RANGE
			Movement();
			if (collision_line(x, y, x + lengthdir_x(attack_detection_range, direction), y, player_allied_objects, 0, 0))
			{
				state = STATE.ATTACKING;
				sprite_index = spr_enemy_attack;
				image_index = 0; // Ensure the animation starts from the beginning
				image_speed = 1; // Set the animation speed
				alarm[0] = 50;
				alarm[1] = 30;
			}
			break;
		case(STATE.ATTACKING):
			break;
	}
}

function Movement()
{	
	//Calculate movement
	horzsp = calc_move * walksp;
	vertsp = vertsp + grav;

	//Horizontal Collision
	if(place_meeting(x+horzsp,y,obj_wall))
	{
		//Move pixel by pixel towards the walls
		while(!place_meeting(x+sign(horzsp),y,obj_wall))
		{
			x = x + sign(horzsp);
		}
		//Stop
		horzsp = 0;
	}
	
	//Move horizontally
	x = x + horzsp;
	
	//Direction
	if (horzsp != 0) image_xscale = sign(horzsp);
	if (horzsp < 0) direction = 180;
	else if(horzsp > 0) direction = 0;

	//Vertical Collision
	if(place_meeting(x,y+vertsp,obj_ground))
	{
		//Move pixel by pixel towards the ground
		while(!place_meeting(x,y+sign(vertsp),obj_ground))
		{
			y = y + sign(vertsp);
		}
		//Stop
		vertsp = 0;
	}
	//Move vertically
	y = y + vertsp;
}

HandleState();