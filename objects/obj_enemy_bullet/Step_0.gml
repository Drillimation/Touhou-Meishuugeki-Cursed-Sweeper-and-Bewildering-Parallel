scr_danmaku_sprites();

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

script_execute(state);

x = xview + x_pos;
y = yview + y_pos;

depth = -y;

//Damage Delay
if damage_delay >= 1 {
	damage_delay--;
}
else {
	damage_delay = 0;
}

//Gravity
if grav > 0 {
	vspd += lengthdir_y(grav,270);
	dir = point_direction(0,0,hspd,vspd);
	spd = point_distance(0,0,hspd,vspd);
}

//Task Functionality
if set_function != undefined {
	script_execute_ext(set_function);
}

//Direction Manipulation
dir += angular_velocity;
spd += acceleration;
if speedcap == true { spd = clamp(spd,0,maxspeed); }
if jitter == true {
	if count mod jitter_speed == 0 {
		dir += choose(jitter_direction,-jitter_direction);
		count = 0;
	}
}

if autohome == true {
	if instance_exists(my_target) {
		if point_in_rectangle(my_target.x,my_target.y,xview + global.playing_field.x1,yview + global.playing_field.y1,xview + global.playing_field.x2,yview +  + global.playing_field.y2) {
			set_target = true;
			dir = point_direction(x,y,my_target.x,my_target.y);
		}
		else {
			my_target = noone;
			set_target = false;
		}
	}
	if my_target == noone {
		var inst = collision_rectangle(xview + global.playing_field.x1,yview + global.playing_field.y1,xview + global.playing_field.x2,yview +  + global.playing_field.y2,enemy_target,false,true);
		if inst != noone and inst.entered == true {
			my_target = inst;
			set_target = true;
			dir = point_direction(x,y,inst.x,inst.y);
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

//Other
count++