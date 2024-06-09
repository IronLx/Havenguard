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
				level++;
				state = STATE.IDLE;
			}
			break;
		case(STATE.IDLE):
			break;
	}
}

HandleState();
