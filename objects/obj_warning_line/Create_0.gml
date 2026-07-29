delay = 120;
deletetime = 120;
angular_velocity = 0;
image_speed = 0;
spd = 0;
hspd = 0;
vspd = 0;
len = 0;
dir = 0;
state = scr_move_state_enemy;

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = x - xview;
y_pos = y - yview;