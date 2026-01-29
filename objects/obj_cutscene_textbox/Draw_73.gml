xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

if array_length(cutscene_images) >= 1 {
	for(var i = 0; i < array_length(cutscene_images); i++) {
		draw_sprite(asset_get_index(cutscene_images[i][0]),cutscene_images[i][1],xview + cutscene_images[i][2],yview + cutscene_images[i][3])
	}
}

draw_sprite_stretched(spr_textbox,0,xview + 0,yview + 192,256,80);

if name_reveal == true {
	scribble_object[0] = scribble(actual_name)
		.starting_format("drp_shd5",make_color_rgb(255,255,255))
		.blend(make_color_rgb(255,255,255),opac)
		.align(fa_center, fa_top)
		.wrap(128)
		.line_spacing(8)
		.draw(xview + 192, yview + 160)
}