scribble_object[63] = scribble(load_array.main_texts.text_final_results)
	.starting_format("drp_shd3",make_color_rgb(255,0,0))
	.align(fa_center,fa_top)
	.outline(make_color_rgb(0,0,0))
	.shadow(make_color_rgb(0,0,0),1)
	.gradient(make_color_rgb(127,0,0),1)
	.wrap(640)
	.draw(320,16)

scribble_object[62] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)
	
scribble_object[61] = scribble(load_array.difficulty_options[global.main_stats.difficulty])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(608)
	.draw(624,64)
	
scribble_object[60] = scribble(global.main_stats.continues_used)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(608)
	.draw(624,80)

scribble_object[59] = scribble(array_length(global.main_stats.spells_captured))
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_right,fa_top)
	.wrap(608)
	.draw(624,96)
	
for(var i = 0; i < array_length(left_text); i++) {
	scribble_object[i] = scribble(left_text[i])
		.starting_format("drp_shd",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(608)
		.draw(0,64 + (16 * i))
}
for(var i = 0; i < array_length(right_text); i++) {
	for(var j = 0; j < array_length(right_text[0]); j++) {
		scribble_object[9 + (i + (j * 6))] = scribble(right_text[i][j])
			.starting_format("drp_shd",make_color_rgb(255,255,255))
			.align(fa_right,fa_top)
			.wrap(608)
			.draw(512 + (i * 112),112 + (16 * j))
	}
}