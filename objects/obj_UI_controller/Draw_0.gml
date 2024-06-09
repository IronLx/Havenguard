// obj_ui Draw event

// Get the camera position
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// Define the UI position relative to the camera
var x_pos = cam_x + 10;
var y_pos = cam_y + 10;
var spacing = 20;

draw_set_color(c_white);
draw_text(x_pos, y_pos, "Resources:");

// Draw each resource
draw_text(x_pos, y_pos + spacing * 1, "Wood: " + string(global.resources[RESOURCE.WOOD]));

// Add more resources here as needed
