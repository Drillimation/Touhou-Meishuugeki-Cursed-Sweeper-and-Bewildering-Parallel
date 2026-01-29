depth = -y;
direction += angular_velocity;

if delay == 0 {
	sound_ObjSound_Play(se_lazer00);
	var inst = shot_CreateLooseLaserA1(x,y,0,direction,image_xscale,image_yscale,sprite_index,5,image_index);
	inst.frame_delete = true;
	inst.deletetime = deletetime;
	instance_destroy();
}
delay--;