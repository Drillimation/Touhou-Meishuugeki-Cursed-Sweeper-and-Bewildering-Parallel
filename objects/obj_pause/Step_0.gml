xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);

scr_get_input_menu(_id);

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

	if (a_button) or clicked == true {
		scr_one_channel_sound(snd_menuconfirm);
		switch(_id) {
			case 0:
				switch(y_pos) {
					case 0:
						instance_destroy();
						instance_activate_all();
						fmod_channel_control_set_paused(global.bgm_channel, false);
						break;
					case 1:
						instance_destroy();
						scr_system_close();
						var xview2 = camera_get_view_x(view_camera[1]);
						var yview2 = camera_get_view_y(view_camera[1]);
						var inst = instance_create_layer(xview2 + 0,yview2 + 0,"Effects",obj_fade_out);
						inst.target = asset_get_index(room_intro);
						break;
				}
				break;
			case 1:
				switch(y_pos) {
					case 0:
						instance_destroy();
						instance_activate_all();
						fmod_channel_control_set_paused(global.bgm_channel, false);
						break;
					case 1:
						instance_destroy();
						instance_activate_all();
						array_delete(global.player_stats,1,1);
						with(obj_player) {
							if play_id == 1 { instance_destroy(); }
						}
						fmod_channel_control_set_paused(global.bgm_channel, false);
						break;
					case 2:
						instance_destroy();
						scr_system_close();
						var xview2 = camera_get_view_x(view_camera[1]);
						var yview2 = camera_get_view_y(view_camera[1]);
						var inst = instance_create_layer(xview2 + 0,yview2 + 0,"Effects",obj_fade_out);
						instance_activate_object(obj_fade_out);
						inst.target = asset_get_index(room_intro);
						break;
				}
				break;				
		}
	}
	
	if (start_button) or (b_button) {
		sound_ObjSound_Play(se_pause);
		instance_destroy();
		instance_activate_all();
		fmod_channel_control_set_paused(global.bgm_channel, false);
	}
}

if count == 1800 {
	instance_destroy();
	scr_system_close();
	var xview2 = camera_get_view_x(view_camera[1]);
	var yview2 = camera_get_view_y(view_camera[1]);
	var inst = instance_create_layer(xview2 + 0,yview2 + 0,"Effects",obj_fade_out);
	instance_activate_object(obj_fade_out);
	inst.target = asset_get_index(room_intro);
}
count++;