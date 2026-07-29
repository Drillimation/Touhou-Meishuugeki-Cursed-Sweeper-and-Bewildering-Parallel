xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

script_execute(state);

x = xview + x_pos;
y = yview + y_pos;