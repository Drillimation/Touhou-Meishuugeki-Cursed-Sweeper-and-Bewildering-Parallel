//Gather .rpy files
replay_list = [];
var load_replays = [];
if directory_exists("replays/") {
	var _file_name = file_find_first("replays/*.rpy", fa_readonly);

	while (_file_name != "") {
		array_push(load_replays,_file_name);
		_file_name = file_find_next()
	}
	file_find_close();
}

//Replay check
for(var i = 0; i < array_length(load_replays); i++) {
	var replay_to_check = scr_json_load_file(load_replays[i]);
	//Main struct check
	if !struct_exists(replay_to_check,"replay_info") or !is_struct(replay_to_check.replay_info) continue
	if !struct_exists(replay_to_check,"playing_field") or !is_struct(replay_to_check.playing_field) continue
	if !struct_exists(replay_to_check,"main_stats") or !is_struct(replay_to_check.main_stats) continue
	if !struct_exists(replay_to_check,"replay_input") or !is_struct(replay_to_check.replay_input) continue
	//Replay info check
	if !struct_exists(replay_to_check.replay_info,"player_name") or !is_string(replay_to_check.replay_info.player_name) continue
	if !struct_exists(replay_to_check.replay_info,"save_date") or !is_string(replay_to_check.replay_info.save_date) continue
	if !struct_exists(replay_to_check.replay_info,"version") or !is_string(replay_to_check.replay_info.version) continue
	if replay_to_check.replay_info.version != global.game_version continue
	//Playing field check
	if !struct_exists(replay_to_check.playing_field,"x1") or !is_numeric(replay_to_check.playing_field.x1) continue
	if !struct_exists(replay_to_check.playing_field,"y1") or !is_numeric(replay_to_check.playing_field.y1) continue
	if !struct_exists(replay_to_check.playing_field,"x2") or !is_numeric(replay_to_check.playing_field.x2) continue
	if !struct_exists(replay_to_check.playing_field,"y2") or !is_numeric(replay_to_check.playing_field.y2) continue
	if !struct_exists(replay_to_check.playing_field,"minrpriority") or !is_numeric(replay_to_check.playing_field.minrpriority) continue
	if !struct_exists(replay_to_check.playing_field,"maxrpriority") or !is_numeric(replay_to_check.playing_field.maxrpriority) continue
	if !struct_exists(replay_to_check.playing_field,"camera_priority") or !is_numeric(replay_to_check.playing_field.camera_priority) continue
	if !struct_exists(replay_to_check.playing_field,"random_seed") or !is_numeric(replay_to_check.playing_field.random_seed) continue
	//Main stats check
	if !struct_exists(replay_to_check.main_stats,"difficulty") or !is_numeric(replay_to_check.main_stats.difficulty) continue
	if !struct_exists(replay_to_check.main_stats,"stage") or !is_numeric(replay_to_check.main_stats.stage) continue
	if !struct_exists(replay_to_check.main_stats,"continues_used") or !is_numeric(replay_to_check.main_stats.continues_used) continue
	if !struct_exists(replay_to_check.main_stats,"spells_captured") or !is_array(replay_to_check.main_stats.spells_captured) continue
	if !struct_exists(replay_to_check.main_stats,"max_health") or !is_numeric(replay_to_check.main_stats.max_health) continue
	if !struct_exists(replay_to_check.main_stats,"time_orbs") or !is_numeric(replay_to_check.main_stats.time_orbs) continue
	if !struct_exists(replay_to_check.main_stats,"orb_requirement") or !is_numeric(replay_to_check.main_stats.orb_requirement) continue
	if !struct_exists(replay_to_check.main_stats,"hours_passed") or !is_numeric(replay_to_check.main_stats.hours_passed) continue
	if !struct_exists(replay_to_check.main_stats,"time_of_day") or !is_string(replay_to_check.main_stats.time_of_day) continue
	if !struct_exists(replay_to_check.main_stats,"current_spell") or !is_string(replay_to_check.main_stats.current_spell) continue
	//Replay inputs stats
	var multi_check = true;
	for(var j = 0; j < array_length(replay_to_check.replay_input); j++) {
		if !struct_exists(replay_to_check.replay_input[j],"replay_stage") or !is_array(replay_to_check.replay_input[j].replay_stage) multi_check = false
		if !struct_exists(replay_to_check.replay_input[j],"replay_score") or !is_array(replay_to_check.replay_input[j].replay_score) multi_check = false
		if !struct_exists(replay_to_check.replay_input[j],"stage_played") or !is_array(replay_to_check.replay_input[j].stage_played) multi_check = false
		for(var k = 0; k < array_length(replay_to_check.replay_input[j].replay_score); k++) {
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"character") or !is_string(replay_to_check.replay_input[j].replay_score[k].character) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_score") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_score) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_lives") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_lives) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_health") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_health) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"cur_bombs") or !is_real(replay_to_check.replay_input[j].replay_score[k].cur_bombs) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"graze") or !is_real(replay_to_check.replay_input[j].replay_score[k].graze) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"point_items") or !is_real(replay_to_check.replay_input[j].replay_score[k].point_items) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"power_items") or !is_real(replay_to_check.replay_input[j].replay_score[k].power_items) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"rpriority") or !is_real(replay_to_check.replay_input[j].replay_score[k].rpriority) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"deaths") or !is_real(replay_to_check.replay_input[j].replay_score[k].deaths) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"bombs_used") or !is_real(replay_to_check.replay_input[j].replay_score[k].bombs_used) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"point_collected") or !is_real(replay_to_check.replay_input[j].replay_score[k].point_collected) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"power_collected") or !is_real(replay_to_check.replay_input[j].replay_score[k].power_collected) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"start_x") or !is_real(replay_to_check.replay_input[j].replay_score[k].start_x) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"start_y") or !is_real(replay_to_check.replay_input[j].replay_score[k].start_y) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"bombscore") or !is_real(replay_to_check.replay_input[j].replay_score[k].bombscore) multi_check == false
			if !struct_exists(replay_to_check.replay_input[j].replay_score[k],"received") or !is_real(replay_to_check.replay_input[j].replay_score[k].received) multi_check == false
			
			if !is_array(replay_to_check.replay_input[j].replay_stage[k]) multi_check = false
			if !is_real(replay_to_check.replay_input[j].stage_played[k]) multi_check = false
			for(var l = 0; l < array_length(replay_to_check.replay_input[j].replay_stage[k]); l++) {
				if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][0])) or (replay_to_check.replay_input[j].replay_stage[k][l][0] != 0) or (replay_to_check.replay_input[j].replay_stage[k][l][0] != 1) multi_check == false
				if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][1])) or (replay_to_check.replay_input[j].replay_stage[k][l][1] != 0) or (replay_to_check.replay_input[j].replay_stage[k][l][1] != 1) multi_check == false
				if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][2])) or (replay_to_check.replay_input[j].replay_stage[k][l][2] != 0) or (replay_to_check.replay_input[j].replay_stage[k][l][2] != 1) multi_check == false
				if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][3])) or (replay_to_check.replay_input[j].replay_stage[k][l][3] != 0) or (replay_to_check.replay_input[j].replay_stage[k][l][3] != 1) multi_check == false
				if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][4])) or (replay_to_check.replay_input[j].replay_stage[k][l][4] != 0) or (replay_to_check.replay_input[j].replay_stage[k][l][4] != 1) multi_check == false
				if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][5])) or (replay_to_check.replay_input[j].replay_stage[k][l][5] != 0) or (replay_to_check.replay_input[j].replay_stage[k][l][5] != 1) multi_check == false
				if (!is_real(replay_to_check.replay_input[j].replay_stage[k][l][6])) or (replay_to_check.replay_input[j].replay_stage[k][l][6] != 0) or (replay_to_check.replay_input[j].replay_stage[k][l][6] != 1) multi_check == false
			}
		}
	}
	if multi_check == false continue;
	array_push(replay_list,replay_to_check);
}

op_space = 32;
x_pos = 0;
y_pos = 0;
count = 0;
cursor_moved = false;
clicked = false;
delay = 10;

load_array = scr_json_load_file("menu_data/replay_menu" + string(global.suf) + ".json");
//var load_order = scr_json_load_file("main/spell_card_order.json");

option = []
//description = []

//for(var i = 0; i < array_length(load_order.spell_card_order); i++) {
	//option[i] = struct_get(load_array.enemy_spell,load_order.spell_card_order[i]);
	//description[i] = struct_get(global.spellcard_statistics,load_order.spell_card_order[i]);
//}

array_copy(option,0,replay_list,0,array_length(replay_list));
//array_copy(description,0,load_array.option_select.option_description,0,array_length(load_array.option_select.option_description));

prompt = load_array.menu_prompt;
prompt = scr_button_menu(prompt);

op_length_y = array_length(option);
op_length_x = 1;

for(var i = 0; i < 64; i++) {
	scribble_object[i] = undefined;
}

scr_get_input_menu();

count = 0;
inventory_scroll = [0,8];
scroll_clamp = 0;
list_max_entries = 8;
_ss = 0;