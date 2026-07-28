for(var i = 0; i < op_length_y; i++) {
	draw_sprite(spr_menu_bar_option,0,x,y + (24 + (i * op_space)));
}	
draw_sprite(spr_menu_bar_option,1,x,y + (24 + (y_pos * op_space)));
for(var i = 0; i < op_length_y; i++) {
	scribble_object[i] = scribble(option[i])
		.starting_format("drp_shd2",make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.outline(make_color_rgb(0,0,0))
		.shadow(make_color_rgb(0,0,0),1)
		.gradient(make_color_rgb(127,127,255),1)
		.wrap(640)
		.draw(x,y + (op_space * i))
}
scribble_object[15] = scribble(description[y_pos])
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(16,296)
	
scribble_object[14] = scribble(prompt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(608)
	.draw(0,0)