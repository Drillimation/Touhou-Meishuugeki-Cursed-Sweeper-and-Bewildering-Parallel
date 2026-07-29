xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

script_execute(state);

x = xview + x_pos;
y = yview + y_pos;

depth = 5000 - y;
dir += angular_velocity;
image_angle = dir;

if delay == 0 {
	sound_ObjSound_Play(se_lazer00);
	var inst = shot_CreateLooseLaserA1(x,y,0,dir,image_xscale,image_yscale,sprite_index,5,image_index);
	inst.frame_delete = true;
	inst.deletetime = deletetime;
	instance_destroy();
}
delay--;