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
		switch(y_pos) {
			case 0:
				instance_destroy();
				instance_activate_all();
				global.main_stats.continues_used++;
				for(var i = 0; i < array_length(global.player_stats); i++) {
					player_SetPlayerHealth(global.main_stats.max_health,i,false);
					player_SetPlayerLife(3,i,true)
					global.player_stats[i].cur_score = round((global.player_stats[i].cur_score / 2) / 10) * 10;
					with(obj_player) {
						if play_id == i {
							x_pos = global.player_stats[i].start_x;
							y_pos = global.player_stats[i].start_y;
						}
					}
				}
				break;
			case 1:
				instance_destroy();
				scr_change_bgm("bgm/ending.it");
				var xview = camera_get_view_x(view_camera[1]);
				var yview = camera_get_view_y(view_camera[1]);
				var inst = instance_create_layer(xview + 0,yview + 0,"Effects",obj_fade_out);
				inst.target = asset_get_index(room_gameover);
				break;				
		}
	}
}

if count == 600 {
	instance_destroy();
	scr_change_bgm("bgm/ending.it");
	var xview = camera_get_view_x(view_camera[1]);
	var yview = camera_get_view_y(view_camera[1]);
	var inst = instance_create_layer(xview + 0,yview + 0,"Effects",obj_fade_out);
	inst.target = asset_get_index(room_gameover);
}
count++;