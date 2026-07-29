dir = 270;
spd = 0.5;
hspd = 0;
vspd = 0;
len = 0;
dir = 0;
state = scr_move_state_enemy;
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