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
	ATTACKING,
	DYING,
}

enum PLAYER_STATE
{
	IDLE,
	ATTACKING,
	RUNNING,
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

function CheckHealth()
{
	if (hp < 0)
	{
		state = STATE.DYING;
	}
}


global.player_allied_objects = [obj_player, obj_peon, obj_barricade_built, obj_townhall_0];
global.player_enemy_objects = [obj_enemy];