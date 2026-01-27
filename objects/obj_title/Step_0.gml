if count == 60 {
	scr_change_bgm("bgm/title.it");
}

if count >= 61 and count <= 179 {
	opac += 0.01;
	opac = clamp(opac,0,1);
}

if count == 180 {
	if !instance_exists(obj_title_menu) {
		instance_create_depth(0,0,0,obj_title_menu)
	}
}

if count < 240 {
	count++;	
}