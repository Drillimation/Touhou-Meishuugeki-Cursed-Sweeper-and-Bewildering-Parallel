xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

x = xview + x_pos;
y = yview + y_pos;

x_pos += hspeed;
y_pos += vspeed;

if count == 300 {
	instance_destroy();
}

count++;
count2++;