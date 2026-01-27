for(var i = 0; i < array_length(description); i++) {
	scribble_object[i] = scribble(description[i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_center,fa_top)
		.wrap(608)
		.draw(320,104 + (32 * i))
}

scribble_object[14] = scribble(header)
	.starting_format("drp_shd2",make_color_rgb(255,255,255))
	.align(fa_center,fa_top)
	.outline(make_color_rgb(0,0,0))
	.shadow(make_color_rgb(0,0,0),1)
	.gradient(make_color_rgb(127,127,255),1)
	.wrap(640)
	.draw(320,64)
	
scribble_object[15] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)