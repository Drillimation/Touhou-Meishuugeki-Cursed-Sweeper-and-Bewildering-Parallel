xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

scribble_object[0] = scribble("STAGE " + string(global.main_stats.stage) + " CLEARED!")
	.starting_format("drp_shd3",make_color_rgb(192,0,0))
	.align(fa_center,fa_top)
	.outline(make_color_rgb(0,0,0))
	.shadow(make_color_rgb(0,0,0),1)
	.gradient(make_color_rgb(64,0,0),1)
	.wrap(640)
	.draw(xview + 128,yview + 16)

var sprite_font = font_add_sprite(spr_font,32,false,0);
draw_set_color(make_color_rgb(255,255,255));
draw_set_halign(fa_left);
for(var i = 0; i < array_length(bonuses[0]); i++) {
	draw_text(xview + 8,(yview + 56) + (16 * i),bonuses[0][i])
}
draw_set_color(make_color_rgb(255,255,255));
draw_set_halign(fa_right);
for(var i = 0; i < array_length(global.player_stats); i++) {
	for(var j = 0; j < array_length(bonuses[i + 1]); j++) {
		draw_text((xview + 176) + (72 * i),(yview + 64) + (16 * j),bonuses[i + 1][j])
	}
}