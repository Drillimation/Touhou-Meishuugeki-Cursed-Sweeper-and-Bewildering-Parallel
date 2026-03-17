for(var i = 0; i < array_length(option); i++) {
	for(var j = 0; j < array_length(option[0]); j++) {
	scribble_object[i][j] = scribble(option[i][j])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(176)
		.draw((216 + (op_space * j)) + 4,64 + (op_space * i))
	}
}

for(var i = 0; i < 10; i++) {
	scribble_object[5][i] = scribble(string(i + 1))
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(176)
		.draw(24,184 + (op_space * i))
	
	scribble_object[6][i] = scribble(score_grid[# 0,i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(176)
		.draw(40,184 + (op_space * i))
	
	scribble_object[7][i] = scribble(score_grid[# 1,i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(176)
		.draw(272,184 + (op_space * i))
		
	scribble_object[8][i] = scribble(score_grid[# 2,i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(176)
		.draw(312,184 + (op_space * i))
	
	scribble_object[9][i] = scribble(score_grid[# 3,i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(176)
		.draw(344,184 + (op_space * i))
}

scribble_object[31][29] = scribble(option[y_pos][x_pos])
	.starting_format("drp_shd",make_color_rgb(255,0,0))
	.align(fa_left,fa_top)
	.wrap(176)
	.draw((216 + (op_space * x_pos)) + 4,64 + (op_space * y_pos))

scribble_object[31][31] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)

scribble_object[31][30] = scribble(player_name)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_center,fa_top)
	.wrap(608)
	.draw(320,32)