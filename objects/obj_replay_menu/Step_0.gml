scr_get_input_menu();

delay--;
delay = clamp(delay,0,999999);

if delay <= 0 {
	if array_length(replay_list) >= 1 {
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
				scr_scroll_clamp_update(false,true,list_max_entries)
			}
		}
		else {
			cursor_moved = false;
		}
	
		if (a_button) {
			scr_one_channel_sound(snd_menuconfirm);
			scr_load_replay("replays/" + option[y_pos]);
			var inst = instance_create_depth(0,0,0,obj_replay_stage_select);
			inst.selected_replay = replay_list[y_pos];
			with(inst) { event_perform(ev_other,ev_user0) }
			instance_destroy();
		}
	}
	
	if (b_button) {
		scr_one_channel_sound(snd_menucancel);
		instance_destroy();
		scr_system_close();
		var inst = instance_create_depth(0,0,0,obj_fade_out);
		inst.target = asset_get_index(room_title);
	}
}