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
		var inst;
		switch(y_pos) {
			case 0:
				instance_destroy();
				global.freeplaymode = false;
				inst = instance_create_depth(0,0,0,obj_fade_out);
				inst.target = asset_get_index(room_setup);
				break;
			case 1:
				instance_destroy();
				global.freeplaymode = true;
				inst = instance_create_depth(0,0,0,obj_fade_out);
				inst.target = asset_get_index(room_setup);
				break;
			case 2: 
				sound_ObjSound_Play(se_invalid); 
				/*global.replay_mode = true;
				var inst = instance_create_depth(0,0,0,obj_fade_out);
				inst.target = asset_get_index(room_replay_menu);*/ 
				break;
			case 3: url_open_ext("https://github.com/Drillimation/Touhou-Meishuugeki-Cursed-Sweeper-and-Bewildering-Parallel/", "_blank"); break;
			case 4: url_open_ext("https://drillipedia.fandom.com/", "_blank"); break;
			case 5: 
				instance_destroy();
				inst = instance_create_depth(0,0,0,obj_fade_out);
				inst.target = asset_get_index(room_options);
				break;
			case 6: game_end(); break;
		}
	}
}

if count == 1800 {
	scr_stop_bgm();
	room_goto(room_intro);
}
count++