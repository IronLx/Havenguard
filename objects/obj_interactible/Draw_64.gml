/// @description Insert description here
// You can write your code in this editor
g_x = x - camera_get_view_x(view_camera[0]);
g_y = y - camera_get_view_y(view_camera[0]);
if (is_selected && is_upgradeable && state == STATE.IDLE)
{
	draw_sprite(spr_highlight, 0, g_x, g_y + highlight_h);
}

switch(state)
{
	case(STATE.SELECTED_FOR_UPGRADE):
		draw_sprite(spr_build_selected,0,g_x,g_y+build_icon_h);
		break;
	case(STATE.WAITING):
		draw_sprite(spr_build_waiting,0,g_x,g_y+build_icon_h);
		break;
	case(STATE.UPGRADING):
		draw_sprite(spr_p_bar,0,g_x,g_y+progress_h);
		draw_sprite_stretched(spr_p_filling,0,g_x+progress_w,g_y+progress_h_f,(progress/progress_max)*progress_f_size,5)
		break;
}