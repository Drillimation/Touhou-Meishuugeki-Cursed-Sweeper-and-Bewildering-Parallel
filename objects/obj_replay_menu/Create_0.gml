//Gather .rpy files
replay_list = [];
var load_replays = [];
if directory_exists("/replays") {
	var _file_name = file_find_first("/replays/*.rpy", fa_none);

	while (_file_name != "") {
		array_push(load_replays,_file_name);
		show_debug_message(_file_name)
		_file_name = file_find_next()
	}
	file_find_close();
}
else {
	show_debug_message("Directory not found.")
}

//Replay check
if array_length(load_replays) >= 1 {
	for(var i = 0; i < array_length(load_replays); i++) {
		var replay_to_check = scr_json_load_file("replays/" + load_replays[i]);
		//Main struct check
		if !struct_exists(replay_to_check,"replay_info") or !is_struct(replay_to_check.replay_info) { show_debug_message("\"replay_info\" not found."); continue; }
		if !struct_exists(replay_to_check,"playing_field") or !is_struct(replay_to_check.playing_field) { show_debug_message("\"playing_field\" not found."); continue; }
		if !struct_exists(replay_to_check,"main_stats") or !is_struct(replay_to_check.main_stats) { show_debug_message("\"main_stats\" not found."); continue; }
		if !struct_exists(replay_to_check,"replay_input") or !is_array(replay_to_check.replay_input) { show_debug_message("\"replay_input\" not found."); continue; }
		//Replay info check
		if !struct_exists(replay_to_check.replay_info,"free_play") or !is_real(replay_to_check.replay_info.free_play) { show_debug_message("\"free_play\" not found."); continue; }
		if !struct_exists(replay_to_check.replay_info,"player_name") or !is_string(replay_to_check.replay_info.player_name) { show_debug_message("\"free_play\" not found."); continue; }
		if !struct_exists(replay_to_check.replay_info,"save_date") or !is_string(replay_to_check.replay_info.save_date) { show_debug_message("\"free_play\" not found."); continue; }
		if !struct_exists(replay_to_check.replay_info,"version") or !is_string(replay_to_check.replay_info.version) { show_debug_message("\"free_play\" not found."); continue; }
		if replay_to_check.replay_info.version != global.game_version { show_debug_message("Version does not match.") continue }
		//Playing field check
		if !struct_exists(replay_to_check.playing_field,"x1") or !is_numeric(replay_to_check.playing_field.x1) { show_debug_message("\"x1\" not found."); continue; }
		if !struct_exists(replay_to_check.playing_field,"y1") or !is_numeric(replay_to_check.playing_field.y1) { show_debug_message("\"y1\" not found."); continue; }
		if !struct_exists(replay_to_check.playing_field,"x2") or !is_numeric(replay_to_check.playing_field.x2) { show_debug_message("\"x2\" not found."); continue; }
		if !struct_exists(replay_to_check.playing_field,"y2") or !is_numeric(replay_to_check.playing_field.y2) { show_debug_message("\"y2\" not found."); continue; }
		if !struct_exists(replay_to_check.playing_field,"minrpriority") or !is_numeric(replay_to_check.playing_field.minrpriority) { show_debug_message("\"minrpriority\" not found."); continue; }
		if !struct_exists(replay_to_check.playing_field,"maxrpriority") or !is_numeric(replay_to_check.playing_field.maxrpriority) { show_debug_message("\"maxrpriority\" not found."); continue; }
		if !struct_exists(replay_to_check.playing_field,"camera_priority") or !is_numeric(replay_to_check.playing_field.camera_priority) { show_debug_message("\"camera_priority\" not found."); continue; }
		if !struct_exists(replay_to_check.playing_field,"random_seed") or !is_numeric(replay_to_check.playing_field.random_seed) { show_debug_message("\"random_seed\" not found."); continue; }
		//Main stats check
		if !struct_exists(replay_to_check.main_stats,"difficulty") or !is_numeric(replay_to_check.main_stats.difficulty) { show_debug_message("\"difficulty\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"stage") or !is_numeric(replay_to_check.main_stats.stage) { show_debug_message("\"stage\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"continues_used") or !is_numeric(replay_to_check.main_stats.continues_used) { show_debug_message("\"continues_used\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"spells_captured") or !is_array(replay_to_check.main_stats.spells_captured) { show_debug_message("\"spells_captured\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"max_health") or !is_numeric(replay_to_check.main_stats.max_health) { show_debug_message("\"max_health\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"time_orbs") or !is_numeric(replay_to_check.main_stats.time_orbs) { show_debug_message("\"time_orbs\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"orb_requirement") or !is_numeric(replay_to_check.main_stats.orb_requirement) { show_debug_message("\"orb_requirement\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"hours_passed") or !is_numeric(replay_to_check.main_stats.hours_passed) { show_debug_message("\"hours_passed\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"time_of_day") or !is_string(replay_to_check.main_stats.time_of_day) { show_debug_message("\"time_of_day\" not found."); continue; }
		if !struct_exists(replay_to_check.main_stats,"current_spell") or !is_string(replay_to_check.main_stats.current_spell) { show_debug_message("\"current_spell\" not found."); continue; }
		//Replay inputs stats
		var multi_check = true;
		for(var j = 0; j < array_length(replay_to_check.replay_input); j++) {
			if !struct_exists(replay_to_check.replay_input[j],"replay_stage") or !is_array(replay_to_check.replay_input[j].replay_stage) { show_debug_message("\"replay_stage\" not found."); multi_check = false; }
			if !struct_exists(replay_to_check.replay_input[j],"replay_score") or !is_array(replay_to_check.replay_input[j].replay_score) { show_debug_message("\"replay_score\" not found."); multi_check = false; }
			if !struct_exists(replay_to_check.replay_input[j],"stage_played") or !is_array(replay_to_check.replay_input[j].stage_played) { show_debug_message("\"stage_played\" not found."); multi_check = false; }
			var stages_played = 0;
			for (var m = 0; m < 8; m++) {
				if struct_names_count(replay_to_check.replay_input[j].replay_score[m]) != 0 {
					stages_played++;
				}
			}
			for(var k = 0; k < stages_played; k++) {
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"character") or !is_string(replay_to_check.replay_input[j].replay_score[k].character) { show_debug_message("\"character\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_score") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_score) { show_debug_message("\"cur_score\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_lives") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_lives) { show_debug_message("\"cur_lives\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_health") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_health) { show_debug_message("\"cur_health\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_bombs") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_bombs) { show_debug_message("\"cur_bombs\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"graze") or !is_real(replay_to_check.replay_input[j].replay_score[k].graze) { show_debug_message("\"graze\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"point_items") or !is_real(replay_to_check.replay_input[j].replay_score[k].point_items) { show_debug_message("\"point_items\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"power_items") or !is_real(replay_to_check.replay_input[j].replay_score[k].power_items) { show_debug_message("\"power_items\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"rpriority") or !is_real(replay_to_check.replay_input[j].replay_score[k].rpriority) { show_debug_message("\"rpriority\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"deaths") or !is_real(replay_to_check.replay_input[j].replay_score[k].deaths) { show_debug_message("\"deaths\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"bombs_used") or !is_real(replay_to_check.replay_input[j].replay_score[k].bombs_used) { show_debug_message("\"bombs_used\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"point_collected") or !is_real(replay_to_check.replay_input[j].replay_score[k].point_collected) { show_debug_message("\"point_collected\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"power_collected") or !is_real(replay_to_check.replay_input[j].replay_score[k].power_collected) { show_debug_message("\"power_collected\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"start_x") or !is_real(replay_to_check.replay_input[j].replay_score[k].start_x) { show_debug_message("\"start_x\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"start_y") or !is_real(replay_to_check.replay_input[j].replay_score[k].start_y) { show_debug_message("\"start_y\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"bombscore") or !is_real(replay_to_check.replay_input[j].replay_score[k].bombscore) { show_debug_message("\"bombscore\" not found."); multi_check = false; }
				if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"received") or !is_real(replay_to_check.replay_input[j].replay_score[k].received) { show_debug_message("\"received\" not found."); multi_check = false; }
			
				if !is_array(replay_to_check.replay_input[j].replay_stage[k]) { multi_check = false }
				if !is_real(replay_to_check.replay_input[j].stage_played[k]) { multi_check = false }
				for(var l = 0; l < array_length(replay_to_check.replay_input[j].replay_stage[k]); l++) {
					if (!is_bool(replay_to_check.replay_input[j].replay_stage[k][l][0])) { show_debug_message("\"right\" not found."); multi_check = false; }
					if (!is_bool(replay_to_check.replay_input[j].replay_stage[k][l][1])) { show_debug_message("\"left\" not found."); multi_check = false; }
					if (!is_bool(replay_to_check.replay_input[j].replay_stage[k][l][2])) { show_debug_message("\"down\" not found."); multi_check = false; }
					if (!is_bool(replay_to_check.replay_input[j].replay_stage[k][l][3])) { show_debug_message("\"up\" not found."); multi_check = false; }
					if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][4])) or (replay_to_check.replay_input[j].replay_stage[k][l][4] < 0) or (replay_to_check.replay_input[j].replay_stage[k][l][4] > 1) { show_debug_message("\"shoot\" not found."); multi_check = false; }
					if (!is_bool(replay_to_check.replay_input[j].replay_stage[k][l][5])) { show_debug_message("\"focus\" not found."); multi_check = false; }
					if (!is_bool(replay_to_check.replay_input[j].replay_stage[k][l][6])) { show_debug_message("\"bomb\" not found."); multi_check = false; }
				}
			}
		}
		if multi_check == false continue;
		array_push(replay_list,replay_to_check);
	}
}

