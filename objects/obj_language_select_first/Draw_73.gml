for(var i = 0; i < op_length_y; i++) {
	scribble_object[i] = scribble(option[i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(640)
		.draw(32,48 + (op_space * i))
}
scribble_object[15] = scribble(description[y_pos])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(16,16)

draw_sprite(spr_menu_cursor,0,16,48 + (y_pos * op_space));