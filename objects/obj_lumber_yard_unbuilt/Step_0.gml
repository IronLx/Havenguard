/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//check if level changed
if (level != pre_level)
{
	//if it did then first set it so we know the level change no longer is detected
	pre_level = level;
	
	//now we can change the instance into it's new form
	//I should be able to make it more universal and share between all interactibles but for now let's HARD CODE IT
	switch(level)
	{
		case(0): 
			instance_change(obj_barricade_unbuilt,true);
			break;
		case(1):
			instance_change(obj_lumber_yard_built,true);
			break;
	}
}

if(previous_state != state && state == STATE.SELECTED_FOR_UPGRADE && global.resources[RESOURCE.WOOD] >= upgrade_cost)
{
	global.resources[RESOURCE.WOOD] -= upgrade_cost;
}

//check upgrades
if(global.resources[RESOURCE.WOOD] >= upgrade_cost && object_index == obj_lumber_yard_unbuilt)
{
	is_upgradeable = true;
}
else
{
	is_upgradeable = false;
}

