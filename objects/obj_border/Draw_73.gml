xview = camera_get_view_x(view_camera[1]);
yview = camera_get_view_y(view_camera[1]);

draw_sprite_ext(spr_border,0,xview + 0,yview + 0,1,1,0,make_color_rgb(_bri,_bri,_bri),1);

scribble_object[0] = scribble("FPS: " + string(fps))
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(640)
	.draw(xview + 640,view + 344)