scr_get_input_menu();

delay--;
delay = clamp(delay,0,999999);

if delay <= 0 {
	if (rKey || uKey || lKey || dKey) {
		if cursor_moved == false {
			count = 0;
			cursor_moved = true;
			x_pos += xaxis;
			y_pos += yaxis;

			if x_pos >= op_length_x { x_pos = 0; }
			if x_pos < 0 { x_pos = op_length_x - 1; }
			switch(y_pos) {
				case 0:
					option_values[0] += xaxis / 10;
					if option_values[0] > 1.0 { option_values[0] = 0; }
					if option_values[0] < 0 { option_values[0] = 1.0; }
					break;
				case 1:
					option_values[1] += xaxis / 10;
					if option_values[1] > 1.0 { option_values[1] = 0; }
					if option_values[1] < 0 { option_values[1] = 1.0; }
					break;
				case 2:
					option_values[2] += xaxis;
					if option_values[2] > 1 { option_values[2] = 0; }
					if option_values[2] < 0 { option_values[2] = 1; }
					break;
				case 3:
					option_values[3] += xaxis / 2;
					if option_values[3] > 1 { option_values[3] = 0; }
					if option_values[3] < 0 { option_values[3] = 1; }
					break;
			}

			if y_pos >= op_length_y { y_pos = 0; }
			if y_pos < 0 { y_pos = op_length_y - 1; }
			scr_one_channel_sound(snd_menuselect)
		}
	}
	else {
		cursor_moved = false;
	}

	if (a_button) or clicked == true {
		scr_one_channel_sound(snd_menuconfirm)
		global.game_options.bgm_volume = option_values[0];
		for(var i = 0; i < 12; i++) {
			fmod_sound_set_music_channel_volume(global.bgm,i,global.game_options.bgm_volume);
		}
		global.game_options.sfx_volume = option_values[1];
		audio_group_set_gain(audiogroup_default,global.game_options.sfx_volume,0);
		global.game_options.fullscreen = option_values[2];
		scr_toggle_fullscreen();
		global.game_options.border_brightness = option_values[3];
		var savedata = global.game_options;
		scr_json_save_file(savedata,"options.save");
		instance_destroy();
		instance_create_depth(656,32,0,obj_options);
	}
	
	if (b_button) {
		instance_destroy();
		instance_create_depth(656,32,0,obj_options);
	}
}