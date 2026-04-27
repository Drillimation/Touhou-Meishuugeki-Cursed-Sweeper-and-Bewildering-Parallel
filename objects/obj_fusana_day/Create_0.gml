can_attack = false;
entered = false;
start_hp = 2500;
hp = start_hp;
hurt_on_collide = false;
life = 6;
max_hp = life + 1;
timer = 40;
tick = 0;

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

scr_fusana_attacks();
hbar = spr_boss_health_7;

for(var i = 0; i < 16; i++) {
	scribble_object[i] = undefined;
}

invultime = 15;
image_blend = make_colour_rgb(255,191,191);