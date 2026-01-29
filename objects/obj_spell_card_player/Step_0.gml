draw_y -= 2;
draw_y = clamp(draw_y,-144,144);

if count == 0 {
	instance_destroy();
}
count--;