op_space = 16;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

load_array = scr_json_load_file("menu_data/replay_menu" + string(global.suf) + ".json");
//var load_order = scr_json_load_file("main/spell_card_order.json");

option = []
description = []

//for(var i = 0; i < array_length(load_order.spell_card_order); i++) {
	//option[i] = struct_get(load_array.enemy_spell,load_order.spell_card_order[i]);
	//description[i] = struct_get(global.spellcard_statistics,load_order.spell_card_order[i]);
//}

if array_length(load_replays) >= 1 {
	array_copy(option,0,load_replays,0,array_length(load_replays));
	for(var i = 0; i < array_length(replay_list); i++) {
		var character_text = struct_get(load_array.characters,replay_list[i].replay_input[0].replay_score[0].character)
		var rank_text = load_array.rank[replay_list[i].main_stats.difficulty]
		var stage_text = load_array.stage[replay_list[i].main_stats.stage - 1]
		array_push(description,[
			replay_list[i].replay_info.player_name,
			replay_list[i].replay_info.save_date,
			character_text,
			rank_text,
			stage_text
		]);
	}
}
//array_copy(description,0,load_array.option_select.option_description,0,array_length(load_array.option_select.option_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(replay_list);
op_length_x = 1;

for(var i = 0; i < 128; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;
inventory_scroll = [0,19];
scroll_clamp = 0;
list_max_entries = 19;
_ss = 0;