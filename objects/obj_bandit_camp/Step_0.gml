CheckHealth();

if(state == STATE.DYING)
{
	instance_destroy();
}

if (state == STATE.GENERATING)
{
	alarm[0] = delay_between_bandits;
	state = STATE.WAITING;
}