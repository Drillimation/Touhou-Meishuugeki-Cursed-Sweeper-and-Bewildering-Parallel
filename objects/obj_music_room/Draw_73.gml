draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(8,24,631,351,false);
draw_set_alpha(1);
scribble_object[0] = scribble(option[y_pos][0])
	.starting_format("drp_shd",make_color_rgb(255,0,0))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(16,32)

scribble_object[1] = scribble(option[y_pos][1])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(16,64)
	
scribble_object[15] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)