scr_get_input_menu();

hspeed = -16;
x = clamp(x,32,640);

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

	if x <= 32 {
		if (a_button) {
			scr_one_channel_sound(snd_menuconfirm);
			instance_destroy();
			scr_stop_bgm();
			global.main_stats.stage = y_pos + 1;
			global.main_stats.orb_requirement = global.main_stats.stage * 1000;
			switch(y_pos) {
				case 0: room_goto(room_transition_1); break;
				case 1:
					for(var i = 0; i < array_length(global.player_stats); i++) {
						player_SetPlayerPower(100,i);
					}
					room_goto(room_transition_2); 
					break;
				case 2:
					for(var i = 0; i < array_length(global.player_stats); i++) {
						player_SetPlayerPower(100,i);
					}
					room_goto(room_transition_3); 
					break;
			}
		}
		if (b_button) {
			scr_one_channel_sound(snd_menucancel);
			instance_destroy();
			instance_create_depth(656,32,0,obj_character_select);
		}
		if keyboard_check_pressed(vk_f1) {
			instance_destroy();
			scr_stop_bgm();
			//var inst = instance_create_depth(0,0,0,obj_fade_out);
			//inst.target = asset_get_index(room_transition_1);
			room_goto(room_debug);
		}
		if count == 1800 {
			instance_destroy();
			var inst = instance_create_depth(0,0,0,obj_fade_out);
			inst.target = asset_get_index(room_title);
		}
		if os_get_config() == "kiosk" { count++ }
	}
}