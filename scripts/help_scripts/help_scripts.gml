//enum containing available statuses
enum STATE
{
	IDLE,
	MOVING,
	DOING_A_TASK,
	SELECTED_FOR_UPGRADE,
	WAITING,
	UPGRADING,
	MARCHING
}



function Animate2dMovement(_idle_sprite, _running_sprite, _horzsp)
{
	image_speed = 1;
	//Standing Still
	if(_horzsp == 0)
	{
		sprite_index = _idle_sprite;
	}
	//Run
	else
	{
		sprite_index = _running_sprite;
	}
	//Direction
	if (_horzsp != 0) image_xscale = sign(_horzsp);
}
