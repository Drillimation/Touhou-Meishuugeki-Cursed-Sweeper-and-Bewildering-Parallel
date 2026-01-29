//Initialize
play_id = 0;
normal_speed = 2;
focus_speed = 1.5;
spd = normal_speed;
hspd = 0;
vspd = 0;
len = 0;
dir = 0;
state = scr_move_state;

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = global.player_stats[play_id].start_x;
y_pos = global.player_stats[play_id].start_y;
clip_x1 = global.playing_field.x1 + 4;
clip_y1 = global.playing_field.y1 + 20;
clip_x2 = global.playing_field.x2 - 4;
clip_y2 = global.playing_field.y2 - 20;
itemcollectline = 80;

invultime = 0;
respawn_time = 60;
deathbomb_time = 15;

can_shoot = true;
can_bomb = true;

player_state = "STATE_NORMAL";

count = 0;
count2 = 0;
reload = 0;
replay_frame = 0;
turret_pos = 0;

scr_character_sprites();