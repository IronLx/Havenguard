c_x = camera_get_view_x(view_camera[0]);
c_y = camera_get_view_y(view_camera[0]);
if(paused)
{
	if (!surface_exists(paused_surface))
	{
		if(paused_surface == -1)
		{
			instance_deactivate_all(true);
		}
		paused_surface = surface_create(room_width,room_height);
		surface_set_target(paused_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
	}
	else
    {
	    draw_surface(paused_surface, c_x, c_y);
	    draw_set_alpha(0.5);
	    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	    draw_set_alpha(1);
	    draw_set_halign(fa_center);
		//center of the camera position is temporarily HARD CODED (TO BE CHANGED LATER)
	    draw_text_transformed_colour(c_x + 640, c_y + (room_height/2), "PAUSED", 2, 2, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
	    draw_set_halign(fa_left);
	}
}