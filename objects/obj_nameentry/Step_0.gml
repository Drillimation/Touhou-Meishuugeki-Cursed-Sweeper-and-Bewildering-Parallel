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
			var newhighscore = {
				name : player_name,
				score : global.player_stats[player_index].cur_score,
				stage : global.main_stats.stage,
				char : global.player_stats[player_index].character
			}
			newhighscore.char = string_delete(newhighscore.char,0,5);
			score_grid[# 0,9] = newhighscore.name
			score_grid[# 1,9] = newhighscore.score
			score_grid[# 2,9] = newhighscore.stage
			score_grid[# 3,9] = newhighscore.char
			ds_grid_sort(score_grid,1,false);
			
			global.highscores = []
			
			for(var i = 0; i < 10; i++) {
				global.highscores[i] = {
					name : score_grid[# 0,i],
					score : score_grid[# 1,i],
					stage : score_grid[# 2,i],
					char : score_grid[# 3,i]
				}
			}
			var savedata = {
				default_table : []
			}
			array_copy(savedata.default_table,0,global.highscores,0,array_length(global.highscores))
			scr_json_save_file(savedata,"highscores.save")
			
			player_index += 1;
			if player_index > array_length(global.player_stats) - 1 {
				instance_destroy();
				ds_grid_destroy(score_grid);
				for(var i = 0; i < array_length(global.main_stats.spells_captured); i++) {
					if struct_exists(global.spellcard_statistics,global.main_stats.spells_captured[i][0]) {
						var _ss = struct_get(global.spellcard_statistics,global.main_stats.spells_captured[i][0])
						_ss.captures += global.main_stats.spells_captured[i][1]
						_ss.encounters++;
						struct_set(global.spellcard_statistics,global.main_stats.spells_captured[i][0],_ss)
					}
				}
				scr_json_save_file(global.spellcard_statistics,"spell_card_statistics.save");
				scr_system_close();
				instance_create_depth(0,0,0,obj_true_gameover);
			}
			else {
				event_perform(ev_user0,0);
			}
		}
		else {
			sound_ObjSound_Play(se_invalid);
		}
	}
}