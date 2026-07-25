scr_get_input_menu();

if (rKey || uKey || lKey || dKey) {
	if cursor_moved == false {
		cursor_moved = true;
		x_pos += xaxis;
		y_pos += yaxis;

		if x_pos >= op_length_x { x_pos = 0; }
		if x_pos < 0 { x_pos = op_length_x - 1; }

		if y_pos >= op_length_y { y_pos = 0; }
		if y_pos < 0 { y_pos = op_length_y - 1; }
		scr_one_channel_sound(snd_menuselect)
	}
}
else {
	cursor_moved = false;
}

if (a_button) {
	scr_one_channel_sound(snd_menuconfirm);
	scr_change_bgm(bgm_list[y_pos]);
}

if (b_button) or escaped == true {
	scr_one_channel_sound(snd_menucancel);
	scr_change_bgm("bgm/title.it");
	instance_destroy();
	instance_create_depth(0,0,0,obj_title);
}

if (x_button) {
	scr_one_channel_sound(snd_menuconfirm);
	scr_stop_bgm();
}