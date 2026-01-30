xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

draw_sprite_stretched(spr_textbox,0,xview + 0,yview + 16,256,256);
draw_sprite(spr_menu_cursor,0,xview + 8,(yview + 96) + (16 * y_pos))
scribble_object[14] = scribble(title_bar)
	.starting_format("drp_shd3",make_color_rgb(192,0,0))
	.align(fa_center,fa_top)
	.outline(make_color_rgb(0,0,0))
	.shadow(make_color_rgb(0,0,0),1)
	.gradient(make_color_rgb(64,0,0),1)
	.wrap(640)
	.draw(xview + 128,yview + 24)

scribble_object[4] = scribble(pause_desc)
	.starting_format(global.gui_font,make_color_rgb(255,255,255))
	.align(fa_center,fa_top)
	.wrap(240)
	.draw(xview + 128,yview + 64)

for(var i = 0; i < array_length(option); i++) {
	scribble_object[i] = scribble(option[i])
		.starting_format(global.gui_font,make_color_rgb(255,255,255))
		.align(fa_left,fa_top)
		.wrap(240)
		.draw(xview + 24,(yview + 96) + (16 * i))
}
scribble_object[3] = scribble(description[y_pos])
	.starting_format(global.gui_font,make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(240)
	.draw(xview + 8,yview + 200)