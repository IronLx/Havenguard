/// @description Insert description here
// You can write your code in this editor

if (is_selected)
{
	draw_sprite(spr_highlight,0,x,y+highlight_h);
}

switch(state)
{
	case(STATE.SELECTED_FOR_UPGRADE):
		draw_sprite(spr_build_selected,0,x,y+build_icon_h);
		break;
	case(STATE.WAITING):
		draw_sprite(spr_build_waiting,0,x,y+build_icon_h);
		break;
	case(STATE.UPGRADING):
		draw_sprite(spr_p_bar,0,x,y+progress_h);
		draw_sprite_stretched(spr_p_filling,0,x+progress_w,y+progress_h_f,(progress/progress_max)*progress_f_size,5)
		break;
}