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

	if (a_button) {
		if replay_input[0].stage_played[y_pos] != 0 {
			global.main_stats.orb_requirement = global.main_stats.stage * 1000;
			switch(y_pos) {
				case 0:	room_goto(room_transition_1); break;
				case 1:	room_goto(room_transition_2); break;
				case 2:	room_goto(room_transition_3); break;
				case 3:	room_goto(room_transition_4); break;
				case 4:	room_goto(room_transition_5); break;
				case 5:	room_goto(room_transition_6); break;
				case 6: room_goto(room_transition_7); break;
				case 7: room_goto(room_transition_8); break;
			}
		}
		else {
			sound_ObjSound_Play(se_invalid)
		}
	}
}