/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

CheckHealth();

if(state == STATE.DYING)
{
	instance_destroy();
}