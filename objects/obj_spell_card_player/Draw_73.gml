xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
	
draw_sprite(spr_player_spell_banner,0,xview + x_pos,yview + 256);
scribble_object[0] = scribble(attack_name)
	.starting_format("drp_shd5",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(240)
	.line_spacing(16)
	.draw(xview + x_pos,yview + 256)