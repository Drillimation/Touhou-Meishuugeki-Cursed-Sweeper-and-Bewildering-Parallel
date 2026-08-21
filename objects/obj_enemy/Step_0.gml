depth = -y;
xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

if point_in_rectangle(x,y,xview + global.playing_field.x1,yview + global.playing_field.y1,xview + global.playing_field.x2,yview + global.playing_field.y2) {
	if entered == false {
		x_pos = x - xview;
		y_pos = y - yview;
		entered = true;
	}
	can_attack = true;
}

if entered == true {
	script_execute(state);
	
	x = xview + x_pos;
	y = yview + y_pos;
	
	if move_mode == true {
		if point_distance(x_pos,y_pos,x_tar,y_tar) >= spd {
			//dir = point_distance(x_pos,y_pos,x_tar,y_tar);
			spd += acceleration;
			if speedcap == true { spd = clamp(spd,0,maxspeed); }
		}
		else {
			spd = 0;
			move_mode = false;
		}
	}
	invultime--;
	invultime = clamp(invultime,0,9999);
}