can_attack = false;
entered = false;
hp = 5;
hurt_on_collide = true;

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
x_pos = x - xview;
y_pos = y - yview;

move_mode = false;
x_tar = x_pos;
y_tar = y_pos;
speedcap = false;
acceleration = 0;
maxspeed = 1;

item_drop = [spr_point_item,spr_power_item_l,spr_power_item_s];
item_drop = array_shuffle(item_drop)

count = 0;
count2 = 0;
face = 0;

invultime = 15;