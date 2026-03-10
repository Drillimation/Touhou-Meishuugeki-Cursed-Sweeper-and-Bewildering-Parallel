scr_item_sprites();

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

x = xview + x_pos;
y = yview + y_pos;

x_pos += hspeed;
y_pos += vspeed;

if move_mode == true {
	if point_distance(x_pos,y_pos,x_tar,y_tar) >= speed {
		//direction = point_direction(x_pos,y_pos,x_tar,y_tar);
		speed = 2;
	}
	else {
		direction = 270;
		speed = 1.5;
		move_mode = false;
	}
}
