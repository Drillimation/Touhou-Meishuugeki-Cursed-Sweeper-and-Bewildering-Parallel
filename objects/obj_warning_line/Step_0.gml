xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

x = xview + x_pos;
y = yview + y_pos;

x_pos += hspeed;
y_pos += vspeed;

depth = 5000 - y;
direction += angular_velocity;
image_angle = direction;

if delay == 0 {
	sound_ObjSound_Play(se_lazer00);
	var inst = shot_CreateLooseLaserA1(x,y,0,direction,image_xscale,image_yscale,sprite_index,5,image_index);
	inst.frame_delete = true;
	inst.deletetime = deletetime;
	instance_destroy();
}
delay--;