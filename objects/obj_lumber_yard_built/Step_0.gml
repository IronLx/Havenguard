/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(alarm[0] < 0)
	alarm[0] = 500;

CheckHealth();

if(state == STATE.DYING)
{
	instance_change(obj_lumber_yard_unbuilt, true);
}
