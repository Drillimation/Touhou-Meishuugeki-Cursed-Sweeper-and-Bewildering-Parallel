//speed = 4;
play_id = 0;

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = x - xview;
y_pos = y - yview;

//Options
damage_delay = 0;
angular_velocity = 0;
acceleration = 0;
frame_delete = false;
fade_delete = 0;
delete_time = 60;
speedcap = false;
maxspeed = 1;
item_resist = false;
auto_delete = true;
set_bounce = false;
indefinite_bounce = false;
bounce_limit = 1;
actual_damage = 5;
erase_other_danmaku = false;
penetration = 1;
autohome = false;
enemy_target = -1;
set_function = undefined;

count = 0;
jitter = false;
jitter_speed = 0;
jitter_direction = 0;

scr_danmaku_sprites();