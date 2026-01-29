if count mod 20 == 0 {
	image_index = (face * 4)
	count = 0;
}
else {
	image_index = (face * 4) + floor(count / 5);
}

if image_alpha == 1 {
	instance_destroy();
	instance_create_layer(x,y,"Instances",midboss)
}
else {
	image_alpha += 0.01;
	image_alpha = clamp(image_alpha,0,1);
}