/// @description Handles it's State Machine and Movement
//UTILITY
function FindJob(_pointx, _pointy, _object)
{
	var _list = ds_priority_create();
    var _nearest_job = noone;
    with (_object) 
	{
		if(state == STATE.SELECTED_FOR_UPGRADE)
			ds_priority_add(_list,id,distance_to_point(_pointx,_pointy));
	}
	
	if(!ds_priority_empty(_list))
		_nearest_job = ds_priority_find_min(_list);
	else return noone;
	
    ds_priority_destroy(_list);
    return _nearest_job;
}

//FUNCTIONALITY
function HandleState()
{
	switch(state)
	{
		case(STATE.IDLE):
			//use a timer to make the peon idle randomly every so often and not all the time
			move_timer--;
			if(move_timer < 0)
			{
				move_timer = rand_interval;
				calc_move = round(irandom_range(-1,1));
			}
			//Look for a job
			selected_job = FindJob(x,y,obj_interactible);
			if (selected_job != noone)
			{
				selected_job.state = STATE.WAITING;
				state = STATE.DOING_A_TASK;
			}
			break;
			
		case(STATE.MOVING):
			//check if we are left or right from the target point if on point then stop moving
			if(x > movement_target) calc_move = -1;
			else if(x < movement_target) calc_move = 1;
			else 
			{
				calc_move = 0;
				state = STATE.IDLE;
			}
			break;
			
		case(STATE.DOING_A_TASK):
			//if there is a job selected
			if(selected_job != noone)
			{
				//handle movement towards target job
				if(x > selected_job.x) calc_move = -1;
				else if(x < selected_job.x) calc_move = 1;
				//handle when you get to the target job
				else
				{
					calc_move = 0;
					selected_job.state = STATE.UPGRADING;
					state = STATE.UPGRADING;
				}
			}
			break;
		case(STATE.UPGRADING):
			calc_move = 0;
			if(selected_job.progress >= selected_job.progress_max)
			{
				state = STATE.IDLE;
				selected_job = noone;
			}
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
Movement();
Animate2dMovement(spr_peon, spr_peon_run, horzsp);