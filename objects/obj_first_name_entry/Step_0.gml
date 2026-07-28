scr_get_input_menu(player_index);

delay--;
delay = clamp(delay,0,999999);

if delay == 0 {
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
		if string_length(player_name) < 20 {
			player_name += option[y_pos][x_pos];
		}
	}
	if (b_button) {
		scr_one_channel_sound(snd_menucancel);
		player_name = string_delete(player_name, string_length(player_name), 1);
	}
	if (start_button) {
		if string_length(player_name) >= 1 {
			global.game_options.player_name = player_name;
			scr_json_save_file(global.game_options,"options.save")
			instance_destroy();
			instance_create_depth(0,0,0,obj_title)
		}
		else {
			sound_ObjSound_Play(se_invalid);
		}
	}
}