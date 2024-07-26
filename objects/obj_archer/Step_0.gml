/// @description Handles it's State Machine and Movement

//FUNCTIONALITY
function HandleState()
{
	switch(state)
	{
		case(STATE.MOVING):
			//station the archer in front of the furthest wall to defend it while dividing all archers equally between sides
		case(STATE.ATTACKING):
			//Animate an attack with the bow and go back to Idle
		case(STATE.IDLE):
			//Wait at the position for incoming enemies or a change of state
	}
}

function Movement()
{	
	//Calculate movement
	horzsp = calc_move * walksp;
	vertsp = vertsp + grav;

	//Horizontal Collision
	if(place_meeting(x+horzsp,y,obj_wall_block))
	{
		//Move pixel by pixel towards the walls
		while(!place_meeting(x+sign(horzsp),y,obj_wall_block))
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

CheckHealth();
HandleState();
Movement();