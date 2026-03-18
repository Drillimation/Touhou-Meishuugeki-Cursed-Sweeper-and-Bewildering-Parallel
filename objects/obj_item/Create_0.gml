direction = 270;
speed = 0.5;
move_mode = false;
score_value = 0;
auto_collect = false;
acceleration = 0;

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = x - xview;
y_pos = y - yview;

x_tar = x_pos;
y_tar = y_pos - 16;