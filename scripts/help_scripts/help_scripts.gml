//enum containing available statuses
enum STATE
{
	IDLE,
	MOVING,
	DOING_A_TASK,
	SELECTED_FOR_UPGRADE,
	WAITING,
	UPGRADING,
	MARCHING,
	ATTACKING
}

enum PLAYER_STATE
{
	IDLE,
	ATTACKING,
	RUNNING
}

function Animate2dMovement(_idle_sprite, _running_sprite, _horzsp, _is_animating)
{
	image_speed = 1;
	//Standing Still
	if(!_is_animating)
	{
		if(_horzsp == 0)
		{
			sprite_index = _idle_sprite;
		}
		//Run
		else
		{
			sprite_index = _running_sprite;
		}
	}
	//Direction
	if (_horzsp != 0) image_xscale = sign(_horzsp);
}
