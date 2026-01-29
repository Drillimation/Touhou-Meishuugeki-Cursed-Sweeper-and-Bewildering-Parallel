xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

scribble_object[0] = scribble(txt)
	.starting_format(global.gui_font,make_color_rgb(255,255,255))
	.align(fa_left,fa_top)
	.wrap(240)
	.draw(xview + 8,yview + 216,typist)

scribble_object[1] = scribble(speaker)
	.starting_format(global.gui_font,make_color_rgb(255,0,0))
	.align(fa_left,fa_top)
	.wrap(240)
	.draw(xview + 8,yview + 200)