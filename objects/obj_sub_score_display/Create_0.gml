display_score = 0;
count = 0;
vspeed = -0.25;

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = x - xview;
y_pos = y - yview;

scribble_object = undefined;