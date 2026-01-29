function scr_move_state(){
	//Direction
	dir = point_direction(0,0,xaxis,yaxis);
	
	//Length
	if (xaxis == 0) and (yaxis == 0) {
		len = 0;
	}
	else {
		len = spd;
	}
	
	//Get the speed variables
	hspd = lengthdir_x(len,dir);
	vspd = lengthdir_y(len,dir);
	
	x_pos += hspd;
	y_pos += vspd;
	
	x_pos = clamp(x_pos,clip_x1,clip_x2)
	y_pos = clamp(y_pos,clip_y1,clip_y2)
	
	//Sprites
	switch(xaxis) {
		case -1: face = 0; break;
		case 0: face = 1; break;
		case 1: face = 2; break;
	}
	
	if count mod 20 == 0 {
		image_index = (face * 4)
		count = 0;
	}
	else {
		image_index = (face * 4) + floor(count / 5);
	}
	count++;
}