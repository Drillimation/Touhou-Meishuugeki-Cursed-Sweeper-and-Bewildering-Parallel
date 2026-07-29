scr_item_sprites();

script_execute(state);

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

x = xview + x_pos;
y = yview + y_pos;

if move_mode == true {
	if point_distance(x_pos,y_pos,x_tar,y_tar) >= spd {
		//dir = point_direction(x_pos,y_pos,x_tar,y_tar);
		spd += acceleration;
	}
	else {
		dir = 270;
		spd = 1.5;
		move_mode = false;
	}
}
else {
	dir = 270;
	spd = 1.5;
}
