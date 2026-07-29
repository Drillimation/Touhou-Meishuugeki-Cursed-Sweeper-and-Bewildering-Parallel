camera_set_view_pos(view_camera[0], x - (view_wport[0] / 2), y - (view_hport[0] / 2));
camera_set_view_pos(view_camera[1], x - (view_wport[1] / 2), y - (view_hport[1] / 2));

if path_position < 1 {
	path_position += increment_amount;
	x = path_get_x(camera_path,path_position);
	y = path_get_y(camera_path,path_position);
}
else {
	path_position = 1;
	event_perform(ev_other,ev_user0);
}