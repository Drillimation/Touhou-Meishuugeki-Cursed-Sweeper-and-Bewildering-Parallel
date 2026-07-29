scr_stop_bgm();
xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = x - xview;
y_pos = y - yview;
spd = 0;
hspd = 0;
vspd = 0;
len = 0;
dir = 0;
state = scr_move_state_enemy;

index_sprite = undefined;

count = 0;
count2 = 0;