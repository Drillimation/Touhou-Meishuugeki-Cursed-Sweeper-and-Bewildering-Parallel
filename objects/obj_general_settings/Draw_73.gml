for(var i = 0; i < op_length_y; i++) {
	scribble_object[i] = scribble(option[i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(640)
		.draw(32,32 + (op_space * i))
}

scribble_object[4] = scribble(option_values[0] * 10)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(320,32)

scribble_object[5] = scribble(option_values[1] * 10)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(320,48)

scribble_object[6] = scribble(fullscreen_options[option_values[2]])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(320,64)

scribble_object[7] = scribble(brightness_options[option_values[3] * 2])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(320,80)

scribble_object[14] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)

scribble_object[15] = scribble(description[y_pos])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(640)
	.draw(0,304)

draw_sprite(spr_menu_cursor,0,16,32 + (y_pos * op_space));