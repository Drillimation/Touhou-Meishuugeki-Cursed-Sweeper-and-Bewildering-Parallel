if array_length(cutscene_images) >= 1 {
	for(var i = 0; i < array_length(cutscene_images); i++) {
		draw_sprite(asset_get_index(cutscene_images[i][0]),cutscene_images[i][1],cutscene_images[i][2],cutscene_images[i][3])
	}
}

draw_set_alpha(0.5);
draw_set_color(make_color_rgb(0,0,0));
draw_rectangle(0,280,639,359,false);
draw_set_alpha(1);