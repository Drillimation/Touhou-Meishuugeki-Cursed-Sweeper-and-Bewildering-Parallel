draw_set_alpha(1);
scribble_object[0] = scribble(txt)
	.starting_format("drp_shd",make_color_rgb(255,255,255))
	.wrap(624)
	.line_spacing(16)
	.draw(x, y)

if y < -360 - (crd_hgt) {
	instance_destroy();
	var inst = instance_create_depth(0,0,0,obj_fade_out);
	inst.target = room_gameover;
}