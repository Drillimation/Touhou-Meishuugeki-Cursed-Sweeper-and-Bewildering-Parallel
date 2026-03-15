if op_length_y < list_max_entries + 1 {
	draw_sprite(spr_menu_cursor,0,0,48 + (y_pos * op_space))
}
else {
	draw_sprite(spr_menu_cursor,0,0,48 + (scroll_clamp * op_space))
}

if array_length(option) < list_max_entries + 1 {
	_ss = array_length(option)
}
else {
	_ss = list_max_entries + 1;
}

for(var i = 0; i < _ss; i++) {
	scribble_object[i] = scribble(option[inventory_scroll[0] + i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(16,(i * 32) + 48)
		
	scribble_object[i + _ss] = scribble(description[inventory_scroll[0] + i].encounters)
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(608)
		.draw(400,(i * 32) + 64)
		
	scribble_object[i + (_ss * 2)] = scribble(description[inventory_scroll[0] + i].captures)
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(608)
		.draw(512,(i * 32) + 64)
		
	var inst;
	if is_nan(round(description[inventory_scroll[0] + i].encounters / description[inventory_scroll[0] + i].captures)) {
		inst = 0;
	}
	else {
		inst = round(description[inventory_scroll[0] + i].encounters / description[inventory_scroll[0] + i].captures);
	}
	scribble_object[i + (_ss * 3)] = scribble(string(inst) + "%")
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_right,fa_top)
		.wrap(608)
		.draw(624,(i * 32) + 64)
}

scribble_object[60] = scribble(load_array.statistics_headers.encountered)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(608)
	.draw(400,32)
	
scribble_object[61] = scribble(load_array.statistics_headers.captured)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(608)
	.draw(512,32)
	
scribble_object[62] = scribble(load_array.statistics_headers.success_rate)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(608)
	.draw(624,32)

scribble_object[63] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)