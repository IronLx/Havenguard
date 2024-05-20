/// @description Handles Key Input, Movement, Selection and Animation
//FUNCTIONALITY
function GetInput()
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

	//Controller Input Alternatively as soon as the gamepad is used (left stick)
	if(key_left || key_right) controller = 0;
	else if(abs(gamepad_axis_value(0,gp_axislh) > 0.2))
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
	
		controller = 1;
	}

	if(gamepad_button_check_pressed(0,gp_face1))
	{
		controller = 1;
	}
}

function Movement()
{
	//Calculate movement
	var _move = key_right - key_left;
	horzsp = _move * walksp;
	vertsp = vertsp + grav;

	//Horizontal Movement
	//Check Collision
	if(place_meeting(x+horzsp,y,obj_wall))
	{
		//Move pixel by pixel towards the ground
		while(!place_meeting(x+sign(horzsp),y,obj_wall))
		{
			x = x + sign(horzsp);
		}
		//Stop
		horzsp = 0;
	}
	
	if(is_animating)
		horzsp = 0;
	
	//Move horizontally
	x = x + horzsp;
	//Direction
	
	if (horzsp != 0) image_xscale = sign(horzsp);
	if (horzsp < 0) direction = 180;
	else if(horzsp > 0)  direction = 0;

	//Vertical Movement
	//Check Collision
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

function SelectToHighlight()
{
	with(obj_interactible)
	{
	    if(collision_line(other.x, other.y, other.x + lengthdir_x(other.selection_range, other.direction), other.y + lengthdir_y(other.selection_range, other.direction), self, 0, 0))
	    {
			is_selected = true;
	    }
		else is_selected = false;
	}
}

//EXECUTION
if(state != PLAYER_STATE.ATTACKING)
{
	GetInput();
	Movement();
	Animate2dMovement(spr_player, spr_player_run, horzsp, is_animating);
	SelectToHighlight();
}