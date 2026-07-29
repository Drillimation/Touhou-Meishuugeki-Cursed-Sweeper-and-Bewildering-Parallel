//scr_create_camera("STAGE_01_DAY")

xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

camera_path = undefined;
path_position = 0;
path_speed = 0;
stage_speed = 1;

//path_length = path_get_length(camera_path);
//increment_amount = stage_speed / path_length;