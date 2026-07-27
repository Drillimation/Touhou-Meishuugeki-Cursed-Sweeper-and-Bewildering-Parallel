for(var i = 0; i < op_length_y; i++) {
	var text_color = replay_input[0].stage_played[i]
	scribble_object[i] = scribble(option[i][0])
		.starting_format("drp_shd",make_color_rgb(128 + (128 * text_color),128 + (128 * text_color),128 + (128 * text_color)))
		.align(fa_left,fa_top)
		.wrap(640)
		.draw(32,32 + (op_space * i))
	scribble_object[i + op_length_y] = scribble(option[i][1])
		.starting_format("drp_shd",make_color_rgb(128 + (128 * text_color),128 + (128 * text_color),128 + (128 * text_color)))
		.align(fa_left,fa_top)
		.wrap(640)
		.draw(48,32 + (op_space * i))
}
scribble_object[31] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)

draw_sprite(spr_menu_cursor,0,16,32 + (y_pos * op_space));

