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
		if (a_button) or clicked == true {
			scr_one_channel_sound(snd_menuconfirm);
			switch(y_pos) {
				case 0: 
					global.main_stats.stage = 1; 
					global.main_stats.time_of_day = "DAY";
					break;
				case 1: 
					global.main_stats.stage = 7;
					for(var i = 0; i < array_length(global.player_stats); i++) {
						player_SetPlayerPower(100,i);
					}
					break;
			}
			instance_destroy();
			instance_create_depth(656,32,0,obj_difficulty_select)
		}
		
		if (b_button) or count == 1800 {
			scr_one_channel_sound(snd_menucancel);
			instance_destroy();
			instance_create_depth(656,32,0,obj_mode_select);
		}
		
		if os_get_config() == "kiosk" { count++ }
	}
}