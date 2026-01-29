if set_bounce == true and bounce_limit <= 0 {
	x = xprevious;
	y = yprevious;
	if x_pos <= global.playing_field.x1 or x_pos >= global.playing_field.x2 {
		direction = 180 - direction;
	}
	if y_pos <= global.playing_field.y1 or y_pos >= global.playing_field.y2 {
		direction = 0 - direction;
	}
	if indefinite_bounce == false {
		bounce_limit -= 1;
	}
}

if auto_delete == true {
	instance_destroy();
}