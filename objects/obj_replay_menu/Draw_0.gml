if array_length(replay_list) >= 1 {
	if op_length_y < list_max_entries + 1 {
		draw_sprite(spr_menu_cursor,0,0,48 + (y_pos * op_space))
	}
	else {
		draw_sprite(spr_menu_cursor,0,0,48 + (scroll_clamp * op_space))
	}

	if array_length(description) < list_max_entries + 1 {
		_ss = array_length(description)
	}
	else {
		_ss = list_max_entries + 1;
	}
}
else {
	scribble_object[121] = scribble(load_array.errors.no_replays)
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(24,48)
}

for(var i = 0; i < _ss; i++) {
	scribble_object[i] = scribble(description[inventory_scroll[0] + i][0])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(24,(i * 32) + 48)
	scribble_object[i + _ss] = scribble(description[inventory_scroll[0] + i][1])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(192,(i * 32) + 48)
	scribble_object[i + (_ss * 2)] = scribble(description[inventory_scroll[0] + i][2])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(352,(i * 32) + 48)
	scribble_object[i + (_ss * 3)] = scribble(description[inventory_scroll[0] + i][3])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(408,(i * 32) + 48)
	scribble_object[i + (_ss * 4)] = scribble(description[inventory_scroll[0] + i][4])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(496,(i * 32) + 48)
}

scribble_object[122] = scribble(load_array.table_headers[0])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(24,32)
scribble_object[123] = scribble(load_array.table_headers[1])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(192,32)
scribble_object[124] = scribble(load_array.table_headers[2])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(352,32)
scribble_object[125] = scribble(load_array.table_headers[3])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(408,32)
scribble_object[126] = scribble(load_array.table_headers[4])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(496,32)

scribble_object[127] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)