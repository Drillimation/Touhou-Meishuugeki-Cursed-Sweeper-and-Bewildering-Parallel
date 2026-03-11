for(var i = 0; i < op_length_y; i++) {
	scribble_object[i] = scribble(option[i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(640)
		.draw(32,32 + (op_space * i))
}
scribble_object[13] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)

scribble_object[14] = scribble(description[y_pos])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(0,304)

draw_sprite(spr_menu_cursor,0,16,32 + (y_pos * op_space));

scribble_object[15] = scribble(copyr_notice)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(0,320)