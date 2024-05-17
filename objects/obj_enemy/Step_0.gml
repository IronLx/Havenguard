function Attack(_range,_type,_layer)
{
	var _attack = instance_create_layer(x + (_range * image_xscale), y, _layer, _type);
	_attack.image_xscale = image_xscale;
	_attack.range = _range;
	_attack.owner = obj_enemy;
}

function HandleState()
{
	switch(state)
	{
		case(STATE.MARCHING):
			//CHECK IF THERE'S ANYONE DEFINED IN CREATE IN RANGE
			if (collision_line(x, y, x + lengthdir_x(attack_detection_range, direction), y, player_allied_objects, 0, 0))
			{
				//show_debug_message("FOUND ");
				if(timer >= attack_intermission)
				{
					Attack(20, obj_enemy_attack, "Instances");
					timer = 0;
				}
				//HARD CODED Starting to move back!!! CHANGE!!!
				calc_move = 0;
			}
			else calc_move = 1;
			Movement();
			break;
	}
	timer++;
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