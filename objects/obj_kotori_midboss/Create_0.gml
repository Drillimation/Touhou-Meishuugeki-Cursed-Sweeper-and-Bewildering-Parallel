can_attack = false;
entered = false;
start_hp = 2000;
hp = start_hp;
hurt_on_collide = false;
life = 0;
max_hp = life + 1;
timer = 30;
tick = 0;
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

move_mode = false;
x_tar = x_pos;
y_tar = y_pos;
speedcap = false;
acceleration = 0.01;
maxspeed = 1;

item_drop = [spr_point_item,spr_point_item,spr_point_item,spr_point_item,spr_point_item,spr_power_item_l,spr_power_item_s,spr_power_item_s,spr_power_item_s,spr_power_item_s];
item_drop = array_shuffle(item_drop,0,array_length(item_drop))

count = 0;
count2 = 0;
face = 0;

scr_kotori_attacks();
hbar = spr_boss_health_1;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

invultime = 15;

if global.main_stats.time_of_day == "NIGHT" {
	image_blend = make_colour_rgb(255,191,191);
}