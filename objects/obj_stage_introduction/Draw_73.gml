draw_set_alpha(1);
xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

if count >= 60 {
	scribble_object[0] = scribble(stage_start_number)
		.starting_format("drp_shd3",make_color_rgb(255,255,255))
		.wrap(240)
		.line_spacing(16)
		.draw(xview + (8), yview + (104),typist[0])

	scribble_object[1] = scribble(stage_name)
		.starting_format(string(global.gui_font),make_color_rgb(255,255,255))
		.wrap(240)
		.line_spacing(16)
		.draw(xview + (8), yview + (152),typist[1])
}