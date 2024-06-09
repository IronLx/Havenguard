/// @description Interact Button
with(obj_interactible)
{
	if(is_selected && state == STATE.IDLE && is_upgradeable)
	{
		state = STATE.SELECTED_FOR_UPGRADE;
	}
}