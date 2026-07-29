scr_danmaku_sprites();

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

script_execute(state);

x = xview + x_pos;
y = yview + y_pos;

depth = 5000 - y;

//Damage Delay
if damage_delay >= 1 {
	damage_delay--;
}
else {
	damage_delay = 0;
}

//Gravity
if grav > 0 {
	vspd += grav;
}

//Task Functionality
if set_function != undefined {
	script_execute_ext(set_function);
}

//Direction Manipulation
dir += angular_velocity;
spd += acceleration;
if speedcap == true { spd = clamp(speed,0,maxspeed); }
if jitter == true {
	if count mod jitter_speed == 0 {
		dir += choose(jitter_direction,-jitter_direction);
		count = 0;
	}
	count++
}

if autohome == true {
	if collision_rectangle(xview + global.playing_field.x1,yview + global.playing_field.y1,xview + global.playing_field.x2,yview +  + global.playing_field.y2,enemy_target,false,true) {
		if instance_exists(enemy_target) {
			var ex = instance_nearest(x,y,enemy_target).x;
			var ey = instance_nearest(x,y,enemy_target).y;
			dir = point_direction(x,y,ex,ey);
		}
	}
}

//Deletion
if frame_delete == true {
	if delete_time == 0 { instance_destroy(); }
	delete_time--;
}
image_alpha += fade_delete;
if image_alpha <= 0 { instance_destroy(); }

if penetration <= 0 { instance_destroy(); }