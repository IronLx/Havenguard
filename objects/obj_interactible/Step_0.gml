//FUNCTIONALITY
function HandleState()
{
	switch(state)
	{
		case(STATE.SELECTED_FOR_UPGRADE):
			break;
		case(STATE.UPGRADING):
			//progress through the upgrade
			if(progress < progress_max)
				progress++;
			//stop upgrade
			else
			{
				progress = 0;
				//level up TBC
				instance_change(obj_barricade_built,true);
				state = STATE.IDLE;
			}
			break;
		case(STATE.IDLE):
			break;
	}
	
}

HandleState();
