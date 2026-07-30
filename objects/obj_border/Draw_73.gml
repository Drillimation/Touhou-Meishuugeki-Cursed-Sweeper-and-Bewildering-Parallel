xview = camera_get_view_x(view_camera[1]);
yview = camera_get_view_y(view_camera[1]);

draw_sprite_ext(spr_border,0,xview + 0,yview + 0,1,1,0,make_color_rgb(_bri,_bri,_bri),1);

scribble_object[0] = scribble("FPS: " + string(fps))
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(640)
	.draw(xview + 640,yview + 344)

if struct_exists(global,"replay_mode") {
	if global.replay_mode == true {
		scribble_object[0] = scribble("REPLAY MODE")
			.starting_format("drp_shd",make_color_rgb(255,255,255))
			.align(fa_center,fa_top)
			.wrap(640)
			.draw(xview + 320,yview + 0)
	}
}
/*scribble_object[1] = scribble(global.replay_frame)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(xview + 0,yview + 0)
	
if instance_exists(obj_control) {
	var testarray = [obj_control.rKey,obj_control.lKey,obj_control.dKey,obj_control.uKey,obj_control.action_shoot,obj_control.action_focus,obj_control.action_bomb]
	scribble_object[2] = scribble(string(testarray))
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(640)
		.draw(xview + 0,yview + 16)
}*/