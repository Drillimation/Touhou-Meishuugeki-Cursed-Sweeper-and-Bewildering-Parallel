draw_y -= 2;
draw_y = clamp(draw_y,-144,144);

x_pos += 8;
x_pos = clamp(x_pos,-256,8);

if count == 0 {
	instance_destroy();
}
count--;