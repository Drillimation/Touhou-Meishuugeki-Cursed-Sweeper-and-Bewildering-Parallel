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

	x = xview + x_pos;
	y = yview + y_pos;

	x_pos += hspeed;
	y_pos += vspeed;
	
	if move_mode == true {
		if point_distance(x_pos,y_pos,x_tar,y_tar) >= 1 {
			//direction = point_distance(x_pos,y_pos,x_tar,y_tar);
			speed += acceleration;
			if speedcap == true { speed = clamp(speed,0,maxspeed); }
		}
		else {
			speed = 0;
			move_mode = false;
		}
	}
	invultime--;
	invultime = clamp(invultime,0,9999);
}