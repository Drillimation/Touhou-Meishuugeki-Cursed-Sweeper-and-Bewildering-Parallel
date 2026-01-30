if view_camera[1] == -1 {
	xview = camera_get_view_x(view_camera[0]);
	yview = camera_get_view_y(view_camera[0]);
	_sequence = layer_sequence_create("Fade",xview + 0,yview + 0,sequence_fade_in);
}
else {
	xview = camera_get_view_x(view_camera[1]);
	yview = camera_get_view_y(view_camera[1]);
	_sequence = layer_sequence_create("Fade",xview + 0,yview + 0,sequence_fade_in);
}
with(obj_fade_out) {
	instance_destroy();
}